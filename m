Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16JYtf-0000RI-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Dec 2001 11:40:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0112240846510.15627-100000@odo.ds9.ufp> 
References: <Pine.LNX.4.33.0112240846510.15627-100000@odo.ds9.ufp> 
To: "Stéphane Doyon" <s.doyon@videotron.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Truncated symlink on jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 27 Dec 2001 11:51:03 +0000
Message-ID: <13913.1009453863@redhat.com>
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
>  where lstat is a tiny program that does lstat(argv[1], &st) and
> printf("size: %lu\n", st.st_size);. It outputs 0, but it should say 6
> (which it does on a symlink created on another fs). 

> Is this a bug or a known limitation? 

Bug. Thanks for pointing it out. We should be setting i_size. Something like
this ought to do it for _new_ symlinks, although we should probably contrive
a hack for jffs2_read_inode() to make it dtrt on older filesystems too:

===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/dir.c,v
retrieving revision 1.44
diff -u -r1.44 dir.c
--- fs/jffs2/dir.c	2001/11/06 17:58:41	1.44
+++ fs/jffs2/dir.c	2001/12/27 11:50:08
@@ -542,7 +542,7 @@
 
 	f = JFFS2_INODE_INFO(inode);
 
-	ri->dsize = ri->csize = strlen(target);
+	ri->isize = ri->dsize = ri->csize = strlen(target);
 	ri->totlen = sizeof(*ri) + ri->dsize;
 	ri->hdr_crc = crc32(0, ri, sizeof(struct jffs2_unknown_node)-4);
 



--
dwmw2
