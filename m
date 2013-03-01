Received: from mail-ee0-f53.google.com ([74.125.83.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBUqK-0002CH-HD
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 18:38:05 +0000
Received: by mail-ee0-f53.google.com with SMTP id e53so2555413eek.12
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 10:38:02 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] integck.c: rework file_check_data to immediately dump the
 buffer containing the errors
Date: Fri,  1 Mar 2013 19:37:38 +0100
Message-Id: <1362163060-5629-3-git-send-email-eliedebrauwer@gmail.com>
In-Reply-To: <1362163060-5629-1-git-send-email-eliedebrauwer@gmail.com>
References: <1362163060-5629-1-git-send-email-eliedebrauwer@gmail.com>
Cc: eliedebrauwer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
---
 tests/fs-tests/integrity/integck.c |   36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 2c6ffea..5ea3642 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1502,7 +1502,8 @@ static void file_check_data(struct file_info *file, int fd,
 {
 	size_t remains, block, i;
 	off_t r;
-	char buf[IO_BUFFER_SIZE];
+	unsigned char read_buf[IO_BUFFER_SIZE];
+	unsigned char check_buf[IO_BUFFER_SIZE];
 	unsigned int seed = w->random_seed;
 
 	if (args.power_cut_mode && !file->clean)
@@ -1517,17 +1518,28 @@ static void file_check_data(struct file_info *file, int fd,
 			block = IO_BUFFER_SIZE;
 		else
 			block = remains;
-		CHECK(read(fd, buf, block) == block);
-		for (i = 0; i < block; ++i) {
-			char c = (char)rand_r(&seed);
-			if (buf[i] != c) {
-				errmsg("file_check_data failed at %zu checking "
-				       "data at %llu size %zu", w->size - remains + i,
-					(unsigned long long)w->offset, w->size);
-				file_info_display(file);
-				save_file(fd, file);
-			}
-			CHECK(buf[i] == c);
+		CHECK(read(fd, read_buf, block) == block);
+		for (i = 0; i < block; ++i)
+			check_buf[i] = (char)rand_r(&seed);
+
+		if (memcmp(check_buf, read_buf, block) != 0) {
+			errmsg("file_check_data failed, dumping "
+				"data at offset %llu size %zu",
+				(unsigned long long)w->offset, w->size);
+
+			fprintf (stderr, "Read data:\n");
+			for (r = 0; r < block; ++r)
+				fprintf(stderr, "%02x%c",
+					read_buf[r], ((r+1)%16)?' ':'\n');
+			fprintf(stderr, "\nExpected data:\n");
+			for (r = 0; r < block; ++r)
+				fprintf(stderr, "%02x%c",
+					check_buf[r], ((r+1)%16)?' ':'\n');
+			fprintf(stderr, " \n");
+
+			file_info_display(file);
+			save_file(fd, file);
+			CHECK(0);
 		}
 		remains -= block;
 	}
-- 
1.7.10.4
