Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nP-0003Qr-BR
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:00 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnDj018703
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:54 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/27] fs-tests: integck: move mem_page_size to fsinfo
Date: Wed, 13 Apr 2011 18:18:51 +0300
Message-Id: <1302707947-6143-12-git-send-email-dedekind1@gmail.com>
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

The fsinfo structure will aggregate all the information about the
tested file-system. Move 'mem_page_size' which we use for 'mmap()'
there as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 3ee20b2..e7a3547 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -55,10 +55,12 @@ static struct {
  * The below data structure describes the tested file-system.
  *
  * max_name_len: maximum file name length
+ * page_size: memory page size to use with 'mmap()'
  * fstype: file-system type (e.g., "ubifs")
  */
 static struct {
 	int max_name_len;
+	int page_size;
 	const char *fstype;
 } fsinfo;
 
@@ -163,8 +165,6 @@ static int check_nospc_files = 1; /* Also check data in files that incurred a
 
 static int can_mmap = 1; /* Can write via mmap */
 
-static long mem_page_size; /* Page size for mmap */
-
 static unsigned int check_run_no;
 
 /*
@@ -846,7 +846,7 @@ static void file_mmap_write(struct file_info *file)
 	for (i = 0; w && w->next && i < r; i++)
 		w = w->next;
 
-	offs = (w->offset / mem_page_size) * mem_page_size;
+	offs = (w->offset / fsinfo.page_size) * fsinfo.page_size;
 	len = w->size + (w->offset - offs);
 	if (len > 1 << 24)
 		len = 1 << 24;
@@ -1958,9 +1958,6 @@ static int integck(void)
 	uint64_t z;
 	char dir_name[256];
 
-	/* Get memory page size for mmap */
-	mem_page_size = sysconf(_SC_PAGE_SIZE);
-	CHECK(mem_page_size > 0);
 	/* Make our top directory */
 	pid = getpid();
 	normsg("pid is %u", (unsigned) pid);
@@ -2051,6 +2048,10 @@ static void get_tested_fs_info(void)
         fclose(f);
 
 	fsinfo.fstype = dup_string(mntent->mnt_type);
+
+	/* Get memory page size for 'mmap()' */
+	fsinfo.page_size = sysconf(_SC_PAGE_SIZE);
+	CHECK(fsinfo.page_size > 0);
 }
 
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-- 
1.7.2.3
