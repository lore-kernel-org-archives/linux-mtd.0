Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURx-00068W-Sz
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmsA009503
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:56 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 23/35] fs-tests: integck: teach file_unlink_file return an
	error
Date: Wed, 20 Apr 2011 13:18:56 +0300
Message-Id: <1303294748-5492-24-git-send-email-dedekind1@gmail.com>
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

Teach 'file_unlink_file()' return an error to the caller if the
file cannot be unlinked.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   18 +++++++-----------
 1 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 9ab417d..f99caae 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -652,14 +652,14 @@ static struct dir_entry_info *pick_entry(struct file_info *file)
 	return entry;
 }
 
-static void file_unlink_file(struct file_info *file)
+static int file_unlink_file(struct file_info *file)
 {
 	struct dir_entry_info *entry;
 
 	entry = pick_entry(file);
 	if (!entry)
-		return;
-	file_unlink(entry);
+		return 0;
+	return file_unlink(entry);
 }
 
 /*
@@ -1941,16 +1941,12 @@ static int operate_on_entry(struct dir_entry_info *entry)
 	}
 	if (entry->type == 'f') {
 		/* If shrinking, 1 time in 10, remove a file */
-		if (shrink && random_no(10) == 0) {
-			file_delete(entry->file);
-			return 0;
-		}
+		if (shrink && random_no(10) == 0)
+			return file_delete(entry->file);
 		/* If not growing, 1 time in 10, unlink a file with links > 1 */
 		if (!grow && entry->file->link_count > 1 &&
-		    random_no(10) == 0) {
-			file_unlink_file(entry->file);
-			return 0;
-		}
+		    random_no(10) == 0)
+			return file_unlink_file(entry->file);
 		operate_on_file(entry->file);
 	}
 	return 0;
-- 
1.7.2.3
