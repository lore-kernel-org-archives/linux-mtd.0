Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QE1vj-0002zo-UH
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 16:13:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3OGD2pJ010549
	for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2011 19:13:02 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/5] fs-tests: integck: fix falures with SIGBUS
Date: Sun, 24 Apr 2011 19:16:18 +0300
Message-Id: <1303661778-13214-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
References: <1303661778-13214-1-git-send-email-dedekind1@gmail.com>
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

The test sometimes dies due to SIGBUS because a power cut event happens when
we are writing to an mmap()'ed area. SIGBUS is very difficult to ignore, so
fix the issue simply by avoiding doing 'mmap()' operations when in power cut
testing mode.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f1a2f84..bbbc7cb 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -213,7 +213,6 @@ static int full   = 0; /* Flag that the file system is full */
 static uint64_t operation_count = 0; /* Number of operations used to fill
                                         up the file system */
 static unsigned int check_run_no;
-
 static unsigned int random_seed;
 
 /*
@@ -1110,11 +1109,14 @@ static int file_mmap_write(struct file_info *file)
 	uint64_t free_space;
 	int fd;
 
+	assert(!args.power_cut_mode);
+
 	if (!file->links)
 		return 0;
 	get_fs_space(NULL, &free_space);
 	if (!free_space)
 		return 0;
+
 	/* Randomly pick a written area of the file */
 	if (!w)
 		return 0;
@@ -1191,8 +1193,20 @@ static int file_write(struct file_info *file, int fd)
 	unsigned int seed;
 	int ret, truncate = 0;
 
-	if (fsinfo.can_mmap && !full && file->link_count &&
-	    random_no(100) == 1)
+	/*
+	 * Do not do 'mmap()' operations if:
+	 * 1. we are in power cut testing mode, because an emulated power cut
+	 *    failure may cause SIGBUS when we are writing to the 'mmap()'ed
+	 *    area, and SIGBUS is not easy to ignore.
+	 * 2. When the file-system is full, because again, writing to the
+	 *    'mmap()'ed area may cause SIGBUS when the space allocation fails.
+	 *    This is not enough to guarantee we never get SIGBUS, though. For
+	 *    example, if we write a lot to a hole, this might require a lot of
+	 *    additional space, and we may fail here. But I do not know why we
+	 *    never observed this, probably this is just very unlikely.
+	 */
+	if (!args.power_cut_mode && fsinfo.can_mmap && !full &&
+	    file->link_count && random_no(100) == 1)
 		return file_mmap_write(file);
 
 	get_offset_and_size(file, &offset, &size);
-- 
1.7.2.3
