Received: from web13405.mail.yahoo.com ([216.136.175.63])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 1875DL-0002Bk-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2002 02:37:43 +0000
Message-ID: <20021031030757.2845.qmail@web13405.mail.yahoo.com>
Date: Wed, 30 Oct 2002 19:07:57 -0800 (PST)
From: Norm Legare <normlegare@yahoo.com>
Subject: Is AM29F016 CFI-compliant?
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello,  

I have searched the archives with this question, and someone has asked
the same question, but no definitive answer could be found.

Also, below is some output from my board and part of my .config in case
there is something obvious which is in error.

Thanks,
Norm

block: queued sectors max/low 9237kB/3079kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 814k freed
physmap flash device: 800000 at fe000000
CFI: Found no Physically mapped flash device at location zero
blkmtd: error, missing `device' name
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
VFS: Mounted root (ext2 filesystem).
Freeing unused kernel memory: 40k init
init started:  BusyBox v0.51 (2002.10.31-01:06+0000) multi-call bi###
Application running ...

BusyBox v0.51 (2002.10.31-01:06+0000) Built-in shell (lash)
Enter 'help' for a list of built-in commands.

/ # cat /proc/devices
Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
 10 misc
162 raw

Block devices:
  1 ramdisk
 31 mtdblock

/ # cat /proc/mtd    
dev:    size   erasesize  name
/ # 


(.config snipped)

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set

#
# User Modules And Translation Layers
#
# CONFIG_MTD_CHAR is not set
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=fe000000
CONFIG_MTD_PHYSMAP_LEN=800000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_C2MON is not set
# CONFIG_MTD_CU824 is not set
# CONFIG_MTD_ICU862 is not set
# CONFIG_MTD_IDIF855 is not set
# CONFIG_MTD_DBOX2 is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_R360MPI is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_TQM8xxL is not set
# CONFIG_MTD_TQM8260 is not set
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLKMTD=y


__________________________________________________
Do you Yahoo!?
HotJobs - Search new jobs daily now
http://hotjobs.yahoo.com/
