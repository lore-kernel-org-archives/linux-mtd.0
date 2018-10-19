Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDPXV-0003Sc-Fc
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:50:15 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 07/15] mtd: maps: physmap: Check mtd_device_{parse_register,
 unregister}() ret code
Date: Fri, 19 Oct 2018 09:49:00 +0200
Message-Id: <20181019074908.13226-8-boris.brezillon@bootlin.com>
In-Reply-To: <20181019074908.13226-1-boris.brezillon@bootlin.com>
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_device_parse_register() and mtd_device_unregister() can fail,
check their return code and propagate the error to the upper layer
if needed.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Reviewed-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
Changes in v2:
- Add Ricardo's R-b
---
 drivers/mtd/maps/physmap.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 86679d149a49..9b34223c4635 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -35,7 +35,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
 	struct physmap_flash_data *physmap_data;
-	int i;
+	int i, err;
 
 	info = platform_get_drvdata(dev);
 	if (info == NULL)
@@ -44,7 +44,10 @@ static int physmap_flash_remove(struct platform_device *dev)
 	physmap_data = dev_get_platdata(&dev->dev);
 
 	if (info->cmtd) {
-		mtd_device_unregister(info->cmtd);
+		err = mtd_device_unregister(info->cmtd);
+		if (err)
+			return err;
+
 		if (info->cmtd != info->mtds[0])
 			mtd_concat_destroy(info->cmtd);
 	}
@@ -194,8 +197,12 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 	part_types = physmap_data->part_probe_types ? : part_probe_types;
 
-	mtd_device_parse_register(info->cmtd, part_types, NULL,
-				  physmap_data->parts, physmap_data->nr_parts);
+	err = mtd_device_parse_register(info->cmtd, part_types, NULL,
+					physmap_data->parts,
+					physmap_data->nr_parts);
+	if (err)
+		goto err_out;
+
 	return 0;
 
 err_out:
-- 
2.14.1
