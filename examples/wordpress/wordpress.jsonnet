// Copyright (c) 2018 Bitnami
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

// ```
// kubecfg update wordpress.jsonnet
//
// kubecfg delete wordpress.jsonnet
// ```

local kube = import "lib/kube.libsonnet";
local fe = import "frontend.jsonnet";
local be = import "backend.jsonnet";

kube.List() {
  items_+: {
    frontend_pvc: fe.frontend.pvc,
  } + {
    frontend_configmap: fe.frontend.configmap,
  } + {
    frontend_secret: fe.frontend.secret,
  } + {
    frontend_deployment: fe.frontend.deployment,
  } + {
    frontend_service: fe.frontend.service,
  } + {
    backend_secret: be.backend.secret,
  } + {
    backend_master_statefulset: be.backend.master.statefulset,
  } + {
    backend_master_service: be.backend.master.service,
  } + {
    backend_slave_statefulset: be.backend.slave.statefulset,
  } + {
    backend_slave_service: be.backend.slave.service,
  },
}
