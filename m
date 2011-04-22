Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3a-0002q3-RQ
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:20 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM9ZT025973
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:13 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/13] fs-tests: integck: make -v switch work
Date: Fri, 22 Apr 2011 20:25:21 +0300
Message-Id: <1303493124-7619-11-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
References: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
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

-v (verbose) switch is supposed to turn power cut testing error
messages on/off. However, it does not work because the messages
are printed even if -v was not specified. This patch fixes it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 0f48377..372a348 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -70,7 +70,7 @@
 } while(0)
 
 #define pcv(fmt, ...) do {                                         \
-	if (args.power_cut_mode)                                   \
+	if (args.power_cut_mode && args.verbose)                   \
 		normsg(fmt " (line %d)", ##__VA_ARGS__, __LINE__); \
 } while(0)
 
-- 
1.7.2.3
