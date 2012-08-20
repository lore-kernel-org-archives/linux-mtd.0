Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3UP3-0006xH-Na
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 16:00:34 +0000
Received: by mail-we0-f177.google.com with SMTP id r3so4351481wey.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 09:00:33 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v3 3/6] UBI: check max_beb_per1024 value in ubi_attach_mtd_dev
Date: Mon, 20 Aug 2012 18:00:13 +0200
Message-Id: <1345478416-23900-4-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

max_beb_per1024 shouldn't be negative, and a 0 value will be treated as
the default value.
For the upper bound, 768/1024 should be enough.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/build.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3c0b91f..6a749d6 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -49,6 +49,9 @@
 /* Maximum number of comma-separated items in the 'mtd=' parameter */
 #define MTD_PARAM_MAX_COUNT 2
 
+/* Maximum value for the number of bad eraseblocks per 1024 limit */
+#define MAX_MTD_UBI_BEB_LIMIT 768
+
 #ifdef CONFIG_MTD_UBI_MODULE
 #define ubi_is_module() 1
 #else
@@ -855,6 +858,15 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	struct ubi_device *ubi;
 	int i, err, ref = 0;
 
+	if ((max_beb_per1024 < 0) || (max_beb_per1024 > MAX_MTD_UBI_BEB_LIMIT))
+		return -EINVAL;
+
+	/*
+	 * Use the default value if max_beb_per1024 isn't provided.
+	 */
+	if (!max_beb_per1024)
+		max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
+
 	/*
 	 * Check if we already have the same MTD device attached.
 	 *
-- 
1.7.2.5
