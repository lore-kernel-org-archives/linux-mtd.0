Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nM-0003P4-2p
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:15:55 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFo28018745
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/27] fs-tests: integck: srink file_info structure even more
Date: Wed, 13 Apr 2011 18:18:43 +0300
Message-Id: <1302707947-6143-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
References: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
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

The 'check_run_no' field does not have to be 64-bit, it can be
32-bit instead and we can save 4 bytes per object. Actually, it
could also be 16-bit, and we could make link_count 16-bit as well,
but that would need a bit more work.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f203e3a..0ff94c5 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -60,9 +60,9 @@ struct file_info /* Each file has one of these */
 	struct dir_entry_info *links;
 	off_t length;
 	int link_count;
+	unsigned int check_run_no; /* Run number used when checking */
 	unsigned int deleted:1; /* File has been deleted but is still open */
 	unsigned int no_space_error:1; /* File has incurred a ENOSPC error */
-	uint64_t check_run_no; /* Run number used when checking */
 };
 
 struct symlink_info /* Each symlink has one of these */
@@ -134,7 +134,7 @@ static int can_mmap = 0; /* Can write via mmap */
 
 static long mem_page_size; /* Page size for mmap */
 
-static uint64_t check_run_no;
+static unsigned int check_run_no;
 
 /*
  * Allocate a buffer of 'size' bytes and fill it with zeroes.
-- 
1.7.2.3
