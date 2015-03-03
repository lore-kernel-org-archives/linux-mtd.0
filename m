Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZp-00037Y-IC
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:08 +0000
Received: by wggy19 with SMTP id y19so42752683wgg.10
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:43 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 03/60] mtd: devices: bcm47xxflash: show device in sysfs
Date: Tue,  3 Mar 2015 22:39:47 +0100
Message-Id: <1425418844-25177-4-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd devices aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/devices/bcm47xxsflash.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 3d008a9..347bb83 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -237,13 +237,14 @@ static int bcm47xxsflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
-static void bcm47xxsflash_fill_mtd(struct bcm47xxsflash *b47s)
+static void bcm47xxsflash_fill_mtd(struct bcm47xxsflash *b47s,
+				   struct device *dev)
 {
 	struct mtd_info *mtd = &b47s->mtd;
 
 	mtd->priv = b47s;
+	mtd->dev.parent = dev;
 	mtd->name = "bcm47xxsflash";
-	mtd->owner = THIS_MODULE;
 
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_CAP_NORFLASH;
@@ -300,7 +301,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	b47s->blocksize = sflash->blocksize;
 	b47s->numblocks = sflash->numblocks;
 	b47s->size = sflash->size;
-	bcm47xxsflash_fill_mtd(b47s);
+	bcm47xxsflash_fill_mtd(b47s, &pdev->dev);
 
 	err = mtd_device_parse_register(&b47s->mtd, probes, NULL, NULL, 0);
 	if (err) {
-- 
2.2.2
