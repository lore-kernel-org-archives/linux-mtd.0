Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVTyb-00054j-1i
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 07:32:12 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004060207422413877
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jun 2004 07:42:24 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812AA@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Wed, 2 Jun 2004 07:33:48 -0400 
MIME-Version: 1.0
Content-Type: text/plain
Subject: Let me add to last message
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is some of the messages I get.  The chip is identified properly but
using the MTD_ioctl calls I get the wrong erase size??

Thanks again for the help.
John

# insmod docprobe
Using /lib/modules/2.4.21-rmk1-omap1/kernel/drivers/mtd/devices/docprobe.o
Using configured DiskOnChip probe address 0xc000000
TP1
emifs_config=0x      12
emifs_cs3_config=0x    3331
emifs_cs0_config=0x  2130b0
emifs_cs0_config=0x  215051
mode is ?? 0x   1
ID is ?? 0x  40
read ID directly =0xffff
read CS3 directly =0x3331
read byte=0x  40
read word=0x  40
read long=0x      40
window=0xc203c000 reg=0x    1046 potential=0xc203c000
In DOCPROBE Toggle= 82
In DOCPROBE Toggle= 86
In DOCPROBE ChipID= 40
ID is ?? 0x  40
In DOCPROBE before case switch ChipID= 40
here in case 0 section
In DOCPROBEeck again ChipID= 64
TP3
TP3
TP2
TP4
DiskOnChip Millennium Plus found at address 0xC000000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB 3,3V
8-bi
t)
in Doc_ScanChips 1 flash chips found. Total DiskOnChip size: 32 MiB
in module init size=0x2000000
in add_mtd_device mtdcore.c TP1
in add_mtd_device mtdcore.c TP2
mtd: Giving out device 4 to DiskOnChip Millennium Plus
in inftl_add_mtd
INFTL: add_mtd for DiskOnChip Millennium Plus
INFTL: INFTL_mount(inftl=0xc1cc6800)
INFTL: find_boot_record(inftl=0xc1cc6800)
INFTL: could not find valid boot record?
INFTL: could not mount device
Could not find valid boot record
NFTL: could not mount device
insmod: init_module: docprobe: Resource temporarily unavailable
# nftl_format -i /dev/mtd4
-sh: nftl_format: not found
# ./nftl_format -i /dev/mtd4
$Id: nftl_format.c,v 1.18 2002/04/26 23:37:48 russ Exp $
MTD_open
MTD_ioctl
Unrecognized Erase size, 0x10000 - I'm confused
MTD_close
#

# cat /proc/partitions
major minor  #blocks  name

  31     0        128 mtdblocka
  31     1        256 mtdblockb
  31     2       2048 mtdblockc
  31     3       1664 mtdblockd
  31     4      32768 mtdblocke
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00010000 "BootLoader"
mtd1: 00040000 00010000 "Params"
mtd2: 00200000 00010000 "Kernel"
mtd3: 001a0000 00010000 "Flash0 FileSys"
mtd4: 02000000 00008000 "DiskOnChip Millennium Plus"
#
