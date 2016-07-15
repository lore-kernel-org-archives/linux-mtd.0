Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bO0xu-0005ZO-CQ
 for linux-mtd@lists.infradead.org; Fri, 15 Jul 2016 11:07:30 +0000
Date: Fri, 15 Jul 2016 14:06:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>, Frans Klaver <fransklaver@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: [patch] mtd: maps: sa1100-flash: potential NULL dereference
Message-ID: <20160715110629.GB9258@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We check for NULL but then dereference "info->mtd" on the next line.

Fixes: 72169755cf36 ('mtd: maps: sa1100-flash: show parent device in sysfs')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 142fc3d..784c6e1 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -230,8 +230,10 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 
 		info->mtd = mtd_concat_create(cdev, info->num_subdev,
 					      plat->name);
-		if (info->mtd == NULL)
+		if (info->mtd == NULL) {
 			ret = -ENXIO;
+			goto err;
+		}
 	}
 	info->mtd->dev.parent = &pdev->dev;
 
