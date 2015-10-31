Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMvh-0005E6-Oj
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:11 +0000
Received: by padhk11 with SMTP id hk11so91291745pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:54 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 11/11] mtd: physmap_of: assign parent for the concatenated
 MTD
Date: Fri, 30 Oct 2015 20:33:30 -0700
Message-Id: <1446262410-45754-12-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If there is more than one map region for this device, then the
concatenated MTD will not have a parent device assigned to it -- only
the sub-devices (which are not actually registered with the framework)
will have their parents assigned. Let's assign the concatenated device
correctly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: lumped into this series, since its context depends on this series

 drivers/mtd/maps/physmap_of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index b78265688075..70c453144f00 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -309,6 +309,7 @@ static int of_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
+	info->cmtd->dev.parent = &dev->dev;
 	mtd_set_of_node(info->cmtd, dp);
 	part_probe_types = of_get_probes(dp);
 	if (!part_probe_types) {
-- 
2.6.0.rc2.230.g3dd15c0
