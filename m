Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnL-0004eQ-Ai
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:20 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWq006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:18 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/11] fs-tests: integck: introduce the clean flag
Date: Tue, 17 May 2011 10:38:06 +0300
Message-Id: <1305617896-23711-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Introduce per-file "clean" flag which tells whether the file is synchronized or
not. This flag is not really used so far.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index ac72c5b..9b98ef0 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -156,6 +156,7 @@ struct file_info /* Each file has one of these */
 	int link_count;
 	unsigned int check_run_no; /* Run number used when checking */
 	unsigned int no_space_error:1; /* File has incurred a ENOSPC error */
+	unsigned int clean:1; /* Non-zero if the file is synchronized */
 };
 
 struct symlink_info /* Each symlink has one of these */
@@ -1192,6 +1193,8 @@ static int file_write(struct file_info *file, int fd)
 {
 	int ret;
 
+	file->clean = 0;
+
 	if (!args.power_cut_mode && fsinfo.can_mmap && !full &&
 	    file->link_count && random_no(100) == 1) {
 		/*
@@ -1260,6 +1263,7 @@ static int file_write(struct file_info *file, int fd)
 				pcv("fdatasync failed for %s",
 				    file->links->name);
 		}
+		file->clean = 1;
 	}
 
 	return 0;
@@ -1295,7 +1299,7 @@ static int file_truncate(struct file_info *file, int fd)
 	int ret;
 	size_t new_length = random_no(file->length);
 
-
+	file->clean = 0;
 	ret = file_ftruncate(file, fd, new_length);
 	if (ret == -1)
 		return -1;
-- 
1.7.2.3
