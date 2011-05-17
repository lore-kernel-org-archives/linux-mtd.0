Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnQ-0004gA-4W
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:25 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWv006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:22 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/11] fs-tests: integck: verify clean files
Date: Tue, 17 May 2011 10:38:11 +0300
Message-Id: <1305617896-23711-7-git-send-email-dedekind1@gmail.com>
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

Allow verification for clean files, i.e. the files which had been fsync()'ed
before the emulated power cut happened.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 944ff3c..221bd49 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1481,7 +1481,8 @@ static void file_check_data(struct file_info *file, int fd,
 	char buf[IO_BUFFER_SIZE];
 	unsigned int seed = w->random_seed;
 
-	assert(!args.power_cut_mode);
+	if (args.power_cut_mode && !file->clean)
+		return;
 
 	for (r = 0; r < w->random_offset; ++r)
 		rand_r(&seed);
@@ -1517,7 +1518,11 @@ static void file_check(struct file_info *file, int fd)
 	struct dir_entry_info *entry;
 	struct stat st;
 
-	if (args.power_cut_mode)
+	/*
+	 * In case of power cut emulation testing check only clean files, i.e.
+	 * the files which have not been modified since last 'fsync()'.
+	 */
+	if (args.power_cut_mode && !file->clean)
 		return;
 
 	/* Do not check files that have errored */
-- 
1.7.2.3
