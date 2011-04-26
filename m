Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEcfu-00074K-Rv
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:27:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3Q7R8gI015874
	for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2011 10:27:08 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] fs-tests: integck: fail loudly on unexpected EROFS
Date: Tue, 26 Apr 2011 10:30:22 +0300
Message-Id: <1303803022-31863-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

If we are not in power cut testing mode (-p was not used) and we get an
unexpected EROFS, we silently exit. This patch fixes this behavior and make
the test loudly fail instead.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index bbbc7cb..1dd424e 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -69,9 +69,11 @@
 		check_failed(stringify(cond), __func__, __FILE__, __LINE__); \
 } while(0)
 
-#define pcv(fmt, ...) do {                                         \
-	if (args.power_cut_mode && args.verbose)                   \
-		normsg(fmt " (line %d)", ##__VA_ARGS__, __LINE__); \
+#define pcv(fmt, ...) do {                                                   \
+	if (!args.power_cut_mode || (args.power_cut_mode && args.verbose))   \
+		normsg(fmt " (line %d)", ##__VA_ARGS__, __LINE__);           \
+	if (!args.power_cut_mode)                                            \
+		CHECK(0);                                                    \
 } while(0)
 
 /* The variables below are set by command line arguments */
@@ -3048,8 +3050,10 @@ int main(int argc, char *argv[])
 		/*
 		 * Iterate forever only in case of power-cut emulation testing.
 		 */
-		if (!args.power_cut_mode)
+		if (!args.power_cut_mode) {
+			CHECK(!ret);
 			break;
+		}
 
 		CHECK(ret);
 		CHECK(errno == EROFS);
-- 
1.7.2.3
