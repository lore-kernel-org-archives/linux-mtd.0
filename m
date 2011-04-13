Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nM-0003P2-2h
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:15:53 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnov018691
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:49 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/27] fs-tests: integck: shrink dir_entry_info structure size
Date: Wed, 13 Apr 2011 18:18:41 +0300
Message-Id: <1302707947-6143-2-git-send-email-dedekind1@gmail.com>
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

Turn "int checked" flag into 'char' flag to lessen memory
consumption a bit. Indeed, the test allocates a lot of these
data objects, so the size decrease from 36 to 32 bytes on
32-bit platforms is good to have.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 88def58..c00e67e 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -89,14 +89,14 @@ struct dir_entry_info /* Each entry in a directory has one of these */
 	struct dir_entry_info *prev_link; /* List of hard links for same file */
 	char *name;
 	struct dir_info *parent; /* Parent directory */
-	char type; /* f => file, d => dir, s => symlink */
-	int checked; /* Temporary flag used when checking */
 	union {
 		struct file_info *file;
 		struct dir_info *dir;
 		struct symlink_info *symlink;
 		void *target;
 	};
+	char type; /* f => file, d => dir, s => symlink */
+	char checked; /* Temporary flag used when checking */
 };
 
 struct fd_info /* We keep a number of files open */
-- 
1.7.2.3
