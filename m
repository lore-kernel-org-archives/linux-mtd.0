Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16JjJy-00012r-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Dec 2001 22:48:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0112271746580.3704-100000@odo.ds9.ufp> 
References: <Pine.LNX.4.33.0112271746580.3704-100000@odo.ds9.ufp> 
To: "Stéphane Doyon" <s.doyon@videotron.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Truncated symlink on jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 27 Dec 2001 22:59:09 +0000
Message-ID: <4942.1009493949@redhat.com>
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

s.doyon@videotron.ca said:
>  OK. Well unless I'm doing something wrong, it doesn't seem to fix it
> for  me: modified my kernel, made a new symlink using ln, lstat'ed it:
> still  says st_size is 0.

> Is the fix correct, and will it work on a 2.4.16-rmk1-hh5 kernel? 

Necessary, but not sufficient. It would get i_size right when you unmount 
and remount the filesystem - we need to set inode->i_size immediately too.

I've just committed the complete version to CVS, along with the workaround
to make it right for existing filesystems.

Index: dir.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/dir.c,v
retrieving revision 1.44
retrieving revision 1.45
diff -u -r1.44 -r1.45
--- dir.c	2001/11/06 17:58:41	1.44
+++ dir.c	2001/12/27 22:43:20	1.45
@@ -31,7 +31,7 @@
  * provisions above, a recipient may use your version of this file
  * under either the RHEPL or the GPL.
  *
- * $Id: dir.c,v 1.44 2001/11/06 17:58:41 dwmw2 Exp $
+ * $Id: dir.c,v 1.45 2001/12/27 22:43:20 dwmw2 Exp $
  *
  */
 
@@ -542,7 +542,7 @@
 
 	f = JFFS2_INODE_INFO(inode);
 
-	ri->dsize = ri->csize = strlen(target);
+	inode->i_size = ri->isize = ri->dsize = ri->csize = strlen(target);
 	ri->totlen = sizeof(*ri) + ri->dsize;
 	ri->hdr_crc = crc32(0, ri, sizeof(struct jffs2_unknown_node)-4);
 
Index: readinode.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/readinode.c,v
retrieving revision 1.56
retrieving revision 1.57
diff -u -r1.56 -r1.57
--- readinode.c	2001/07/26 20:32:39	1.56
+++ readinode.c	2001/12/27 22:49:46	1.57
@@ -31,7 +31,7 @@
  * provisions above, a recipient may use your version of this file
  * under either the RHEPL or the GPL.
  *
- * $Id: readinode.c,v 1.56 2001/07/26 20:32:39 dwmw2 Exp $
+ * $Id: readinode.c,v 1.57 2001/12/27 22:49:46 dwmw2 Exp $
  *
  */
 
@@ -408,6 +408,12 @@
 
 	case S_IFLNK:
 		inode->i_op = &jffs2_symlink_inode_operations;
+		/* Hack to work around broken isize in old symlink code.
+		   Remove this when dwmw2 comes to his senses and stops
+		   symlinks from being an entirely gratuitous special
+		   case. */
+		if (!inode->i_size)
+			inode->i_size = latest_node.dsize;
 		break;
 		
 	case S_IFDIR:


--
dwmw2
