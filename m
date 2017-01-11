Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRPtC-0000Y3-UA
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 20:53:00 +0000
Subject: [PATCH 17/18] mtd-cfi_cmdset_0020: Use common error handling code in
 cfi_staa_setup()
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <128b121d-9b5e-8c71-6265-96110d6ca833@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:52:27 +0100
MIME-Version: 1.0
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 20:02:40 +0100

Add jump targets so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0020.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 9cd7b1c6faba..60de9d58dcc6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -173,11 +173,8 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 
 	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	//printk(KERN_DEBUG "number of CFI chips: %d\n", cfi->numchips);
-
-	if (!mtd) {
-		kfree(cfi->cmdset_priv);
-		return NULL;
-	}
+	if (!mtd)
+		goto free_priv;
 
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
@@ -187,11 +184,8 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	mtd->eraseregions = kmalloc_array(mtd->numeraseregions,
 					  sizeof(*mtd->eraseregions),
 					  GFP_KERNEL);
-	if (!mtd->eraseregions) {
-		kfree(cfi->cmdset_priv);
-		kfree(mtd);
-		return NULL;
-	}
+	if (!mtd->eraseregions)
+		goto free_mtd;
 
 	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
@@ -213,9 +207,7 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 		/* Argh */
 		printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
 		kfree(mtd->eraseregions);
-		kfree(cfi->cmdset_priv);
-		kfree(mtd);
-		return NULL;
+		goto free_mtd;
 	}
 
 	for (i=0; i<mtd->numeraseregions;i++){
@@ -242,6 +234,11 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	__module_get(THIS_MODULE);
 	mtd->name = map->name;
 	return mtd;
+free_mtd:
+	kfree(mtd);
+free_priv:
+	kfree(cfi->cmdset_priv);
+	return NULL;
 }
 
 
-- 
2.11.0
