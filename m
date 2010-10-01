Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1j9a-0002V0-Al
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 17:12:15 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id C4C4C1B4205
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 17:12:12 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] libmtd: make malloc failures fatal
Date: Fri,  1 Oct 2010 13:13:10 -0400
Message-Id: <1285953190-19669-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This converts libmtd to the common xalloc helpers and in doing so, makes
memory allocation failures fatal rather than returning an error to the
caller.  I think this is acceptable behavior.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 lib/libmtd.c        |   26 ++++++--------------------
 lib/libmtd_legacy.c |    8 +-------
 2 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 83ae812..e0c0934 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -48,14 +48,10 @@
 static char *mkpath(const char *path, const char *name)
 {
 	char *n;
-	int len1 = strlen(path);
-	int len2 = strlen(name);
+	size_t len1 = strlen(path);
+	size_t len2 = strlen(name);
 
-	n = malloc(len1 + len2 + 2);
-	if (!n) {
-		sys_errmsg("cannot allocate %d bytes", len1 + len2 + 2);
-		return NULL;
-	}
+	n = xmalloc(len1 + len2 + 2);
 
 	memcpy(n, path, len1);
 	if (n[len1 - 1] != '/')
@@ -556,9 +552,7 @@ libmtd_t libmtd_open(void)
 {
 	struct libmtd *lib;
 
-	lib = calloc(1, sizeof(struct libmtd));
-	if (!lib)
-		return NULL;
+	lib = xzalloc(sizeof(*lib));
 
 	lib->offs64_ioctls = OFFS64_IOCTLS_UNKNOWN;
 
@@ -917,11 +911,7 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 	normsg("run torture test for PEB %d", eb);
 	patt_count = ARRAY_SIZE(patterns);
 
-	buf = malloc(mtd->eb_size);
-	if (!buf) {
-		errmsg("cannot allocate %d bytes of memory", mtd->eb_size);
-		return -1;
-	}
+	buf = xmalloc(mtd->eb_size);
 
 	for (i = 0; i < patt_count; i++) {
 		err = mtd_erase(desc, mtd, fd, eb);
@@ -1240,11 +1230,7 @@ int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 		goto out_close;
 	}
 
-	buf = malloc(mtd->eb_size);
-	if (!buf) {
-		sys_errmsg("cannot allocate %d bytes of memory", mtd->eb_size);
-		goto out_close;
-	}
+	buf = xmalloc(mtd->eb_size);
 
 	while (written < len) {
 		int rd = 0;
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 3d129c1..7488275 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -75,12 +75,7 @@ static int proc_parse_start(struct proc_parse_info *pi)
 	if (fd == -1)
 		return -1;
 
-	pi->buf = malloc(PROC_MTD_MAX_LEN);
-	if (!pi->buf) {
-		sys_errmsg("cannot allocate %d bytes of memory",
-			   PROC_MTD_MAX_LEN);
-		goto out_close;
-	}
+	pi->buf = xmalloc(PROC_MTD_MAX_LEN);
 
 	ret = read(fd, pi->buf, PROC_MTD_MAX_LEN);
 	if (ret == -1) {
@@ -103,7 +98,6 @@ static int proc_parse_start(struct proc_parse_info *pi)
 
 out_free:
 	free(pi->buf);
-out_close:
 	close(fd);
 	return -1;
 }
-- 
1.7.3.1
