Received: from mail-qy0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2H4a-00030I-Cs
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2012 07:02:09 +0000
Received: by qcsu28 with SMTP id u28so861829qcs.36
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2012 23:02:07 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 28 Feb 2012 08:02:06 +0100
Message-ID: <CAHMF36Gy9r2mPRrahpbAMvwOE=jWD3jzWqpF4846gG6saHjZ-w@mail.gmail.com>
Subject: Problems with mtd_oobtest
From: Matej Kupljen <matej.kupljen@gmail.com>
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

Dear list,

I'am working on a custom board with NXP LPC31xx CPU on it, which is designed
very similar to Embedded Artists LPC3152 Development Kit:
http://www.embeddedartists.com/products/kits/lpc3152_kit.php

I am trying to use UBIFS on it and it works, however there are
frequent file system
corruption and I read on the Linux MTD WEB page about the tests.

I can run mtd_speedtest, mtd_stresstest, mtd_readtest, mtd_pagetest without the
problems, but when I start the mtd_oobtest it fails, basically on every page!

This is what I get:
# insmod mtd_oobtest.ko  dev=1
[ 8332.880000]
[ 8332.880000] =================================================
[ 8332.884000] mtd_oobtest: MTD device: 1
[ 8332.888000] mtd_oobtest: MTD device size 112459776, eraseblock size
131072, page size 2048, count of eraseblocks4
[ 8332.892000] mtd_oobtest: scanning for bad eraseblocks
[ 8332.920000] mtd_oobtest: block 854 is bad
[ 8332.924000] mtd_oobtest: block 855 is bad
[ 8332.932000] mtd_oobtest: block 856 is bad
[ 8332.936000] mtd_oobtest: block 857 is bad
[ 8332.944000] mtd_oobtest: scanned 858 eraseblocks, 4 are bad
[ 8332.948000] mtd_oobtest: test 1 of 5
[ 8332.952000] mtd_oobtest: erasing whole device
[ 8333.484000] mtd_oobtest: erased 858 eraseblocks
[ 8333.488000] mtd_oobtest: writing OOBs of whole device
[ 8333.512000] mtd_oobtest: written up to eraseblock 0
[ 8337.132000] mtd_oobtest: written up to eraseblock 256
[ 8340.764000] mtd_oobtest: written up to eraseblock 512
[ 8340.764000] mtd_oobtest: written up to eraseblock 768
..............
[ 8350.844000] mtd_oobtest: error: verify failed at 0x1e9000
[ 8350.848000] mtd_oobtest: error: verify failed at 0x1e9800
[ 8350.856000] mtd_oobtest: error: verify failed at 0x1ea000

A lot of this messages and finally:

[ 8350.956000] mtd_oobtest: error: too many errors
[ 8350.960000] mtd_oobtest: error -1 occurred
[ 8350.964000] =================================================

I read that I should disable the sub_page writing with
ubi.vid_hdr_offs=2048 kernel parameter,
but the problems remains the same.

I use kernel version 2.6.33 with the latest back ported patches
available on your site.
My NAND Flash is detected as:

[    0.644000] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xa1
(Micron NAND 128MiB 1,8V 8-bit)
[    0.652000] Creating 2 MTD partitions on "lpc313x_nand":
[    0.656000] 0x000000060000-0x000000080000 : "u-boot envirnment"
[    0.668000] 0x0000014c0000-0x000008000000 : "lpc313x-rootfs"
[    0.684000] UBI: attaching mtd1 to ubi0
[    0.688000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    0.692000] UBI: logical eraseblock size:    129024 bytes
[    0.696000] UBI: smallest flash I/O unit:    2048
[    0.700000] UBI: sub-page size:              512
[    0.704000] UBI: VID header offset:          512 (aligned 512)
[    0.708000] UBI: data offset:                2048
[    1.184000] UBI: max. sequence number:       0

(This is the output without the ubi.vid_hdr_offs=2048 kernel parameter)

I can use JFFS2 on this device, and for some time even UBIFS, but then
it just fails.

Is there anything I am doing wrong?
Should I provide any more information?

I'd appreciate any hint, how to solve this problem.

Thank you and Best Regards,
Matej
