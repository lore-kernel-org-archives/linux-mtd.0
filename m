Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WN0D-0001IT-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 20:03:53 +0100
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403E3E24D@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: Vipin Malik <Vipin.Malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: Applying MTD to 2.2.x kernel, with more info
Date: Mon, 13 Aug 2001 15:03:36 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi, 

Its me again, Here I have listed the output from make bzImage ... and after
that I have added my config file. I am trying to compile MTD support in a
2.2.18 kernel.

OUTPUT -->
		/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__
-pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=586 -DUTS_MACHINE='"i386"' -c -o init/version.o
init/version.c
		make -C  kernel
		make[1]: Entering directory `/usr/src/linux/kernel'
		make all_targets
		make[2]: Entering directory `/usr/src/linux/kernel'
		make[2]: Nothing to be done for `all_targets'.
		make[2]: Leaving directory `/usr/src/linux/kernel'
		make[1]: Leaving directory `/usr/src/linux/kernel'
		make -C  drivers
		make[1]: Entering directory `/usr/src/linux/drivers'
		make -C block
		make[2]: Entering directory `/usr/src/linux/drivers/block'
		make all_targets
		make[3]: Entering directory `/usr/src/linux/drivers/block'
		make[3]: Nothing to be done for `all_targets'.
		make[3]: Leaving directory `/usr/src/linux/drivers/block'
		make[2]: Leaving directory `/usr/src/linux/drivers/block'
		make -C char
		make[2]: Entering directory `/usr/src/linux/drivers/char'
		make all_targets
		make[3]: Entering directory `/usr/src/linux/drivers/char'
		make[3]: Nothing to be done for `all_targets'.
		make[3]: Leaving directory `/usr/src/linux/drivers/char'
		make[2]: Leaving directory `/usr/src/linux/drivers/char'
		make -C net
		make[2]: Entering directory `/usr/src/linux/drivers/net'
		make all_targets
		make[3]: Entering directory `/usr/src/linux/drivers/net'
		make[3]: Nothing to be done for `all_targets'.
		make[3]: Leaving directory `/usr/src/linux/drivers/net'
		make[2]: Leaving directory `/usr/src/linux/drivers/net'
		make -C misc
		make[2]: Entering directory `/usr/src/linux/drivers/misc'
		make all_targets
		make[3]: Entering directory `/usr/src/linux/drivers/misc'
		make[3]: Nothing to be done for `all_targets'.
		make[3]: Leaving directory `/usr/src/linux/drivers/misc'
		make[2]: Leaving directory `/usr/src/linux/drivers/misc'
		make -C sound
		make[2]: Entering directory `/usr/src/linux/drivers/sound'
		make all_targets
		make[3]: Entering directory `/usr/src/linux/drivers/sound'
		make[3]: Nothing to be done for `all_targets'.
		make[3]: Leaving directory `/usr/src/linux/drivers/sound'
		make[2]: Leaving directory `/usr/src/linux/drivers/sound'
		make -C pci
		make[2]: Entering directory `/usr/src/linux/drivers/pci'
		make all_targets
		make[3]: Entering directory `/usr/src/linux/drivers/pci'
		make[3]: Nothing to be done for `all_targets'.
		make[3]: Leaving directory `/usr/src/linux/drivers/pci'
		make[2]: Leaving directory `/usr/src/linux/drivers/pci'
		make -C video
		make[2]: Entering directory `/usr/src/linux/drivers/video'
		make all_targets
		make[3]: Entering directory `/usr/src/linux/drivers/video'
		make[3]: Nothing to be done for `all_targets'.
		make[3]: Leaving directory `/usr/src/linux/drivers/video'
		make[2]: Leaving directory `/usr/src/linux/drivers/video'
		make -C mtd
		make[2]: Entering directory `/usr/src/linux/drivers/mtd'
		make -C chips
		make[3]: Entering directory
`/usr/src/linux/drivers/mtd/chips'
		make all_targets
		make[4]: Entering directory
`/usr/src/linux/drivers/mtd/chips'
		/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__
-pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=586   -DEXPORT_SYMTAB -c chipreg.c
		chipreg.c: In function `do_map_probe':
		chipreg.c:67: parse error before `do'
		chipreg.c:63: warning: unused variable `ret'
		chipreg.c:69: warning: control reaches end of non-void
function
		chipreg.c: At top level:
		chipreg.c:73: warning: type defaults to `int' in declaration
of `ret'
		chipreg.c:73: `drv' undeclared here (not in a function)
		chipreg.c:73: `map' undeclared here (not in a function)
		chipreg.c:73: warning: data definition has no type or
storage class
		chipreg.c:80: parse error before `if'
		make[4]: *** [chipreg.o] Error 1
		make[4]: Leaving directory
`/usr/src/linux/drivers/mtd/chips'
		make[3]: *** [first_rule] Error 2
		make[3]: Leaving directory
`/usr/src/linux/drivers/mtd/chips'
		make[2]: *** [_subdir_chips] Error 2
		make[2]: Leaving directory `/usr/src/linux/drivers/mtd'
		make[1]: *** [_subdir_mtd] Error 2
		make[1]: Leaving directory `/usr/src/linux/drivers'
		make: *** [_dir_drivers] Error 2














CONFIG FILE -->

		#
		# Automatically generated make config: don't edit
		#

		#
		# Code maturity level options
		#
		# CONFIG_EXPERIMENTAL is not set

		#
		# Processor type and features
		#
		# CONFIG_M386 is not set
		# CONFIG_M486 is not set
		CONFIG_M586=y
		# CONFIG_M586TSC is not set
		# CONFIG_M686 is not set
		CONFIG_X86_WP_WORKS_OK=y
		CONFIG_X86_INVLPG=y
		CONFIG_X86_BSWAP=y
		CONFIG_X86_POPAD_OK=y
		# CONFIG_MICROCODE is not set
		# CONFIG_X86_MSR is not set
		# CONFIG_X86_CPUID is not set
		CONFIG_1GB=y
		# CONFIG_2GB is not set
		# CONFIG_MATH_EMULATION is not set
		# CONFIG_MTRR is not set
		CONFIG_SMP=y

		#
		# Loadable module support
		#
		CONFIG_MODULES=y
		# CONFIG_MODVERSIONS is not set
		# CONFIG_KMOD is not set

		#
		# General setup
		#
		CONFIG_NET=y
		CONFIG_PCI=y
		# CONFIG_PCI_GOBIOS is not set
		# CONFIG_PCI_GODIRECT is not set
		CONFIG_PCI_GOANY=y
		CONFIG_PCI_BIOS=y
		CONFIG_PCI_DIRECT=y
		CONFIG_PCI_QUIRKS=y
		CONFIG_PCI_OLD_PROC=y
		# CONFIG_MCA is not set
		# CONFIG_VISWS is not set
		CONFIG_X86_IO_APIC=y
		CONFIG_X86_LOCAL_APIC=y
		CONFIG_SYSVIPC=y
		# CONFIG_BSD_PROCESS_ACCT is not set
		CONFIG_SYSCTL=y
		CONFIG_BINFMT_AOUT=y
		CONFIG_BINFMT_ELF=y
		CONFIG_BINFMT_MISC=y
		# CONFIG_PARPORT is not set
		# CONFIG_APM is not set
		# CONFIG_TOSHIBA is not set

		#
		# Memory Technology Devices (MTD)
		#
		CONFIG_MTD=y
		CONFIG_MTD_DEBUG=y
		CONFIG_MTD_DEBUG_VERBOSE=3
		# CONFIG_MTD_PARTITIONS is not set

		#
		# User Modules And Translation Layers
		#
		# CONFIG_MTD_CHAR is not set
		# CONFIG_MTD_BLOCK is not set
		# CONFIG_MTD_BLOCK_RO is not set
		# CONFIG_FTL is not set
		# CONFIG_NFTL is not set

		#
		# RAM/ROM/Flash chip drivers
		#
		# CONFIG_MTD_CFI is not set
		# CONFIG_MTD_AMDSTD is not set
		# CONFIG_MTD_SHARP is not set
		# CONFIG_MTD_RAM is not set
		# CONFIG_MTD_ROM is not set
		# CONFIG_MTD_JEDEC is not set

		#
		# Mapping drivers for chip access
		#
		# CONFIG_MTD_SUN_UFLASH is not set
		# CONFIG_MTD_OCELOT is not set

		#
		# Self-contained MTD device drivers
		#
		# CONFIG_MTD_PMC551 is not set
		# CONFIG_MTD_SLRAM is not set
		# CONFIG_MTD_LART is not set
		# CONFIG_MTD_MTDRAM is not set
		# CONFIG_MTD_BLKMTD is not set

		#
		# Disk-On-Chip Device Drivers
		#
		# CONFIG_MTD_DOC1000 is not set
		CONFIG_MTD_DOC2000=y
		# CONFIG_MTD_DOC2001 is not set
		CONFIG_MTD_DOCPROBE=y
		# CONFIG_MTD_DOCPROBE_ADVANCED is not set
		CONFIG_MTD_DOCPROBE_ADDRESS=0
		# CONFIG_MTD_DOCPROBE_HIGH is not set
		# CONFIG_MTD_DOCPROBE_55AA is not set

		#
		# NAND Flash Device Drivers
		#
		# CONFIG_MTD_NAND is not set

		#
		# Plug and Play support
		#
		# CONFIG_PNP is not set

		#
		# Block devices
		#
		CONFIG_BLK_DEV_FD=y
		CONFIG_BLK_DEV_IDE=y

		#
		# Please see Documentation/ide.txt for help/info on IDE
drives
		#
		# CONFIG_BLK_DEV_HD_IDE is not set
		CONFIG_BLK_DEV_IDEDISK=y
		CONFIG_BLK_DEV_IDECD=y
		# CONFIG_BLK_DEV_IDETAPE is not set
		# CONFIG_BLK_DEV_IDEFLOPPY is not set
		# CONFIG_BLK_DEV_IDESCSI is not set
		CONFIG_BLK_DEV_CMD640=y
		# CONFIG_BLK_DEV_CMD640_ENHANCED is not set
		CONFIG_BLK_DEV_RZ1000=y
		CONFIG_BLK_DEV_IDEPCI=y
		CONFIG_BLK_DEV_IDEDMA=y
		# CONFIG_BLK_DEV_OFFBOARD is not set
		CONFIG_IDEDMA_AUTO=y
		# CONFIG_IDE_CHIPSETS is not set

		#
		# Additional Block Devices
		#
		# CONFIG_BLK_DEV_LOOP is not set
		# CONFIG_BLK_DEV_NBD is not set
		# CONFIG_BLK_DEV_MD is not set
		# CONFIG_BLK_DEV_RAM is not set
		# CONFIG_BLK_DEV_XD is not set
		# CONFIG_BLK_DEV_DAC960 is not set
		CONFIG_PARIDE_PARPORT=y
		# CONFIG_PARIDE is not set
		# CONFIG_BLK_CPQ_DA is not set
		# CONFIG_BLK_CPQ_CISS_DA is not set
		# CONFIG_BLK_DEV_HD is not set

		#
		# Networking options
		#
		CONFIG_PACKET=y
		# CONFIG_NETLINK is not set
		# CONFIG_FIREWALL is not set
		# CONFIG_FILTER is not set
		CONFIG_UNIX=y
		CONFIG_INET=y
		# CONFIG_IP_MULTICAST is not set
		# CONFIG_IP_ADVANCED_ROUTER is not set
		# CONFIG_IP_PNP is not set
		# CONFIG_IP_ROUTER is not set
		# CONFIG_NET_IPIP is not set
		# CONFIG_NET_IPGRE is not set
		# CONFIG_IP_ALIAS is not set
		# CONFIG_SYN_COOKIES is not set

		#
		# (it is safe to leave these untouched)
		#
		# CONFIG_INET_RARP is not set
		CONFIG_SKB_LARGE=y

		#
		#  
		#
		# CONFIG_IPX is not set
		# CONFIG_ATALK is not set

		#
		# Telephony Support
		#
		# CONFIG_PHONE is not set

		#
		# SCSI support
		#
		CONFIG_SCSI=y

		#
		# SCSI support type (disk, tape, CD-ROM)
		#
		CONFIG_BLK_DEV_SD=y
		# CONFIG_CHR_DEV_ST is not set
		# CONFIG_BLK_DEV_SR is not set
		# CONFIG_CHR_DEV_SG is not set

		#
		# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
		#
		CONFIG_SCSI_MULTI_LUN=y
		CONFIG_SCSI_CONSTANTS=y
		# CONFIG_SCSI_LOGGING is not set

		#
		# SCSI low-level drivers
		#
		# CONFIG_SCSI_7000FASST is not set
		# CONFIG_SCSI_ACARD is not set
		# CONFIG_SCSI_AHA152X is not set
		# CONFIG_SCSI_AHA1542 is not set
		# CONFIG_SCSI_AHA1740 is not set
		# CONFIG_SCSI_AIC7XXX is not set
		# CONFIG_SCSI_IPS is not set
		# CONFIG_SCSI_ADVANSYS is not set
		# CONFIG_SCSI_IN2000 is not set
		# CONFIG_SCSI_AM53C974 is not set
		# CONFIG_SCSI_MEGARAID is not set
		# CONFIG_SCSI_BUSLOGIC is not set
		# CONFIG_SCSI_CPQFCTS is not set
		# CONFIG_SCSI_DTC3280 is not set
		# CONFIG_SCSI_EATA is not set
		# CONFIG_SCSI_EATA_DMA is not set
		# CONFIG_SCSI_EATA_PIO is not set
		# CONFIG_SCSI_FUTURE_DOMAIN is not set
		# CONFIG_SCSI_GDTH is not set
		# CONFIG_SCSI_GENERIC_NCR5380 is not set
		# CONFIG_SCSI_INITIO is not set
		# CONFIG_SCSI_INIA100 is not set
		# CONFIG_SCSI_NCR53C406A is not set
		# CONFIG_SCSI_SYM53C416 is not set
		# CONFIG_SCSI_SIM710 is not set
		# CONFIG_SCSI_NCR53C7xx is not set
		# CONFIG_SCSI_NCR53C8XX is not set
		CONFIG_SCSI_SYM53C8XX=y
		CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=4
		CONFIG_SCSI_NCR53C8XX_MAX_TAGS=32
		CONFIG_SCSI_NCR53C8XX_SYNC=20
		# CONFIG_SCSI_NCR53C8XX_IOMAPPED is not set
		# CONFIG_SCSI_NCR53C8XX_PQS_PDS is not set
		# CONFIG_SCSI_PAS16 is not set
		# CONFIG_SCSI_PCI2000 is not set
		# CONFIG_SCSI_PCI2220I is not set
		# CONFIG_SCSI_PSI240I is not set
		# CONFIG_SCSI_QLOGIC_FAS is not set
		# CONFIG_SCSI_QLOGIC_ISP is not set
		# CONFIG_SCSI_QLOGIC_FC is not set
		# CONFIG_SCSI_SEAGATE is not set
		# CONFIG_SCSI_DC390T is not set
		# CONFIG_SCSI_T128 is not set
		# CONFIG_SCSI_U14_34F is not set
		# CONFIG_SCSI_ULTRASTOR is not set

		#
		# I2O device support
		#
		# CONFIG_I2O is not set

		#
		# Network device support
		#
		CONFIG_NETDEVICES=y

		#
		# ARCnet devices
		#
		# CONFIG_ARCNET is not set
		CONFIG_DUMMY=m
		# CONFIG_BONDING is not set
		# CONFIG_EQUALIZER is not set
		# CONFIG_NET_SB1000 is not set

		#
		# Ethernet (10 or 100Mbit)
		#
		CONFIG_NET_ETHERNET=y
		# CONFIG_NET_VENDOR_3COM is not set
		# CONFIG_LANCE is not set
		# CONFIG_NET_VENDOR_SMC is not set
		# CONFIG_NET_VENDOR_RACAL is not set
		# CONFIG_NET_ISA is not set
		CONFIG_NET_EISA=y
		# CONFIG_PCNET32 is not set
		# CONFIG_APRICOT is not set
		# CONFIG_CS89x0 is not set
		# CONFIG_DE4X5 is not set
		# CONFIG_DEC_ELCP is not set
		# CONFIG_DEC_ELCP_OLD is not set
		# CONFIG_DGRS is not set
		CONFIG_EEXPRESS_PRO100=y
		# CONFIG_NE2K_PCI is not set
		# CONFIG_TLAN is not set
		# CONFIG_VIA_RHINE is not set
		# CONFIG_SIS900 is not set
		# CONFIG_NET_POCKET is not set

		#
		# Ethernet (1000 Mbit)
		#
		# CONFIG_SK98LIN is not set
		# CONFIG_FDDI is not set
		# CONFIG_PPP is not set
		# CONFIG_SLIP is not set
		# CONFIG_NET_RADIO is not set

		#
		# Token ring devices
		#
		# CONFIG_TR is not set
		# CONFIG_NET_FC is not set

		#
		# Wan interfaces
		#
		# CONFIG_HOSTESS_SV11 is not set
		# CONFIG_COSA is not set
		# CONFIG_SEALEVEL_4021 is not set
		# CONFIG_SYNCLINK_SYNCPPP is not set
		# CONFIG_LANMEDIA is not set
		# CONFIG_COMX is not set
		# CONFIG_DLCI is not set
		# CONFIG_WAN_DRIVERS is not set
		# CONFIG_XPEED is not set
		# CONFIG_SBNI is not set

		#
		# Amateur Radio support
		#
		# CONFIG_HAMRADIO is not set

		#
		# IrDA (infrared) support
		#
		# CONFIG_IRDA is not set

		#
		# ISDN subsystem
		#
		# CONFIG_ISDN is not set

		#
		# Old CD-ROM drivers (not SCSI, not IDE)
		#
		# CONFIG_CD_NO_IDESCSI is not set

		#
		# Character devices
		#
		CONFIG_VT=y
		CONFIG_VT_CONSOLE=y
		CONFIG_SERIAL=y
		# CONFIG_SERIAL_CONSOLE is not set
		# CONFIG_SERIAL_EXTENDED is not set
		# CONFIG_SERIAL_NONSTANDARD is not set
		CONFIG_UNIX98_PTYS=y
		CONFIG_UNIX98_PTY_COUNT=256
		CONFIG_MOUSE=y

		#
		# Mice
		#
		# CONFIG_ATIXL_BUSMOUSE is not set
		# CONFIG_BUSMOUSE is not set
		# CONFIG_MS_BUSMOUSE is not set
		CONFIG_PSMOUSE=y
		CONFIG_82C710_MOUSE=y
		# CONFIG_PC110_PAD is not set

		#
		# Joysticks
		#
		# CONFIG_JOYSTICK is not set
		# CONFIG_QIC02_TAPE is not set
		# CONFIG_WATCHDOG is not set
		# CONFIG_NVRAM is not set
		# CONFIG_RTC is not set
		# CONFIG_INTEL_RNG is not set

		#
		# Video For Linux
		#
		# CONFIG_VIDEO_DEV is not set
		# CONFIG_DTLK is not set

		#
		# Ftape, the floppy tape device driver
		#
		# CONFIG_FTAPE is not set

		#
		# USB support
		#
		# CONFIG_USB is not set

		#
		# Filesystems
		#
		# CONFIG_QUOTA is not set
		CONFIG_AUTOFS_FS=y
		# CONFIG_AFFS_FS is not set
		# CONFIG_HFS_FS is not set
		# CONFIG_FAT_FS is not set
		CONFIG_ISO9660_FS=y
		# CONFIG_JOLIET is not set
		# CONFIG_MINIX_FS is not set
		# CONFIG_NTFS_FS is not set
		# CONFIG_HPFS_FS is not set
		CONFIG_PROC_FS=y
		CONFIG_DEVPTS_FS=y
		# CONFIG_ROMFS_FS is not set
		CONFIG_EXT2_FS=y
		# CONFIG_SYSV_FS is not set
		# CONFIG_UFS_FS is not set

		#
		# Network File Systems
		#
		# CONFIG_CODA_FS is not set
		CONFIG_NFS_FS=y
		# CONFIG_NFS_V3 is not set
		# CONFIG_NFSD is not set
		CONFIG_SUNRPC=y
		CONFIG_LOCKD=y
		# CONFIG_SMB_FS is not set
		# CONFIG_NCP_FS is not set

		#
		# Partition Types
		#
		# CONFIG_BSD_DISKLABEL is not set
		# CONFIG_MAC_PARTITION is not set
		# CONFIG_SMD_DISKLABEL is not set
		# CONFIG_SOLARIS_X86_PARTITION is not set
		# CONFIG_NLS is not set

		#
		# Console drivers
		#
		CONFIG_VGA_CONSOLE=y
		# CONFIG_VIDEO_SELECT is not set

		#
		# Sound
		#
		# CONFIG_SOUND is not set

		#
		# Kernel hacking
		#
		# CONFIG_MAGIC_SYSRQ is not set

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.
