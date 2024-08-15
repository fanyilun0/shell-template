#!/bin/bash

# 检查是否以root用户运行脚本
if [ "$(id -u)" != "0" ]; then
    echo "此脚本需要以root用户权限运行。"
    echo "请尝试使用 'sudo -i' 命令切换到root用户，然后再次运行此脚本。"
    exit 1
fi

# 自动设置快捷键的功能
function check_and_set_alias() {
    local alias_name="quili"
    local profile_file="$HOME/.profile"

    if ! grep -q "$alias_name" "$profile_file"; then
        echo "设置快捷键 '$alias_name' 到 $profile_file"
        echo "alias $alias_name='bash $SCRIPT_PATH'" >> "$profile_file"
        echo "快捷键 '$alias_name' 已设置。请运行 'source $profile_file' 来激活快捷键，或重新登录。"
    else
        echo "快捷键 '$alias_name' 已经设置在 $profile_file。"
    fi
}

# 示例功能 - 节点安装
function install_node() {
    echo "执行节点安装..."
    # 在这里添加您的节点安装代码
}

# 示例功能 - 查看节点日志
function check_service_status() {
    echo "查看节点日志..."
    # 在这里添加您的查看日志代码
}

# 示例功能 - 更新脚本
function update_script() {
    echo "更新脚本..."
    # 在这里添加您的脚本更新代码
}

# 主菜单
function main_menu() {
    clear
    echo "脚本由推特用户大赌哥 @y95277777 编写，免费开源，请勿相信收费"
    echo "================================================================"
    echo "请选择要执行的操作:"
    echo "1. 安装常规节点"
    echo "2. 查看节点日志"
    echo "3. 更新本脚本"
    
    read -p "请输入选项（1-8）: " OPTION

    case $OPTION in
        1) install_node ;;
        2) check_service_status ;;
        3) update_script ;;
        *) echo "无效选项。" ;;
    esac
}

# 显示主菜单
main_menu
