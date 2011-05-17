Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnN-0004fF-2e
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:22 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWs006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:19 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/11] fs-tests: integck: check errno in pvc macro
Date: Tue, 17 May 2011 10:38:08 +0300
Message-Id: <1305617896-23711-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

All errors but write errors have corresponding CHECK(), so if something
gets wrong we fail. But in case of I/O errors we do not fail if an
unexpected error happens, which makes it difficult to trace issues.
Inject the errno checking to the pvc macro to make sure we fail if
errno is not EROFS.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 1b08acc..b411a68 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -69,12 +69,18 @@
 		check_failed(stringify(cond), __func__, __FILE__, __LINE__); \
 } while(0)
 
+#define CHECK_ERRNO() do {                                                   \
+	if (args.power_cut_mode)                                             \
+		CHECK(errno == EROFS);                                       \
+	else                                                                 \
+		CHECK(0);                                                    \
+} while(0)
+
 #define pcv(fmt, ...) do {                                                   \
 	if (!args.power_cut_mode || (args.power_cut_mode && args.verbose))   \
 		normsg(fmt " (line %d, error %d (%s))",                      \
 		       ##__VA_ARGS__, __LINE__, errno, strerror(errno));     \
-	if (!args.power_cut_mode)                                            \
-		CHECK(0);                                                    \
+	CHECK_ERRNO();                                                       \
 } while(0)
 
 /* The variables below are set by command line arguments */
-- 
1.7.2.3
