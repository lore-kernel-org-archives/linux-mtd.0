Date: Thu, 30 Jul 2009 17:23:10 +0200
From: Benedikt Spranger <b.spranger@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: PATCH] MTD/maps: correct cleanup in error case
Message-ID: <20090730172310.719ad329@ariane.spranger.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Stoyan Gaydarov <sgayda2@uiuc.edu>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Benedikt Spranger <b.spranger@linutronix.de>
Date: Thu, 30 Jul 2009 17:03:51 +0200
Subject: [PATCH] MTD/maps: correct cleanup in error case

fix a copy and paste error introduced by commit 143070e
(mtd: physmap_of: Add multiple regions and concatenation support).

info is needed (via drvdata) and freed in of_flash_remove(), therefore
drvdata should be set right after allocation.

Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
---
 drivers/mtd/maps/physmap_of.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 39d357b..32b4a5a 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -214,12 +214,12 @@ static int __devinit of_flash_probe(struct of_device *dev,
 	if (!info)
 		goto err_out;
 
+	dev_set_drvdata(&dev->dev, info);
+
 	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
-	if (!info)
+	if (!mtd_list)
 		goto err_out;
 
-	dev_set_drvdata(&dev->dev, info);
-
 	for (i = 0; i < count; i++) {
 		err = -ENXIO;
 		if (of_address_to_resource(dp, i, &res)) {
-- 
1.6.3.3
