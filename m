Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURs-00065A-Ld
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:58 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmWt009496
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/35] fs-tests: integck: handle all failures in
	operate_on_open_file
Date: Wed, 20 Apr 2011 13:18:42 +0300
Message-Id: <1303294748-5492-10-git-send-email-dedekind1@gmail.com>
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

Make 'operate_on_open_file()' to handle possible 'fsync()' and 'fdatasync()'
errors by returning -1 up to the caller.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   27 +++++++++++++++++----------
 1 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 7ccbcb1..7348e14 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1947,26 +1947,33 @@ static int operate_on_dir(struct dir_info *dir)
  */
 static int operate_on_open_file(struct fd_info *fdi)
 {
+	int ret = 0;
 	unsigned int r = random_no(1000);
 
 	if (shrink && r < 5)
-		return file_truncate(fdi->file, fdi->fd);
+		ret = file_truncate(fdi->file, fdi->fd);
 	else if (r < 21)
 		file_close(fdi);
 	else if (shrink && r < 121 && !fdi->file->deleted)
-		return file_delete(fdi->file);
+		ret = file_delete(fdi->file);
 	else {
-		if (file_write(fdi->file, fdi->fd))
-			return -1;
-		if (r >= 999) {
-			if (random_no(100) >= 50)
-				CHECK(fsync(fdi->fd) == 0);
-			else
-				CHECK(fdatasync(fdi->fd) == 0);
+		ret = file_write(fdi->file, fdi->fd);
+		if (!ret && r >= 999) {
+			if (random_no(100) >= 50) {
+				ret = fsync(fdi->fd);
+				if (ret)
+					pcv("fsync failed for %s",
+					    fdi->file->name);
+			} else {
+				ret = fdatasync(fdi->fd);
+				if (ret)
+					pcv("fdatasync failed for %s",
+					    fdi->file->name);
+			}
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
1.7.2.3
