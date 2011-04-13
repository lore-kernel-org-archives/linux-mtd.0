Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nM-0003P3-2l
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:15:53 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnRt018697
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/27] fs-tests: integck: shrink file_info structure size
Date: Wed, 13 Apr 2011 18:18:42 +0300
Message-Id: <1302707947-6143-3-git-send-email-dedekind1@gmail.com>
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

We do not have to store boolean flags in 'int' variables which
consume 4 bytes each, we can store those in bit-fields instead.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index c00e67e..f203e3a 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -58,10 +58,10 @@ struct file_info /* Each file has one of these */
 				/* Record in order all writes to the file */
 	struct fd_info *fds; /* All open file descriptors for this file */
 	struct dir_entry_info *links;
-	int link_count;
 	off_t length;
-	int deleted; /* File has been deleted but is still open */
-	int no_space_error; /* File has incurred a ENOSPC error */
+	int link_count;
+	unsigned int deleted:1; /* File has been deleted but is still open */
+	unsigned int no_space_error:1; /* File has incurred a ENOSPC error */
 	uint64_t check_run_no; /* Run number used when checking */
 };
 
-- 
1.7.2.3
