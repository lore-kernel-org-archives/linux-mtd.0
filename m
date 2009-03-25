Received: from kroah.org ([198.145.64.141] helo=coco.kroah.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmH03-0002VZ-Aq
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 00:29:49 +0000
From: Greg Kroah-Hartman <gregkh@suse.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/61] mtd: struct device - replace bus_id with dev_name(),
	dev_set_name()
Date: Tue, 24 Mar 2009 17:26:10 -0700
Message-Id: <1237940825-22904-6-git-send-email-gregkh@suse.de>
In-Reply-To: <20090325001659.GA22461@kroah.com>
References: <20090325001659.GA22461@kroah.com>
Cc: linux-mtd@lists.infradead.org, Kay Sievers <kay.sievers@vrfy.org>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kay Sievers <kay.sievers@vrfy.org>

Cc: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
---
 drivers/mtd/nand/ndfc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 582cf80..89bf85a 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -187,7 +187,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 		return -ENODEV;
 
 	ndfc->mtd.name = kasprintf(GFP_KERNEL, "%s.%s",
-				   ndfc->ofdev->dev.bus_id, flash_np->name);
+			dev_name(&ndfc->ofdev->dev), flash_np->name);
 	if (!ndfc->mtd.name) {
 		ret = -ENOMEM;
 		goto err;
-- 
1.6.2
