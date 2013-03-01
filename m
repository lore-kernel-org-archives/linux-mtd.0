Received: from mail-ee0-f46.google.com ([74.125.83.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBUqL-0002EB-S2
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 18:38:06 +0000
Received: by mail-ee0-f46.google.com with SMTP id e49so2669067eek.33
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 10:38:03 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] integck.c: Fix buffer overflow in save_file,
 avoid possible failure to write buffers when the filename length is
 equal to max_name_len
Date: Fri,  1 Mar 2013 19:37:39 +0100
Message-Id: <1362163060-5629-4-git-send-email-eliedebrauwer@gmail.com>
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
 tests/fs-tests/integrity/integck.c |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 5ea3642..ee37a0d 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -32,11 +32,11 @@
 #include <assert.h>
 #include <mntent.h>
 #include <execinfo.h>
+#include <bits/stdio_lim.h>
 #include <sys/mman.h>
 #include <sys/vfs.h>
 #include <sys/mount.h>
 #include <sys/statvfs.h>
-#include <linux/fs.h>
 
 #define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME "integck"
@@ -1433,12 +1433,17 @@ static void save_file(int fd, struct file_info *file)
 	int w_fd;
 	struct write_info *w;
 	char buf[IO_BUFFER_SIZE];
-	char name[256];
+	char name[FILENAME_MAX];
+        const char * read_suffix = ".integ.sav.read";
+        const char * write_suffix = ".integ.sav.written";
+        size_t fname_len = strlen(get_file_name(file));
 
 	/* Open file to save contents to */
 	strcpy(name, "/tmp/");
-	strcat(name, get_file_name(file));
-	strcat(name, ".integ.sav.read");
+	if (fname_len + strlen(read_suffix) > fsinfo.max_name_len)
+		fname_len = fsinfo.max_name_len - strlen(read_suffix);
+	strncat(name, get_file_name(file), fname_len);
+	strcat(name, read_suffix);
 	normsg("Saving %sn", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
 	CHECK(w_fd != -1);
@@ -1457,8 +1462,10 @@ static void save_file(int fd, struct file_info *file)
 
 	/* Open file to save contents to */
 	strcpy(name, "/tmp/");
-	strcat(name, get_file_name(file));
-	strcat(name, ".integ.sav.written");
+	if (fname_len + strlen(write_suffix) > fsinfo.max_name_len)
+		fname_len = fsinfo.max_name_len - strlen(write_suffix);
+	strncat(name, get_file_name(file), fname_len);
+	strcat(name, write_suffix);
 	normsg("Saving %s", name);
 	w_fd = open(name, O_CREAT | O_WRONLY, 0777);
 	CHECK(w_fd != -1);
-- 
1.7.10.4
