Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaL-0004tp-Tp
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:38 +0000
Received: by widex7 with SMTP id ex7so26102695wid.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:16 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 39/60] mtd: nand: mpc5121_nfc: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:23 +0100
Message-Id: <1425418844-25177-40-git-send-email-fransklaver@gmail.com>
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
2.2.2
