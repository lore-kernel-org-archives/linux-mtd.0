Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS3-00063G-5T
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmV0009491
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:16:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 32/35] fs-tests: integck: clean up add_dir_entry usage
Date: Wed, 20 Apr 2011 13:19:05 +0300
Message-Id: <1303294748-5492-33-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
References: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
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

Make 'add_dir_entry()' consistent and allocate name for all types,
not only for 'd' and 's'. Also, since 'add_dir_entry()' sets the
parent - do not do this in the calling functions.

This is a clean-up which makes 'add_dir_entry()' more consistent.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 94ffeb8..03b3a01 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -399,6 +399,7 @@ static void add_dir_entry(struct dir_info *parent, char type, const char *name,
 	if (entry->type == 'f') {
 		struct file_info *file = target;
 
+		file->name = dup_string(name);
 		entry->file = file;
 		entry->next_link = file->links;
 		if (file->links)
@@ -472,7 +473,6 @@ static int dir_new(struct dir_info *parent, const char *name)
 	free(path);
 
 	dir = zalloc(sizeof(struct dir_info));
-	dir->parent = parent;
 	if (parent)
 		add_dir_entry(parent, 'd', name, dir);
 	return 0;
@@ -545,8 +545,6 @@ static int file_new(struct dir_info *parent, const char *name)
 	free(path);
 
 	file = zalloc(sizeof(struct file_info));
-	file->name = dup_string(name);
-
 	add_dir_entry(parent, 'f', name, file);
 	add_fd(file, fd);
 	return 0;
-- 
1.7.2.3
