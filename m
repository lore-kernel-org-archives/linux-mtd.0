Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nQ-0003Ra-TI
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnDl018703
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:55 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/27] fs-tests: integck: move log10_initial_free to fsinfo
Date: Wed, 13 Apr 2011 18:18:54 +0300
Message-Id: <1302707947-6143-15-git-send-email-dedekind1@gmail.com>
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

Similarly to the previous patches, move the log10_initial_free variable
to the fsinfo data structure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   19 ++++++++-----------
 1 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index bfedeb2..910f22a 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -57,6 +57,8 @@ static struct {
  *
  * max_name_len: maximum file name length
  * page_size: memory page size to use with 'mmap()'
+ * log10_initial_free: logarighm base 10 of the initial amount of free space in
+ *                     the tested file-system
  * nospc_size_ok: file size is updated even if the write operation failed with
  *                ENOSPC error
  * can_mmap: file-system supports share writable 'mmap()' operation
@@ -65,6 +67,7 @@ static struct {
 static struct {
 	int max_name_len;
 	int page_size;
+	unsigned int log10_initial_free;
 	unsigned int nospc_size_ok:1;
 	unsigned int can_mmap:1;
 	const char *fstype;
@@ -165,10 +168,6 @@ static int shrink = 0; /* Should we try to shrink files and directories */
 static int full   = 0; /* Flag that the file system is full */
 static uint64_t operation_count = 0; /* Number of operations used to fill
                                         up the file system */
-static uint64_t initial_free_space = 0; /* Free space on file system when
-					   test starts */
-static unsigned log10_initial_free_space = 0; /* log10 of initial_free_space */
-
 static unsigned int check_run_no;
 
 /*
@@ -804,9 +803,9 @@ static void get_offset_and_size(struct file_info *file,
 		*offset = file->length;
 	/* Distribute the size logarithmically */
 	if (tests_random_no(1000) == 0)
-		r = tests_random_no(log10_initial_free_space + 2);
+		r = tests_random_no(fsinfo.log10_initial_free + 2);
 	else
-		r = tests_random_no(log10_initial_free_space);
+		r = tests_random_no(fsinfo.log10_initial_free);
 	n = 1;
 	while (r--)
 		n *= 10;
@@ -1971,7 +1970,6 @@ static int integck(void)
 {
 	pid_t pid;
 	int64_t rpt;
-	uint64_t z;
 	char dir_name[256];
 
 	/* Make our top directory */
@@ -1984,10 +1982,6 @@ static int integck(void)
 		CHECK(chdir("..") != -1);
 		CHECK(rmdir(dir_name) != -1);
 	}
-	initial_free_space = get_free_space();
-	log10_initial_free_space = 0;
-	for (z = initial_free_space; z >= 10; z /= 10)
-		++log10_initial_free_space;
 	top_dir = dir_new(NULL, dir_name);
 
 	if (!top_dir)
@@ -2038,6 +2032,7 @@ static void get_tested_fs_info(void)
 	struct mntent *mntent;
 	const char *mp;
         FILE *f;
+	uint64_t z;
 
 	CHECK(statfs(args.mount_point, &fs_info) == 0);
 
@@ -2078,6 +2073,8 @@ static void get_tested_fs_info(void)
 		fsinfo.can_mmap = 0;
 	}
 
+	for (z = get_free_space(); z >= 10; z /= 10)
+		fsinfo.log10_initial_free += 1;
 }
 
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-- 
1.7.2.3
