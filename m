Received: from mail-wi0-x241.google.com ([2a00:1450:400c:c05::241])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmu-0003iz-Di
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:52 +0000
Received: by wivz2 with SMTP id z2so11955204wiv.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:31 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 21/60] mtd: maps: sa1100-flash: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:35 +0200
Message-Id: <1433968754-10651-22-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.
Incidentally, it seems the owner field in the concatenated mtds is not
actually used, so this shouldn't make much of a difference anyway.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/sa1100-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 892ad6a..142fc3d 100644
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
2.4.0
