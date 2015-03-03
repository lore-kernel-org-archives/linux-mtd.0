Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSua5-0004s8-Gr
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:21 +0000
Received: by wghl18 with SMTP id l18so42781056wgh.8
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:59 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 21/60] mtd: maps: sa1100-flash: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:05 +0100
Message-Id: <1425418844-25177-22-git-send-email-fransklaver@gmail.com>
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
Incidentally, it seems the owner field in the concatenated mtds is not
actually used, so this shouldn't make much of a difference anyway.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/sa1100-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index ea69720..af04244 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -117,7 +117,6 @@ static int sa1100_probe_subdev(struct sa_subdev_info *subdev, struct resource *r
 		ret = -ENXIO;
 		goto err;
 	}
-	subdev->mtd->owner = THIS_MODULE;
 
 	printk(KERN_INFO "SA1100 flash: CFI device at 0x%08lx, %uMiB, %d-bit\n",
 		phys, (unsigned)(subdev->mtd->size >> 20),
@@ -234,6 +233,7 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 		if (info->mtd == NULL)
 			ret = -ENXIO;
 	}
+	info->mtd->dev.parent = &pdev->dev;
 
 	if (ret == 0)
 		return info;
-- 
2.2.2
