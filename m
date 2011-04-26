Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEced-00071N-KV
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:25:53 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3Q7PnBJ010212
	for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2011 10:25:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] UBIFS: dump the stack on errors in failure mode too
Date: Tue, 26 Apr 2011 10:29:23 +0300
Message-Id: <1303802963-31612-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303802963-31612-1-git-send-email-dedekind1@gmail.com>
References: <1303802963-31612-1-git-send-email-dedekind1@gmail.com>
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

When UBIFS is in the failure mode (used for power cut emulation testing) we for
some reasons do not dump the stack in many places, e.g., in assertions.
Probably at early days we had too many of them and disabled this to make the
development easier, but then never enabled. Nowadays I sometimes observe
assertion failures during power cut testing, but the useful stackdump is not
printed, which is bad. This patch makes UBIFS always print the stackdump when
debugging is enabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.h |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 8934c12..f3e235f 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -107,10 +107,7 @@ struct ubifs_debug_info {
 	}                                                                      \
 } while (0)
 
-#define dbg_dump_stack() do {                                                  \
-	if (!dbg_failure_mode)                                                 \
-		dump_stack();                                                  \
-} while (0)
+#define dbg_dump_stack() dump_stack()
 
 /* Generic debugging messages */
 #define dbg_msg(fmt, ...) do {                                                 \
-- 
1.7.2.3
