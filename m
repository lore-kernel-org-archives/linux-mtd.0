Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TwFB4-0004Bl-SN
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2013 16:52:27 +0000
Received: by mail-pb0-f49.google.com with SMTP id un15so2136001pbc.22
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2013 08:52:25 -0800 (PST)
Message-ID: <50F97DB5.7040801@gmail.com>
Date: Fri, 18 Jan 2013 22:22:05 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd_oobtest fails with GPMI-NAND
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When I try to run the mtd_oobtest on an i.Mx6Q board, it results in a 
failure with the following error.
I'm using 3.5.7 Kernel.

root@freescale:/# insmod mtd_oobtest.ko dev=6
[ 7534.508880]
[ 7534.511228] =================================================
[ 7534.518460] mtd_oobtest: MTD device: 6
[ 7534.523000] mtd_oobtest: MTD device size 304087040, eraseblock size 
262144, page size 4096, count of eraseblocks 1160, pages per eraseblock 
64, OOB size 128
[ 7534.539301] mtd_oobtest: scanning for bad eraseblocks
[ 7534.545345] mtd_oobtest: scanned 1160 eraseblocks, 0 are bad
[ 7534.552482] mtd_oobtest: test 1 of 5
[ 7534.556797] mtd_oobtest: erasing whole device
[ 7537.523540] mtd_oobtest: erased 1160 eraseblocks
[ 7537.528888] mtd_oobtest: writing OOBs of whole device
[ 7537.534704] mtd_oobtest: error: writeoob failed at 0x0
[ 7537.540562] mtd_oobtest: error: use_len 0, use_offset 0
[ 7537.546565] mtd_oobtest: error -22 occurred
[ 7537.551456] =================================================

This boils down to the fake "struct nand_ecclayout" defined in
<drivers/mtd/nand/gpmi-nand/gpmi-nand.c>

Is there a way to run this test successfully?

Regards,
Vikram
