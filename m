Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2k1D-00083m-EW
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 12:52:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2OCpxfn004177
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2011 14:52:00 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] fs-tests: integck: lessen memory consumption
Date: Thu, 24 Mar 2011 14:54:24 +0200
Message-Id: <1300971264-7352-1-git-send-email-dedekind1@gmail.com>
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

The integck test works as follows:
1. Performs many random operations and remembers what it did
   in small per-operatoin objects.
2. Unmounts the file-system, mounts it again, and checks that
   the contents of the file-system matches the stored in-memory
   information.

The information about write operations is stored in
'struct write_info' objects. We may end up with a huge amount
of them. This patch shrinks their size by re-arraging various
fields from 48 bytes to 40 bytes (on x86_64).

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 145557f..f763031 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -38,12 +38,12 @@
 
 struct write_info /* Record of random data written into a file */
 {
-	struct write_info *next;
 	off_t offset; /* Where in the file the data was written */
-	size_t size; /* Number of bytes written */
-	unsigned random_seed; /* Seed for rand() to create random data */
 	off_t random_offset; /* Call rand() this number of times first */
+	struct write_info *next;
+	unsigned random_seed; /* Seed for rand() to create random data */
 	int trunc; /* Records a truncation (raw_writes only) */
+	size_t size; /* Number of bytes written */
 };
 
 struct dir_entry_info;
-- 
1.7.2.3
