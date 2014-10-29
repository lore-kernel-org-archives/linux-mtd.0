Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeN-0006TE-H3
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:58 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 23/35] UBI: Fastmap: Add new module parameter fm_debug
Date: Wed, 29 Oct 2014 13:45:46 +0100
Message-Id: <1414586758-9972-24-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If fm_debug is set fastmap debugging is enabled by default.
This is useful if one wants to debug fastmap on an UBI device
with serves the rootfs.
The the UBI attach mechanism runs long before debugfs can be mounted
and chk_fastmap set.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 5 +++++
 drivers/mtd/ubi/debug.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 666b2a0..a047bb4 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -81,6 +81,7 @@ static struct mtd_dev_param __initdata mtd_dev_param[UBI_MAX_DEVICES];
 #ifdef CONFIG_MTD_UBI_FASTMAP
 /* UBI module parameter to enable fastmap automatically on non-fastmap images */
 static bool fm_autoconvert;
+static bool fm_debug;
 #endif
 /* Root UBI "class" object (corresponds to '/<sysfs>/class/ubi/') */
 struct class *ubi_class;
@@ -949,6 +950,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 	ubi->fm_wl_pool.max_size = ubi->fm_pool.max_size / 2;
 	ubi->fm_disabled = !fm_autoconvert;
+	if (fm_debug)
+		ubi_enable_dbg_chk_fastmap(ubi);
 
 	if (!ubi->fm_disabled && (int)mtd_div_by_eb(ubi->mtd->size, ubi->mtd)
 	    <= UBI_FM_MAX_START) {
@@ -1495,6 +1498,8 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|pa
 #ifdef CONFIG_MTD_UBI_FASTMAP
 module_param(fm_autoconvert, bool, 0644);
 MODULE_PARM_DESC(fm_autoconvert, "Set this parameter to enable fastmap automatically on images without a fastmap.");
+module_param(fm_debug, bool, 0);
+MODULE_PARM_DESC(fm_debug, "Set this parameter to enable fastmap debugging by default. Warning, this will make fastmap slow!");
 #endif
 MODULE_VERSION(__stringify(UBI_VERSION));
 MODULE_DESCRIPTION("UBI - Unsorted Block Images");
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index e99ef37..c6ea443 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -132,4 +132,9 @@ static inline int ubi_dbg_chk_fastmap(const struct ubi_device *ubi)
 {
 	return ubi->dbg.chk_fastmap;
 }
+
+static inline void ubi_enable_dbg_chk_fastmap(struct ubi_device *ubi)
+{
+	ubi->dbg.chk_fastmap = 1;
+}
 #endif /* !__UBI_DEBUG_H__ */
-- 
1.8.4.5
