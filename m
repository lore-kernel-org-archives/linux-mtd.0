Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4kB2-0004HJ-6i
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 06:49:09 +0000
To: Frans Klaver <fransklaver@gmail.com>
Reply-To: hs@denx.de
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Pekon Gupta <pekon@pek-sem.com>, Roger Quadros <rogerq@ti.com>,
 Nicholas Mc Guire <hofrat@osadl.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefano Babic <sbabic@denx.de>,
 "Stahl Martin (Helbling Technik)" <Martin.Stahl@helbling.ch>
From: Heiko Schocher <hs@denx.de>
Subject: mtd, nand, omap2: parse cmdline partition fail
Message-ID: <56613747.8040907@denx.de>
Date: Fri, 4 Dec 2015 07:48:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Frans,

I just tried current mainline kernel:
commit 2255702db4014d1c69d6037ed7bdad2d2e271985
Merge: 9e5d25e c86576e
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Nov 30 16:06:44 2015 -0800

     Merge tag 'mn10300-for-linus-v4.4-rc4' of 
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging

on an am3517 based board (mainlining soon). And with your commit:
commit 853f1c58c4b2: mtd: nand: omap2: show parent device structure in sysfs

MTD partitions from cmdline are not longer detected:

[    2.087305] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
[    2.094097] nand: Micron MT29F4G16ABADAWP
[    2.098303] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    2.106296] nand: WARNING: MT29F4G16ABADAWP: the ECC used on your system is too weak compared to 
the one required by the NAND chip
[    2.118674] MT29F4G16ABADAWP: 'partitions' subnode not found on /ocp/gpmc@6e000000/nand@0,0. 
Trying to parse direct subnodes as partitions.
[...]

before this patch it worked:
[    2.307444] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
[    2.314092] nand: Micron MT29F4G16ABADAWP
[    2.318348] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    2.326331] nand: WARNING: omap2-nand.0: the ECC used on your system is too weak compared to the 
one required by the NAND chip
[    2.338336] 5 cmdlinepart partitions found on MTD device omap2-nand.0
[    2.345129] Creating 5 MTD partitions on "omap2-nand.0":
[    2.350704] 0x000000000000-0x000000080000 : "MLO"
[    2.366877] 0x000000080000-0x000000180000 : "u-boot"
[    2.379179] 0x000000180000-0x0000001c0000 : "env1"
[    2.390627] 0x0000001c0000-0x000000200000 : "env2"
[    2.402255] 0x000000200000-0x000020000000 : "common_data"

Reason is taht the mtd->name has changed from "omap2-nand.0" to the
nand chip name ...

If I revert this part from the patch

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 93f664c..28dcf66 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1685,6 +1685,7 @@ static int omap_nand_probe(struct platform_device *pdev)
         info->ecc_opt           = pdata->ecc_opt;
         mtd                     = &info->mtd;
         mtd->priv               = &info->nand;
+       mtd->name               = dev_name(&pdev->dev);
         mtd->dev.parent         = &pdev->dev;
         nand_chip               = &info->nand;
         nand_chip->ecc.priv     = NULL;

It works again ...

So the question is, is it intended to change the "mtd->name"?
But wondering, if there are two or more identical nand chips in the
system, they will have the same mtd->name ... which seems buggy to me...

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
