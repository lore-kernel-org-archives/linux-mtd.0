Received: from bay20-f25.bay20.hotmail.com ([64.4.54.114] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DpiQA-0005hV-Ky
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2005 04:04:49 -0400
Message-ID: <BAY20-F25624945C6C1BACAC0203BBFE60@phx.gbl>
From: "asdfg dfgh" <culinux@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 05 Jul 2005 15:57:32 +0800
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: When I try to mount up the JFFS2 using uClinux, fail "-22"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using the uClinux 2.4.24 and FS44B0X (arm7)
When I try to mount up the JFFS2, there are some error message shown as 
below.

I have already erase the mtd block before mounting, but the problem still 
cannot be solved.
----------------------------------------------------------

#  mount -t jffs2 /dev/mtdblock0 /mnt
mtdblock_open
ok
nand_read_ecc: from = 0x00000000, len = 1024
Reading data from NAND FLASH without ECC is not recommended
nand_read_ecc: from = 0x00004000, len = 1024
nand_read_ecc: from = 0x00008000, len = 1024
nand_read_ecc: from = 0x0000c000, len = 1024
nand_read_ecc: from = 0x00010000, len = 1024
nand_read_ecc: from = 0x00014000, len = 1024
nand_read_ecc: from = 0x00018000, len = 1024
nand_read_ecc: from = 0x0001c000, len = 1024
nand_read_ecc: from = 0x00020000, len = 1024
nand_read_ecc: from = 0x00024000, len = 1024
nand_read_ecc: from = 0x00028000, len = 1024
nand_read_ecc: from = 0x0002c000, len = 1024
# nand_erase: start = 0x00028000, len = 16384
nand_read_ecc: from = 0x00028000, len = 4096
Reading data from NAND FLASH without ECC is not recommended
nand_read_ecc: from = 0x00029000, len = 4096
nand_read_ecc: from = 0x0002a000, len = 4096
nand_read_ecc: from = 0x0002b000, len = 4096
nand_write_ecc: to = 0x00028000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00028000 failed: -22
nand_erase: start = 0x00024000, len = 16384
nand_read_ecc: from = 0x00024000, len = 4096
nand_read_ecc: from = 0x00025000, len = 4096
nand_read_ecc: from = 0x00026000, len = 4096
nand_read_ecc: from = 0x00027000, len = 4096
nand_write_ecc: to = 0x00024000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00024000 failed: -22
nand_erase: start = 0x00020000, len = 16384
nand_read_ecc: from = 0x00020000, len = 4096
nand_read_ecc: from = 0x00021000, len = 4096
nand_read_ecc: from = 0x00022000, len = 4096
nand_read_ecc: from = 0x00023000, len = 4096
nand_write_ecc: to = 0x00020000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00020000 failed: -22
nand_erase: start = 0x0001c000, len = 16384
nand_read_ecc: from = 0x0001c000, len = 4096
nand_read_ecc: from = 0x0001d000, len = 4096
nand_read_ecc: from = 0x0001e000, len = 4096
nand_read_ecc: from = 0x0001f000, len = 4096
nand_write_ecc: to = 0x0001c000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x0001c000 failed: -22
nand_erase: start = 0x00018000, len = 16384
nand_read_ecc: from = 0x00018000, len = 4096
nand_read_ecc: from = 0x00019000, len = 4096
nand_read_ecc: from = 0x0001a000, len = 4096
nand_read_ecc: from = 0x0001b000, len = 4096
nand_write_ecc: to = 0x00018000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00018000 failed: -22
nand_erase: start = 0x00014000, len = 16384
nand_read_ecc: from = 0x00014000, len = 4096
nand_read_ecc: from = 0x00015000, len = 4096
nand_read_ecc: from = 0x00016000, len = 4096
nand_read_ecc: from = 0x00017000, len = 4096
nand_write_ecc: to = 0x00014000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00014000 failed: -22
nand_erase: start = 0x00010000, len = 16384
nand_read_ecc: from = 0x00010000, len = 4096
nand_read_ecc: from = 0x00011000, len = 4096
nand_read_ecc: from = 0x00012000, len = 4096
nand_read_ecc: from = 0x00013000, len = 4096
nand_write_ecc: to = 0x00010000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00010000 failed: -22
nand_erase: start = 0x0000c000, len = 16384
nand_read_ecc: from = 0x0000c000, len = 4096
nand_read_ecc: from = 0x0000d000, len = 4096
nand_read_ecc: from = 0x0000e000, len = 4096
nand_read_ecc: from = 0x0000f000, len = 4096
nand_write_ecc: to = 0x0000c000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x0000c000 failed: -22
nand_erase: start = 0x00008000, len = 16384
nand_read_ecc: from = 0x00008000, len = 4096
nand_read_ecc: from = 0x00009000, len = 4096
nand_read_ecc: from = 0x0000a000, len = 4096
nand_read_ecc: from = 0x0000b000, len = 4096
nand_write_ecc: to = 0x00008000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00008000 failed: -22
nand_erase: start = 0x00004000, len = 16384
nand_read_ecc: from = 0x00004000, len = 4096
nand_read_ecc: from = 0x00005000, len = 4096
nand_read_ecc: from = 0x00006000, len = 4096
nand_read_ecc: from = 0x00007000, len = 4096
nand_write_ecc: to = 0x00004000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00004000 failed: -22
nand_erase: start = 0x00000000, len = 16384
nand_read_ecc: from = 0x00000000, len = 4096
nand_read_ecc: from = 0x00001000, len = 4096
nand_read_ecc: from = 0x00002000, len = 4096
nand_read_ecc: from = 0x00003000, len = 4096
nand_write_ecc: to = 0x00000000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x00000000 failed: -22
nand_erase: start = 0x0002c000, len = 16384
nand_read_ecc: from = 0x0002c000, len = 4096
nand_read_ecc: from = 0x0002d000, len = 4096
nand_read_ecc: from = 0x0002e000, len = 4096
nand_read_ecc: from = 0x0002f000, len = 4096
nand_write_ecc: to = 0x0002c000, len = 12
nand_write_ecc: Attempt to write not page aligned data
Write clean marker to block at 0x0002c000 failed: -22

#


I doubt if the error is caused by the incorrect value of "len", but I would 
like to ask how could I set the "len" to be a correct value.
(I have not set the block size yet and do not know if I need to do so.)

Thank you.

Regards,
Kuen

_________________________________________________________________
46 FREE English Classes, ACT Now! 
http://www.linguaphonegroup.com/BannerTrack.asp?EMSCode=MSN03-08ETFJ-0211E
