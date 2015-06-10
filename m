Received: from mail-wg0-x243.google.com ([2a00:1450:400c:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmV-00006Y-9s
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:29 +0000
Received: by wggy19 with SMTP id y19so8933015wgg.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:05 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 02/60] mtd: core: set some defaults when dev.parent is set
Date: Wed, 10 Jun 2015 22:38:16 +0200
Message-Id: <1433968754-10651-3-git-send-email-fransklaver@gmail.com>
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

If a parent device is set, add_mtd_device() has enough knowledge to fill
in some sane default values for the module name and owner. Do so if they
aren't already set.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>

---
v1..v2
  - Apparently we can get here without a driver set, causing a NULL
    dereference[0]. Check that a driver is there before copying the
    owner. It does mean that parent devices that don't seem to be
    having a driver lying around still can't produce an owner. I suppose
    the effect is not much different from it was before.
  - Change wording of debug message to mention the fact we're talking
    about parent device symlinks here.

[0] https://lkml.org/lkml/2015/4/16/15
---
 drivers/mtd/mtdcore.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index d7967cc..0bd1761 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -413,6 +413,15 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
 	mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
 
+	if (mtd->dev.parent) {
+		if (!mtd->owner && mtd->dev.parent->driver)
+			mtd->owner = mtd->dev.parent->driver->owner;
+		if (!mtd->name)
+			mtd->name = dev_name(mtd->dev.parent);
+	} else {
+		pr_debug("mtd device won't show a device symlink in sysfs\n");
+	}
+
 	/* Some chips always power up locked. Unlock them now */
 	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
 		error = mtd_unlock(mtd, 0, mtd->size);
-- 
2.4.0
