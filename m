Received: from mail-wg0-x242.google.com ([2a00:1450:400c:c00::242])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mml-0003if-CR
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:43 +0000
Received: by wggx12 with SMTP id x12so8978068wgg.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:21 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 12/60] mtd: maps: intel_vr_nor: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:26 +0200
Message-Id: <1433968754-10651-13-git-send-email-fransklaver@gmail.com>
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

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/intel_vr_nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index 5ab71f0..8bf7977 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -90,7 +90,7 @@ static int vr_nor_mtd_setup(struct vr_nor_mtd *p)
 	if (!p->info)
 		return -ENODEV;
 
-	p->info->owner = THIS_MODULE;
+	p->info->dev.parent = &p->dev->dev;
 
 	return 0;
 }
-- 
2.4.0
