Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaE-0003Gr-J3
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:31 +0000
Received: by widem10 with SMTP id em10so24663704wid.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:08 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 30/60] mtd: nand: fsl_elbc_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:14 +0100
Message-Id: <1425418844-25177-31-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where devices aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 04b22fd..0cd94a1 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -747,7 +747,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 
 	/* Fill in fsl_elbc_mtd structure */
 	priv->mtd.priv = chip;
-	priv->mtd.owner = THIS_MODULE;
+	priv->mtd.dev.parent = &chip->dev;
 
 	/* set timeout to maximum */
 	priv->fmr = 15 << FMR_CWTO_SHIFT;
-- 
2.2.2
