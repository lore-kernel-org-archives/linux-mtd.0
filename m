Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YPh-0006nQ-Mf
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:44:10 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 7CF611B4001
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:44:08 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: xalloc: simplify/unify error messages
Date: Fri,  1 Oct 2010 01:45:06 -0400
Message-Id: <1285911906-9672-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not sure that if we actually are out of memory that declaring the
failing allocation size is useful in the output.  So use the same
simple string in every error message to cut down on size (there will
only be one copy of this at runtime).  Size is a much more common
concern than handling OOM issues which most likely aren't the fault
of mtd-utils in the first place.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/xalloc.h |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/xalloc.h b/include/xalloc.h
index 35a94af..f1cc8d4 100644
--- a/include/xalloc.h
+++ b/include/xalloc.h
@@ -41,7 +41,7 @@ static void *xmalloc(size_t size)
 	void *ptr = malloc(size);
 
 	if (ptr == NULL && size != 0)
-		sys_errmsg_die("malloc(%zu) failed", size);
+		sys_errmsg_die("out of memory");
 	return ptr;
 }
 
@@ -51,7 +51,7 @@ static void *xcalloc(size_t nmemb, size_t size)
 	void *ptr = calloc(nmemb, size);
 
 	if (ptr == NULL && nmemb != 0 && size != 0)
-		sys_errmsg_die("calloc(%zu, %zu) failed", nmemb, size);
+		sys_errmsg_die("out of memory");
 	return ptr;
 }
 
@@ -66,7 +66,7 @@ static void *xrealloc(void *ptr, size_t size)
 {
 	ptr = realloc(ptr, size);
 	if (ptr == NULL && size != 0)
-		sys_errmsg_die("realloc(%p, %zu) failed", ptr, size);
+		sys_errmsg_die("out of memory");
 	return ptr;
 }
 
@@ -79,7 +79,7 @@ static char *xstrdup(const char *s)
 		return NULL;
 	t = strdup(s);
 	if (t == NULL)
-		sys_errmsg_die("strdup(%p) failed", s);
+		sys_errmsg_die("out of memory");
 	return t;
 }
 
@@ -97,7 +97,7 @@ static int xasprintf(char **strp, const char *fmt, ...)
 	va_end(ap);
 
 	if (cnt == -1)
-		sys_errmsg_die("asprintf(...) failed");
+		sys_errmsg_die("out of memory");
 
 	return cnt;
 }
-- 
1.7.3.1
