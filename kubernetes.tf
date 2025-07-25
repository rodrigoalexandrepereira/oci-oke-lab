data "oci_core_image" "node" {
  image_id = var.image_id
}

resource "oci_containerengine_cluster" "cluster1" {
  compartment_id     = var.compartment_ocid
  kubernetes_version = var.kubernetes_version
  name               = "cluster1"
  vcn_id             = oci_core_virtual_network.k8s_vcn.id
  type               = "BASIC_CLUSTER"

  options {
    service_lb_subnet_ids = [oci_core_subnet.k8s_loadbalancers.id]
  }

  cluster_pod_network_options {
    cni_type = "OCI_VCN_IP_NATIVE"
  }

  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = oci_core_subnet.k8s_api.id
  }
}

resource "oci_containerengine_node_pool" "pool1" {
  cluster_id         = oci_containerengine_cluster.cluster1.id
  compartment_id     = var.compartment_ocid
  name               = "pool1"
  node_shape         = "VM.Standard.A1.Flex"
  kubernetes_version = var.kubernetes_version

  initial_node_labels {
    key   = "name"
    value = "pool1"
  }

  node_config_details {

    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = oci_core_subnet.k8s_worker_nodes.id
    }

    size                                = 4
    is_pv_encryption_in_transit_enabled = false

    node_pool_pod_network_option_details {
      cni_type          = "OCI_VCN_IP_NATIVE"
      max_pods_per_node = 31
      pod_subnet_ids    = [oci_core_subnet.k8s_pods.id]
    }
  }

  node_eviction_node_pool_settings {
    eviction_grace_duration              = "PT1H"
    is_force_delete_after_grace_duration = false
  }

  node_shape_config {
    memory_in_gbs = 6
    ocpus         = 1
  }

  node_source_details {
    image_id    = data.oci_core_image.node.id
    source_type = "IMAGE"
  }
}