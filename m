Received: from mail-wi0-x241.google.com ([2a00:1450:400c:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmU-00006S-PS
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:28 +0000
Received: by wibbw19 with SMTP id bw19so11967097wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:04 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 01/60] mtd: core: tone down suggestion that dev.parent
 should be set
Date: Wed, 10 Jun 2015 22:38:15 +0200
Message-Id: <1433968754-10651-2-git-send-email-fransklaver@gmail.com>
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

add_mtd_device() has a comment suggesting that the caller should have
set dev.parent. This is required to have the parent device symlink show
up in sysfs, but not for proper operation of the mtd device itself.
Currently we have five drivers registering mtd devices during module
initialization, so they don't actually provide a parent device to link
to. That means we cannot WARN_ON() here, as it would trigger false
positives.

Make the comment a bit less firm in its assertion that dev.parent should
be set.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d172195..d7967cc 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -423,7 +423,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	}
 
 	/* Caller should have set dev.parent to match the
-	 * physical device.
+	 * physical device, if appropriate.
 	 */
 	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
-- 
2.4.0
