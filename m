Received: from lyte-mail1.lyse.net ([213.167.96.67])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmZtp-0005I6-5N
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2004 11:17:54 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-WOBIci44i0llb1FYQojx"
Message-Id: <1090250271.14173.6.camel@famine>
Mime-Version: 1.0
Date: Mon, 19 Jul 2004 17:17:51 +0200
Subject: problems with JFFS2 assert failure on mutex
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WOBIci44i0llb1FYQojx
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I was working on a different problem when I came across a mutex that
was being obtained twice(discovered via eCos asserts).

On the surface of it, this patch looks correct.

Comments?


--=20
=D8yvind Harboe
http://www.zylin.com


--=-WOBIci44i0llb1FYQojx
Content-Disposition: attachment; filename=mutex.txt
Content-Type: text/x-patch; name=mutex.txt; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Index: gc.c
===================================================================
RCS file: /cvs/ecos/ecos/packages/fs/jffs2/current/src/gc.c,v
retrieving revision 1.7
diff -w -u -r1.7 gc.c
--- gc.c	1 Apr 2004 03:17:57 -0000	1.7
+++ gc.c	19 Jul 2004 12:54:18 -0000
@@ -358,10 +358,10 @@
 	spin_unlock(&c->inocache_lock);
 
 	f = jffs2_gc_fetch_inode(c, inum, nlink);
-	if (IS_ERR(f))
-		return PTR_ERR(f);
-	if (!f)
-		return 0;
+	if (!f||IS_ERR(f)) {
+	  up(&c->alloc_sem);
+		return f;
+	}
 
 	ret = jffs2_garbage_collect_live(c, jeb, raw, f);
 

--=-WOBIci44i0llb1FYQojx--
