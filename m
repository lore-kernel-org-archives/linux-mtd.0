Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZo-00037K-1U
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:07 +0000
Received: by wghl18 with SMTP id l18so42765270wgh.7
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:41 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 02/60] mtd: core: set some defaults when dev.parent is set
Date: Tue,  3 Mar 2015 22:39:46 +0100
Message-Id: <1425418844-25177-3-git-send-email-fransklaver@gmail.com>
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

If a parent device is set, add_mtd_device() has enough knowledge to fill
in some sane default values for the module name and owner. Do so if they
aren't already set.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/mtdcore.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2093676..487e467 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -412,6 +412,15 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
 	mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
 
+	if (mtd->dev.parent) {
+		if (!mtd->owner)
+			mtd->owner = mtd->dev.parent->driver->owner;
+		if (!mtd->name)
+			mtd->name = dev_name(mtd->dev.parent);
+	} else {
+		pr_debug("mtd device won't show a device entry in sysfs\n");
+	}
+
 	/* Some chips always power up locked. Unlock them now */
 	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
 		error = mtd_unlock(mtd, 0, mtd->size);
-- 
2.2.2
