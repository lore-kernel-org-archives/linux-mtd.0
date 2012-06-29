Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkcuH-0006TE-0o
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:14:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/11] UBI: Fastmap: Add a module parameter to enable fastmap
Date: Fri, 29 Jun 2012 17:14:29 +0200
Message-Id: <1340982869-77042-12-git-send-email-richard@nod.at>
In-Reply-To: <1340982869-77042-1-git-send-email-richard@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The new parameter, ubi.fm_auto is per default 0.
If you attach an old image without a fastmap installed
UBI will not install a fastmap an work like in the old days.
But attaching by fastmap will work too if you attach a new image.
Of course in this case the fastmap will also get updated.

Is ubi.fm_auto set to 1 UBI automatically installs a fastmap
on old images.
This can be used to convert old images to have fastmap support.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |    2 +-
 drivers/mtd/ubi/build.c   |    8 +++++++-
 drivers/mtd/ubi/fastmap.c |    2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c55ad0f..a343a41 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1394,7 +1394,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (!ai)
 		return -ENOMEM;
 
-	if (force_scan || ubi->fm_disabled)
+	if (force_scan)
 		err = scan_all(ubi, ai, 0);
 	else {
 		err = scan_fast(ubi, ai);
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7b5dc5d..50b7590 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -67,6 +67,8 @@ static int __initdata mtd_devs;
 
 /* MTD devices specification parameters */
 static struct mtd_dev_param __initdata mtd_dev_param[UBI_MAX_DEVICES];
+/* UBI module parameter to enable fastmap automatically on non-fastmap images */
+static bool fm_auto;
 
 /* Root UBI "class" object (corresponds to '/<sysfs>/class/ubi/') */
 struct class *ubi_class;
@@ -899,7 +901,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 		ubi->fm_pool.max_size = UBI_FM_MIN_POOL_SIZE;
 
 	ubi->fm_wl_pool.max_size = UBI_FM_WL_POOL_SIZE;
-	ubi->fm_disabled = 1;
+	ubi->fm_disabled = !fm_auto;
 
 	ubi_msg("default fastmap pool size: %d", ubi->fm_pool.max_size);
 	ubi_msg("default fastmap WL pool size: %d", ubi->fm_wl_pool.max_size);
@@ -1392,6 +1394,10 @@ MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
 		      "with name \"content\" using VID header offset 1984, and "
 		      "MTD device number 4 with default VID header offset.");
 
+module_param(fm_auto, bool, 000);
+MODULE_PARM_DESC(fm_auto, "Set this parameter to enable fastmap automatically "
+			  "on images without a fastmap.");
+
 MODULE_VERSION(__stringify(UBI_VERSION));
 MODULE_DESCRIPTION("UBI - Unsorted Block Images");
 MODULE_AUTHOR("Artem Bityutskiy");
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 0c9466d..d995105 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1044,8 +1044,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	ubi->fm = fm;
 	ubi->fm_pool.max_size = ubi->fm->max_pool_size;
 	ubi->fm_wl_pool.max_size = ubi->fm->max_wl_pool_size;
+	ubi_msg("attached by fastmap");
 	ubi_msg("fastmap pool size: %d", ubi->fm_pool.max_size);
 	ubi_msg("fastmap WL pool size: %d", ubi->fm_wl_pool.max_size);
+	ubi->fm_disabled = 0;
 
 free_hdr:
 	ubi_free_vid_hdr(ubi, vh);
-- 
1.7.6.5
