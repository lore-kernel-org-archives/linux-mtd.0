Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoFyL-0008Rx-7c
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 12:20:34 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n8HCJbn6008066
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2009 07:19:39 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH 1/5] UBIFS: define journal head numbers in ubifs-media.h
Date: Thu, 17 Sep 2009 15:19:52 +0300
Message-Id: <1253189996-14191-2-git-send-email-dedekind@infradead.org>
In-Reply-To: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
References: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The journal head names and numbers are part of the UBIFS format, so
they should be in the ubifs-media.h.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/ubifs-media.h |    7 +++++++
 fs/ubifs/ubifs.h       |   10 ++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index 3eee07e..191ca78 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -135,6 +135,13 @@
 /* The key is always at the same position in all keyed nodes */
 #define UBIFS_KEY_OFFSET offsetof(struct ubifs_ino_node, key)
 
+/* Garbage collector journal head number */
+#define UBIFS_GC_HEAD   0
+/* Base journal head number */
+#define UBIFS_BASE_HEAD 1
+/* Data journal head number */
+#define UBIFS_DATA_HEAD 2
+
 /*
  * LEB Properties Tree node types.
  *
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 9782e7c..8ca441f 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -105,12 +105,10 @@
 /* Number of non-data journal heads */
 #define NONDATA_JHEADS_CNT 2
 
-/* Garbage collector head */
-#define GCHD   0
-/* Base journal head number */
-#define BASEHD 1
-/* First "general purpose" journal head */
-#define DATAHD 2
+/* Shorter names for journal head numbers for internal usage */
+#define GCHD   UBIFS_GC_HEAD
+#define BASEHD UBIFS_BASE_HEAD
+#define DATAHD UBIFS_DATA_HEAD
 
 /* 'No change' value for 'ubifs_change_lp()' */
 #define LPROPS_NC 0x80000001
-- 
1.6.2.5
