Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvqU7-00030W-Vm
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2012 13:58:12 +0000
Received: by mail-bk0-f49.google.com with SMTP id ji2so2949582bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2012 06:58:09 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: [PATCH 2/5] UBI: introduce new bad PEB limit
Date: Mon, 30 Jul 2012 16:57:38 +0300
Message-Id: <1343656661-8096-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1343656661-8096-1-git-send-email-dedekind1@gmail.com>
References: <1343656661-8096-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Introduce 'ubi->bad_peb_limit', which specifies an upper limit of PEBs
UBI expects to go bad.  Currently, it is initialized to a fixed percentage
of total PEBs in the UBI device (configurable via CONFIG_MTD_UBI_BEB_LIMIT).

The 'bad_peb_limit' is intended to be used for calculating the amount of PEBs
UBI needs to reserve for bad eraseblock handling.

Artem: minor amendments.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/Kconfig | 26 +++++++++++++++++++-------
 drivers/mtd/ubi/build.c | 12 +++++++++++-
 drivers/mtd/ubi/ubi.h   |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index ea4b95b..76195ac 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -34,13 +34,25 @@ config MTD_UBI_BEB_RESERVE
 	help
 	  If the MTD device admits of bad eraseblocks (e.g. NAND flash), UBI
 	  reserves some amount of physical eraseblocks to handle new bad
-	  eraseblocks. For example, if a flash physical eraseblock becomes bad,
-	  UBI uses these reserved physical eraseblocks to relocate the bad one.
-	  This option specifies how many physical eraseblocks will be reserved
-	  for bad eraseblock handling (percents of total number of good flash
-	  eraseblocks). If the underlying flash does not admit of bad
-	  eraseblocks (e.g. NOR flash), this value is ignored and nothing is
-	  reserved. Leave the default value if unsure.
+	  eraseblocks. When a physical eraseblock becomes bad, UBI uses these
+	  reserved physical eraseblocks to relocate the bad one. This
+	  configuration option specifies how many physical eraseblocks will be
+	  reserved for bad eraseblock handling (percents of total number of
+	  good physical eraseblocks on this MTD partition). If the underlying
+	  flash does not admit of bad eraseblocks (e.g. NOR flash), this value
+	  is ignored and nothing is reserved. Leave the default value if
+	  unsure.
+
+config MTD_UBI_BEB_LIMIT
+	int "Percentage of maximum expected bad eraseblocks"
+	default 2
+	range 0 25
+	help
+	  This option specifies the maximum bad physical eraseblocks UBI
+	  expects on the UBI device (percents of total number of physical
+	  eraseblocks on this MTD partition). If the underlying flash does not
+	  admit of bad eraseblocks (e.g. NOR flash), this value is ignored.
+	  Leave the default value if unsure.
 
 config MTD_UBI_GLUEBI
 	tristate "MTD devices emulation driver (gluebi)"
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 2c5ed5c..7b6b5f9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -607,8 +607,18 @@ static int io_init(struct ubi_device *ubi)
 	ubi->peb_count  = mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
 	ubi->flash_size = ubi->mtd->size;
 
-	if (mtd_can_have_bb(ubi->mtd))
+	if (mtd_can_have_bb(ubi->mtd)) {
 		ubi->bad_allowed = 1;
+		if (CONFIG_MTD_UBI_BEB_LIMIT > 0) {
+			int percent = CONFIG_MTD_UBI_BEB_LIMIT;
+			int limit = mult_frac(ubi->peb_count, percent, 100);
+
+			/* Round it up */
+			if (mult_frac(limit, 100, percent) < ubi->peb_count)
+				limit += 1;
+			ubi->bad_peb_limit = limit;
+		}
+	}
 
 	if (ubi->mtd->type == MTD_NORFLASH) {
 		ubi_assert(ubi->mtd->writesize == 1);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 84f66e3..aeb459e 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -363,6 +363,7 @@ struct ubi_wl_entry;
  * @flash_size: underlying MTD device size (in bytes)
  * @peb_count: count of physical eraseblocks on the MTD device
  * @peb_size: physical eraseblock size
+ * @bad_peb_limit: top limit of expected bad physical eraseblocks
  * @bad_peb_count: count of bad physical eraseblocks
  * @good_peb_count: count of good physical eraseblocks
  * @corr_peb_count: count of corrupted physical eraseblocks (preserved and not
@@ -410,6 +411,7 @@ struct ubi_device {
 	int avail_pebs;
 	int beb_rsvd_pebs;
 	int beb_rsvd_level;
+	int bad_peb_limit;
 
 	int autoresize_vol_id;
 	int vtbl_slots;
-- 
1.7.11.2
