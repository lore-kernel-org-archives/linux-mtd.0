Received: from mail-yk0-x244.google.com ([2607:f8b0:4002:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDzEK-0007YM-FU
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 18:42:45 +0000
Received: by mail-yk0-x244.google.com with SMTP id k129so12026292yke.3
 for <linux-mtd@lists.infradead.org>; Tue, 29 Dec 2015 10:42:23 -0800 (PST)
From: Insu Yun <wuninsu@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: taesoo@gatech.edu, yeongjin.jang@gatech.edu, insu@gatech.edu,
 changwoo@gatech.edu, Insu Yun <wuninsu@gmail.com>
Subject: [PATCH] mtd: fixing memory leak and handling failed kmalloc
Date: Tue, 29 Dec 2015 13:45:09 -0500
Message-Id: <1451414709-8581-1-git-send-email-wuninsu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kmalloc needs to be handled when failing in memory pressure.
Also, it has memory leak in error routine.

Signed-off-by: Insu Yun <wuninsu@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 286b97a..5e1b68c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -596,7 +596,7 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	mtd->size = devsize * cfi->numchips;
 
 	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
-	mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info)
+	mtd->eraseregions = kzalloc(sizeof(struct mtd_erase_region_info)
 			* mtd->numeraseregions, GFP_KERNEL);
 	if (!mtd->eraseregions)
 		goto setup_err;
@@ -614,6 +614,8 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize = ersize;
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap = kmalloc(ernum / 8 + 1, GFP_KERNEL);
+			if (!mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap)
+				goto setup_err;
 		}
 		offset += (ersize * ernum);
 	}
@@ -650,6 +652,10 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	return mtd;
 
  setup_err:
+	if (mtd->eraseregions)
+		for (i=0; i<cfi->cfiq->NumEraseRegions; i++)
+			for (j=0; j<cfi->numchips; j++)
+				kfree(mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap);
 	kfree(mtd->eraseregions);
 	kfree(mtd);
 	kfree(cfi->cmdset_priv);
-- 
1.9.1
