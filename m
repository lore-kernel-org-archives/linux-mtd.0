Received: from mail.allot.com ([199.203.223.202] helo=exg.allot.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14yvGs-0000Ps-00
	for <linux-mtd@lists.infradead.org>; Sun, 13 May 2001 13:46:51 +0100
Message-ID: <3AFE84A7.D7D3A689@allot.com>
Date: Sun, 13 May 2001 15:57:11 +0300
From: Felix Radensky <felix@allot.com>
MIME-Version: 1.0
To: Linux-mtd <linux-mtd@lists.infradead.org>
Subject: DOC 2000 problems on PowerPC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi, all

I'm trying to utilize DOC 2000 (MD2202-D96) on our custom
board based on 405GP PowerPC processor. I'm using the
latest cvs mtd drivers and 2.4.2 kernel from Monta Vista
(ftp://ftp.mvista.com/pub/Area51/ppc-405gp/files_01.04.12).

The DOC size is 96M. It's mapped to the physical address
0xf6000000.  The kernel properly detects the chip:

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0xf6000000
DiskOnChip 2000 found at address 0xF6000000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba
TC58256FT/DC)
3 flash chips found. Total DiskOnChip size: 96 Mb

The contents of /proc/mtd:

dev:    size   erasesize  name
mtd0: 06000000 00004000 "DiskOnChip 2000"

As you see, the erase size is 16k. After commenting out the 8k erase
size check
in nftl_format.c, I was able to format /dev/mtd0. Here is the output of
nftldump:

NFTL Media Header found at offset 0x00000000:
NumEraseUnits:    6144
FirstPhysicalEUN: 0
Formatted Size:   100597760
UnitSizeFactor:   0xff
Second NFTL Media Header found at offset 0x00004000
EraseMark not present in unit 0: 693c
Unit 0 is free
EraseMark not present in unit 1: 693c
Unit 1 is free
....................

However, I cannot use fdisk to partition /dev/nftla, as nftl driver
reports wrong device geometry:

Command (m for help): p

Disk /dev/nftla: 1 heads, 1 sectors, 96 cylinders
Units = cylinders of 1 * 512 bytes

I suspect that the problem is in find_boot_record() routine of
nftlmout.c.
The following line seems suspicious on big-endian machine:

nftl->numvunits = le32_to_cpu(mh->FormattedSize) / nftl->EraseSize;

so, I've changed it to

nftl->numvunits = mh->FormattedSize / nftl->EraseSize;

Now I get the following error at boot time:

Cannot calculate an NFTL geometry to match size of 0x2ff80.
Using C:1023 H:16 S:12 (== 0x2ff40 sects)
NFTL_setup: cylinders = 1023, heads = 16, sectors = 12
Partition check:
   nftla: unknown partition table

I went on and tried to create a single ext2 partition spanning the
entire  device. But
fdisk complained:

Calling ioctl() to re-read partition table.
    nftla: nftla1
    nftla:end_request: I/O error, dev 5d:00 (unknown), sector 0
    unable to read partition table


Please help.

TIA.

Felix.
