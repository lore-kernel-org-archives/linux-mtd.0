Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvqUE-00030W-6t
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2012 13:58:18 +0000
Received: by mail-bk0-f49.google.com with SMTP id ji2so2949582bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2012 06:58:12 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: [PATCH 4/5] UBI: kill CONFIG_MTD_UBI_BEB_RESERVE
Date: Mon, 30 Jul 2012 16:57:40 +0300
Message-Id: <1343656661-8096-4-git-send-email-dedekind1@gmail.com>
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

CONFIG_MTD_UBI_BEB_RESERVE and MIN_RESEVED_PEBS are no longer used,
since the amount of reserved eraseblocks for bad PEB handling is now
derived from 'ubi->bad_peb_limit' (ubi's maximum expected bad
eraseblocks).

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/Kconfig | 16 ----------------
 drivers/mtd/ubi/ubi.h   |  3 ---
 2 files changed, 19 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 76195ac..b2f4f0f 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -27,22 +27,6 @@ config MTD_UBI_WL_THRESHOLD
 	  life-cycle less than 10000, the threshold should be lessened (e.g.,
 	  to 128 or 256, although it does not have to be power of 2).
 
-config MTD_UBI_BEB_RESERVE
-	int "Percentage of reserved eraseblocks for bad eraseblocks handling"
-	default 2
-	range 0 25
-	help
-	  If the MTD device admits of bad eraseblocks (e.g. NAND flash), UBI
-	  reserves some amount of physical eraseblocks to handle new bad
-	  eraseblocks. When a physical eraseblock becomes bad, UBI uses these
-	  reserved physical eraseblocks to relocate the bad one. This
-	  configuration option specifies how many physical eraseblocks will be
-	  reserved for bad eraseblock handling (percents of total number of
-	  good physical eraseblocks on this MTD partition). If the underlying
-	  flash does not admit of bad eraseblocks (e.g. NOR flash), this value
-	  is ignored and nothing is reserved. Leave the default value if
-	  unsure.
-
 config MTD_UBI_BEB_LIMIT
 	int "Percentage of maximum expected bad eraseblocks"
 	default 2
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index aeb459e..c94612e 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -59,9 +59,6 @@
 #define ubi_err(fmt, ...) printk(KERN_ERR "UBI error: %s: " fmt "\n", \
 				 __func__, ##__VA_ARGS__)
 
-/* Lowest number PEBs reserved for bad PEB handling */
-#define MIN_RESEVED_PEBS 2
-
 /* Background thread name pattern */
 #define UBI_BGT_NAME_PATTERN "ubi_bgt%dd"
 
-- 
1.7.11.2
