Received: from smtp2.libero.it ([193.70.192.52])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CA9Sr-0005yk-5m
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2004 11:55:33 -0400
Received: from localhost (172.16.1.84) by smtp2.libero.it (7.0.027-DD01)
	id 40C73476014E3D28 for linux-mtd@lists.infradead.org;
	Wed, 22 Sep 2004 17:55:35 +0200
Received: from libero.it (172.16.1.87) by smtp2.libero.it (7.0.027-DD01)
	id 40C734700099A309 for linux-mtd@lists.infradead.org;
	Wed, 22 Sep 2004 17:55:34 +0200
Date: Wed, 22 Sep 2004 17:55:20 +0200
Message-Id: <I4G9K8$32150B19D33A6F23F04032D520B4890A@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "lp4u\@inwind\.it" <lp4u@inwind.it>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: NAND detect
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 
 
I have a s3c2410 board (BAST architecture). 
I have installed o=
n board a kernel2.4.26 patched and with MTD. 
But the board, at boot, do=
n't detect the NAND (I've 3 NANDs on board: 2 samsung & 1 STM). 
The MTD=
 detect only NOR Flash. 
 
This is my configuration: 
 
# 
CONFIG_AR=
M=3Dy 
# CONFIG_EISA is not set 
# CONFIG_SBUS is not set 
# CONFIG_MC=
A is not set 
CONFIG_UID16=3Dy 
CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy 
# C=
ONFIG_RWSEM_XCHGADD_ALGORITHM is not set 
# CONFIG_GENERIC_BUST_SPINLOCK=
 is not set 
# CONFIG_GENERIC_ISA_DMA is not set 
# 
CONFIG_EXPERIMENT=
AL=3Dy 
# CONFIG_OBSOLETE is not set 
# 
# CONFIG_MODULES is not set =0D
=
# CONFIG_MODVERSIONS is not set 
# CONFIG_KMOD is not set 
# 
# CONFIG=
_ARCH_ANAKIN is not set 
# CONFIG_ARCH_ARCA5K is not set 
# CONFIG_ARCH=
_CLPS7500 is not set 
# CONFIG_ARCH_CLPS711X is not set 
# CONFIG_ARCH_=
CO285 is not set 
# CONFIG_ARCH_EBSA110 is not set 
# CONFIG_ARCH_CAMEL=
OT is not set 
# CONFIG_ARCH_FOOTBRIDGE is not set 
# CONFIG_ARCH_INTEG=
RATOR is not set 
# CONFIG_ARCH_OMAHA is not set 
# CONFIG_ARCH_L7200 i=
s not set 
# CONFIG_ARCH_MX1ADS is not set 
# CONFIG_ARCH_RPC is not se=
t 
# CONFIG_ARCH_RISCSTATION is not set 
# CONFIG_ARCH_SA1100 is not se=
t 
# CONFIG_ARCH_SHARK is not set 
CONFIG_ARCH_BAST=3Dy 
# CONFIG_ARCH=
_AT91RM9200 is not set 
# 
# CONFIG_ARCH_ARC is not set 
# CONFIG_ARCH=
_A5K is not set 
# 
# CONFIG_MACH_VR1000 is not set 
# 
# CONFIG_ARCH=
_CATS is not set 
# CONFIG_ARCH_PERSONAL_SERVER is not set 
# CONFIG_AR=
CH_EBSA285_ADDIN is not set 
# CONFIG_ARCH_EBSA285_HOST is not set 
# C=
ONFIG_ARCH_NETWINDER is not set 
# 
# CONFIG_SA1100_ACCELENT is not set=
 
# CONFIG_SA1100_ASSABET is not set 
# CONFIG_ASSABET_NEPONSET is not =
set 
# CONFIG_SA1100_ADSAGC is not set 
# CONFIG_SA1100_ADSBITSY is not=
 set 
# CONFIG_SA1100_ADSBITSYPLUS is not set 
# CONFIG_SA1100_BRUTUS i=
s not set 
# CONFIG_SA1100_CEP is not set 
# CONFIG_SA1100_CERF is not =
set 
# CONFIG_SA1100_H3100 is not set 
# CONFIG_SA1100_H3600 is not set=
 
# CONFIG_SA1100_H3800 is not set 
# CONFIG_SA1100_H3XXX is not set =0D
=
# CONFIG_H3600_SLEEVE is not set 
# CONFIG_SA1100_EXTENEX1 is not set =0D
=
# CONFIG_SA1100_FLEXANET is not set 
# CONFIG_SA1100_FREEBIRD is not set=
 
# CONFIG_SA1100_FRODO is not set 
# CONFIG_SA1100_GRAPHICSCLIENT is n=
ot set 
# CONFIG_SA1100_GRAPHICSMASTER is not set 
# CONFIG_SA1100_HACK=
KIT is not set 
# CONFIG_SA1100_BADGE4 is not set 
# CONFIG_SA1100_JORN=
ADA720 is not set 
# CONFIG_SA1100_HUW_WEBPANEL is not set 
# CONFIG_SA=
1100_ITSY is not set 
# CONFIG_SA1100_LART is not set 
# CONFIG_SA1100_=
NANOENGINE is not set 
# CONFIG_SA1100_OMNIMETER is not set 
# CONFIG_S=
A1100_PANGOLIN is not set 
# CONFIG_SA1100_PLEB is not set 
# CONFIG_SA=
1100_PT_SYSTEM3 is not set 
# CONFIG_SA1100_SHANNON is not set 
# CONFI=
G_SA1100_SHERMAN is not set 
# CONFIG_SA1100_SIMPAD is not set 
# CONFI=
G_SA1100_SIMPUTER is not set 
# CONFIG_SA1100_PFS168 is not set 
# CONF=
IG_SA1100_VICTOR is not set 
# CONFIG_SA1100_XP860 is not set 
# CONFIG=
_SA1100_YOPY is not set 
# CONFIG_SA1100_USB is not set 
# CONFIG_SA110=
0_USB_NETLINK is not set 
# CONFIG_SA1100_USB_CHAR is not set 
# CONFIG=
_SA1100_SSP is not set 
# 
# CONFIG_ARCH_AT91RM9200DK is not set 
# CO=
NFIG_MACH_CSB337 is not set 
# 
# CONFIG_ARCH_AUTCPU12 is not set 
# C=
ONFIG_ARCH_CDB89712 is not set 
# CONFIG_ARCH_CLEP7312 is not set 
# CO=
NFIG_ARCH_EDB7211 is not set 
# CONFIG_ARCH_FORTUNET is not set 
# CONF=
IG_ARCH_GUIDEA07 is not set 
# CONFIG_ARCH_P720T is not set 
# CONFIG_A=
RCH_EP7211 is not set 
# CONFIG_ARCH_EP7212 is not set 
# CONFIG_ARCH_A=
CORN is not set 
# CONFIG_PLD is not set 
# CONFIG_FOOTBRIDGE is not se=
t 
# CONFIG_FOOTBRIDGE_HOST is not set 
# CONFIG_FOOTBRIDGE_ADDIN is no=
t set 
CONFIG_CPU_32=3Dy 
# CONFIG_CPU_26 is not set 
# CONFIG_CPU_ARM=
610 is not set 
# CONFIG_CPU_ARM710 is not set 
# CONFIG_CPU_ARM720T is=
 not set 
# CONFIG_CPU_ARM920T is not set 
CONFIG_CPU_ARM920T=3Dy 
CON=
FIG_CPU_S3C2410X=3Dy 
# CONFIG_CPU_ARM922T is not set 
# CONFIG_CPU_ARM=
926T is not set 
# CONFIG_CPU_ARM1020 is not set 
# CONFIG_CPU_ARM1020E=
 is not set 
# CONFIG_CPU_ARM1022 is not set 
# CONFIG_CPU_ARM1026 is n=
ot set 
# CONFIG_CPU_SA110 is not set 
# CONFIG_CPU_SA1100 is not set =0D
=
# CONFIG_CPU_32v3 is not set 
CONFIG_CPU_32v4=3Dy 
# CONFIG_ARM_THUMB i=
s not set 
# CONFIG_CPU_ICACHE_DISABLE is not set 
# CONFIG_CPU_DCACHE_=
DISABLE is not set 
# CONFIG_CPU_DCACHE_WRITETHROUGH is not set 
# CONF=
IG_DISCONTIGMEM is not set 
# 
# CONFIG_PCI is not set 
CONFIG_ISA=3Dy=
 
# CONFIG_ISA_DMA is not set 
# CONFIG_ZBOOT_ROM is not set 
CONFIG_Z=
BOOT_ROM_TEXT=3D0 
CONFIG_ZBOOT_ROM_BSS=3D0 
# CONFIG_HOTPLUG is not se=
t 
# CONFIG_PCMCIA is not set 
CONFIG_NET=3Dy 
CONFIG_SYSVIPC=3Dy 
# =
CONFIG_BSD_PROCESS_ACCT is not set 
CONFIG_SYSCTL=3Dy 
CONFIG_FPE_NWFPE=
=3Dy 
# CONFIG_FPE_NWFPE_XP is not set 
# CONFIG_FPE_FASTFPE is not set=
 
CONFIG_KCORE_ELF=3Dy 
# CONFIG_KCORE_AOUT is not set 
CONFIG_BINFMT_=
AOUT=3Dy 
CONFIG_BINFMT_ELF=3Dy 
CONFIG_BINFMT_MISC=3Dy 
# CONFIG_PM i=
s not set 
# CONFIG_ARTHUR is not set 
CONFIG_CMDLINE=3D"root=3D/dev/nf=
s rw nfsroot=3D143.225.229.44:/board ip=3Ddhcp init/bin/bash 
console=3D=
ttySAC0" 
CONFIG_ALIGNMENT_TRAP=3Dy 
CONFIG_S3C2410_DMA_PROC=3Dy 
# CO=
NFIG_S3C2410_DMA_DEBUG is not set 
# 
# CONFIG_PARPORT is not set 
# =0D
=
CONFIG_MTD=3Dy 
CONFIG_MTD_DEBUG=3Dy 
CONFIG_MTD_DEBUG_VERBOSE=3D1 
CO=
NFIG_MTD_PARTITIONS=3Dy 
CONFIG_MTD_CONCAT=3Dy 
CONFIG_MTD_REDBOOT_PART=
S=3Dy 
# CONFIG_MTD_CMDLINE_PARTS is not set 
CONFIG_MTD_AFS_PARTS=3Dy =

CONFIG_MTD_CHAR=3Dy 
CONFIG_MTD_BLOCK=3Dy 
# CONFIG_FTL is not set =0D
=
CONFIG_NFTL=3Dy 
CONFIG_NFTL_RW=3Dy 
# 
CONFIG_MTD_CFI=3Dy 
CONFIG_MT=
D_JEDECPROBE=3Dy 
CONFIG_MTD_GEN_PROBE=3Dy 
# CONFIG_MTD_CFI_ADV_OPTION=
S is not set 
CONFIG_MTD_CFI_INTELEXT=3Dy 
CONFIG_MTD_CFI_AMDSTD=3Dy =0D
=
# CONFIG_MTD_CFI_STAA is not set 
CONFIG_MTD_RAM=3Dy 
CONFIG_MTD_ROM=3D=
y 
CONFIG_MTD_ABSENT=3Dy 
# CONFIG_MTD_OBSOLETE_CHIPS is not set 
# CO=
NFIG_MTD_AMDSTD is not set 
# CONFIG_MTD_SHARP is not set 
# CONFIG_MTD=
_JEDEC is not set 
# 
# CONFIG_MTD_PHYSMAP is not set 
# CONFIG_MTD_NO=
RA is not set 
# CONFIG_MTD_ARM_INTEGRATOR is not set 
# CONFIG_MTD_CDB=
89712 is not set 
# CONFIG_MTD_SA1100 is not set 
# CONFIG_MTD_DC21285 =
is not set 
# CONFIG_MTD_IQ80310 is not set 
# CONFIG_MTD_FORTUNET is n=
ot set 
# CONFIG_MTD_EPXA is not set 
CONFIG_MTD_BAST=3Dy 
# CONFIG_MT=
D_VR1000RAM is not set 
# CONFIG_MTD_AUTCPU12 is not set 
# CONFIG_MTD_=
EDB7312 is not set 
# CONFIG_MTD_IMPA7 is not set 
# CONFIG_MTD_CEIVA i=
s not set 
# CONFIG_MTD_PCI is not set 
# CONFIG_MTD_PCMCIA is not set =

# 
# CONFIG_MTD_PMC551 is not set 
# CONFIG_MTD_SLRAM is not set 
# =
CONFIG_MTD_MTDRAM is not set 
# CONFIG_MTD_BLKMTD is not set 
# CONFIG_=
MTD_DOC1000 is not set 
# CONFIG_MTD_DOC2000 is not set 
# CONFIG_MTD_D=
OC2001 is not set 
# CONFIG_MTD_DOCPROBE is not set 
# 
CONFIG_MTD_NAN=
D=3Dy 
CONFIG_MTD_NAND_VERIFY_WRITE=3Dy 
CONFIG_MTD_NAND_S3C2410=3Dy =0D
=
CONFIG_MTD_NAND_BAST=3Dy 
CONFIG_MTD_NAND_IDS=3Dy 
# 
# CONFIG_PNP is =
not set 
# CONFIG_ISAPNP is not set 
# 
# CONFIG_BLK_DEV_FD is not set=
 
# CONFIG_BLK_DEV_XD is not set 
# CONFIG_PARIDE is not set 
# CONFIG=
_BLK_CPQ_DA is not set 
# CONFIG_BLK_CPQ_CISS_DA is not set 
# CONFIG_C=
ISS_SCSI_TAPE is not set 
# CONFIG_CISS_MONITOR_THREAD is not set 
# CO=
NFIG_BLK_DEV_DAC960 is not set 
# CONFIG_BLK_DEV_UMEM is not set 
CONFI=
G_BLK_DEV_LOOP=3Dy 
CONFIG_BLK_DEV_NBD=3Dy 
CONFIG_BLK_DEV_RAM=3Dy 
CO=
NFIG_BLK_DEV_RAM_SIZE=3D4096 
CONFIG_BLK_DEV_INITRD=3Dy 
CONFIG_BLK_STA=
TS=3Dy 
# 
# CONFIG_MD is not set 
# CONFIG_BLK_DEV_MD is not set 
# =
CONFIG_MD_LINEAR is not set 
# CONFIG_MD_RAID0 is not set 
# CONFIG_MD_=
RAID1 is not set 
# CONFIG_MD_RAID5 is not set 
# CONFIG_MD_MULTIPATH i=
s not set 
# CONFIG_BLK_DEV_LVM is not set 
# 
CONFIG_PACKET=3Dy 
CON=
FIG_PACKET_MMAP=3Dy 
CONFIG_NETLINK_DEV=3Dy 
CONFIG_NETFILTER=3Dy 
CON=
FIG_NETFILTER_DEBUG=3Dy 
CONFIG_FILTER=3Dy 
CONFIG_UNIX=3Dy 
CONFIG_IN=
ET=3Dy 
CONFIG_IP_MULTICAST=3Dy 
# CONFIG_IP_ADVANCED_ROUTER is not set=
 
CONFIG_IP_PNP=3Dy 
CONFIG_IP_PNP_DHCP=3Dy 
CONFIG_IP_PNP_BOOTP=3Dy =0D
=
CONFIG_IP_PNP_RARP=3Dy 
# CONFIG_NET_IPIP is not set 
# CONFIG_NET_IPGR=
E is not set 
# CONFIG_IP_MROUTE is not set 
# CONFIG_ARPD is not set =0D
=
# CONFIG_INET_ECN is not set 
# CONFIG_SYN_COOKIES is not set 
# 
# CO=
NFIG_IP_NF_CONNTRACK is not set 
# CONFIG_IP_NF_QUEUE is not set 
# CON=
FIG_IP_NF_IPTABLES is not set 
# CONFIG_IP_NF_ARPTABLES is not set 
# C=
ONFIG_IP_NF_COMPAT_IPCHAINS is not set 
# CONFIG_IP_NF_COMPAT_IPFWADM is=
 not set 
# 
# CONFIG_IP_VS is not set 
# CONFIG_IPV6 is not set 
# C=
ONFIG_KHTTPD is not set 
# 
# CONFIG_IP_SCTP is not set 
# CONFIG_ATM =
is not set 
# CONFIG_VLAN_8021Q is not set 
# CONFIG_IPX is not set =0D
=
# CONFIG_ATALK is not set 
# 
# CONFIG_DEV_APPLETALK is not set 
# CON=
FIG_DECNET is not set 
# CONFIG_BRIDGE is not set 
# CONFIG_X25 is not =
set 
# CONFIG_LAPB is not set 
# CONFIG_LLC is not set 
# CONFIG_NET_D=
IVERT is not set 
# CONFIG_ECONET is not set 
# CONFIG_WAN_ROUTER is no=
t set 
# CONFIG_NET_FASTROUTE is not set 
# CONFIG_NET_HW_FLOWCONTROL i=
s not set 
# 
# CONFIG_NET_SCHED is not set 
# 
# CONFIG_NET_PKTGEN i=
s not set 
# 
CONFIG_NETDEVICES=3Dy 
# 
# CONFIG_ARCNET is not set =0D
=
# CONFIG_DUMMY is not set 
# CONFIG_BONDING is not set 
# CONFIG_EQUALI=
ZER is not set 
# CONFIG_TUN is not set 
# CONFIG_ETHERTAP is not set =0D
=
# 
CONFIG_NET_ETHERNET=3Dy 
# CONFIG_ARM_AM79C961A is not set 
# CONFI=
G_ARM_CIRRUS is not set 
CONFIG_NE2K_BAST=3Dy 
CONFIG_DM9000_BAST=3Dy =0D
=
# CONFIG_SUNLANCE is not set 
# CONFIG_SUNBMAC is not set 
# CONFIG_SUN=
QE is not set 
# CONFIG_SUNGEM is not set 
# CONFIG_NET_VENDOR_3COM is =
not set 
# CONFIG_LANCE is not set 
# CONFIG_NET_VENDOR_SMC is not set =

# CONFIG_NET_VENDOR_RACAL is not set 
# CONFIG_AT1700 is not set 
# C=
ONFIG_DEPCA is not set 
# CONFIG_HP100 is not set 
CONFIG_NET_ISA=3Dy =0D
=
# CONFIG_E2100 is not set 
# CONFIG_EWRK3 is not set 
# CONFIG_EEXPRESS=
 is not set 
# CONFIG_EEXPRESS_PRO is not set 
# CONFIG_HPLAN_PLUS is n=
ot set 
# CONFIG_HPLAN is not set 
# CONFIG_LP486E is not set 
# CONFI=
G_ETH16I is not set 
CONFIG_NE2000=3Dy 
# CONFIG_NET_PCI is not set =0D
=
# CONFIG_NET_POCKET is not set 
# 
# CONFIG_ACENIC is not set 
# CONFI=
G_DL2K is not set 
# CONFIG_E1000 is not set 
# CONFIG_MYRI_SBUS is not=
 set 
# CONFIG_NS83820 is not set 
# CONFIG_HAMACHI is not set 
# CONF=
IG_YELLOWFIN is not set 
# CONFIG_R8169 is not set 
# CONFIG_SK98LIN is=
 not set 
# CONFIG_TIGON3 is not set 
# CONFIG_FDDI is not set 
# CONF=
IG_HIPPI is not set 
# CONFIG_PLIP is not set 
# CONFIG_PPP is not set =

CONFIG_SLIP=3Dy 
CONFIG_SLIP_COMPRESSED=3Dy 
CONFIG_SLIP_SMART=3Dy =0D
=
CONFIG_SLIP_MODE_SLIP6=3Dy 
# 
# CONFIG_NET_RADIO is not set 
# 
# CO=
NFIG_TR is not set 
# CONFIG_NET_FC is not set 
# CONFIG_RCPCI is not s=
et 
# CONFIG_SHAPER is not set 
# 
# CONFIG_WAN is not set 
# 
# CON=
FIG_HAMRADIO is not set 
# 
# CONFIG_IRDA is not set 
# 
CONFIG_IDE=3D=
y 
# 
CONFIG_BLK_DEV_IDE=3Dy 
# CONFIG_BLK_DEV_HD_IDE is not set 
# C=
ONFIG_BLK_DEV_HD is not set 
CONFIG_BLK_DEV_IDEDISK=3Dy 
# CONFIG_IDEDI=
SK_MULTI_MODE is not set 
# CONFIG_IDEDISK_STROKE is not set 
# CONFIG_=
BLK_DEV_IDECS is not set 
CONFIG_BLK_DEV_IDECD=3Dy 
# CONFIG_BLK_DEV_ID=
ETAPE is not set 
# CONFIG_BLK_DEV_IDEFLOPPY is not set 
# CONFIG_BLK_D=
EV_IDESCSI is not set 
# CONFIG_IDE_TASK_IOCTL is not set 
# CONFIG_BLK=
_DEV_CMD640 is not set 
# CONFIG_BLK_DEV_CMD640_ENHANCED is not set 
# =
CONFIG_BLK_DEV_ISAPNP is not set 
CONFIG_BLK_DEV_IDE_BAST=3Dy 
# CONFIG=
_IDE_CHIPSETS is not set 
# CONFIG_IDEDMA_AUTO is not set 
# CONFIG_DMA=
_NONPCI is not set 
# CONFIG_BLK_DEV_ATARAID is not set 
# CONFIG_BLK_D=
EV_ATARAID_PDC is not set 
# CONFIG_BLK_DEV_ATARAID_HPT is not set 
# C=
ONFIG_BLK_DEV_ATARAID_MEDLEY is not set 
# CONFIG_BLK_DEV_ATARAID_SII is=
 not set 
# 
# CONFIG_SCSI is not set 
# 
# CONFIG_I2O is not set =0D
=
# CONFIG_I2O_BLOCK is not set 
# CONFIG_I2O_LAN is not set 
# CONFIG_I2=
O_SCSI is not set 
# CONFIG_I2O_PROC is not set 
# 
# CONFIG_ISDN is n=
ot set 
# 
# CONFIG_INPUT is not set 
# CONFIG_INPUT_KEYBDEV is not se=
t 
# CONFIG_INPUT_MOUSEDEV is not set 
# CONFIG_INPUT_JOYDEV is not set=
 
# CONFIG_INPUT_EVDEV is not set 
# CONFIG_INPUT_UINPUT is not set =0D
=
# CONFIG_INPUT_MX1TS is not set 
# 
CONFIG_VT=3Dy 
CONFIG_VT_CONSOLE=3D=
y 
# CONFIG_SERIAL is not set 
# CONFIG_SERIAL_EXTENDED is not set 
# =
CONFIG_SERIAL_NONSTANDARD is not set 
CONFIG_DUMMY_KEYB=3Dy 
# 
# CONF=
IG_SERIAL_ANAKIN is not set 
# CONFIG_SERIAL_ANAKIN_CONSOLE is not set =0D
=
# CONFIG_SERIAL_AMBA is not set 
# CONFIG_SERIAL_AMBA_CONSOLE is not set=
 
# CONFIG_SERIAL_CLPS711X is not set 
# CONFIG_SERIAL_CLPS711X_CONSOLE=
 is not set 
# CONFIG_SERIAL_21285 is not set 
# CONFIG_SERIAL_21285_OL=
D is not set 
# CONFIG_SERIAL_21285_CONSOLE is not set 
# CONFIG_SERIAL=
_UART00 is not set 
# CONFIG_SERIAL_UART00_CONSOLE is not set 
# CONFIG=
_SERIAL_SA1100 is not set 
# CONFIG_SERIAL_SA1100_CONSOLE is not set =0D
=
# CONFIG_SERIAL_OMAHA is not set 
# CONFIG_SERIAL_OMAHA_CONSOLE is not s=
et 
# CONFIG_SERIAL_AT91 is not set 
# CONFIG_SERIAL_AT91_CONSOLE is no=
t set 
CONFIG_SERIAL_S3C2410X=3Dy 
CONFIG_SERIAL_S3C2410X_CONSOLE=3Dy =0D
=
# CONFIG_SERIAL_8250 is not set 
# CONFIG_SERIAL_8250_CONSOLE is not set=
 
# CONFIG_SERIAL_8250_EXTENDED is not set 
# CONFIG_SERIAL_8250_MANY_P=
ORTS is not set 
# CONFIG_SERIAL_8250_SHARE_IRQ is not set 
# CONFIG_SE=
RIAL_8250_DETECT_IRQ is not set 
# CONFIG_SERIAL_8250_MULTIPORT is not s=
et 
# CONFIG_SERIAL_8250_HUB6 is not set 
# CONFIG_SERIAL_BAST_16550 is=
 not set 
CONFIG_SERIAL_CORE=3Dy 
CONFIG_SERIAL_CORE_CONSOLE=3Dy 
CONF=
IG_UNIX98_PTYS=3Dy 
CONFIG_UNIX98_PTY_COUNT=3D256 
# 
CONFIG_I2C=3Dy =0D
=
CONFIG_I2C_ALGOBIT=3Dy 
# CONFIG_I2C_PHILIPSPAR is not set 
# CONFIG_I2=
C_ELV is not set 
# CONFIG_I2C_VELLEMAN is not set 
# CONFIG_SCx200_I2C=
 is not set 
# CONFIG_I2C_GUIDE is not set 
CONFIG_I2C_S3C2410BIT=3Dy =0D
=
# CONFIG_SCx200_ACB is not set 
# CONFIG_I2C_ALGOPCF is not set 
CONFIG=
_I2C_CHARDEV=3Dy 
CONFIG_I2C_PROC=3Dy 
# CONFIG_I2C_DS1307 is not set =0D
=
# CONFIG_I2C_M41ST87 is not set 
# 
# CONFIG_L3 is not set 
# CONFIG_L=
3_ALGOBIT is not set 
# CONFIG_L3_BIT_SA1100_GPIO is not set 
# CONFIG_=
L3_SA1111 is not set 
# CONFIG_BIT_SA1100_GPIO is not set 
# 
# CONFIG=
_BUSMOUSE is not set 
CONFIG_MOUSE=3Dy 
CONFIG_PSMOUSE=3Dy 
# CONFIG_8=
2C710_MOUSE is not set 
# CONFIG_PC110_PAD is not set 
# CONFIG_MK712_M=
OUSE is not set 
# 
# CONFIG_INPUT_GAMEPORT is not set 
# CONFIG_QIC02=
_TAPE is not set 
# CONFIG_IPMI_HANDLER is not set 
# CONFIG_IPMI_PANIC=
_EVENT is not set 
# CONFIG_IPMI_DEVICE_INTERFACE is not set 
# CONFIG_=
IPMI_KCS is not set 
# CONFIG_IPMI_WATCHDOG is not set 
# 
CONFIG_WATC=
HDOG=3Dy 
# CONFIG_WATCHDOG_NOWAYOUT is not set 
# CONFIG_ACQUIRE_WDT i=
s not set 
# CONFIG_ADVANTECH_WDT is not set 
# CONFIG_ALIM1535_WDT is =
not set 
# CONFIG_ALIM7101_WDT is not set 
# CONFIG_SC520_WDT is not se=
t 
# CONFIG_PCWATCHDOG is not set 
# CONFIG_21285_WATCHDOG is not set =0D
=
# CONFIG_977_WATCHDOG is not set 
# CONFIG_SA1100_WATCHDOG is not set =0D
=
# CONFIG_EPXA_WATCHDOG is not set 
# CONFIG_OMAHA_WATCHDOG is not set =0D
=
CONFIG_S3C2410_WATCHDOG=3Dy 
# CONFIG_AT91_WATCHDOG is not set 
# CONFI=
G_EUROTECH_WDT is not set 
# CONFIG_IB700_WDT is not set 
# CONFIG_WAFE=
R_WDT is not set 
# CONFIG_I810_TCO is not set 
# CONFIG_MIXCOMWD is no=
t set 
# CONFIG_60XX_WDT is not set 
# CONFIG_SC1200_WDT is not set =0D
=
# CONFIG_SCx200_WDT is not set 
# CONFIG_SOFT_WATCHDOG is not set 
# CO=
NFIG_W83877F_WDT is not set 
# CONFIG_WDT is not set 
# CONFIG_WDTPCI i=
s not set 
# CONFIG_MACHZ_WDT is not set 
# CONFIG_AMD7XX_TCO is not se=
t 
# CONFIG_SCx200 is not set 
# CONFIG_SCx200_GPIO is not set 
# CONF=
IG_AMD_PM768 is not set 
# CONFIG_NVRAM is not set 
# CONFIG_RTC is not=
 set 
CONFIG_BAST_RTC=3Dy 
# CONFIG_DTLK is not set 
# CONFIG_R3964 is=
 not set 
# CONFIG_APPLICOM is not set 
# 
# CONFIG_FTAPE is not set =0D
=
# CONFIG_AGP is not set 
# 
# CONFIG_DRM is not set 
# 
# CONFIG_VIDE=
O_DEV is not set 
# 
# CONFIG_QUOTA is not set 
# CONFIG_QFMT_V2 is no=
t set 
# CONFIG_AUTOFS_FS is not set 
# CONFIG_AUTOFS4_FS is not set =0D
=
CONFIG_REISERFS_FS=3Dy 
# CONFIG_REISERFS_CHECK is not set 
# CONFIG_RE=
ISERFS_PROC_INFO is not set 
# CONFIG_ADFS_FS is not set 
# CONFIG_ADFS=
_FS_RW is not set 
# CONFIG_AFFS_FS is not set 
# CONFIG_HFS_FS is not =
set 
# CONFIG_HFSPLUS_FS is not set 
# CONFIG_BEFS_FS is not set 
# CO=
NFIG_BEFS_DEBUG is not set 
# CONFIG_BFS_FS is not set 
CONFIG_EXT3_FS=3D=
y 
CONFIG_JBD=3Dy 
# CONFIG_JBD_DEBUG is not set 
CONFIG_FAT_FS=3Dy =0D
=
CONFIG_MSDOS_FS=3Dy 
# CONFIG_UMSDOS_FS is not set 
CONFIG_VFAT_FS=3Dy =

# CONFIG_EFS_FS is not set 
CONFIG_JFFS_FS=3Dy 
CONFIG_JFFS_FS_VERBOS=
E=3D0 
CONFIG_JFFS_PROC_FS=3Dy 
CONFIG_JFFS2_FS=3Dy 
CONFIG_JFFS2_FS_D=
EBUG=3D0 
CONFIG_CRAMFS=3Dy 
# CONFIG_TMPFS is not set 
CONFIG_RAMFS=3D=
y 
CONFIG_ISO9660_FS=3Dy 
CONFIG_JOLIET=3Dy 
CONFIG_ZISOFS=3Dy 
# CON=
FIG_JFS_FS is not set 
# CONFIG_JFS_DEBUG is not set 
# CONFIG_JFS_STAT=
ISTICS is not set 
# CONFIG_MINIX_FS is not set 
# CONFIG_VXFS_FS is no=
t set 
# CONFIG_NTFS_FS is not set 
# CONFIG_NTFS_RW is not set 
# CON=
FIG_HPFS_FS is not set 
CONFIG_PROC_FS=3Dy 
# CONFIG_DEVFS_FS is not se=
t 
# CONFIG_DEVFS_MOUNT is not set 
# CONFIG_DEVFS_DEBUG is not set =0D
=
CONFIG_DEVPTS_FS=3Dy 
# CONFIG_QNX4FS_FS is not set 
# CONFIG_QNX4FS_RW=
 is not set 
CONFIG_ROMFS_FS=3Dy 
CONFIG_EXT2_FS=3Dy 
# CONFIG_SYSV_FS=
 is not set 
# CONFIG_UDF_FS is not set 
# CONFIG_UDF_RW is not set =0D
=
# CONFIG_UFS_FS is not set 
# CONFIG_UFS_FS_WRITE is not set 
# CONFIG_=
XFS_FS is not set 
# CONFIG_XFS_QUOTA is not set 
# CONFIG_XFS_RT is no=
t set 
# CONFIG_XFS_TRACE is not set 
# CONFIG_XFS_DEBUG is not set =0D
=
# 
# CONFIG_CODA_FS is not set 
# CONFIG_INTERMEZZO_FS is not set 
CON=
FIG_NFS_FS=3Dy 
CONFIG_NFS_V3=3Dy 
# CONFIG_NFS_DIRECTIO is not set =0D
=
CONFIG_ROOT_NFS=3Dy 
# CONFIG_NFSD is not set 
# CONFIG_NFSD_V3 is not =
set 
# CONFIG_NFSD_TCP is not set 
CONFIG_SUNRPC=3Dy 
CONFIG_LOCKD=3Dy=
 
CONFIG_LOCKD_V4=3Dy 
# CONFIG_SMB_FS is not set 
# CONFIG_NCP_FS is =
not set 
# CONFIG_NCPFS_PACKET_SIGNING is not set 
# CONFIG_NCPFS_IOCTL=
_LOCKING is not set 
# CONFIG_NCPFS_STRONG is not set 
# CONFIG_NCPFS_N=
FS_NS is not set 
# CONFIG_NCPFS_OS2_NS is not set 
# CONFIG_NCPFS_SMAL=
LDOS is not set 
# CONFIG_NCPFS_NLS is not set 
# CONFIG_NCPFS_EXTRAS i=
s not set 
CONFIG_ZISOFS_FS=3Dy 
# 
CONFIG_PARTITION_ADVANCED=3Dy 
# =
CONFIG_ACORN_PARTITION is not set 
# CONFIG_OSF_PARTITION is not set =0D
=
# CONFIG_AMIGA_PARTITION is not set 
# CONFIG_ATARI_PARTITION is not set=
 
# CONFIG_MAC_PARTITION is not set 
CONFIG_MSDOS_PARTITION=3Dy 
CONFI=
G_BSD_DISKLABEL=3Dy 
CONFIG_MINIX_SUBPARTITION=3Dy 
CONFIG_SOLARIS_X86_=
PARTITION=3Dy 
CONFIG_UNIXWARE_DISKLABEL=3Dy 
# CONFIG_LDM_PARTITION is=
 not set 
# CONFIG_SGI_PARTITION is not set 
# CONFIG_ULTRIX_PARTITION =
is not set 
# CONFIG_SUN_PARTITION is not set 
# CONFIG_EFI_PARTITION i=
s not set 
# CONFIG_SMB_NLS is not set 
CONFIG_NLS=3Dy 
# 
CONFIG_NLS=
_DEFAULT=3D"iso8859-1" 
CONFIG_NLS_CODEPAGE_437=3Dy 
# CONFIG_NLS_CODEP=
AGE_737 is not set 
# CONFIG_NLS_CODEPAGE_775 is not set 
CONFIG_NLS_CO=
DEPAGE_850=3Dy 
CONFIG_NLS_CODEPAGE_852=3Dy 
# CONFIG_NLS_CODEPAGE_855 =
is not set 
# CONFIG_NLS_CODEPAGE_857 is not set 
# CONFIG_NLS_CODEPAGE=
_860 is not set 
# CONFIG_NLS_CODEPAGE_861 is not set 
# CONFIG_NLS_COD=
EPAGE_862 is not set 
# CONFIG_NLS_CODEPAGE_863 is not set 
# CONFIG_NL=
S_CODEPAGE_864 is not set 
# CONFIG_NLS_CODEPAGE_865 is not set 
# CONF=
IG_NLS_CODEPAGE_866 is not set 
# CONFIG_NLS_CODEPAGE_869 is not set =0D
=
# CONFIG_NLS_CODEPAGE_936 is not set 
# CONFIG_NLS_CODEPAGE_950 is not s=
et 
# CONFIG_NLS_CODEPAGE_932 is not set 
# CONFIG_NLS_CODEPAGE_949 is =
not set 
# CONFIG_NLS_CODEPAGE_874 is not set 
# CONFIG_NLS_ISO8859_8 i=
s not set 
# CONFIG_NLS_CODEPAGE_1250 is not set 
# CONFIG_NLS_CODEPAGE=
_1251 is not set 
# CONFIG_NLS_ISO8859_1 is not set 
# CONFIG_NLS_ISO88=
59_2 is not set 
# CONFIG_NLS_ISO8859_3 is not set 
# CONFIG_NLS_ISO885=
9_4 is not set 
# CONFIG_NLS_ISO8859_5 is not set 
# CONFIG_NLS_ISO8859=
_6 is not set 
# CONFIG_NLS_ISO8859_7 is not set 
# CONFIG_NLS_ISO8859_=
9 is not set 
# CONFIG_NLS_ISO8859_13 is not set 
# CONFIG_NLS_ISO8859_=
14 is not set 
# CONFIG_NLS_ISO8859_15 is not set 
# CONFIG_NLS_KOI8_R =
is not set 
# CONFIG_NLS_KOI8_U is not set 
# CONFIG_NLS_UTF8 is not se=
t 
# 
# CONFIG_VGA_CONSOLE is not set 
# 
# CONFIG_FB is not set 
# =

# CONFIG_SOUND is not set 
# 
# CONFIG_MCP is not set 
# CONFIG_MCP_=
SA1100 is not set 
# CONFIG_MCP_UCB1200 is not set 
# CONFIG_MCP_UCB120=
0_AUDIO is not set 
# CONFIG_MCP_UCB1200_TS is not set 
# 
# CONFIG_US=
B is not set 
# 
# CONFIG_USB_GADGET is not set 
# 
# CONFIG_BLUEZ is=
 not set 
# 
CONFIG_FRAME_POINTER=3Dy 
CONFIG_DEBUG_USER=3Dy 
CONFIG_=
DEBUG_INFO=3Dy 
# CONFIG_NO_PGT_CACHE is not set 
CONFIG_DEBUG_KERNEL=3D=
y 
CONFIG_DEBUG_SLAB=3Dy 
CONFIG_MAGIC_SYSRQ=3Dy 
CONFIG_DEBUG_SPINLOC=
K=3Dy 
CONFIG_DEBUG_WAITQ=3Dy 
CONFIG_DEBUG_BUGVERBOSE=3Dy 
CONFIG_DEB=
UG_ERRORS=3Dy 
CONFIG_DEBUG_LL=3Dy 
# CONFIG_DEBUG_DC21285_PORT is not =
set 
# CONFIG_DEBUG_CLPS711X_UART2 is not set 
CONFIG_DEBUG_S3C2410X_UA=
RT0=3Dy 
# CONFIG_DEBUG_VR1000_SER3 is not set 
# 
# CONFIG_CRC32 is n=
ot set 
CONFIG_ZLIB_INFLATE=3Dy 
CONFIG_ZLIB_DEFLATE=3Dy 
 
Thanks. 
