Received: from postfix3-2.free.fr ([213.228.0.169])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kL54-0005Ho-0Y
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 10:59:42 +0100
Message-ID: <1060163960.3f30d17832e6e@impt2-2.free.fr>
Date: Wed,  6 Aug 2003 11:59:20 +0200
From: olivier.eribon@free.fr
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: Bad block problem (MTD & YAFFS on Toshiba TH58512FT Nand Flash)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working on a board with IBM405gpr processor, and for the  FS a Nand flash
with MTD and YAFFS.
I have a problem with this type of nand flash on some board.

NAND device : Manufacture ID: 0x98, Chip ID: 0x76 (Toshiba TH58512FT)
       erasesize : 16384
       size      : 67108864
       eccsize   : 256

I erase all nand flash device (Toshiba TH58512FT) (4096 blocks) under ppcboot
(basic function erase block with 0x60 command and verify status with 0x70 command).
For one block (number 1233) the status after erasing is 0xc1 (expected 0xc0).

I use 3 partitions on Nand device in order to make a small (1Mo) partition with
this bad block.

Now booting linux 2.4.18 with MTD & YAFFS (6 months away) :
===========================================================
# Memory Technology Devices (MTD)
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_NAND=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_UTS=y
CONFIG_MTD_NAND_IDS=y

CONFIG_YAFFS_FS=y


NAND device: Manufacture ID: 0x98, Chip ID: 0x76 (Toshiba NAND 64MB 3,3V)
Partitionning (64Mo)
Creating 3 MTD partitions on "NAND 64MB 3,3V":
0x00000000-0x01300000 : " 18 Mo"
mtd: Giving out device 1 to  18 Mo
0x01300000-0x01400000 : "  1 Mo"
mtd: Giving out device 2 to   1 Mo <===== this patition with the bad block
0x01400000-0x03f00000 : " 44 Mo"
mtd: Giving out device 3 to  44 Mo

Display MTD device partition table :
====================================
# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00020000 00008000 "Physically mapped flash"
mtd1: 01300000 00004000 " 18 Mo"
mtd2: 00100000 00004000 "  1 Mo"
mtd3: 02b00000 00004000 " 44 Mo"

Erase 2nd nand flash partition :
================================
In telnet window : 
# eraseall /dev/mtd2
Erasing 16 Kibyte @ 44000 -- 26 % complete.
eraseall: /dev/mtd2: MTD Erase failure: Input/output error
Erased 1024 Kibyte @ 0 -- 100% complete.
    
In console window :
<6>MTD_open
MTD_ioctl
MTD_ioctl
nand_erase: start = 0x01300000, len = 16384
MTD_ioctl
nand_erase: start = 0x01304000, len = 16384
MTD_ioctl
nand_erase: start = 0x01308000, len = 16384
MTD_ioctl
nand_erase: start = 0x0130c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01310000, len = 16384
MTD_ioctl
nand_erase: start = 0x01314000, len = 16384
MTD_ioctl
nand_erase: start = 0x01318000, len = 16384
MTD_ioctl
nand_erase: start = 0x0131c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01320000, len = 16384
MTD_ioctl
nand_erase: start = 0x01324000, len = 16384
MTD_ioctl
nand_erase: start = 0x01328000, len = 16384
MTD_ioctl
nand_erase: start = 0x0132c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01330000, len = 16384
MTD_ioctl
nand_erase: start = 0x01334000, len = 16384
MTD_ioctl
nand_erase: start = 0x01338000, len = 16384
MTD_ioctl
nand_erase: start = 0x0133c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01340000, len = 16384
MTD_ioctl
nand_erase: start = 0x01344000, len = 16384
nand_erase: Failed erase, page 0x00009a20
MTD_ioctl
nand_erase: start = 0x01348000, len = 16384
MTD_ioctl
nand_erase: start = 0x0134c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01350000, len = 16384
MTD_ioctl
nand_erase: start = 0x01354000, len = 16384
MTD_ioctl
nand_erase: start = 0x01358000, len = 16384
MTD_ioctl
nand_erase: start = 0x0135c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01360000, len = 16384
MTD_ioctl
nand_erase: start = 0x01364000, len = 16384
MTD_ioctl
nand_erase: start = 0x01368000, len = 16384
MTD_ioctl
nand_erase: start = 0x0136c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01370000, len = 16384
MTD_ioctl
nand_erase: start = 0x01374000, len = 16384
MTD_ioctl
nand_erase: start = 0x01378000, len = 16384
MTD_ioctl
nand_erase: start = 0x0137c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01380000, len = 16384
MTD_ioctl
nand_erase: start = 0x01384000, len = 16384
MTD_ioctl
nand_erase: start = 0x01388000, len = 16384
MTD_ioctl
nand_erase: start = 0x0138c000, len = 16384
MTD_ioctl
nand_erase: start = 0x01390000, len = 16384
MTD_ioctl
nand_erase: start = 0x01394000, len = 16384
MTD_ioctl
nand_erase: start = 0x01398000, len = 16384
MTD_ioctl
nand_erase: start = 0x0139c000, len = 16384
MTD_ioctl
nand_erase: start = 0x013a0000, len = 16384
MTD_ioctl
nand_erase: start = 0x013a4000, len = 16384
MTD_ioctl
nand_erase: start = 0x013a8000, len = 16384
MTD_ioctl
nand_erase: start = 0x013ac000, len = 16384
MTD_ioctl
nand_erase: start = 0x013b0000, len = 16384
MTD_ioctl
nand_erase: start = 0x013b4000, len = 16384
MTD_ioctl
nand_erase: start = 0x013b8000, len = 16384
MTD_ioctl
nand_erase: start = 0x013bc000, len = 16384
MTD_ioctl
nand_erase: start = 0x013c0000, len = 16384
MTD_ioctl
nand_erase: start = 0x013c4000, len = 16384
MTD_ioctl
nand_erase: start = 0x013c8000, len = 16384
MTD_ioctl
nand_erase: start = 0x013cc000, len = 16384
MTD_ioctl
nand_erase: start = 0x013d0000, len = 16384
MTD_ioctl
nand_erase: start = 0x013d4000, len = 16384
MTD_ioctl
nand_erase: start = 0x013d8000, len = 16384
MTD_ioctl
nand_erase: start = 0x013dc000, len = 16384
MTD_ioctl
nand_erase: start = 0x013e0000, len = 16384
MTD_ioctl
nand_erase: start = 0x013e4000, len = 16384
MTD_ioctl
nand_erase: start = 0x013e8000, len = 16384
MTD_ioctl
nand_erase: start = 0x013ec000, len = 16384
MTD_ioctl
nand_erase: start = 0x013f0000, len = 16384
MTD_ioctl
nand_erase: start = 0x013f4000, len = 16384
MTD_ioctl
nand_erase: start = 0x013f8000, len = 16384
MTD_ioctl
nand_erase: start = 0x013fc000, len = 16384
MTD_close
nand_sync: called

-------------------------------------------------------------
For me :
One page is bad :     Page_number 0x9a20 => 39456
(32 pages per block)  Block numbe 0x4d1  =>  1233
The same bad block detected under ppcboot !
-------------------------------------------------------------

Now, mounting the 2nd nand flash partition :
============================================
In telnet window :     
# mount -t yaffs /dev/mtdblock2 /mnt/yaffs
      
In console window :
 mtdblock_open
ok
yaffs: dev is 7938 name is "1f:02"
nand_read_oob: from = 0x01304000, len = 16
nand_read_oob: from = 0x01304200, len = 16
nand_read_oob: from = 0x01304000, len = 16
nand_read_oob: from = 0x01308000, len = 16
nand_read_oob: from = 0x01308200, len = 16
nand_read_oob: from = 0x01308000, len = 16
nand_read_oob: from = 0x0130c000, len = 16
nand_read_oob: from = 0x0130c200, len = 16
nand_read_oob: from = 0x0130c000, len = 16
nand_read_oob: from = 0x01310000, len = 16
nand_read_oob: from = 0x01310200, len = 16
nand_read_oob: from = 0x01310000, len = 16
nand_read_oob: from = 0x01314000, len = 16
nand_read_oob: from = 0x01314200, len = 16
nand_read_oob: from = 0x01314000, len = 16
nand_read_oob: from = 0x01318000, len = 16
nand_read_oob: from = 0x01318200, len = 16
nand_read_oob: from = 0x01318000, len = 16
nand_read_oob: from = 0x0131c000, len = 16
nand_read_oob: from = 0x0131c200, len = 16
nand_read_oob: from = 0x0131c000, len = 16
nand_read_oob: from = 0x01320000, len = 16
nand_read_oob: from = 0x01320200, len = 16
nand_read_oob: from = 0x01320000, len = 16
nand_read_oob: from = 0x01324000, len = 16
nand_read_oob: from = 0x01324200, len = 16
nand_read_oob: from = 0x01324000, len = 16
nand_read_oob: from = 0x01328000, len = 16
nand_read_oob: from = 0x01328200, len = 16
nand_read_oob: from = 0x01328000, len = 16
nand_read_oob: from = 0x0132c000, len = 16
nand_read_oob: from = 0x0132c200, len = 16
nand_read_oob: from = 0x0132c000, len = 16
nand_read_oob: from = 0x01330000, len = 16
nand_read_oob: from = 0x01330200, len = 16
nand_read_oob: from = 0x01330000, len = 16
nand_read_oob: from = 0x01334000, len = 16
nand_read_oob: from = 0x01334200, len = 16
nand_read_oob: from = 0x01334000, len = 16
nand_read_oob: from = 0x01338000, len = 16
nand_read_oob: from = 0x01338200, len = 16
nand_read_oob: from = 0x01338000, len = 16
nand_read_oob: from = 0x0133c000, len = 16
nand_read_oob: from = 0x0133c200, len = 16
nand_read_oob: from = 0x0133c000, len = 16
nand_read_oob: from = 0x01340000, len = 16
nand_read_oob: from = 0x01340200, len = 16
nand_read_oob: from = 0x01340000, len = 16
nand_read_oob: from = 0x01344000, len = 16
nand_read_oob: from = 0x01344200, len = 16
nand_read_oob: from = 0x01344000, len = 16
nand_read_oob: from = 0x01348000, len = 16
nand_read_oob: from = 0x01348200, len = 16
nand_read_oob: from = 0x01348000, len = 16
nand_read_oob: from = 0x0134c000, len = 16
nand_read_oob: from = 0x0134c200, len = 16
nand_read_oob: from = 0x0134c000, len = 16
nand_read_oob: from = 0x01350000, len = 16
nand_read_oob: from = 0x01350200, len = 16
nand_read_oob: from = 0x01350000, len = 16
nand_read_oob: from = 0x01354000, len = 16
nand_read_oob: from = 0x01354200, len = 16
nand_read_oob: from = 0x01354000, len = 16
nand_read_oob: from = 0x01358000, len = 16
nand_read_oob: from = 0x01358200, len = 16
nand_read_oob: from = 0x01358000, len = 16
nand_read_oob: from = 0x0135c000, len = 16
nand_read_oob: from = 0x0135c200, len = 16
nand_read_oob: from = 0x0135c000, len = 16
nand_read_oob: from = 0x01360000, len = 16
nand_read_oob: from = 0x01360200, len = 16
nand_read_oob: from = 0x01360000, len = 16
nand_read_oob: from = 0x01364000, len = 16
nand_read_oob: from = 0x01364200, len = 16
nand_read_oob: from = 0x01364000, len = 16
nand_read_oob: from = 0x01368000, len = 16
nand_read_oob: from = 0x01368200, len = 16
nand_read_oob: from = 0x01368000, len = 16
nand_read_oob: from = 0x0136c000, len = 16
nand_read_oob: from = 0x0136c200, len = 16
nand_read_oob: from = 0x0136c000, len = 16
nand_read_oob: from = 0x01370000, len = 16
nand_read_oob: from = 0x01370200, len = 16
nand_read_oob: from = 0x01370000, len = 16
nand_read_oob: from = 0x01374000, len = 16
nand_read_oob: from = 0x01374200, len = 16
nand_read_oob: from = 0x01374000, len = 16
nand_read_oob: from = 0x01378000, len = 16
nand_read_oob: from = 0x01378200, len = 16
nand_read_oob: from = 0x01378000, len = 16
nand_read_oob: from = 0x0137c000, len = 16
nand_read_oob: from = 0x0137c200, len = 16
nand_read_oob: from = 0x0137c000, len = 16
nand_read_oob: from = 0x01380000, len = 16
nand_read_oob: from = 0x01380200, len = 16
nand_read_oob: from = 0x01380000, len = 16
nand_read_oob: from = 0x01384000, len = 16
nand_read_oob: from = 0x01384200, len = 16
nand_read_oob: from = 0x01384000, len = 16
nand_read_oob: from = 0x01388000, len = 16
nand_read_oob: from = 0x01388200, len = 16
nand_read_oob: from = 0x01388000, len = 16
nand_read_oob: from = 0x0138c000, len = 16
nand_read_oob: from = 0x0138c200, len = 16
nand_read_oob: from = 0x0138c000, len = 16
nand_read_oob: from = 0x01390000, len = 16
nand_read_oob: from = 0x01390200, len = 16
nand_read_oob: from = 0x01390000, len = 16
nand_read_oob: from = 0x01394000, len = 16
nand_read_oob: from = 0x01394200, len = 16
nand_read_oob: from = 0x01394000, len = 16
nand_read_oob: from = 0x01398000, len = 16
nand_read_oob: from = 0x01398200, len = 16
nand_read_oob: from = 0x01398000, len = 16
nand_read_oob: from = 0x0139c000, len = 16
nand_read_oob: from = 0x0139c200, len = 16
nand_read_oob: from = 0x0139c000, len = 16
nand_read_oob: from = 0x013a0000, len = 16
nand_read_oob: from = 0x013a0200, len = 16
nand_read_oob: from = 0x013a0000, len = 16
nand_read_oob: from = 0x013a4000, len = 16
nand_read_oob: from = 0x013a4200, len = 16
nand_read_oob: from = 0x013a4000, len = 16
nand_read_oob: from = 0x013a8000, len = 16
nand_read_oob: from = 0x013a8200, len = 16
nand_read_oob: from = 0x013a8000, len = 16
nand_read_oob: from = 0x013ac000, len = 16
nand_read_oob: from = 0x013ac200, len = 16
nand_read_oob: from = 0x013ac000, len = 16
nand_read_oob: from = 0x013b0000, len = 16
nand_read_oob: from = 0x013b0200, len = 16
nand_read_oob: from = 0x013b0000, len = 16
nand_read_oob: from = 0x013b4000, len = 16
nand_read_oob: from = 0x013b4200, len = 16
nand_read_oob: from = 0x013b4000, len = 16
nand_read_oob: from = 0x013b8000, len = 16
nand_read_oob: from = 0x013b8200, len = 16
nand_read_oob: from = 0x013b8000, len = 16
nand_read_oob: from = 0x013bc000, len = 16
nand_read_oob: from = 0x013bc200, len = 16
nand_read_oob: from = 0x013bc000, len = 16
nand_read_oob: from = 0x013c0000, len = 16
nand_read_oob: from = 0x013c0200, len = 16
nand_read_oob: from = 0x013c0000, len = 16
nand_read_oob: from = 0x013c4000, len = 16
nand_read_oob: from = 0x013c4200, len = 16
nand_read_oob: from = 0x013c4000, len = 16
nand_read_oob: from = 0x013c8000, len = 16
nand_read_oob: from = 0x013c8200, len = 16
nand_read_oob: from = 0x013c8000, len = 16
nand_read_oob: from = 0x013cc000, len = 16
nand_read_oob: from = 0x013cc200, len = 16
nand_read_oob: from = 0x013cc000, len = 16
nand_read_oob: from = 0x013d0000, len = 16
nand_read_oob: from = 0x013d0200, len = 16
nand_read_oob: from = 0x013d0000, len = 16
nand_read_oob: from = 0x013d4000, len = 16
nand_read_oob: from = 0x013d4200, len = 16
nand_read_oob: from = 0x013d4000, len = 16
nand_read_oob: from = 0x013d8000, len = 16
nand_read_oob: from = 0x013d8200, len = 16
nand_read_oob: from = 0x013d8000, len = 16
nand_read_oob: from = 0x013dc000, len = 16
nand_read_oob: from = 0x013dc200, len = 16
nand_read_oob: from = 0x013dc000, len = 16
nand_read_oob: from = 0x013e0000, len = 16
nand_read_oob: from = 0x013e0200, len = 16
nand_read_oob: from = 0x013e0000, len = 16
nand_read_oob: from = 0x013e4000, len = 16
nand_read_oob: from = 0x013e4200, len = 16
nand_read_oob: from = 0x013e4000, len = 16
nand_read_oob: from = 0x013e8000, len = 16
nand_read_oob: from = 0x013e8200, len = 16
nand_read_oob: from = 0x013e8000, len = 16
nand_read_oob: from = 0x013ec000, len = 16
nand_read_oob: from = 0x013ec200, len = 16
nand_read_oob: from = 0x013ec000, len = 16
nand_read_oob: from = 0x013f0000, len = 16
nand_read_oob: from = 0x013f0200, len = 16
nand_read_oob: from = 0x013f0000, len = 16
nand_read_oob: from = 0x013f4000, len = 16
nand_read_oob: from = 0x013f4200, len = 16
nand_read_oob: from = 0x013f4000, len = 16
nand_read_oob: from = 0x013f8000, len = 16
nand_read_oob: from = 0x013f8200, len = 16
nand_read_oob: from = 0x013f8000, len = 16
nand_read_oob: from = 0x013fc000, len = 16
nand_read_oob: from = 0x013fc200, len = 16
nand_read_oob: from = 0x013fc000, len = 16

Display disk free :
===================
# df | grep mtd
/dev/mtdblock2            1008       128       880  13% /mnt/yaffs

Copy a small file (200 ko) into the 2nd nand flash partition (800 ko) :
=======================================================================
In telnet window : 
# ls -al /usr/bin/automake 
-rwxr-xr-x    1 root     root       199419 Dec 19  2002 /usr/bin/automake

# cp /usr/bin/automake /mnt/yaffs/f1

In console window :
 nand_write_ecc: to = 0x01304000, len = 512
nand_read_ecc: from = 0x01304000, len = 512
nand_write_ecc: to = 0x01304200, len = 512
nand_read_ecc: from = 0x01304200, len = 512
nand_write_ecc: to = 0x01304400, len = 512
nand_read_ecc: from = 0x01304400, len = 512
nand_write_ecc: to = 0x01304600, len = 512
nand_read_ecc: from = 0x01304600, len = 512
nand_write_ecc: to = 0x01304800, len = 512
nand_read_ecc: from = 0x01304800, len = 512
nand_write_ecc: to = 0x01304a00, len = 512
nand_read_ecc: from = 0x01304a00, len = 512
nand_write_ecc: to = 0x01304c00, len = 512
nand_read_ecc: from = 0x01304c00, len = 512
nand_write_ecc: to = 0x01304e00, len = 512
nand_read_ecc: from = 0x01304e00, len = 512
nand_write_ecc: to = 0x01305000, len = 512
nand_read_ecc: from = 0x01305000, len = 512
nand_write_ecc: to = 0x01305200, len = 512
nand_read_ecc: from = 0x01305200, len = 512
nand_write_ecc: to = 0x01305400, len = 512
nand_read_ecc: from = 0x01305400, len = 512
nand_write_ecc: to = 0x01305600, len = 512
nand_read_ecc: from = 0x01305600, len = 512
...
nand_read_ecc: from = 0x01332c00, len = 512
nand_write_ecc: to = 0x01332e00, len = 512
nand_read_ecc: from = 0x01332e00, len = 512
nand_write_ecc: to = 0x01333000, len = 512
nand_read_ecc: from = 0x01333000, len = 512
nand_write_ecc: to = 0x01333200, len = 512
nand_read_ecc: from = 0x01333200, len = 512
nand_write_ecc: to = 0x01333400, len = 512
nand_read_ecc: from = 0x01333400, len = 512
nand_write_ecc: to = 0x01333600, len = 512
nand_read_ecc: from = 0x01333600, len = 512
nand_write_ecc: to = 0x01333800, len = 512
nand_read_ecc: from = 0x01333800, len = 512
nand_write_ecc: to = 0x01333a00, len = 512
nand_read_ecc: from = 0x01333a00, len = 512
nand_write_ecc: to = 0x01333c00, len = 512
nand_read_ecc: from = 0x01333c00, len = 512
nand_write_ecc: to = 0x01333e00, len = 512
nand_read_ecc: from = 0x01333e00, len = 512
nand_write_ecc: to = 0x01334000, len = 512
nand_read_ecc: from = 0x01334000, len = 512
nand_write_ecc: to = 0x01334200, len = 512
nand_read_ecc: from = 0x01334200, len = 512
nand_write_ecc: to = 0x01334400, len = 512
nand_read_ecc: from = 0x01334400, len = 512
nand_write_ecc: to = 0x01334600, len = 512
nand_read_ecc: from = 0x01334600, len = 512
nand_write_ecc: to = 0x01334800, len = 512
nand_read_ecc: from = 0x01334800, len = 512
nand_write_ecc: to = 0x01334a00, len = 512
nand_read_ecc: from = 0x01334a00, len = 512
nand_write_ecc: to = 0x01334c00, len = 512
nand_read_ecc: from = 0x01334c00, len = 512
nand_read_ecc: from = 0x01304000, len = 512
nand_write_ecc: to = 0x01334e00, len = 512
nand_read_ecc: from = 0x01334e00, len = 512
nand_write_oob: to = 0x01304000, len = 16

Display disk free :
===================      
# df | grep mtd
/dev/mtdblock2            1008       324       684  33% /mnt/yaffs
# ls -al /mnt/yaffs/f*
-rwxr-xr-x    1 root     root       199419 Feb 20 02:57 /mnt/yaffs/f1

Copy a second small file (200 ko) into the 2nd nand flash partition (600 ko) :
==============================================================================
In telnet window : 
# cp /usr/bin/automake /mnt/yaffs/f2
cp: writing `/mnt/yaffs/f2': No space left on device

-------------------------------------------------------------
Here the copy failled ! Why the bad block is not only igored
All blocks ather this is considered as bad !!!
-------------------------------------------------------------

In console window :
nand_write_ecc: to = 0x01335000, len = 512
nand_read_ecc: from = 0x01335000, len = 512
nand_write_ecc: to = 0x01335200, len = 512
nand_read_ecc: from = 0x01335200, len = 512
nand_write_ecc: to = 0x01335400, len = 512
nand_read_ecc: from = 0x01335400, len = 512
nand_write_ecc: to = 0x01335600, len = 512
nand_read_ecc: from = 0x01335600, len = 512
nand_write_ecc: to = 0x01335800, len = 512
nand_read_ecc: from = 0x01335800, len = 512
nand_write_ecc: to = 0x01335a00, len = 512
nand_read_ecc: from = 0x01335a00, len = 512
nand_write_ecc: to = 0x01335c00, len = 512
nand_read_ecc: from = 0x01335c00, len = 512
nand_write_ecc: to = 0x01335e00, len = 512
nand_read_ecc: from = 0x01335e00, len = 512
nand_write_ecc: to = 0x01336000, len = 512
nand_read_ecc: from = 0x01336000, len = 512
...
nand_read_ecc: from = 0x01344a00, len = 512
nand_write_ecc: to = 0x01344c00, len = 512
nand_read_ecc: from = 0x01344c00, len = 512
nand_write_ecc: to = 0x01344e00, len = 512
nand_read_ecc: from = 0x01344e00, len = 512
nand_write_ecc: to = 0x01345000, len = 512
nand_read_ecc: from = 0x01345000, len = 512
nand_write_ecc: to = 0x01345200, len = 512
nand_read_ecc: from = 0x01345200, len = 512
nand_write_ecc: to = 0x01345400, len = 512
nand_read_ecc: from = 0x01345400, len = 512
nand_write_ecc: to = 0x01345600, len = 512
nand_read_ecc: from = 0x01345600, len = 512
nand_write_ecc: to = 0x01345800, len = 512
nand_read_ecc: from = 0x01345800, len = 512
nand_write_ecc: to = 0x01345a00, len = 512
nand_read_ecc: from = 0x01345a00, len = 512
nand_write_ecc: to = 0x01345c00, len = 512
nand_read_ecc: from = 0x01345c00, len = 512
nand_write_oob: to = 0x01345c00, len = 16
nand_write_oob: to = 0x01345e00, len = 16
nand_write_oob: to = 0x01346000, len = 16
nand_write_oob: to = 0x01346200, len = 16
nand_write_oob: to = 0x01346400, len = 16
nand_write_oob: to = 0x01346600, len = 16
nand_write_oob: to = 0x01346800, len = 16
nand_write_oob: to = 0x01346a00, len = 16
nand_write_oob: to = 0x01346c00, len = 16
nand_write_oob: to = 0x01346e00, len = 16
nand_write_oob: to = 0x01347000, len = 16
...
nand_write_oob: to = 0x013dae00, len = 16
nand_write_oob: to = 0x013db000, len = 16
nand_write_oob: to = 0x013db200, len = 16
nand_write_oob: to = 0x013db400, len = 16
nand_write_oob: to = 0x013db600, len = 16
nand_write_oob: to = 0x013db800, len = 16
nand_write_oob: to = 0x013dba00, len = 16
nand_write_oob: to = 0x013dbc00, len = 16
nand_write_oob: to = 0x013dbe00, len = 16
nand_write_oob: to = 0x013d8000, len = 16
nand_write_oob: to = 0x013d8200, len = 16
nand_read_ecc: from = 0x01344000, len = 512
nand_write_ecc: to = 0x013dc000, len = 512
nand_read_ecc: from = 0x013dc000, len = 512
nand_write_oob: to = 0x01344000, len = 16
nand_read_ecc: from = 0x01344200, len = 512
nand_write_ecc: to = 0x013dc200, len = 512
nand_read_ecc: from = 0x013dc200, len = 512
nand_write_oob: to = 0x01344200, len = 16
nand_read_ecc: from = 0x01344400, len = 512
nand_write_ecc: to = 0x013dc400, len = 512
nand_read_ecc: from = 0x013dc400, len = 512
nand_write_oob: to = 0x01344400, len = 16
nand_read_ecc: from = 0x01344600, len = 512
nand_write_ecc: to = 0x013dc600, len = 512
nand_read_ecc: from = 0x013dc600, len = 512
nand_write_oob: to = 0x01344600, len = 16
nand_read_ecc: from = 0x01344800, len = 512
nand_write_ecc: to = 0x013dc800, len = 512
nand_read_ecc: from = 0x013dc800, len = 512
nand_write_oob: to = 0x01344800, len = 16
nand_read_ecc: from = 0x01344a00, len = 512
nand_write_ecc: to = 0x013dca00, len = 512
nand_read_ecc: from = 0x013dca00, len = 512
nand_write_oob: to = 0x01344a00, len = 16
nand_read_ecc: from = 0x01344c00, len = 512
nand_write_ecc: to = 0x013dcc00, len = 512
nand_read_ecc: from = 0x013dcc00, len = 512
nand_write_oob: to = 0x01344c00, len = 16
nand_read_ecc: from = 0x01344e00, len = 512
nand_write_ecc: to = 0x013dce00, len = 512
nand_read_ecc: from = 0x013dce00, len = 512
nand_write_oob: to = 0x01344e00, len = 16
nand_read_ecc: from = 0x01345000, len = 512
nand_write_ecc: to = 0x013dd000, len = 512
nand_read_ecc: from = 0x013dd000, len = 512
nand_write_oob: to = 0x01345000, len = 16
nand_read_ecc: from = 0x01345200, len = 512
nand_write_ecc: to = 0x013dd200, len = 512
nand_read_ecc: from = 0x013dd200, len = 512
nand_write_oob: to = 0x01345200, len = 16
nand_read_ecc: from = 0x01345400, len = 512
nand_write_ecc: to = 0x013dd400, len = 512
nand_read_ecc: from = 0x013dd400, len = 512
nand_write_oob: to = 0x01345400, len = 16
nand_read_ecc: from = 0x01345600, len = 512
nand_write_ecc: to = 0x013dd600, len = 512
nand_read_ecc: from = 0x013dd600, len = 512
nand_write_oob: to = 0x01345600, len = 16
nand_read_ecc: from = 0x01345800, len = 512
nand_write_ecc: to = 0x013dd800, len = 512
nand_read_ecc: from = 0x013dd800, len = 512
nand_write_oob: to = 0x01345800, len = 16
nand_read_ecc: from = 0x01345a00, len = 512
nand_write_ecc: to = 0x013dda00, len = 512
nand_read_ecc: from = 0x013dda00, len = 512
nand_write_oob: to = 0x01345a00, len = 16
nand_write_oob: to = 0x01344000, len = 16
nand_write_oob: to = 0x01344200, len = 16
nand_read_ecc: from = 0x01335000, len = 512
nand_write_ecc: to = 0x013ddc00, len = 512
nand_read_ecc: from = 0x013ddc00, len = 512
nand_write_oob: to = 0x01335000, len = 16

Display disk free :
===================          
# df | grep mtd
/dev/mtdblock2            1008       392       616  39% /mnt/yaffs

# ls -al /mnt/yaffs/f*
-rwxr-xr-x    1 root     root       199419 Feb 20 02:57 /mnt/yaffs/f1
-rwxr-xr-x    1 root     root        68096 Feb 20 03:00 /mnt/yaffs/f2

Unmount and remounting the 2nd nand flash partition :
=====================================================
# umount /mnt/yaffs
# mount -t yaffs /dev/mtdblock2 /mnt/yaffs

# df | grep mtd
/dev/mtdblock2            1008      1000         8 100% /mnt/yaffs

-------------------------------------------------------------
No erase is possible with eraseall. All blocks are bad.
If i erase all nand flash device (Toshiba TH58512FT) (4096 blocks) under 
ppcboot (basic function erase block with 0x60 command and verify status with
0x70 command). Only one block (number 1233) the status after erasing is 
0xc1 (expected 0xc0).

This block is realy bad ?
With a another board, with bad block, no problem, only bad block is jump.

Any suggestions?
 
Many thanks in advance.

Olivier
-------------------------------------------------------------
