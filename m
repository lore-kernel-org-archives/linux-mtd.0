Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OzNsG-0004PA-F7
	for linux-mtd@lists.infradead.org; Sat, 25 Sep 2010 06:04:40 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 2ABF81B437B
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Sep 2010 06:04:36 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4 v2] mtd-utils: new bareverbose() helper
Date: Sat, 25 Sep 2010 02:05:25 -0400
Message-Id: <1285394725-29738-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1285293221-25028-2-git-send-email-vapier@gentoo.org>
References: <1285293221-25028-2-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new helper that lets people do simple verbose output without any
implicit strings added around it.  Good for progress bars and such.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- fix typo in changelog

 include/common.h |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/common.h b/include/common.h
index e87b215..11b0cf6 100644
--- a/include/common.h
+++ b/include/common.h
@@ -38,10 +38,12 @@ extern "C" {
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
 
 /* Verbose messages */
-#define verbose(verbose, fmt, ...) do {                            \
+#define bareverbose(verbose, fmt, ...) do {                        \
 	if (verbose)                                               \
-		printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__); \
+		printf(fmt, ##__VA_ARGS__);                        \
 } while(0)
+#define verbose(verbose, fmt, ...) \
+	bareverbose(verbose, PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__)
 
 /* Normal messages */
 #define normsg(fmt, ...) do {                              \
-- 
1.7.2.3
