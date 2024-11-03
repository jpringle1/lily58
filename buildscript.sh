#!/bin/bash 

devcontainer up --workspace-folder '/home/joep/repos/zmk'
docker exec -i 4156a9cab403 /bin/bash << EOF
cd /workspaces/zmk/app
west build -d build/left -p -b nice_nano_v2 -- -DZMK_CONFIG=/workspaces/zmk-config/config -DSHIELD="lily58_left nice_view_adapter nice_view"
west build -d build/right -p -b nice_nano_v2 -- -DZMK_CONFIG=/workspaces/zmk-config/config -DSHIELD="lily58_right nice_view_adapter nice_view"
exit
EOF

docker cp inspiring_jackson:/workspaces/zmk/app/build/left/zephyr/zmk.uf2 /home/joep/repos/left.uf2
docker cp inspiring_jackson:/workspaces/zmk/app/build/right/zephyr/zmk.uf2 /home/joep/repos/right.uf2
