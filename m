Received: from codepoet.org ([166.70.14.212] helo=winder.codepoet.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15d6Fa-0001hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Sep 2001 09:35:34 +0100
Date: Sat, 1 Sep 2001 02:41:34 -0600
From: Erik Andersen <andersen@codepoet.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 device table support
Message-ID: <20010901024134.A25280@codepoet.org>
Reply-To: andersen@codepoet.org
References: <20010830030712.A15950@codepoet.org> <20010830022725.A15819@codepoet.org> <6952.999162191@redhat.com> <20578.999166288@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20578.999166288@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu Aug 30, 2001 at 11:11:28AM +0100, David Woodhouse wrote:
> 
> andersen@codepoet.org said:
> >  But the device tables _do_ allow you to set permissions.  :-) 
> 
> So you don't need root at all?

Thats that plan -- I'll have an updated device table mkfs.jffs2 
patch to you over the weekend.  Meanwhile, I've fixed up jffs2reader 
so that it actually works, so that it default to listing the contents
of the whole fs when given no flags, and so its directory listings now
mimic the behavior of 'ls -l', i.e.:

[andersen@sage util]$ ./jffs2reader ~/buildroot/image.jffs2 -d /etc 
-rw-r--r-- 1    1000     1000          270 Aug 31 00:00 /etc/fstab 
lrwxrwxrwx 1    1000     1000           12 Aug 31 00:00 /etc/mtab@
-rw-r--r-- 1    1000     1000          243 Aug 31 00:00 /etc/group 
-rw-r--r-- 1    1000     1000          390 Aug 31 00:00 /etc/passwd 
-rw-r--r-- 1    1000     1000          293 Aug 31 00:00 /etc/shadow 
-rw-r--r-- 1    1000     1000          914 Aug 31 00:00 /etc/inittab 
drwxr-sr-x 1    1000     1000            0 Aug 31 00:00 /etc/init.d/
-rw-r--r-- 1    1000     1000          124 Aug 31 00:00 /etc/profile 
-rw-r--r-- 1    1000     1000         4096 Aug 31 00:00 /etc/services 
-rw-r--r-- 1    1000     1000           64 Aug 31 00:00 /etc/securetty 
-rw-r--r-- 1    1000     1000           36 Aug 31 00:00 /etc/resolv.conf 


[andersen@sage util]$ ./jffs2reader ~/buildroot/image.jffs2 -d /etc -r
-rw-r--r-- 1    1000     1000          270 Aug 31 00:00 /etc/fstab 
lrwxrwxrwx 1    1000     1000           12 Aug 31 00:00 /etc/mtab@
-rw-r--r-- 1    1000     1000          243 Aug 31 00:00 /etc/group 
-rw-r--r-- 1    1000     1000          390 Aug 31 00:00 /etc/passwd 
-rw-r--r-- 1    1000     1000          293 Aug 31 00:00 /etc/shadow 
-rw-r--r-- 1    1000     1000          914 Aug 31 00:00 /etc/inittab 
drwxr-sr-x 1    1000     1000            0 Aug 31 00:00 /etc/init.d/
-rwxr-xr-x 1    1000     1000           36 Aug 31 00:00 /etc/init.d/S50hostname 
-rwxr-xr-x 1    1000     1000          892 Aug 31 00:00 /etc/init.d/S05ramdisk1 
-rwxr-xr-x 1    1000     1000           97 Aug 31 00:00 /etc/init.d/S20syslogd 
-rwxr-xr-x 1    1000     1000          122 Aug 31 00:00 /etc/init.d/S15modules 
-rwxr-xr-x 1    1000     1000          231 Aug 31 00:00 /etc/init.d/S01mount 
-rwxr-xr-x 1    1000     1000          408 Aug 31 00:00 /etc/init.d/rcS 
-rw-r--r-- 1    1000     1000          124 Aug 31 00:00 /etc/profile 
-rw-r--r-- 1    1000     1000         4096 Aug 31 00:00 /etc/services 
-rw-r--r-- 1    1000     1000           64 Aug 31 00:00 /etc/securetty 
-rw-r--r-- 1    1000     1000           36 Aug 31 00:00 /etc/resolv.conf 

This was needed to allow me to easily find and fix the bugs with my device
table patch for mkfs.jffs2.  Seems like it should be generally useful.
Patch is attached,

 -Erik

--
Erik B. Andersen   email:  andersee@debian.org, andersen@lineo.com
--This message was written using 73% post-consumer electrons--

--u3/rZRmxL6MmkK24
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="patch.jffs2reader.c"

Index: jffs2reader.c
===================================================================
RCS file: /home/cvs/mtd/util/jffs2reader.c,v
retrieving revision 1.1
diff -u -r1.1 jffs2reader.c
--- jffs2reader.c	2001/04/04 09:29:07	1.1
+++ jffs2reader.c	2001/09/01 08:37:19
@@ -1,49 +1,49 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/param.h>
-
-#include <sys/dirent.h>
-
-#include <zlib.h>
-
-#include "jffs2.h"
-
-#define SCRATCH_SIZE (5*1024*1024)
-
-/* jffs2reader v0.0.18 */
-
-/* $Id: jffs2reader.c,v 1.1 2001/04/04 09:29:07 dwmw2 Exp $ */
-
-/* simple jffs2 image reader */
-
-/*
-  Copyright (c) 2001 Jari Kirma <Jari.Kirma@hut.fi>
-
-  This software is provided 'as-is', without any express or implied
-  warranty. In no event will the author be held liable for any damages
-  arising from the use of this software.
-
-  Permission is granted to anyone to use this software for any
-  purpose, including commercial applications, and to alter it and
-  redistribute it freely, subject to the following restrictions:
-
-  1. The origin of this software must not be misrepresented; you must
-  not claim that you wrote the original software. If you use this
-  software in a product, an acknowledgment in the product
-  documentation would be appreciated but is not required.
-
-  2. Altered source versions must be plainly marked as such, and must
-  not be misrepresented as being the original software.
-
-  3. This notice may not be removed or altered from any source
-  distribution.
+/* vi: set sw=4 ts=4: */
+/* 
+ * jffs2reader v0.0.18 A jffs2 image reader 
+ *
+ * Copyright (c) 2001 Jari Kirma <Jari.Kirma@hut.fi>
+ * 
+ * This software is provided 'as-is', without any express or implied
+ * warranty. In no event will the author be held liable for any damages
+ * arising from the use of this software.
+ * 
+ * Permission is granted to anyone to use this software for any
+ * purpose, including commercial applications, and to alter it and
+ * redistribute it freely, subject to the following restrictions:
+ * 
+ * 1. The origin of this software must not be misrepresented; you must
+ * not claim that you wrote the original software. If you use this
+ * software in a product, an acknowledgment in the product
+ * documentation would be appreciated but is not required.
+ * 
+ * 2. Altered source versions must be plainly marked as such, and must
+ * not be misrepresented as being the original software.
+ * 
+ * 3. This notice may not be removed or altered from any source
+ * distribution.
+ *
+ *
+ *********
+ *  This code was altered September 2001 
+ *  Changes are Copyright (c) Erik Andersen <andersee@debian.org>
+ *
+ * In compliance with (2) above, this is hereby marked as an altered
+ * version of this software.  It has been altered as follows:
+ *      *) Listing a directory now mimics the behavior of 'ls -l'
+ *      *) Support for recursive listing has been added
+ *      *) Without options, does a recursive 'ls' on the whole filesystem
+ *      *) option parsing now uses getopt()
+ *      *) Now uses printf, and error messages go to stderr.
+ *      *) The copyright notice has been cleaned up and reformatted
+ *      *) The code has been reformatted
+ *      *) Several twisty code paths have been fixes so I can understand them.
+ *  -Erik, 1 September 2001
+ *
+ * $Id: jffs2reader.c,v 1.1 2001/04/04 09:29:07 dwmw2 Exp $
 */
 
+
 /*
   TODO:
 
@@ -60,41 +60,53 @@
   - Doesn't check CRC checksums.
 */
 
-#define errmsg0(msg) write(1,&msg,sizeof(msg))
-#define errmsg1(msg) write(1,msg,sizeof(msg)-1)
 
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <time.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/param.h>
+#include <dirent.h>
+#include <zlib.h>
+#include <linux/jffs2.h>
+
+#define SCRATCH_SIZE (5*1024*1024)
+
+
 #define DIRENT_INO(dirent) ((dirent)!=NULL?(dirent)->ino:0)
 #define DIRENT_PINO(dirent) ((dirent)!=NULL?(dirent)->pino:0)
 
 struct dir {
-  struct dir *next;
-  __u8 type;
-  __u8 nsize;
-  char name[256];
-} ;
+	struct dir *next;
+	__u8 type;
+	__u8 nsize;
+	__u32 ino;
+	char name[256];
+};
 
 void putblock(char *, size_t, size_t *, struct jffs2_raw_inode *);
 struct dir *putdir(struct dir *, struct jffs2_raw_dirent *);
-void printdir(struct dir *);
+void printdir(char *o, size_t size, struct dir *d, char *path,
+			  int recurse);
 void freedir(struct dir *);
-
-struct dir *collectgen(int f, char *, size_t, __u32, struct dir *,
-		       char *, size_t, size_t *);
-struct dir *collectdir(char *, size_t, __u32, struct dir *);
-void collectfile(char *, size_t, __u32, char *, size_t, size_t *);
 
+struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, __u32 ino);
 struct jffs2_raw_dirent *resolvedirent(char *, size_t, __u32, __u32,
-				       char *, __u8);
-struct jffs2_raw_dirent *resolvename(char *, size_t, __u32, char *,
-				     __u8);
+									   char *, __u8);
+struct jffs2_raw_dirent *resolvename(char *, size_t, __u32, char *, __u8);
 struct jffs2_raw_dirent *resolveinode(char *, size_t, __u32);
 
 struct jffs2_raw_dirent *resolvepath0(char *, size_t, __u32, char *,
-				      __u32 *, int);
+									  __u32 *, int);
 struct jffs2_raw_dirent *resolvepath(char *, size_t, __u32, char *,
-				     __u32 *);
+									 __u32 *);
 
-void lsdir(char *, size_t, char *);
+void lsdir(char *, size_t, char *, int);
 void catfile(char *, size_t, char *, char *, size_t, size_t *);
 
 int main(int, char **);
@@ -109,46 +121,43 @@
   n       - node
 */
 
-void putblock(char *b, size_t bsize, size_t *rsize, struct jffs2_raw_inode *n)
+void putblock(char *b, size_t bsize, size_t * rsize,
+			  struct jffs2_raw_inode *n)
 {
-  uLongf dlen = n->dsize;
+	uLongf dlen = n->dsize;
 
-  if (n->isize > bsize ||
-      (n->offset + dlen) > bsize) {
-    errmsg1("File does not fit into buffer!\n");
-    
-    exit(1);
-  }
-
-  if (*rsize < n->isize)
-    bzero(b + *rsize, n->isize - *rsize);
-
-  switch(n->compr) {
-  case JFFS2_COMPR_ZLIB:
-    uncompress((Bytef *)b + n->offset, &dlen,
-	       (Bytef *)((char *)n) + sizeof(struct jffs2_raw_inode),
-	       (uLongf) n->csize);
-    break;
-
-  case JFFS2_COMPR_NONE:
-    memcpy(b + n->offset,
-	   ((char *)n) + sizeof(struct jffs2_raw_inode),
-	   dlen);
-    break;
-
-  case JFFS2_COMPR_ZERO:
-    bzero(b + n->offset, dlen);
-    break;
-
-    /* [DYN]RUBIN support required! */
+	if (n->isize > bsize || (n->offset + dlen) > bsize) {
+		fprintf(stderr, "File does not fit into buffer!\n");
+		exit(EXIT_FAILURE);
+	}
 
-  default:
-    errmsg1("Unsupported compression method!\n");
+	if (*rsize < n->isize)
+		bzero(b + *rsize, n->isize - *rsize);
 
-    exit(1);
-  }
+	switch (n->compr) {
+	case JFFS2_COMPR_ZLIB:
+		uncompress((Bytef *) b + n->offset, &dlen,
+				   (Bytef *) ((char *) n) + sizeof(struct jffs2_raw_inode),
+				   (uLongf) n->csize);
+		break;
+
+	case JFFS2_COMPR_NONE:
+		memcpy(b + n->offset,
+			   ((char *) n) + sizeof(struct jffs2_raw_inode), dlen);
+		break;
+
+	case JFFS2_COMPR_ZERO:
+		bzero(b + n->offset, dlen);
+		break;
+
+		/* [DYN]RUBIN support required! */
+
+	default:
+		fprintf(stderr, "Unsupported compression method!\n");
+		exit(EXIT_FAILURE);
+	}
 
-  *rsize = n->isize;
+	*rsize = n->isize;
 }
 
 /* adds/removes directory node into dir struct. */
@@ -163,66 +172,113 @@
 
 struct dir *putdir(struct dir *dd, struct jffs2_raw_dirent *n)
 {
-  struct dir *o, *d, *p;
+	struct dir *o, *d, *p;
+
+	o = dd;
 
-  o = dd;
+	if (n->ino) {
+		if (dd == NULL) {
+			d = malloc(sizeof(struct dir));
+			d->type = n->type;
+			memcpy(d->name, n->name, n->nsize);
+			d->nsize = n->nsize;
+			d->ino = n->ino;
+			d->next = NULL;
+
+			return d;
+		}
+
+		while (1) {
+			if (n->nsize == dd->nsize &&
+				!memcmp(n->name, dd->name, n->nsize)) {
+				dd->type = n->type;
+				dd->ino = n->ino;
+
+				return o;
+			}
+
+			if (dd->next == NULL) {
+				dd->next = malloc(sizeof(struct dir));
+				dd->next->type = n->type;
+				memcpy(dd->next->name, n->name, n->nsize);
+				dd->next->nsize = n->nsize;
+				dd->next->ino = n->ino;
+				dd->next->next = NULL;
+
+				return o;
+			}
+
+			dd = dd->next;
+		}
+	} else {
+		if (dd == NULL)
+			return NULL;
+
+		if (n->nsize == dd->nsize && !memcmp(n->name, dd->name, n->nsize)) {
+			d = dd->next;
+			free(dd);
+			return d;
+		}
+
+		while (1) {
+			p = dd;
+			dd = dd->next;
+
+			if (dd == NULL)
+				return o;
+
+			if (n->nsize == dd->nsize &&
+				!memcmp(n->name, dd->name, n->nsize)) {
+				p->next = dd->next;
+				free(dd);
+
+				return o;
+			}
+		}
+	}
+}
 
-  if (n->ino) {
-    if (dd == NULL) {
-      d = malloc(sizeof(struct dir));
-      d->type = n->type;
-      memcpy(d->name, n->name, n->nsize);
-      d->nsize = n->nsize;
-      d->next = NULL;
-
-      return d;
-    }
-
-    while (1) {
-      if (n->nsize == dd->nsize &&
-	  !memcmp(n->name, dd->name, n->nsize)) {
-	dd->type = n->type;
-
-	return o;
-      }
-
-      if (dd->next == NULL) {
-	dd->next = malloc(sizeof(struct dir));
-	dd->next->type = n->type;
-	memcpy(dd->next->name, n->name, n->nsize);
-	dd->next->nsize = n->nsize;
-	dd->next->next = NULL;
-
-	return o;
-      }
-
-      dd = dd->next;
-    }
-  } else {
-    if (dd == NULL) return NULL;
-
-    if (n->nsize == dd->nsize &&
-	!memcmp(n->name, dd->name, n->nsize)) {
-      d = dd->next;
-      free(dd);
-      return d;
-    }
-
-    while (1) {
-      p = dd;
-      dd = dd->next;
-
-      if (dd == NULL) return o;
-
-      if (n->nsize == dd->nsize &&
-	  !memcmp(n->name, dd->name, n->nsize)) {
-	p->next = dd->next;
-	free(dd);
-
-	return o;
-      }      
-    }
-  }
+
+#define TYPEINDEX(mode) (((mode) >> 12) & 0x0f)
+#define TYPECHAR(mode)  ("0pcCd?bB-?l?s???" [TYPEINDEX(mode)])
+
+/* The special bits. If set, display SMODE0/1 instead of MODE0/1 */
+static const mode_t SBIT[] = {
+	0, 0, S_ISUID,
+	0, 0, S_ISGID,
+	0, 0, S_ISVTX
+};
+
+/* The 9 mode bits to test */
+static const mode_t MBIT[] = {
+	S_IRUSR, S_IWUSR, S_IXUSR,
+	S_IRGRP, S_IWGRP, S_IXGRP,
+	S_IROTH, S_IWOTH, S_IXOTH
+};
+
+static const char MODE1[] = "rwxrwxrwx";
+static const char MODE0[] = "---------";
+static const char SMODE1[] = "..s..s..t";
+static const char SMODE0[] = "..S..S..T";
+
+/*
+ * Return the standard ls-like mode string from a file mode.
+ * This is static and so is overwritten on each call.
+ */
+const char *mode_string(int mode)
+{
+	static char buf[12];
+
+	int i;
+
+	buf[0] = TYPECHAR(mode);
+	for (i = 0; i < 9; i++) {
+		if (mode & SBIT[i])
+			buf[i + 1] = (mode & MBIT[i]) ? SMODE1[i] : SMODE0[i];
+		else
+			buf[i + 1] = (mode & MBIT[i]) ? MODE1[i] : MODE0[i];
+	}
+	return buf;
 }
 
 /* prints contents of directory structure */
@@ -231,52 +287,79 @@
   d       - dir struct
 */
 
-void printdir(struct dir *d)
+void printdir(char *o, size_t size, struct dir *d, char *path, int recurse)
 {
-  char m;
+	char m;
+	char *filetime;
+	time_t age;
+	struct jffs2_raw_inode *ri;
+
+	if (!path)
+		return;
+	if (strlen(path) == 1 && *path == '/')
+		path++;
+
+	while (d != NULL) {
+		switch (d->type) {
+		case DT_REG:
+			m = ' ';
+			break;
+
+		case DT_FIFO:
+			m = '|';
+			break;
+
+		case DT_CHR:
+			m = ' ';
+			break;
+
+		case DT_BLK:
+			m = ' ';
+			break;
+
+		case DT_DIR:
+			m = '/';
+			break;
+
+		case DT_LNK:
+			m = '@';
+			break;
+
+		case DT_SOCK:
+			m = '=';
+			break;
+
+		default:
+			m = '?';
+		}
+		ri = find_raw_inode(o, size, d->ino);
+
+		filetime = ctime((const time_t *) &(ri->ctime));
+		age = time(NULL) - ri->ctime;
+		printf("%s %-4d %-8d %-8d %8u %6.6s", mode_string(ri->mode),
+			   1, ri->uid, ri->gid, ri->dsize, filetime + 4);
+		d->name[d->nsize]='\0';
+		if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {
+			/* hh:mm if less than 6 months old */
+			printf(" %5.5s %s/%s%c\n", filetime + 11, path, d->name, m);
+		} else {
+			printf(" %4.4s %s/%s%c\n", filetime + 20, path, d->name, m);
+		}
+
+		if (d->type == DT_DIR && recurse) {
+			char *tmp;
+			tmp = malloc(BUFSIZ);
+			if (!tmp) {
+				fprintf(stderr, "memory exhausted\n");
+				exit(EXIT_FAILURE);
+			}
+			sprintf(tmp, "%s/%s", path, d->name);
+			lsdir(o, size, tmp, recurse);		/* Go recursive */
+			free(tmp);
+		}
 
-  while (d != NULL) {
-    write(1, d->name, d->nsize);
-    switch (d->type) {
-    case DT_REG:
-      m = ' ';
-      break;
-
-    case DT_FIFO:
-      m = '|';
-      break;
-
-    case DT_CHR:
-      m = '*';
-      break;
-
-    case DT_BLK:
-      m = '+';
-      break;
-
-    case DT_DIR:
-      m = '/';
-      break;
-
-    case DT_LNK:
-      m = '^';
-      break;
-
-    case DT_SOCK:
-      m = '@';
-      break;
-      
-    default:
-      m = '?';
-    }
-
-    errmsg0(m);
-    errmsg1(" ");
-
-    d = d->next;
-  }
-
-  errmsg1("\n");
+		d = d->next;
+	}
 }
 
 /* frees memory used by directory structure */
@@ -287,13 +370,13 @@
 
 void freedir(struct dir *d)
 {
-  struct dir *t;
+	struct dir *t;
 
-  while (d != NULL) {
-    t = d->next;
-    free(d);
-    d = t;
-  }
+	while (d != NULL) {
+		t = d->next;
+		free(d);
+		d = t;
+	}
 }
 
 /* collects directory/file nodes in version order. */
@@ -305,89 +388,66 @@
   o       - filesystem image pointer
   size    - size of filesystem image
   ino     - inode to compare against. see f.
-  d       - input directory structure, used if f=0
-  b       - file buffer, used if f=1
-  bsize   - file buffer size, used if f=1
-  rsize   - file result size, used if f=1
-
-  return value: result directory structure, replaces d. used if f=0
-*/
-
-struct dir *collectgen(int f, char *o, size_t size, __u32 ino,
-		       struct dir *d, char *b, size_t bsize,
-		       size_t *rsize)
-{
-  /* aligned! */
-  union jffs2_node_union *n;
-  union jffs2_node_union *e = (union jffs2_node_union *) (o + size);
-  union jffs2_node_union *lr; /* last block position */
-  union jffs2_node_union *mp = NULL; /* minimum position */
-
-  __u32 vmin, vmint, vmaxt, vmax, vcur, v;
-
-  vmin = 0; /* next to read */
-  vmax = ~((__u32)0); /* last to read */
-  vmint = ~((__u32)0);
-  vmaxt = 0; /* found maximum */
-  vcur = 0; /* XXX what is smallest version number used? */
-  /* too low version number can easily result excess log rereading */
-
-  n = (union jffs2_node_union *) o;
-  lr = n;
-
-  do {
-    while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK) ((char *)n) += 4;
-
-    if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-      if ((f && (n->u.nodetype == JFFS2_NODETYPE_INODE &&
-	  n->i.ino == ino &&
-	  (v = n->i.version) > vcur)) ||
-	  (!f && (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
-	  n->d.pino == ino &&
-	  (v = n->d.version) > vcur))) {
-	/* XXX crc check */
-
-	if (vmaxt < v) vmaxt = v;
-	if (vmint > v) {
-	  vmint = v;
-	  mp = n;
-	}
-
-	if (v == (vcur + 1)) {
-	  if (f)
-	    putblock(b, bsize, rsize, &(n->i));
-	  else
-	    d = putdir(d, &(n->d));
-
-	  lr = n;
-	  vcur++;
-	  vmint = ~((__u32)0);
-	}
-      }
-	
-      ((char *) n) += ((n->u.totlen + 3) & ~3);
-    } else
-      n = (union jffs2_node_union *) o; /* we're at the end, rewind to the beginning */
-
-    if (lr == n) { /* whole loop since last read */
-      vmax = vmaxt;
-      vmin = vmint;
-      vmint = ~((__u32)0);
-      
-      if (vcur < vmax && vcur < vmin) {
-	if (f)
-	  putblock(b, bsize, rsize, &(mp->i));
-	else
-	  d = putdir(d, &(mp->d));
-
-	lr = n = (union jffs2_node_union *) (((char *) mp) + ((mp->u.totlen + 3) & ~3));
-
-	vcur = vmin;
-      }
-    }
-  } while (vcur < vmax);
 
-  return d;
+  return value: a jffs2_raw_inode that corresponds the the specified
+    inode, or NULL
+*/
+
+struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, __u32 ino)
+{
+	/* aligned! */
+	union jffs2_node_union *n;
+	union jffs2_node_union *e = (union jffs2_node_union *) (o + size);
+	union jffs2_node_union *lr;	/* last block position */
+	union jffs2_node_union *mp = NULL;	/* minimum position */
+
+	__u32 vmin, vmint, vmaxt, vmax, vcur, v;
+
+	vmin = 0;					/* next to read */
+	vmax = ~((__u32) 0);		/* last to read */
+	vmint = ~((__u32) 0);
+	vmaxt = 0;					/* found maximum */
+	vcur = 0;					/* XXX what is smallest version number used? */
+	/* too low version number can easily result excess log rereading */
+
+	n = (union jffs2_node_union *) o;
+	lr = n;
+
+	do {
+		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
+			((char *) n) += 4;
+
+		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
+			if (n->u.nodetype == JFFS2_NODETYPE_INODE &&
+				n->i.ino == ino && (v = n->i.version) > vcur) {
+				/* XXX crc check */
+
+				if (vmaxt < v)
+					vmaxt = v;
+				if (vmint > v) {
+					vmint = v;
+					mp = n;
+				}
+
+				if (v == (vcur + 1))
+					return (&(n->i));
+			}
+
+			((char *) n) += ((n->u.totlen + 3) & ~3);
+		} else
+			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
+
+		if (lr == n) {			/* whole loop since last read */
+			vmax = vmaxt;
+			vmin = vmint;
+			vmint = ~((__u32) 0);
+
+			if (vcur < vmax && vcur < vmin)
+				return (&(mp->i));
+		}
+	} while (vcur < vmax);
+
+	return NULL;
 }
 
 /* collects dir struct for selected inode */
@@ -401,27 +461,76 @@
   return value: result directory structure, replaces d.
 */
 
-struct dir *collectdir(char *o, size_t size, __u32 pino, struct dir *d)
+struct dir *collectdir(char *o, size_t size, __u32 ino, struct dir *d)
 {
-  return collectgen(0, o, size, pino, d, NULL, 0, NULL);
-}
+	/* aligned! */
+	union jffs2_node_union *n;
+	union jffs2_node_union *e = (union jffs2_node_union *) (o + size);
+	union jffs2_node_union *lr;	/* last block position */
+	union jffs2_node_union *mp = NULL;	/* minimum position */
+
+	__u32 vmin, vmint, vmaxt, vmax, vcur, v;
+
+	vmin = 0;					/* next to read */
+	vmax = ~((__u32) 0);		/* last to read */
+	vmint = ~((__u32) 0);
+	vmaxt = 0;					/* found maximum */
+	vcur = 0;					/* XXX what is smallest version number used? */
+	/* too low version number can easily result excess log rereading */
+
+	n = (union jffs2_node_union *) o;
+	lr = n;
+
+	do {
+		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
+			((char *) n) += 4;
+
+		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
+			if (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
+					n->d.pino == ino && (v = n->d.version) > vcur) {
+				/* XXX crc check */
+
+				if (vmaxt < v)
+					vmaxt = v;
+				if (vmint > v) {
+					vmint = v;
+					mp = n;
+				}
+
+				if (v == (vcur + 1)) {
+					d = putdir(d, &(n->d));
+
+					lr = n;
+					vcur++;
+					vmint = ~((__u32) 0);
+				}
+			}
+
+			((char *) n) += ((n->u.totlen + 3) & ~3);
+		} else
+			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
+
+		if (lr == n) {			/* whole loop since last read */
+			vmax = vmaxt;
+			vmin = vmint;
+			vmint = ~((__u32) 0);
+
+			if (vcur < vmax && vcur < vmin) {
+				d = putdir(d, &(mp->d));
+
+				lr = n =
+					(union jffs2_node_union *) (((char *) mp) +
+												((mp->u.totlen + 3) & ~3));
+
+				vcur = vmin;
+			}
+		}
+	} while (vcur < vmax);
 
-/* collects file with selected inode to buffer */
+	return d;
+}
 
-/*
-  o       - filesystem image pointer
-  size    - size of filesystem image
-  ino     - inode of the specified file
-  b       - file buffer
-  bsize   - file buffer size
-  rsize   - file result size
-*/
 
-void collectfile(char *o, size_t size, __u32 ino, char *b,
-		 size_t bsize, size_t *rsize)
-{
-  collectgen(1, o, size, ino, NULL, b, bsize, rsize);
-}
 
 /* resolve dirent based on criteria */
 
@@ -441,46 +550,47 @@
 */
 
 struct jffs2_raw_dirent *resolvedirent(char *o, size_t size,
-				       __u32 ino, __u32 pino,
-				       char *name, __u8 nsize)
-
+									   __u32 ino, __u32 pino,
+									   char *name, __u8 nsize)
 {
-  /* aligned! */
-  union jffs2_node_union *n;
-  union jffs2_node_union *e = (union jffs2_node_union *) (o + size);
-
-  struct jffs2_raw_dirent *dd = NULL;
-
-  __u32 vmax, v;
-
-  if (!pino && ino <= 1) return dd;
-
-  vmax = 0;
-
-  n = (union jffs2_node_union *) o;
-
-  do {
-    while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK) ((char *)n) += 4;
-
-    if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
-      if (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
-	  (!ino || n->d.ino == ino) &&
-	  (v = n->d.version) > vmax &&
-	  (!pino || (n->d.pino == pino &&
-		     nsize == n->d.nsize &&
-		     !memcmp(name, n->d.name, nsize)))) {
-	/* XXX crc check */
-
-	if (vmax < v) {
-	  vmax = v;
-	  dd = &(n->d);
-	}
-      }
-	
-      ((char *) n) += ((n->u.totlen + 3) & ~3);
-    } else
-      return dd;
-  } while (1);
+	/* aligned! */
+	union jffs2_node_union *n;
+	union jffs2_node_union *e = (union jffs2_node_union *) (o + size);
+
+	struct jffs2_raw_dirent *dd = NULL;
+
+	__u32 vmax, v;
+
+	if (!pino && ino <= 1)
+		return dd;
+
+	vmax = 0;
+
+	n = (union jffs2_node_union *) o;
+
+	do {
+		while (n < e && n->u.magic != JFFS2_MAGIC_BITMASK)
+			((char *) n) += 4;
+
+		if (n < e && n->u.magic == JFFS2_MAGIC_BITMASK) {
+			if (n->u.nodetype == JFFS2_NODETYPE_DIRENT &&
+				(!ino || n->d.ino == ino) &&
+				(v = n->d.version) > vmax &&
+				(!pino || (n->d.pino == pino &&
+						   nsize == n->d.nsize &&
+						   !memcmp(name, n->d.name, nsize)))) {
+				/* XXX crc check */
+
+				if (vmax < v) {
+					vmax = v;
+					dd = &(n->d);
+				}
+			}
+
+			((char *) n) += ((n->u.totlen + 3) & ~3);
+		} else
+			return dd;
+	} while (1);
 }
 
 /* resolve name under certain parent inode to dirent */
@@ -497,9 +607,9 @@
 */
 
 struct jffs2_raw_dirent *resolvename(char *o, size_t size, __u32 pino,
-				     char *name, __u8 nsize)
+									 char *name, __u8 nsize)
 {
-  return resolvedirent(o, size, 0, pino, name, nsize);
+	return resolvedirent(o, size, 0, pino, name, nsize);
 }
 
 /* resolve inode to dirent */
@@ -515,7 +625,7 @@
 
 struct jffs2_raw_dirent *resolveinode(char *o, size_t size, __u32 ino)
 {
-  return resolvedirent(o, size, ino, 0, NULL, 0);
+	return resolvedirent(o, size, ino, 0, NULL, 0);
 }
 
 /* resolve slash-style path into dirent and inode.
@@ -537,97 +647,102 @@
 */
 
 struct jffs2_raw_dirent *resolvepath0(char *o, size_t size, __u32 ino,
-				      char *p, __u32 *inos, int recc)
+									  char *p, __u32 * inos, int recc)
 {
-  struct jffs2_raw_dirent *dir = NULL;
-
-  int d = 1;
-  __u32 tino;
+	struct jffs2_raw_dirent *dir = NULL;
 
-  char *next;
+	int d = 1;
+	__u32 tino;
 
-  char *path, *pp;
+	char *next;
 
-  char symbuf[1024];
-  size_t symsize;
+	char *path, *pp;
 
-  if (recc > 16) {
-    /* probably symlink loop */
-    *inos = 0;
-    return NULL;
-  }
+	char symbuf[1024];
+	size_t symsize;
 
-  pp = path = strdup(p);
-
-  if (*path == '/') {
-    path++;
-    ino = 1;
-  }
-
-  if (ino > 1) {
-    dir = resolveinode(o, size, ino);
-
-    ino = DIRENT_INO(dir);
-  }
-
-  next = path - 1;
-
-  while (ino && next != NULL && next[1] != 0 && d) {
-    path = next + 1;
-    next = strchr(path, '/');
-
-    if (next != NULL) *next = 0;
- 
-    if (*path == '.' && path[1] == 0) continue;
-    if (*path == '.' && path[1] == '.' && path[2] == 0) {
-      if (DIRENT_PINO(dir) == 1) {
-	ino = 1;
-	dir = NULL;
-      } else {
-	dir = resolveinode(o, size, DIRENT_PINO(dir));
-	ino = DIRENT_INO(dir);
-      }
-
-      continue;
-    }
-
-    dir = resolvename(o, size, ino, path, (__u8) strlen(path));
+	if (recc > 16) {
+		/* probably symlink loop */
+		*inos = 0;
+		return NULL;
+	}
 
-    if (DIRENT_INO(dir) == 0 ||
-	(next != NULL &&
-	 !(dir->type == DT_DIR || dir->type == DT_LNK))) {
-      free(pp);
+	pp = path = strdup(p);
 
-      *inos = 0;
+	if (*path == '/') {
+		path++;
+		ino = 1;
+	}
 
-      return NULL;
-    }
+	if (ino > 1) {
+		dir = resolveinode(o, size, ino);
 
-    if (dir->type == DT_LNK) {
-      collectfile(o, size, DIRENT_INO(dir), symbuf, sizeof(symbuf), &symsize);
-      symbuf[symsize] = 0;
+		ino = DIRENT_INO(dir);
+	}
 
-      tino = ino;
-      ino = 0;
+	next = path - 1;
 
-      dir = resolvepath0(o, size, tino, symbuf, &ino, ++recc);
+	while (ino && next != NULL && next[1] != 0 && d) {
+		path = next + 1;
+		next = strchr(path, '/');
+
+		if (next != NULL)
+			*next = 0;
+
+		if (*path == '.' && path[1] == 0)
+			continue;
+		if (*path == '.' && path[1] == '.' && path[2] == 0) {
+			if (DIRENT_PINO(dir) == 1) {
+				ino = 1;
+				dir = NULL;
+			} else {
+				dir = resolveinode(o, size, DIRENT_PINO(dir));
+				ino = DIRENT_INO(dir);
+			}
+
+			continue;
+		}
+
+		dir = resolvename(o, size, ino, path, (__u8) strlen(path));
+
+		if (DIRENT_INO(dir) == 0 ||
+			(next != NULL &&
+			 !(dir->type == DT_DIR || dir->type == DT_LNK))) {
+			free(pp);
+
+			*inos = 0;
+
+			return NULL;
+		}
+
+		if (dir->type == DT_LNK) {
+			struct jffs2_raw_inode *ri;
+			ri = find_raw_inode(o, size, DIRENT_INO(dir));
+			putblock(symbuf, sizeof(symbuf), &symsize, ri);
+			symbuf[symsize] = 0;
+
+			tino = ino;
+			ino = 0;
+
+			dir = resolvepath0(o, size, tino, symbuf, &ino, ++recc);
+
+			if (dir != NULL && next != NULL &&
+				!(dir->type == DT_DIR || dir->type == DT_LNK)) {
+				free(pp);
+
+				*inos = 0;
+				return NULL;
+			}
+		}
+		if (dir != NULL)
+			ino = DIRENT_INO(dir);
+	}
 
-      if (dir != NULL && next != NULL &&
-	  !(dir->type == DT_DIR || dir->type == DT_LNK)) {
 	free(pp);
-
-	*inos = 0;
-	return NULL;
-      }
-    }
-    if (dir != NULL) ino = DIRENT_INO(dir);
-  }
-
-  free(pp);
 
-  *inos = ino;
+	*inos = ino;
 
-  return dir;
+	return dir;
 }
 
 /* resolve slash-style path into dirent and inode.
@@ -648,9 +763,9 @@
 */
 
 struct jffs2_raw_dirent *resolvepath(char *o, size_t size, __u32 ino,
-				     char *p, __u32 *inos)
+									 char *p, __u32 * inos)
 {
-  return resolvepath0(o, size, ino, p, inos, 0);
+	return resolvepath0(o, size, ino, p, inos, 0);
 }
 
 /* lists files on directory specified by path */
@@ -661,25 +776,25 @@
   p       - path to be resolved
 */
 
-void lsdir(char *o, size_t size, char *path)
+void lsdir(char *o, size_t size, char *path, int recurse)
 {
-  struct jffs2_raw_dirent *dd;
-  struct dir *d = NULL;
+	struct jffs2_raw_dirent *dd;
+	struct dir *d = NULL;
 
-  __u32 ino;
+	__u32 ino;
 
-  dd = resolvepath(o, size, 1, path, &ino);
+	dd = resolvepath(o, size, 1, path, &ino);
 
-  if (ino == 0 ||
-      (dd == NULL && ino == 0) ||
-      (dd != NULL && dd->type != DT_DIR)) {
-    errmsg1("No such directory!\n");
-    return;
-  }
+	if (ino == 0 ||
+		(dd == NULL && ino == 0) || (dd != NULL && dd->type != DT_DIR)) {
+		fprintf(stderr, "jffs2reader: %s: No such file or directory\n",
+				path);
+		exit(EXIT_FAILURE);
+	}
 
-  d = collectdir(o, size, ino, d);
-  printdir(d);
-  freedir(d);
+	d = collectdir(o, size, ino, d);
+	printdir(o, size, d, path, recurse);
+	freedir(d);
 }
 
 /* writes file specified by path to the buffer */
@@ -694,86 +809,100 @@
 */
 
 void catfile(char *o, size_t size, char *path, char *b, size_t bsize,
-	     size_t *rsize)
+			 size_t * rsize)
 {
-  struct jffs2_raw_dirent *dd;
-  __u32 ino;
+	struct jffs2_raw_dirent *dd;
+	struct jffs2_raw_inode *ri;
+	__u32 ino;
 
-  dd = resolvepath(o, size, 1, path, &ino);
+	dd = resolvepath(o, size, 1, path, &ino);
 
-  if (ino == 0) {
-    errmsg1("No such file or directory!\n");
-    return;
-  }
+	if (ino == 0) {
+		fprintf(stderr, "%s: No such file or directory\n", path);
+		exit(EXIT_FAILURE);
+	}
 
-  if (dd == NULL || dd->type != DT_REG) {
-    errmsg1("Not a regular file!\n");
-    return;
-  }
+	if (dd == NULL || dd->type != DT_REG) {
+		fprintf(stderr, "%s: Not a regular file\n", path);
+		exit(EXIT_FAILURE);
+	}
 
-  collectfile(o, size, ino, b, bsize, rsize);
+	ri = find_raw_inode(o, size, ino);
+	putblock(b, bsize, rsize, ri);
 
-  write(1, b, *rsize);
+	write(1, b, *rsize);
 }
 
 /* usage example */
 
 int main(int argc, char **argv)
 {
-  int fd;
-  struct stat st;
-
-  char *scratch;
-  size_t ssize = 0;
-
-  char *buf;
+	int fd, opt, recurse = 0;
+	struct stat st;
 
-  if (argc != 4 || argv[2][0] != '-' || !(argv[2][1] == 'd' ||
-					  argv[2][1] == 'f')) {
-    errmsg1("Syntax: jffs2reader <image> [-d|-f] <path>\n");
-    return 1;
-  }
+	char *scratch, *dir = NULL, *file = NULL;
+	size_t ssize = 0;
 
-  fd = open(argv[1], O_RDONLY);
+	char *buf;
 
-  if (fd == -1) {
-    errmsg1("Opening image failed.\n");
-    return 2;
-  }
+	while ((opt = getopt(argc, argv, "rd:f:")) > 0) {
+		switch (opt) {
+		case 'd':
+			dir = optarg;
+			break;
+		case 'f':
+			file = optarg;
+			break;
+		case 'r':
+			recurse++;
+			break;
+		default:
+			fprintf(stderr,
+					"Usage: jffs2reader <image> [-d|-f] < path > \n");
+			exit(EXIT_FAILURE);
+		}
+	}
 
-  if (fstat(fd, &st)) {
-    errmsg1("Stat failed for image.\n");
-    return 3;
-  }
+	fd = open(argv[optind], O_RDONLY);
+	if (fd == -1) {
+		fprintf(stderr, "%s: %s\n", argv[optind], strerror(errno));
+		exit(2);
+	}
 
-  buf = malloc((size_t)st.st_size);
+	if (fstat(fd, &st)) {
+		fprintf(stderr, "%s: %s\n", argv[optind], strerror(errno));
+		exit(3);
+	}
 
-  if (buf == NULL) {
-    errmsg1("Malloc failed to allocate memory for image storage.\n");
-    return 4;
-  }
+	buf = malloc((size_t) st.st_size);
+	if (buf == NULL) {
+		fprintf(stderr, "%s: memory exhausted\n", argv[optind]);
+		exit(4);
+	}
 
-  if (read(fd, buf, st.st_size) != (ssize_t) st.st_size) {
-    errmsg1("Read failed to read image file.\n");
-    return 5;
-  }
+	if (read(fd, buf, st.st_size) != (ssize_t) st.st_size) {
+		fprintf(stderr, "%s: %s\n", argv[optind], strerror(errno));
+		exit(5);
+	}
 
-  if( argv[2][1] == 'd' )
-    lsdir(buf, st.st_size, argv[3]);
-  else {
-    scratch = malloc(SCRATCH_SIZE);
+	if (dir)
+		lsdir(buf, st.st_size, dir, recurse);
 
-    if (scratch == NULL) {
-      errmsg1("Malloc failed to allocate memory for scratchpad.\n");
-      return 4;
-    }
+	if (file) {
+		scratch = malloc(SCRATCH_SIZE);
+		if (scratch == NULL) {
+			fprintf(stderr, "%s: memory exhausted\n", argv[optind]);
+			exit(6);
+		}
 
-    catfile(buf, st.st_size, argv[3], scratch, SCRATCH_SIZE, &ssize);
+		catfile(buf, st.st_size, file, scratch, SCRATCH_SIZE, &ssize);
+		free(scratch);
+	}
 
-    free(scratch);
-  }
+	if (!dir && !file)
+		lsdir(buf, st.st_size, "/", 1);
 
-  free(buf);
 
-  return 0;
+	free(buf);
+	exit(EXIT_SUCCESS);
 }
Index: Makefile
===================================================================
RCS file: /home/cvs/mtd/util/Makefile,v
retrieving revision 1.19
diff -u -r1.19 Makefile
--- Makefile	2001/06/18 10:47:25	1.19
+++ Makefile	2001/09/01 08:37:19
@@ -7,7 +7,7 @@
 
 TARGETS = ftl_format erase eraseall nftldump nanddump doc_loadbios \
 nftl_format mkfs.jffs ftl_check nandtest nandwrite mkfs.jffs2 lock unlock \
-einfo mtd_debug fcp \
+einfo mtd_debug fcp jffs2reader
 
 SYMLINKS = crc32.h crc32.c compr_rtime.c compr_rubin.c compr.c pushpull.c pushpull.h histo_mips.h compr_rubin.h
 
@@ -28,4 +28,8 @@
 
 compr.o: compr.c
 	$(CC) $(CFLAGS) -Dprintk=printf -DKERN_NOTICE= -c -o $@ $<
+
+jffs2reader: jffs2reader.c
+	$(CC) $(CFLAGS) jffs2reader.c -o jffs2reader -lz 
+
 

--u3/rZRmxL6MmkK24--
