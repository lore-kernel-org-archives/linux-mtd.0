Received: from mgw-sa02.ext.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7mX5-0007dd-M9
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 10:01:34 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: [PATCH 2/2] UBIFS: add unstable pages problem description
Date: Mon, 18 Oct 2010 13:02:05 +0300
Message-Id: <1287396125-1890-1-git-send-email-dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Describe a problem reported by Matthieu CASTET which is currently
not handled by UBIFS.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index eed0fcf..e04d74a 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -32,6 +32,28 @@
  * larger is the journal, the more memory its index may consume.
  */
 
+/*
+ * Problem description: unstable pages after unclean power cut on NAND flashes.
+ *
+ * If a power cut happens when we have ongoing NAND page program, this page
+ * becomes unstable. The following situations are possible when we mount this
+ * flash next time and UBIFS reads the page.
+ *   o The page may look like it is empty, i.e., it contains only 0xFFs, but
+ *     we write data there, the data becomes corrupted. I.e., when the data are
+ *     read, we may get a ECC errors. Moreover, the page may be read with no
+ *     errors sometimes, with an ECC error next time, with a bit-flip next
+ *     time, etc.
+ *   o The page may have bit-flip, but when it is read next time, it may have
+ *     ECC errors or no errors at all.
+ *   o An UBIFS	node may have correct CRC, but when it is read next time, it
+ *     may have CRC error.
+ *
+ * IOW, these unstable pages are disaster. UBIFS has to handle them correctly:
+ * never write to them and never rely on their contents.
+ *
+ * TODO: handle this for buds, log, orphan area, and master area.
+ */
+
 #include "ubifs.h"
 
 /*
-- 
1.7.2.3
