Received: from smtp101.mail.mud.yahoo.com ([209.191.85.211])
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Iim7m-0002vQ-Cu
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 08:18:30 +0100
From: Nick Piggin <nickpiggin@yahoo.com.au>
To: Erez Zadok <ezk@cs.sunysb.edu>
Subject: Re: BUG at mm/filemap.c:1749 (2.6.24, jffs2, unionfs)
Date: Fri, 19 Oct 2007 17:16:53 +1000
References: <200710190605.l9J65kDe008069@agora.fsl.cs.sunysb.edu>
	<200710191703.12026.nickpiggin@yahoo.com.au>
In-Reply-To: <200710191703.12026.nickpiggin@yahoo.com.au>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_lnFGHwOggSRGKPd"
Message-Id: <200710191716.53470.nickpiggin@yahoo.com.au>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, jffs-dev@axis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_lnFGHwOggSRGKPd
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 19 October 2007 17:03, Nick Piggin wrote:
> On Friday 19 October 2007 16:05, Erez Zadok wrote:
> > David,
> >
> > I'm testing unionfs on top of jffs2, using 2.6.24 as of linus's commit
> > 4fa4d23fa20de67df919030c1216295664866ad7.  All of my unionfs tests pass
> > when unionfs is stacked on top of jffs2, other than my truncate test --
> > whic tries to truncate files up/down (through the union, which then is
> > passed through to the lower jffs2 f/s).  The same truncate test passes on
> > all other file systems I've tried unionfs/2.6.24 with, as well as all of
> > the earlier kernels that unionfs runs on (2.6.9--2.6.23).  So I tend to
> > think this bug is more probably due to something else going on in 2.6.24,
> > possibly wrt jffs2/mtd.  (Of course, it's still possible that unionfs
> > isn't doing something right -- any pointers?)
> >
> > The oops trace is included below.  Is this a known issue and if so, any
> > fixes?  If this is the first you hear of this problem, let me know and
> > I'll try to narrow it down further.
>
> It's had quite a lot of recent changes in that area -- the "new aops"
> patches.
>
> They've been getting quite a bit of testing in -mm and no such problems,
> but I doubt anyone was doing much unionfs over jffs2, or even much jffs2
> testing with -mm.
>
> The bug smells like jffs2 is actually passing back a "written" length
> greater than the length we passed into it.
>
> The following might show what's happening.

Hmm, looks like jffs2_write_end is writing more than we actually ask it
to, and returns that back.

        unsigned aligned_start = start & ~3;

and

        if (end == PAGE_CACHE_SIZE) {
                /* When writing out the end of a page, write out the
                   _whole_ page. This helps to reduce the number of
                   nodes in files which have many short writes, like
                   syslog files. */
                start = aligned_start = 0;
        }

These "longer" writes are fine, but they shouldn't get propagated back
to the vm/vfs. Something like the following patch might fix it.


--Boundary-00=_lnFGHwOggSRGKPd
Content-Type: text/x-diff; charset="utf-8"; name="jffs2-writtenlen-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="jffs2-writtenlen-fix.patch"

Index: linux-2.6/fs/jffs2/file.c
===================================================================
--- linux-2.6.orig/fs/jffs2/file.c
+++ linux-2.6/fs/jffs2/file.c
@@ -255,7 +255,7 @@ static int jffs2_write_end(struct file *
 		   _whole_ page. This helps to reduce the number of
 		   nodes in files which have many short writes, like
 		   syslog files. */
-		start = aligned_start = 0;
+		aligned_start = 0;
 	}
 
 	ri = jffs2_alloc_raw_inode();
@@ -291,14 +291,11 @@ static int jffs2_write_end(struct file *
 	}
 
 	/* Adjust writtenlen for the padding we did, so we don't confuse our caller */
-	if (writtenlen < (start&3))
-		writtenlen = 0;
-	else
-		writtenlen -= (start&3);
+	writtenlen -= min(writtenlen, (start - aligned_start));
 
 	if (writtenlen) {
-		if (inode->i_size < (pg->index << PAGE_CACHE_SHIFT) + start + writtenlen) {
-			inode->i_size = (pg->index << PAGE_CACHE_SHIFT) + start + writtenlen;
+		if (inode->i_size < pos + start + writtenlen) {
+			inode->i_size = pos + start + writtenlen;
 			inode->i_blocks = (inode->i_size + 511) >> 9;
 
 			inode->i_ctime = inode->i_mtime = ITIME(je32_to_cpu(ri->ctime));

--Boundary-00=_lnFGHwOggSRGKPd--
