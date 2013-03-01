Received: from mail-ee0-f52.google.com ([74.125.83.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBUqI-0002Bm-DK
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 18:38:02 +0000
Received: by mail-ee0-f52.google.com with SMTP id b15so2435659eek.25
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 10:38:00 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] integck.c: Only verify the operation after all
 datastructures have been updated
Date: Fri,  1 Mar 2013 19:37:37 +0100
Message-Id: <1362163060-5629-2-git-send-email-eliedebrauwer@gmail.com>
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
 tests/fs-tests/integrity/integck.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 087a18b..2c6ffea 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -960,9 +960,6 @@ static void file_write_info(struct file_info *file, int fd, off_t offset,
 	w->random_seed = seed;
 	file->raw_writes = w;
 
-	if (args.verify_ops && !args.power_cut_mode)
-		file_check_data(file, fd, new_write);
-
 	/* Insert it into file->writes */
 	inserted = 0;
 	end = offset + size;
@@ -1028,6 +1025,9 @@ static void file_write_info(struct file_info *file, int fd, off_t offset,
 	/* Update file length */
 	if (end > file->length)
 		file->length = end;
+
+	if (args.verify_ops && !args.power_cut_mode)
+		file_check_data(file, fd, new_write);
 }
 
 /* Randomly select offset and and size to write in a file */
-- 
1.7.10.4
