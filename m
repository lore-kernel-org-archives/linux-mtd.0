Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P07NA-0007kP-Lz
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:39:37 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 08BBA1B4091
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Sep 2010 06:39:31 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: common.h: clean up PROGRAM_NAME usage
Date: Mon, 27 Sep 2010 02:40:26 -0400
Message-Id: <1285569626-16021-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make PROGRAM_NAME required in order to include common.h so we can rely
on it existing.

Further, stop embedding PROGRAM_NAME in every error message so that we
can save string space with it being declare only once.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/common.h |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/include/common.h b/include/common.h
index 11b0cf6..dce067b 100644
--- a/include/common.h
+++ b/include/common.h
@@ -24,10 +24,9 @@
 #include <string.h>
 #include <errno.h>
 
-/*
- * Note, the user is supposed to define its PROGRAM_NAME before including this
- * header.
- */
+#ifndef PROGRAM_NAME
+# error "You must define PROGRAM_NAME before including this header"
+#endif
 
 #ifdef __cplusplus
 extern "C" {
@@ -43,27 +42,27 @@ extern "C" {
 		printf(fmt, ##__VA_ARGS__);                        \
 } while(0)
 #define verbose(verbose, fmt, ...) \
-	bareverbose(verbose, PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__)
+	bareverbose(verbose, "%s: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__)
 
 /* Normal messages */
-#define normsg(fmt, ...) do {                              \
-	printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__); \
+#define normsg_cont(fmt, ...) do {                                 \
+	printf("%s: " fmt, PROGRAM_NAME, ##__VA_ARGS__);           \
 } while(0)
-#define normsg_cont(fmt, ...) do {                         \
-	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__);      \
+#define normsg(fmt, ...) do {                                      \
+	normsg_cont(fmt "\n", ##__VA_ARGS__);                      \
 } while(0)
 
 /* Error messages */
 #define errmsg(fmt, ...)  ({                                                \
-	fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__); \
+	fprintf(stderr, "%s: error!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
 	-1;                                                                 \
 })
 
 /* System error messages */
 #define sys_errmsg(fmt, ...)  ({                                            \
 	int _err = errno;                                                   \
-	size_t _i;                                                           \
-	fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__); \
+	size_t _i;                                                          \
+	errmsg(fmt, ##__VA_ARGS__);                                         \
 	for (_i = 0; _i < sizeof(PROGRAM_NAME) + 1; _i++)                   \
 		fprintf(stderr, " ");                                       \
 	fprintf(stderr, "error %d (%s)\n", _err, strerror(_err));           \
@@ -72,7 +71,7 @@ extern "C" {
 
 /* Warnings */
 #define warnmsg(fmt, ...) do {                                                \
-	fprintf(stderr, PROGRAM_NAME ": warning!: " fmt "\n", ##__VA_ARGS__); \
+	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
 } while(0)
 
 static inline int is_power_of_2(unsigned long long n)
-- 
1.7.2.3
