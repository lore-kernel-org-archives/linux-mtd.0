Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nM-0003P5-8e
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:15:55 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFoIT018754
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/27] fs-tests: integck: abuse random_offset field nicer
Date: Wed, 13 Apr 2011 18:18:44 +0300
Message-Id: <1302707947-6143-5-git-send-email-dedekind1@gmail.com>
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

Currently integck uses the 'random_offset' filed to store the new file
length sometimes, thus abusing this field. But we can do this nicer -
introduce an anonymous union and add 'new_length' filed which will be
used instead of 'random_offset' to make the code look nicer.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 0ff94c5..eff7274 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -44,7 +44,10 @@ struct write_info /* Record of random data written into a file */
 	off_t offset; /* Where in the file the data was written */
 	size_t size; /* Number of bytes written */
 	unsigned random_seed; /* Seed for rand() to create random data */
-	off_t random_offset; /* Call rand() this number of times first */
+	union {
+		off_t random_offset; /* Call rand() this number of times first */
+		off_t new_length; /* For truncation records new file length */
+	};
 	int trunc; /* Records a truncation (raw_writes only) */
 };
 
@@ -568,7 +571,7 @@ static void file_info_display(struct file_info *file)
 	while (w) {
 		if (w->trunc)
 			normsg("        Trunc from %u to %u",
-			       (unsigned) w->offset, (unsigned) w->random_offset);
+			       (unsigned) w->offset, (unsigned) w->new_length);
 		else
 			normsg("        Offset: %u  Size: %u  Seed: %u  R.Off: %u",
 			       (unsigned) w->offset, (unsigned) w->size,
@@ -920,7 +923,7 @@ static void file_truncate_info(struct file_info *file, size_t new_length)
 	w = zalloc(sizeof(struct write_info));
 	w->next = file->raw_writes;
 	w->offset = file->length;
-	w->random_offset = new_length; /* Abuse random_offset */
+	w->new_length = new_length;
 	w->trunc = 1;
 	file->raw_writes = w;
 	/* Update file length */
-- 
1.7.2.3
