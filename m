Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnD-0005FV-Cb
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:11 +0000
Received: by wibbw19 with SMTP id bw19so11975341wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:51 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 39/60] mtd: nand: mpc5121_nfc: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:53 +0200
Message-Id: <1433968754-10651-40-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
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

Fix a bug where parent device symlinks aren't shown in sysfs.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/mpc5121_nfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 1f12e5b..b97c371 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -659,6 +659,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip = &prv->chip;
 
 	mtd->priv = chip;
+	mtd->dev.parent = dev;
 	chip->priv = prv;
 	prv->dev = dev;
 
-- 
2.4.0
