Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SK9FK-0000EU-GC
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 14:19:10 +0000
Received: by dadn15 with SMTP id n15so10191788dad.16
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 07:19:03 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 17 Apr 2012 22:19:03 +0800
Message-ID: <CAHvCehVVPoORvmV=WZESDkb_9es1B7W9ojFv9P3W1ANpQyQ1xA@mail.gmail.com>
Subject: UBI use subpage and verify fail when write on nandflash
From: b w <wdjjwb@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
    Use linux 2.6.32,ARM,nandflash(support subpage),config
CONFIG_MTD_NAND_VERIFY_WRITE. UBI attach fail on empty flash.I found
when UBI write VID header to the second subpage of eraseblock,will
call function "nand_write_page",this function write a whole page(i
think the page size is 2048),the unset bit of the buf is filled with
0xff,after write,

#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
	/* Send command to read back the data */
	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);

	if (chip->verify_buf(mtd, buf, mtd->writesize))
		return -EIO;
#endif

now,the buf for verify is not equal to the buf which write,because the
buf which read from flash contains EC header ?

I found there is topic also mention subpage:
http://lists.infradead.org/pipermail/linux-mtd/2010-September/031822.html

error log:
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
0:512, written 0 bytes
Backtrace:
[<c0212a24>] (dump_stack+0x18/0x1c)
[<c040aab8>] (ubi_io_write+0x324/0x3a8)
[<c038e118>] (ubi_io_write_vid_hdr+0x134/0x150)
[<c038e4c0>] (create_vtbl+0x1bc/0x290)
[<c0383734>] (ubi_read_volume_table+0xe8/0x984)
[<c0384070>] (ubi_attach_mtd_dev+0x690/0xd24)
[<c03873c0>] (ctrl_cdev_ioctl+0xe8/0x1a4)
[<c03883a0>] (vfs_ioctl+0x38/0x78)
