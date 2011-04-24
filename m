Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDw5P-0001a2-Es
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 09:58:40 +0000
Received: from eru.research.nokia.com ([172.21.24.121])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3O9waqE017856
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 12:58:36 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: do not change debugfs file position
Date: Sun, 24 Apr 2011 13:02:17 +0300
Message-Id: <1303639337-15836-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch is a tiny improvement which removes few bytes of code.
UBIFS debugfs files are non-seekable and the file position is ignored,
so do not increase it in the write handler.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index ba4d795..d64cd21 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2822,7 +2822,6 @@ static ssize_t write_debugfs_file(struct file *file, const char __user *buf,
 	} else
 		return -EINVAL;
 
-	*ppos += count;
 	return count;
 }
 
-- 
1.7.4.2
