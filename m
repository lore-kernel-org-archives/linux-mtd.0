Received: from smtp6.pp.htv.fi ([213.243.153.40])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPPBT-0002f3-7y
	for linux-mtd@lists.infradead.org; Wed, 13 Feb 2008 21:30:34 +0000
Date: Wed, 13 Feb 2008 23:30:10 +0200
From: Adrian Bunk <bunk@kernel.org>
To: Mart Raudsepp <mart.raudsepp@artecdesign.ee>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [2.6 patch] make mtd/nand/cs553x_nand.c:part_probes[] static
Message-ID: <20080213213010.GX3383@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the needlessly global part_probes[] static.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
054adb5b7a0d1ebaef61192ccf78df37aec42270 diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index 8dab696..3370a80 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -279,7 +279,7 @@ static int is_geode(void)
 
 
 #ifdef CONFIG_MTD_PARTITIONS
-const char *part_probes[] = { "cmdlinepart", NULL };
+static const char *part_probes[] = { "cmdlinepart", NULL };
 #endif
 
 
