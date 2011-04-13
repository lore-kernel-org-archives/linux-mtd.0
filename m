Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nW-0003Uy-Lp
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnRv018697
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:16:01 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 27/27] fs-tests: integck: do not expect max name length to be
	256
Date: Wed, 13 Apr 2011 18:19:07 +0300
Message-Id: <1302707947-6143-28-git-send-email-dedekind1@gmail.com>
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

The 'make_name()' function assumes that the maxumum file name length
is 256 bytes, which is wrong. This patch fixes this.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   21 ++++++++++++++-------
 1 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 387874c..61fb12c 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -203,6 +203,11 @@ static uint64_t operation_count = 0; /* Number of operations used to fill
 static unsigned int check_run_no;
 
 /*
+ * A buffer which is used by 'make_name()' to return the generated random name.
+ */
+static char *random_name_buf;
+
+/*
  * Is this 'struct write_info' actually holds information about a truncation?
  */
 static int is_truncation(struct write_info *w)
@@ -1451,7 +1456,6 @@ static void close_open_files(void)
 
 static char *make_name(struct dir_info *dir)
 {
-	static char name[256];
 	struct dir_entry_info *entry;
 	int found;
 
@@ -1460,20 +1464,20 @@ static char *make_name(struct dir_info *dir)
 		if (random_no(5) == 1) {
 			int i, n = random_no(fsinfo.max_name_len) + 1;
 
-			CHECK(n > 0 && n < 256);
 			for (i = 0; i < n; i++)
-				name[i] = 'a' + random_no(26);
-			name[i] = '\0';
+				random_name_buf[i] = 'a' + random_no(26);
+			random_name_buf[i] = '\0';
 		} else
-			sprintf(name, "%u", random_no(1000000));
+			sprintf(random_name_buf, "%u", random_no(1000000));
 		for (entry = dir->first; entry; entry = entry->next) {
-			if (strcmp(entry->name, name) == 0) {
+			if (strcmp(entry->name, random_name_buf) == 0) {
 				found = 1;
 				break;
 			}
 		}
 	} while (found);
-	return name;
+
+	return random_name_buf;
 }
 
 static struct file_info *pick_file(void)
@@ -2417,6 +2421,9 @@ int main(int argc, char *argv[])
 	/* Seed the random generator with out PID */
 	srand(getpid());
 
+	random_name_buf = malloc(fsinfo.max_name_len + 1);
+	CHECK(random_name_buf != NULL);
+
 	/* Do the actual test */
 	ret = integck();
 	if (ret)
-- 
1.7.2.3
