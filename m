Received: from [218.6.168.90] (helo=mail.bigwww.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1ByNlM-0008Ei-JH
	for linux-mtd@lists.infradead.org; Sat, 21 Aug 2004 00:46:01 -0400
From: <xuelu@xuelu.org>
To: <linux-mtd@lists.infradead.org>
Date: Sat, 21 Aug 2004 12:45:20 +0800
Message-ID: <001c01c48739$b268e140$0600a8c0@fujitsu>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Hello,About jffs2 on NAND,on S3C2410
Reply-To: xuelu@xuelu.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello everybody:
   I am using Samsung SMDK S3C2410 with one 64MB SM card,MIZI linux, Linux
version 2.4.18-rmk7-pxa1 with jffs2 compiled in.Now I meet one problem of
erase jffs2 filesystem on SM card.
	I have done the kernel to partition my SM card as:
------------------------------------------------------------------
NAND device: Manufacture ID: 0xec, Chip ID: 0x76 (Samsung K9D1208V0M)
Creating 5 MTD partitions on "Samsung K9D1208V0M":
0x00000000-0x00020000 : "vivi"
0x00020000-0x00030000 : "param"
0x00030000-0x00100000 : "kernel"
0x00100000-0x02800000 : "root"
0x02800000-0x03ffc000 : "data"
-------------------------------------------------------------------
	I use vivi to part the SM card as the same size above and specify
the "data" to jffs2:
-------------------------------------------------------------------
vivi> part show
mtdpart info. (5 partitions)
name              offset        size        flag
------------------------------------------------
vivi            : 0x00000000    0x00020000     4  128k
param           : 0x00020000    0x00010000     4   64k
kernel          : 0x00030000    0x000c0000     4  768k
root            : 0x00100000    0x02700000     4   39M
data            : 0x02800000    0x017fc000     8   23M+1008k
------------------------------------------------
	The flag 4 is CRAMFS,the flag 8 is jffs2.
	The vivi has no "flash erase" command to format/erase the mtdblock.
	Now,I try to use the mtd's util tools to erase the jffs2 part.
	I cvs the recently source code,cross-compiled the util dir in the
mtd's source tree.
	I use flash_erase/flash_eraseall/flash_info do as follow:
-------------------------------------------------
# ./flash_erase /dev/mtd/4
File open error
# ./flash_erase /dev/mtdblock/4 
Erase Total 1 Units
# ./flash_eraseall  /dev/mtd/4 
./flash_eraseall: /dev/mtd/4: Permission denied
# ./flash_eraseall  /dev/mtdblock/4 
./flash_eraseall: /dev/mtdblock/4: unable to get MTD device info
# ./flash_info /dev/mtd/4
Device /dev/mtd/4 has 0 erase regions
# ./flash_info /dev/mtdblock/4 
# mkdir /tmp/mtd
# mount -t jffs2 /dev/mtd/4 /tmp/mtd/
mount: Mounting /dev/mtd/4 on /tmp/mtd failed: Block device required
# mount -t jffs2 /dev/mtdblock/4 /tmp/mtd/ 
mount: Mounting /dev/mtdblock/4 on /tmp/mtd failed: Permission denied
# mount
/dev/mtdblock/3 on / type cramfs (rw)
none on /dev type devfs (rw)
ramfs on /etc type ramfs (rw)
none on /proc type proc (rw)
none on /dev/pts type devpts (rw)
tmpfs on /dev/shm type tmpfs (rw)
-----------------------------------------
	I also tried to use jffs2 image to dd:
-----------------------------------------
# dd if=data.img of=/dev/mtdblock/4
dd: /dev/mtdblock/4: Operation not permitted
# dd if=data.img of=/dev/mtd/4     
dd: /dev/mtd/4: Permission denied
-----------------------------------------
	Other more,the device seems readonly,I am comfused here:
-----------------------------------------
# cd /dev/mtd/
# ls -l
crw-rw-rw-    1 0        0         90,   0 Jan  1  1970 0
crw-rw-rw-    1 0        0         90,   1 Jan  1  1970 0ro
crw-rw-rw-    1 0        0         90,   2 Jan  1  1970 1
crw-rw-rw-    1 0        0         90,   3 Jan  1  1970 1ro
crw-rw-rw-    1 0        0         90,   4 Jan  1  1970 2
crw-rw-rw-    1 0        0         90,   5 Jan  1  1970 2ro
crw-rw-rw-    1 0        0         90,   6 Jan  1  1970 3
crw-rw-rw-    1 0        0         90,   7 Jan  1  1970 3ro
crw-rw-rw-    1 0        0         90,   8 Jan  1  1970 4
crw-rw-rw-    1 0        0         90,   9 Jan  1  1970 4ro
# cd /dev/mtdblock/
# ls -l
brw-rw-rw-    1 0        0         31,   0 Jan  1  1970 0
brw-rw-rw-    1 0        0         31,   1 Jan  1  1970 1
brw-rw-rw-    1 0        0         31,   2 Jan  1  1970 2
brw-rw-rw-    1 0        0         31,   3 Jan  1  1970 3
brw-rw-rw-    1 0        0         31,   4 Jan  1  1970 4
-----------------------------------------
I guess the *ro means the block filesystem is readonly,so so much "
Permission denied" show......
I do not know how to do with this problem......
Can somebody help?Thanks first.;-(
Paste my kernel's .config:
-----------------------------------------
[root@xuelu]#grep MTD .config
# Memory Technology Devices (MTD)
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0x4000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=2
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_CDB89712 is not set
# CONFIG_MTD_SA1100 is not set
# CONFIG_MTD_DC21285 is not set
# CONFIG_MTD_LUBBOCK is not set
# CONFIG_MTD_FORTUNET is not set
# CONFIG_MTD_EPXA10DB is not set
# CONFIG_MTD_PXA_CERF is not set
# CONFIG_MTD_AUTCPU12 is not set
# CONFIG_MTD_PCI is not set
# Self-contained MTD device drivers
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set
# CONFIG_MTD_NAND is not set
CONFIG_MTD_SMC=y
CONFIG_MTD_NANDY=y
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
# CONFIG_MTD_NAND_BONFS is not set
CONFIG_MTD_SMC_S3C2410_SMDK=y
[root@xuelu]# grep -i NAND .config
# NAND Flash Device Drivers
# CONFIG_MTD_NAND is not set
CONFIG_MTD_NANDY=y
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
# CONFIG_MTD_NAND_BONFS is not set
[root@xuelu]# grep -i jffs .config
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
[root@xuelu]# grep -i cfi .config 
CONFIG_MTD_CFI=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
-----------------------------------------

Thanks very much again~~!!!

	
xuelu@2004.08.21.China
