Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e2k7-0007tg-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 00:39:47 +0000
Received: from pengwin (h209-139-192-234.gtconnect.net [209.139.192.234])
	(authenticated bits=0)
	by smtp.hotbox.ru (8.12.6/8.12.6) with ESMTP id h0U16A31089665
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 04:06:14 +0300 (MSK)
	(envelope-from samoutin@hotbox.ru)
Message-ID: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: <linux-mtd@lists.infradead.org>
Subject: NAND subsector writing problem
Date: Wed, 29 Jan 2003 17:10:09 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello,



I've implemented hardware driver for Toshiba TC5818AFT NAND flash . (I took
Jan 27 snapshot of MTD drivers).

When I do write and read using "nandwrite/nanddump" utilities - it is look
like all working fine. However "nandtest" showed me error message during
subsector writing (see log below). Can I use  jffs2 with this type of
problem or I have to fix it? (And may be you know - what can cause this
error?)



Thanks.

Alex.



debian:/home/util# ./nandtest /dev/mtd1
MTD_open
MTD_ioctl
This will erase the first block of device, continue? y

Performing FlashMTD_ioctl
 Erase of lengthnand_erase: start = 0x00200000, len = 16384
 16384 at offset 0...
MTD_read
OK
Test if block was erased...
nand_read_ecc: from = 0x00200000, len = 512
MTD_ioctl
nand_read_oob: from = 0x00200000, len = 16
MTD_read

[..censored..]

nand_read_ecc: from = 0x00203e00, len = 512
MTD_ioctl
nand_read_oob: from = 0x00203e00, len = 16
OK
Writing 512 byte sectors...
MTD_write
nand_write_ecc: to = 0x00200800, len = 512
MTD_write
nand_write_ecc: to = 0x00200a00, len = 512
MTD_write
nand_write_ecc: to = 0x00200c00, len = 512
MTD_write
nand_write_ecc: to = 0x00200e00, len = 512
OK MTD_read

Reading 512 byte sectors...
nand_read_ecc: from = 0x00200800, len = 512
MTD_read
nand_read_ecc: from = 0x00200a00, len = 512
MTD_read
nand_read_ecc: from = 0x00200c00, len = 512
MTD_read
nand_read_ecc: from = 0x00200e00, len = 512
OK MTD_write

Testing subsector writing... nand_write_ecc: to = 0x00200190, len = 112
MTD_write
nand_write_ecc: to = 0x00200064, len = 100
nand_write_page: Failed write verify, page 0x00001001 pwrite: Input/output
error <6>
MTD_close
nand_sync: called
