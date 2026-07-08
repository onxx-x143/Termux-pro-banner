#!/bin/bash

# Define Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
PURPLE='\033[1;38;5;129m'
ORANGE='\033[1;38;5;208m'
PINK='\033[1;38;5;198m'
RESET='\033[0m'
NC='\033[0m'  # No Color
BOLD='\033[1m'

# Create a dedicated directory for all files
CONFIG_DIR="$HOME/.termux_custom"
mkdir -p "$CONFIG_DIR" || {
    echo -e "${RED}✗ Failed to create config directory!${NC}"
    exit 1
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to handle errors
handle_error() {
    echo -e "${RED}✗ Error: $1${NC}"
    echo -e "${YELLOW}Please report issues at https://termux.dev/issues${NC}"
    exit 1
}

# Check for nala or apt
if command_exists nala; then
    PKG_MANAGER="nala"
elif command_exists apt; then
    PKG_MANAGER="apt"
else
    handle_error "No supported package manager found (nala/apt)"
fi

# Check for pv
if ! command_exists pv; then
    echo -e "${YELLOW}✗ pv not found! Installing now...${NC}"
    $PKG_MANAGER update -y && $PKG_MANAGER install -y pv || {
        echo -e "${RED}✗ Failed to install pv${NC}"
    }
fi

# Clear screen
clear

# Welcome Banner - Red Color

# Color Definitions
RED='\033[1;31m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e "${RED}"
cat << "EOF"
                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢯⡳⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡶⣻⠟⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⣍⠈⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡏⢈⡍⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢙⣿⠟⣉⡳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣋⡙⢿⣟⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣸⠻⠸⣛⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣟⡻⠸⢻⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡻⣯⡲⣼⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢸⣴⣪⡿⡃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⣿⣍⣹⡞⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡞⣾⣃⣝⣷⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣿⣿⢉⣫⣙⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢟⣩⣋⢹⣿⣅⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣰⡿⢁⢊⠮⣍⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⣭⢮⢂⠹⣷⡀⠀⠀⠀⠀
⠀⠀⠀⢠⣿⡟⢃⡜⡀⢻⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡘⡘⣄⠛⢿⣧⠀⠀⠀⠀
⠀⠀⢠⣿⡏⢠⠹⣷⢷⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⢳⡿⢡⠈⣿⣷⡀⠀⠀
⠀⠰⠋⠻⢿⣞⣠⡖⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠐⢦⠈⣷⠿⠋⠳⠀⠀
⢠⡞⠉⣠⣾⡁⣾⣷⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣴⣿⣆⣹⣦⡈⠙⣧⠀
⢸⡇⣠⣿⠝⢷⡃⢾⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠖⣣⠟⢽⣧⡄⣿⠀
⣾⣷⠾⠽⣷⢺⣳⡤⡹⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⡡⣴⣫⠶⡿⠽⢦⣿⡇
⢸⡏⣸⡛⣁⣠⠝⢾⣌⠻⣷⣄⠀⠀⠀⠀⠀⠀⢀⣀⡀⣀⠀⠀⠀⠀⢀⡀⣀⣀⠀⠀⠀⠀⠀⠀⢀⣴⡿⢋⣼⠟⢡⣀⡘⣻⢀⣿⠁
⠸⡗⡽⣧⢛⡙⢷⣭⣟⡿⣮⢝⢷⡤⣄⢀⣴⣿⣯⠠⢸⡿⣱⠇⠀⢳⡹⣿⡠⢨⣿⣷⣄⢀⣠⣴⢟⢭⡶⣟⣿⣷⠞⣋⢣⡿⡁⡿⠀                       
                   by onxx-x143
⠀⢻⣿⡙⠶⠟⠀⠒⢮⣻⣌⡣⢷⢹⢸⣷⢝⡡⡈⣧⢜⣼⡟⢰⣷⠘⣿⣜⢧⡏⡢⣙⢥⣿⢸⢱⡇⡏⣼⣫⠖⠂⠐⡷⠞⣹⣽⠇⠀
⠀⠀⢻⣶⡟⣭⣶⣶⡿⣣⣿⣷⡿⢠⡿⡃⣾⢸⠇⢻⣿⠏⠀⣿⣿⡇⠈⢿⣿⠇⢻⢸⡆⣹⣧⠸⣧⣿⣷⡹⣷⣶⣾⡝⣷⣾⠋⠀⠀
⠀⠀⠀⠹⡧⣿⣿⠟⠓⣶⣭⣻⣷⣿⣿⢆⢿⣷⣸⡜⡏⡄⢰⣿⣿⣯⠀⡎⡟⣸⣨⣿⢇⣾⣿⣷⡿⣩⣵⡖⠚⢿⣿⡷⡿⠁⠀⠀⠀
⠀⠀⠀⠀⠈⠹⣿⣧⡻⠿⠷⠾⣿⠿⣿⣧⣯⡙⢿⣿⡄⣇⠸⣿⣿⣿⢀⡷⣼⣿⠟⣫⣾⣿⣿⣿⠿⠶⠾⠿⣣⣾⡿⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⠿⡓⢹⡆⡿⣬⣻⢦⡻⡇⣿⡄⣿⣿⡇⣸⡇⣿⣣⢾⣻⡾⡇⣾⠳⡻⢿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⣼⠷⢦⣷⣭⡛⡢⢧⠸⣧⢿⣿⢧⡿⢠⢣⡛⣯⣵⣧⠶⢿⢄⢸⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣦⡭⣧⡀⠀⠉⠛⢿⡜⣧⢻⣸⣿⢸⢃⡟⣼⠟⠋⠁⠀⢠⡯⣥⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣏⠪⢵⣦⣀⠀⠈⢷⢻⣞⢻⣿⢛⣾⢷⠏⠀⢀⣠⣴⠯⢊⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣭⣽⡏⣞⢛⡓⣾⢞⢹⣤⣥⣼⢙⢺⠶⣛⣛⡄⣾⣭⣵⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡽⠿⣿⡌⢟⣻⣿⢿⡄⡝⣟⡕⣼⢷⡿⣻⠏⣼⡿⠷⡽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⢸⣿⠈⢳⡟⡄⡇⣿⣼⡇⡏⡞⣷⠋⢰⣿⢸⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢏⣿⡟⣟⢶⠀⣷⣅⣿⣿⣇⣷⡗⢰⢞⡞⣿⣇⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⢀⠘⣿⠗⠈⠹⣿⣿⡿⠉⠐⢿⡟⢀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣾⠀⣿⣰⡹⣧⣼⣿⣥⡾⢸⣸⡇⢸⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢻⡄⣮⣛⢷⣬⡘⠟⣨⣴⢟⣫⢆⣸⢫⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢯⢑⠭⣩⠿⢻⣿⡻⢯⡩⢕⢨⠷⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   .⠈⢛⣸⡆⠈⡇⣿⣿⡇⡟⠀⣼⢘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀. ⣼⡿⡷⣤⣷⣿⣿⣷⣷⡴⡿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠈⠛⠿⠾⠿⠉⠈⠙⠿⠾⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF

echo -e "========>> Created by Onxx-x143 [ Hari Jadhav ] <<=========${RESET}"
echo -e "${RESET}"

# User Input for Customization
read -p "$(echo -e "${YELLOW}Enter creator name [default: Onxx]: ${RESET}")" creator_name
creator_name=${creator_name:-Onxx}
read -p "$(echo -e "${YELLOW}Enter creator tagline [default: HARI JADHAV: ${RESET}")" creator_tag
creator_tag=${creator_tag:-Prince4You}
read -p "$(echo -e "${YELLOW}Enter welcome message [default: Welcome to Your Terminal]: ${RESET}")" welcome_msg
welcome_msg=${welcome_msg:-Welcome to Your Terminal}

# Default speed
default_speed=50

# Function to validate speed
validate_speed() {
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}✘ Invalid input! Please enter numbers only.${NC}"
        return 1
    elif [[ "$1" -lt 1 || "$1" -gt 200 ]]; then
        echo -e "${RED}✘ Speed must be between 1 and 200.${NC}"
        return 1
    fi
    return 0
}

# Loop until valid input
while true; do
    read -p "$(echo -e "${YELLOW}Enter animation speed (1-200, where higher = faster) [Default: ${default_speed}]: ${RESET}")" speed
    speed=${speed:-$default_speed}

    validate_speed "$speed" && break
done

pv_speed=$speed

# Preview the speed
echo -e "${CYAN}Previewing animation speed at ${pv_speed} bytes/sec...${NC}"
echo "      Loading animation test..." | pv -qL "$pv_speed"
sleep 1

# Confirm and finalize
echo -e "${GREEN}✓ Customization saved! Animation speed set to ${pv_speed} bytes/sec.${NC}"

# Update and upgrade packages
echo -e "${GREEN}[1/6]${NC} ${YELLOW}Updating and upgrading packages...${NC}"
if $PKG_MANAGER update -y && $PKG_MANAGER upgrade -y; then
    echo -e "${GREEN}✓ Package update complete!${NC}\n"
else
    echo -e "${RED}✗ Package update failed. Continuing anyway...${NC}\n"
fi
sleep 1

# Install required packages
echo -e "${GREEN}[2/6]${NC} ${YELLOW}Installing required packages...${NC}"
if $PKG_MANAGER install -y toilet starship fish python neofetch pv wget git; then
    echo -e "${GREEN}✓ Packages installed successfully!${NC}\n"
else
    echo -e "${RED}✗ Package installation failed. Some features might not work.${NC}\n"
fi
sleep 1

# Install lolcat
echo -e "${GREEN}[3/6]${NC} ${YELLOW}Installing lolcat...${NC}"
if ! command_exists pip; then
    if ! $PKG_MANAGER install -y python-pip; then
        echo -e "${RED}✗ Failed to install python-pip. lolcat won't be installed.${NC}\n"
    fi
fi

if command_exists pip; then
    if pip install lolcat; then
        echo -e "${GREEN}✓ lolcat installed successfully!${NC}\n"
    else
        echo -e "${RED}✗ Failed to install lolcat.${NC}\n"
    fi
fi
sleep 1

# Change shell to fish
echo -e "${GREEN}[4/6]${NC} ${YELLOW}Changing default shell to fish...${NC}"
if command_exists chsh; then
    if chsh -s fish; then
        echo -e "${GREEN}✓ Default shell changed to fish!${NC}"
    else
        echo -e "${RED}✗ Failed to change shell to fish.${NC}"
    fi
else
    echo -e "${RED}✗ chsh command not found. Shell not changed.${NC}"
fi
echo ""
sleep 1

# Create fish config directory
mkdir -p ~/.config/fish || echo -e "${RED}✗ Failed to create fish config directory.${NC}"

# Social Media Setup
echo -e "${GREEN}[5/6]${NC} ${YELLOW}Social Media Setup${NC}"
echo -e "${CYAN}Enter your social media links (leave blank to skip):${NC}\n"

SOCIAL_FILE="$CONFIG_DIR/social_media.txt"
> "$SOCIAL_FILE"  # Clear old content

platforms=(
    "YouTube" "Instagram" "Facebook" "Telegram" "WhatsApp" 
    "Twitter/X" "GitHub" "LinkedIn" "Discord" "Reddit" "Mastodon"
)

for platform in "${platforms[@]}"; do
    read -p "$(echo -e "${YELLOW}$platform: ${NC}")" url
    if [ -n "$url" ]; then
        echo "$platform:$url" >> "$SOCIAL_FILE"
    fi
done
echo -e "${GREEN}✓ Social media details saved to $SOCIAL_FILE${NC}\n"
sleep 1

# Create the banner script
echo -e "${GREEN}[6/6]${NC} ${YELLOW}Creating terminal banner...${NC}"

cat > "$CONFIG_DIR/termux_banner.sh" << EOF
#!/bin/bash

# Function to generate random colors
random_color() {
    colors=(
        "\033[1;31m"  # Red
        "\033[1;32m"  # Green
        "\033[1;33m"  # Yellow
        "\033[1;34m"  # Blue
        "\033[1;36m"  # Cyan
        "\033[1;35m"  # Magenta
        "\033[1;37m"  # White
        "\033[1;38;5;129m"  # Purple
        "\033[1;38;5;208m"  # Orange
        "\033[1;38;5;198m"  # Pink
    )
    echo "\${colors[\$RANDOM % \${#colors[@]}]}"
}

# Define Reset and Bold
RESET="\033[0m"
BOLD="\033[1m"

# Distro list (expanded)
distros=(
    "debian" "AlmaLinux" "Elementary" "Linux Mint" "Solus" "RHEL" "Rocky" 
    "termux" "ubuntu" "parrot" "blackarch" "arch" "kali" "mint" "fedora" 
    "manjaro" "centos" "pop" "slackware" "backbox" "void" "garuda" 
    "gentoo" "deepin" "zorin" "mxlinux" "endeavouros" "opensuse" "arcolinux"
)

# Custom messages for each distro
declare -A messages
messages["debian"]="Debian: The universal and stable choice!"
messages["AlmaLinux"]="AlmaLinux: Enterprise-grade reliability."
messages["Elementary"]="Elementary OS: Beauty meets functionality."
messages["Linux Mint"]="Linux Mint: Simple, elegant, and user-friendly."
messages["Solus"]="Solus: Independent and innovative."
messages["RHEL"]="RHEL: Trusted by enterprises worldwide."
messages["Rocky"]="Rocky Linux: The CentOS successor."
messages["termux"]="Termux: Mobile hacking powerhouse."
messages["ubuntu"]="Ubuntu: Let's dive into the open-source world!"
messages["parrot"]="Parrot OS: Your security and privacy fortress."
messages["blackarch"]="BlackArch: For elite penetration testers."
messages["arch"]="Arch Linux: Build it your way."
messages["kali"]="Kali Linux: Unleash your inner hacker!"
messages["mint"]="Mint: The hassle-free Linux experience."
messages["fedora"]="Fedora: Cutting-edge and community-driven."
messages["manjaro"]="Manjaro: Arch made accessible and awesome."
messages["centos"]="CentOS: Rock-solid for servers."
messages["pop"]="Pop!_OS: Ubuntu with a modern twist."
messages["slackware"]="Slackware: The OG Linux distro."
messages["backbox"]="BackBox: Security testing made simple."
messages["void"]="Void Linux: Lightweight and independent."
messages["garuda"]="Garuda: Performance and style combined."
messages["gentoo"]="Gentoo: Customize every bit of your OS."
messages["deepin"]="Deepin: Stunning visuals, smooth experience."
messages["zorin"]="Zorin OS: Windows users' gateway to Linux."
messages["mxlinux"]="MX Linux: Lightweight and powerful."
messages["endeavouros"]="EndeavourOS: Arch with a friendly face."
messages["opensuse"]="openSUSE: Flexible and versatile."
messages["arcolinux"]="ArcoLinux: Learn, customize, conquer."

# Random distro selection
random_distro=\${distros[\$RANDOM % \${#distros[@]}]}

# Read social media details
declare -A social_media
if [ -f "$SOCIAL_FILE" ]; then
    while IFS=':' read -r platform link; do
        social_media["\$platform"]="\$link"
    done < "$SOCIAL_FILE"
fi

# Clear screen and show loading animation
clear
echo -e "\$(random_color)Loading Your Awesome Terminal...\$RESET" | pv -qL $pv_speed
sleep 0.5

# Show neofetch with random distro
if command -v neofetch >/dev/null 2>&1; then
    neofetch --ascii_distro "\$random_distro" --color_blocks off
else
    echo -e "\${YELLOW}Neofetch not found. Skipping system info display.\${RESET}"
fi

# Display Terminal Banner
echo -e "\n\$(random_color)${BOLD}$welcome_msg\$RESET" | pv -qL $pv_speed
echo -e "\$(random_color)Current Distro: \$random_distro\$RESET" | pv -qL $pv_speed
echo -e "\$(random_color)\${messages[\$random_distro]}\$RESET" | pv -qL $pv_speed

# Social Media Section with Colors
if [ \${#social_media[@]} -gt 0 ]; then
    echo -e "\n\$(random_color)Follow us for more updates:\$RESET" | pv -qL $pv_speed
    for platform in "\${!social_media[@]}"; do
        echo -e "\$(random_color)[+] \${platform}: \$RESET\${social_media[\$platform]}" | pv -qL $pv_speed
    done
fi

# Add "Created by"
echo -e "\n\$(random_color)Created By $creator_name [$creator_tag]\$RESET" | pv -qL $pv_speed

# Final progress bar
echo -e "\n\$(random_color)All systems loaded. Ready to rock! \$RESET" | pv -qL $pv_speed
EOF

chmod +x "$CONFIG_DIR/termux_banner.sh" || handle_error "Failed to make termux_banner.sh executable"

# Create social media customization script
cat > "$CONFIG_DIR/setup_social.sh" << EOF
#!/bin/bash

# Colors
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

echo -e "\n\${CYAN}Customize Your Social Media Links:\${RESET}"
echo -e "\${YELLOW}Press Enter to keep current value\${RESET}\n"

# Read current values
declare -A current_values
if [ -f "$SOCIAL_FILE" ]; then
    while IFS=':' read -r platform link; do
        current_values["\$platform"]="\$link"
    done < "$SOCIAL_FILE"
fi

# Get user input
platforms=(
    "YouTube" "Instagram" "Facebook" "Telegram" "WhatsApp" 
    "Twitter/X" "GitHub" "LinkedIn" "Discord" "Reddit" "Mastodon"
)

for platform in "\${platforms[@]}"; do
    read -p "\$(echo -e "\${YELLOW}Enter \$platform [\${current_values[\$platform]}]: \${RESET}")" input_link
    if [ -n "\$input_link" ]; then
        current_values["\$platform"]="\$input_link"
    fi
done

# Save to file
> "$SOCIAL_FILE"
for platform in "\${!current_values[@]}"; do
    echo "\$platform:\${current_values[\$platform]}" >> "$SOCIAL_FILE"
done

echo -e "\n\${GREEN}✓ Social media updated successfully!\${RESET}"
sleep 1
EOF

chmod +x "$CONFIG_DIR/setup_social.sh" || handle_error "Failed to make setup_social.sh executable"

# Configure fish greeting
mkdir -p ~/.config/fish || handle_error "Failed to create fish config directory"
echo "function fish_greeting; bash '$CONFIG_DIR/termux_banner.sh'; end" > ~/.config/fish/config.fish || handle_error "Failed to configure fish greeting"

# Download and setup starship config
echo -e "\n${YELLOW}Downloading custom Starship configuration...${NC}"
mkdir -p ~/.config || handle_error "Failed to create .config directory"
if command_exists wget; then
    if wget https://raw.githubusercontent.com/prince4you/Term-Banner/main/starship.toml -O ~/.config/starship.toml; then
        echo -e "${GREEN}✓ Starship config downloaded!${NC}"
    else
        echo -e "${RED}✗ Failed to download Starship config.${NC}"
    fi
else
    echo -e "${RED}✗ wget not found. Starship config not downloaded.${NC}"
fi

# Initialize starship
if command_exists starship; then
    echo 'starship init fish | source' >> ~/.config/fish/config.fish || echo -e "${RED}✗ Failed to add starship to fish config.${NC}"
else
    echo -e "${RED}✗ starship not found. Not added to fish config.${NC}"
fi

# Final message
echo -e "\n${GREEN}Installation complete!${NC}"
echo -e "${CYAN}All files have been saved to: $CONFIG_DIR${NC}"
echo -e "${BLUE}To restart your terminal, type:${NC}"
echo -e "${MAGENTA}exec fish${NC}"
echo -e "${BLUE}Or simply close and reopen your terminal.${NC}"
echo -e "${GREEN}Enjoy your customized terminal experience!${NC}"
