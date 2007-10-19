Received: from smtp103.mail.mud.yahoo.com ([209.191.85.213])
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IiluT-0002Ox-HJ
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 08:04:45 +0100
From: Nick Piggin <nickpiggin@yahoo.com.au>
To: Erez Zadok <ezk@cs.sunysb.edu>
Subject: Re: BUG at mm/filemap.c:1749 (2.6.24, jffs2, unionfs)
Date: Fri, 19 Oct 2007 17:03:11 +1000
References: <200710190605.l9J65kDe008069@agora.fsl.cs.sunysb.edu>
In-Reply-To: <200710190605.l9J65kDe008069@agora.fsl.cs.sunysb.edu>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_waFGH8UXwSUL1yv"
Message-Id: <200710191703.12026.nickpiggin@yahoo.com.au>
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

--Boundary-00=_waFGH8UXwSUL1yv
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 19 October 2007 16:05, Erez Zadok wrote:
> David,
>
> I'm testing unionfs on top of jffs2, using 2.6.24 as of linus's commit
> 4fa4d23fa20de67df919030c1216295664866ad7.  All of my unionfs tests pass
> when unionfs is stacked on top of jffs2, other than my truncate test --
> whic tries to truncate files up/down (through the union, which then is
> passed through to the lower jffs2 f/s).  The same truncate test passes on
> all other file systems I've tried unionfs/2.6.24 with, as well as all of
> the earlier kernels that unionfs runs on (2.6.9--2.6.23).  So I tend to
> think this bug is more probably due to something else going on in 2.6.24,
> possibly wrt jffs2/mtd.  (Of course, it's still possible that unionfs isn't
> doing something right -- any pointers?)
>
> The oops trace is included below.  Is this a known issue and if so, any
> fixes?  If this is the first you hear of this problem, let me know and I'll
> try to narrow it down further.

It's had quite a lot of recent changes in that area -- the "new aops"
patches.

They've been getting quite a bit of testing in -mm and no such problems,
but I doubt anyone was doing much unionfs over jffs2, or even much jffs2
testing with -mm.

The bug smells like jffs2 is actually passing back a "written" length
greater than the length we passed into it.

The following might show what's happening.

--Boundary-00=_waFGH8UXwSUL1yv
Content-Type: text/x-diff;
  charset="utf-8";
  name="mm-debug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mm-debug.patch"

Index: linux-2.6/mm/filemap.c
===================================================================
--- linux-2.6.orig/mm/filemap.c
+++ linux-2.6/mm/filemap.c
@@ -2184,6 +2184,7 @@ fs_write_aop_error:
 	return written ? written : status;
 }
 
+#include <linux/kallsyms.h>
 static ssize_t generic_perform_write(struct file *file,
 				struct iov_iter *i, loff_t pos)
 {
@@ -2243,6 +2244,13 @@ again:
 						page, fsdata);
 		if (unlikely(status < 0))
 			break;
+		if (status > copied) {
+			print_symbol("%s returned more than it should!\n", (unsigned long)a_ops->write_end);
+			printk("status = %ld, copied = %lu\n", status, copied);
+			dump_stack();
+			status = copied; /* try to fix */
+		}
+
 		copied = status;
 
 		cond_resched();

--Boundary-00=_waFGH8UXwSUL1yv--
