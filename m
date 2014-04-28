Received: from mail-yh0-f41.google.com ([209.85.213.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WelOv-0003aQ-O9
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 13:15:18 +0000
Received: by mail-yh0-f41.google.com with SMTP id i57so6074054yha.28
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 06:14:54 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] nandtest: Move the "read and compare" code to a function
Date: Mon, 28 Apr 2014 10:14:18 -0300
Message-Id: <1398690859-11494-3-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit makes no functionality change, and simply moves the
read and compare code into a separate read_and_compare() function.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 nandtest.c | 79 ++++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 36 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index fd78b95..31301d6 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -37,46 +37,11 @@ int fd;
 int markbad=0;
 int seed;
 
-int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
+void read_and_compare(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 {
-	struct erase_info_user er;
 	ssize_t len;
 	int i;
 
-	printf("\r%08x: erasing... ", (unsigned)ofs);
-	fflush(stdout);
-
-	er.start = ofs;
-	er.length = meminfo.erasesize;
-
-	if (ioctl(fd, MEMERASE, &er)) {
-		perror("MEMERASE");
-		if (markbad) {
-			printf("Mark block bad at %08lx\n", (long)ofs);
-			ioctl(fd, MEMSETBADBLOCK, &ofs);
-		}
-		return 1;
-	}
-
-	printf("\r%08x: writing...", (unsigned)ofs);
-	fflush(stdout);
-
-	len = pwrite(fd, data, meminfo.erasesize, ofs);
-	if (len < 0) {
-		printf("\n");
-		perror("write");
-		if (markbad) {
-			printf("Mark block bad at %08lx\n", (long)ofs);
-			ioctl(fd, MEMSETBADBLOCK, &ofs);
-		}
-		return 1;
-	}
-	if (len < meminfo.erasesize) {
-		printf("\n");
-		fprintf(stderr, "Short write (%zd bytes)\n", len);
-		exit(1);
-	}
-
 	printf("\r%08x: reading...", (unsigned)ofs);
 	fflush(stdout);
 
@@ -121,6 +86,48 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 		}
 		exit(1);
 	}
+}
+
+int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
+{
+	struct erase_info_user er;
+	ssize_t len;
+
+	printf("\r%08x: erasing... ", (unsigned)ofs);
+	fflush(stdout);
+
+	er.start = ofs;
+	er.length = meminfo.erasesize;
+
+	if (ioctl(fd, MEMERASE, &er)) {
+		perror("MEMERASE");
+		if (markbad) {
+			printf("Mark block bad at %08lx\n", (long)ofs);
+			ioctl(fd, MEMSETBADBLOCK, &ofs);
+		}
+		return 1;
+	}
+
+	printf("\r%08x: writing...", (unsigned)ofs);
+	fflush(stdout);
+
+	len = pwrite(fd, data, meminfo.erasesize, ofs);
+	if (len < 0) {
+		printf("\n");
+		perror("write");
+		if (markbad) {
+			printf("Mark block bad at %08lx\n", (long)ofs);
+			ioctl(fd, MEMSETBADBLOCK, &ofs);
+		}
+		return 1;
+	}
+	if (len < meminfo.erasesize) {
+		printf("\n");
+		fprintf(stderr, "Short write (%zd bytes)\n", len);
+		exit(1);
+	}
+
+	read_and_compare(ofs, data, rbuf);
 	return 0;
 }
 
-- 
1.9.1
