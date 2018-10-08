Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9brg-000694-Lb
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2018 20:10:54 +0000
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
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 04/14] mtd: maps: physmap: Use dev_notice() and a %pR specifier
Date: Mon,  8 Oct 2018 22:10:17 +0200
Message-Id: <20181008201027.17952-5-boris.brezillon@bootlin.com>
In-Reply-To: <20181008201027.17952-1-boris.brezillon@bootlin.com>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace printk(KERN_NOTICE) by dev_notice() use the %pR specifier to
print the iomem resource.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/maps/physmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index e5b15ec2cb04..c8df9cccf4c4 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -129,9 +129,8 @@ static int physmap_flash_probe(struct platform_device *dev)
 		if (res)
 			break;
 
-		printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
-		       (unsigned long long)resource_size(res),
-		       (unsigned long long)res->start);
+		dev_notice(&dev->dev, "physmap platform flash device: %pR\n",
+			   res);
 
 		if (!devm_request_mem_region(&dev->dev, res->start,
 					     resource_size(res),
-- 
2.14.1
