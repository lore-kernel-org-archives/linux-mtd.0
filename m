Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3neM-00048l-Pa
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 12:33:39 +0000
Received: by weyr3 with SMTP id r3so4952589wey.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 05:33:37 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH resend] UBI: introduce MTD_PARAM_MAX_COUNT
Date: Tue, 21 Aug 2012 14:33:22 +0200
Message-Id: <1345552402-25190-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is the patch accidentally dropped.
I rebased it on linux-ubi/master (9baf0a2) and made sure the other ones:
* UBI: replace MTD_UBI_BEB_LIMIT with module parameter
* UBI: add ioctl for max_beb_per1024
* UBI: drop CONFIG_MTD_UBI_BEB_LIMIT

still apply correctly (and they still do, so I don't resend them).

Best regards,
Richard.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8bbab23..0fe6356 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -46,6 +46,9 @@
 /* Maximum length of the 'mtd=' parameter */
 #define MTD_PARAM_LEN_MAX 64
 
+/* Maximum number of comma-separated items in the 'mtd=' parameter */
+#define MTD_PARAM_MAX_COUNT 2
+
 /* Maximum value for the number of bad PEBs per 1024 PEBs */
 #define MAX_MTD_UBI_BEB_LIMIT 768
 
@@ -1338,7 +1341,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	struct mtd_dev_param *p;
 	char buf[MTD_PARAM_LEN_MAX];
 	char *pbuf = &buf[0];
-	char *tokens[2] = {NULL, NULL};
+	char *tokens[MTD_PARAM_MAX_COUNT];
 
 	if (!val)
 		return -EINVAL;
@@ -1368,7 +1371,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 	if (buf[len - 1] == '\n')
 		buf[len - 1] = '\0';
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < MTD_PARAM_MAX_COUNT; i++)
 		tokens[i] = strsep(&pbuf, ",");
 
 	if (pbuf) {
-- 
1.7.2.5
