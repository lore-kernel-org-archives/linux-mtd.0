Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTpd7-0002S7-QY
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:19:10 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 1CD121B4020
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 06:19:07 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] libmtd: use O_CLOEXEC
Date: Tue,  7 Jun 2011 02:19:05 -0400
Message-Id: <1307427548-29306-3-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not strictly necessary, but this is good library behavior and
should carry no runtime overhead.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/common.h |    5 +++++
 lib/libmtd.c     |   10 +++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/common.h b/include/common.h
index c37660c..7ea282c 100644
--- a/include/common.h
+++ b/include/common.h
@@ -23,6 +23,7 @@
 #include <stdlib.h>
 #include <ctype.h>
 #include <string.h>
+#include <fcntl.h>
 #include <errno.h>
 
 #ifndef PROGRAM_NAME
@@ -42,6 +43,10 @@ extern "C" {
 #define min(a, b) MIN(a, b) /* glue for linux kernel source */
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
 
+#ifndef O_CLOEXEC
+#define O_CLOEXEC 0
+#endif
+
 /* Verbose messages */
 #define bareverbose(verbose, fmt, ...) do {                        \
 	if (verbose)                                               \
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 7fabd80..a651808 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -77,7 +77,7 @@ static int read_data(const char *file, void *buf, int buf_len)
 {
 	int fd, rd, tmp, tmp1;
 
-	fd = open(file, O_RDONLY);
+	fd = open(file, O_RDONLY | O_CLOEXEC);
 	if (fd == -1)
 		return -1;
 
@@ -201,7 +201,7 @@ static int read_hex_ll(const char *file, long long *value)
 	int fd, rd;
 	char buf[50];
 
-	fd = open(file, O_RDONLY);
+	fd = open(file, O_RDONLY | O_CLOEXEC);
 	if (fd == -1)
 		return -1;
 
@@ -253,7 +253,7 @@ static int read_pos_ll(const char *file, long long *value)
 	int fd, rd;
 	char buf[50];
 
-	fd = open(file, O_RDONLY);
+	fd = open(file, O_RDONLY | O_CLOEXEC);
 	if (fd == -1)
 		return -1;
 
@@ -538,7 +538,7 @@ static int sysfs_is_supported(struct libmtd *lib)
 		return 0;
 
 	sprintf(file, lib->mtd_name, num);
-	fd = open(file, O_RDONLY);
+	fd = open(file, O_RDONLY | O_CLOEXEC);
 	if (fd == -1)
 		return 0;
 
@@ -1193,7 +1193,7 @@ int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 		return -1;
 	}
 
-	in_fd = open(img_name, O_RDONLY);
+	in_fd = open(img_name, O_RDONLY | O_CLOEXEC);
 	if (in_fd == -1)
 		return sys_errmsg("cannot open \"%s\"", img_name);
 
-- 
1.7.5.3
