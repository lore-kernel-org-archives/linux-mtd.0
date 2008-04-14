Received: from smtp6.pp.htv.fi ([213.243.153.40])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPYt-0003YC-CH
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:35 +0000
Date: Mon, 14 Apr 2008 17:20:30 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd/chips/cfi_cmdset_0020.c: make a function static
Message-ID: <20080414142030.GT6695@cs181133002.pp.htv.fi>
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

This patch makes the needlessly global cfi_staa_erase_varsize() static.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
071e1e3116928c1625f475a0fba2f96ee897a95c diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 492e2ab..356939b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -893,7 +893,8 @@ retry:
 	return ret;
 }
 
-int cfi_staa_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
+static int cfi_staa_erase_varsize(struct mtd_info *mtd,
+				  struct erase_info *instr)
 {	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long adr, len;
