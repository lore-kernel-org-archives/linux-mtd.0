Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzA5d-0001Rb-VK
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 15:53:50 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2EFrld4030468
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2011 17:53:47 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH] UBIFS: clean-up commentaries
Date: Mon, 14 Mar 2011 17:56:38 +0200
Message-Id: <1300118198-12682-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Clean-up commentaries in debug.h and remove references to non-existing
symblols.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 4efbba7..919f0de 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -171,7 +171,7 @@ const char *dbg_key_str1(const struct ubifs_info *c,
 #define dbg_rcvry(fmt, ...) dbg_do_msg(UBIFS_MSG_RCVRY, fmt, ##__VA_ARGS__)
 
 /*
- * Debugging message type flags (must match msg_type_names in debug.c).
+ * Debugging message type flags.
  *
  * UBIFS_MSG_GEN: general messages
  * UBIFS_MSG_JNL: journal messages
@@ -204,7 +204,7 @@ enum {
 };
 
 /*
- * Debugging check flags (must match chk_names in debug.c).
+ * Debugging check flags.
  *
  * UBIFS_CHK_GEN: general checks
  * UBIFS_CHK_TNC: check TNC
@@ -225,7 +225,7 @@ enum {
 };
 
 /*
- * Special testing flags (must match tst_names in debug.c).
+ * Special testing flags.
  *
  * UBIFS_TST_FORCE_IN_THE_GAPS: force the use of in-the-gaps method
  * UBIFS_TST_RCVRY: failure mode for recovery testing
-- 
1.7.2.3
