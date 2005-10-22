Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ETC0l-0000nN-D1
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2005 01:33:47 -0400
Received: by zproxy.gmail.com with SMTP id 14so592112nzn
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Oct 2005 22:33:39 -0700 (PDT)
Date: Sat, 22 Oct 2005 14:33:23 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <b1c6420f0510142013q68d95bfak59086ca9a1887240@mail.gmail.com>
References: <b1c6420f0510142013q68d95bfak59086ca9a1887240@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <4359cf33.4d2108c5.1cab.ffff918e@mx.gmail.com>
Subject: Re: [PATCH 3/4] util/jffs2reader catfile fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 15 Oct 2005 12:13:29 +0900, I wrote:
> This is another bug fix for util/jffs2reader.c.
> 
> Please review and apply if it is ok.

The patch without quoted-printable encoding and extra linebreaks.
Thanks.


--- jffs2reader.c.printsize	2005-10-10 17:55:17.000000000 +0900
+++ jffs2reader.c	2005-10-10 18:22:02.000000000 +0900
@@ -87,7 +87,14 @@
 #include <linux/jffs2.h>
 #include <mtd/jffs2-user.h>
 
+#ifdef DEBUG
+#define dprintf(...) printf (__VA_ARGS__)
+#else /* not DEBUG */
+#define dprintf(...)
+#endif /* not DEBUG */
+
 #define SCRATCH_SIZE (5*1024*1024)
+#define SCRATCH_NUM  (64)
 
 #ifndef MAJOR
 /* FIXME:  I am using illicit insider knowledge of 
@@ -117,6 +124,7 @@ void printdir(char *o, size_t size, stru
 void freedir(struct dir *);
 
 struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, uint32_t ino);
+struct jffs2_raw_inode **collect_raw_inodes(char *o, size_t size, uint32_t ino, int *);
 struct jffs2_raw_dirent *resolvedirent(char *, size_t, uint32_t, uint32_t,
 									   char *, uint8_t);
 struct jffs2_raw_dirent *resolvename(char *, size_t, uint32_t, char *, uint8_t);
@@ -420,7 +428,7 @@ void freedir(struct dir *d)
 	}
 }
 
-/* collects directory/file nodes in version order. */
+/* searches the newest directory/file nodes. */
 
 /*
   f       - file flag.
@@ -491,6 +499,67 @@ struct jffs2_raw_inode *find_raw_inode(c
 	return NULL;
 }
 
+/* collects directory/file nodes in version order. */
+
+/*
+  o       - filesystem image pointer
+  size    - size of filesystem image
+  ino     - inode to compare against. see f.
+  *num    - number of raw inodes (result)
+
+  return value: a pointer to jffs2_raw_inode array and should be freed later.
+*/
+
+struct jffs2_raw_inode **collect_raw_inodes(char *o, size_t size, uint32_t ino, int *num)
+{
+	/* aligned! */
+	union jffs2_node_union *n = (union jffs2_node_union *) o;
+	union jffs2_node_union *e = (union jffs2_node_union *) (o + size);
+
+	struct jffs2_raw_inode **ri = NULL;
+	int i, count = 0, bufnum = 0;
+	uint32_t ver;
+
+	do {
+		while (n < e && je16_to_cpu (n->u.magic) != JFFS2_MAGIC_BITMASK)
+			n = (union jffs2_node_union *) ((char *) n + 4);
+
+		if (n < e && je16_to_cpu (n->u.magic) == JFFS2_MAGIC_BITMASK) {
+			if (je16_to_cpu (n->u.nodetype) == JFFS2_NODETYPE_INODE &&
+				je32_to_cpu (n->i.ino) == ino) {
+				/* XXX crc check */
+
+				if (bufnum <= count) {
+					bufnum += SCRATCH_NUM;
+					ri = realloc(ri, sizeof(struct jffs2_raw_inode *) * bufnum);
+					if (ri == NULL) {
+						fprintf(stderr, "memory exhausted\n");
+						exit(EXIT_FAILURE);
+					}
+				}
+
+				ver = je32_to_cpu (n->i.version);
+
+				for (i = 0; i < count; i++) {
+					if (ver < je32_to_cpu (ri[i]->version)) {
+						memmove(&ri[i + 1], &ri[i], 
+								sizeof(struct jffs2_raw_inode *) * (count - i));
+						break;
+					}
+				}
+
+				ri[i] = &(n->i);
+				count++;
+			}
+		}
+
+		n = (union jffs2_node_union *) ((char *) n + ((je32_to_cpu (n->u.totlen) + 3) & ~3));
+	} while (n < e);
+
+	*num = count;
+	return ri;
+}
+
 /* collects dir struct for selected inode */
 
 /*
@@ -853,8 +922,9 @@ void catfile(char *o, size_t size, char 
 			 size_t * rsize)
 {
 	struct jffs2_raw_dirent *dd;
-	struct jffs2_raw_inode *ri;
+	struct jffs2_raw_inode **rip;
 	uint32_t ino;
+	int i, count;
 
 	dd = resolvepath(o, size, 1, path, &ino);
 
@@ -868,8 +938,23 @@ void catfile(char *o, size_t size, char 
 		exit(EXIT_FAILURE);
 	}
 
-	ri = find_raw_inode(o, size, ino);
-	putblock(b, bsize, rsize, ri);
+	rip = collect_raw_inodes(o, size, ino, &count);
+
+	dprintf(" ver   isize   offset    csize    dsize      ctime      mtime\n");
+
+	for (i = 0; i < count; i++) {
+		struct jffs2_raw_inode *ri = rip[i];
+		dprintf ("%4u %8u %8u %8u %8u %10u %10u\n",
+				 je32_to_cpu (ri->version), je32_to_cpu (ri->isize),
+				 je32_to_cpu (ri->offset),
+				 je32_to_cpu (ri->csize), je32_to_cpu (ri->dsize),
+				 je32_to_cpu (ri->ctime), je32_to_cpu (ri->mtime));
+		putblock(b, bsize, rsize, ri);
+	};
+
+	fflush (stdout);
+
+	free (rip);
 
 	write(1, b, *rsize);
 }


-- 
Suzuki Takashi
