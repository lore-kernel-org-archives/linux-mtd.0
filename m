Received: from carallon.force9.co.uk ([80.229.37.120] helo=carallon.f9.co.uk)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LRrFE-0003Ea-3F
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2009 16:57:02 +0000
Received: from [127.0.0.1] by carallon.f9.co.uk (MDaemon PRO v9.6.5)
	with ESMTP id md50000339027.msg
	for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2009 16:56:38 +0000
Message-ID: <497F3CBF.4000309@carallon.com>
Date: Tue, 27 Jan 2009 16:56:31 +0000
From: Will Wagner <will_wagner@carallon.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND and JFFS2 newbie question
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have an arm iMx31 board with 128M of NAND flash. It all appears to be working however I 
get a lot of error/warning messages and I'd just like to check I am doing things right.

The NAND chip is a ST NAND01G-B2B used in 8-bit mode which has 2048+64 byte pages and 128k 
block size. Linux is 2.6.24.7 with Freescale patches for MTD support on the iMx31 chip.

I am wanting to create a JFFS2 partition on the device. The partition is created using:

mkfs.jffs2 -s 2 -e 128 -c 12 -o fs.jffs2 -r jffs2_fs

Are these the correct arguments for the flash device I am using?

On the target I then do:
 > flash_eraseall /dev/mtd4
Erasing 128 Kibyte @ 5f60000 -- 99 % complete.
Skipping bad block at 0x05f80000

Skipping bad block at 0x05fa0000

Skipping bad block at 0x05fc0000

Skipping bad block at 0x05fe0000

 > nandwrite -p /dev/mtdblock4 fs.jffs2
Writing data to block 0

 > mount -t jffs2 /dev/mtdblock4 /flashfs
JFFS2 doesn't use OOB.
CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05fc0010: 0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x05fe0010: 0xffff instead
# nand_erase: attempt to erase a bad block at page 0x0000ff80
Erase at 0x05fc0000 failed immediately: errno -5
nand_erase: attempt to erase a bad block at page 0x0000ffc0
Erase at 0x05fe0000 failed immediately: errno -5

Does this seem right? Why doesn't it use OOB and why is the cleanmarker wrong?

It all seems to be working but any advice on whether I am doing things write and if the 
output is all acceptable warnings would be much appreciated.

Thanks,

Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner@carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
