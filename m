Received: from filer.fsl.cs.sunysb.edu ([130.245.126.2])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IivrC-0002fA-Ja
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 18:42:02 +0100
Date: Fri, 19 Oct 2007 13:38:38 -0400
Message-Id: <200710191738.l9JHccYx011061@agora.fsl.cs.sunysb.edu>
From: Erez Zadok <ezk@cs.sunysb.edu>
To: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: BUG at mm/filemap.c:1749 (2.6.24, jffs2, unionfs) 
In-reply-to: Your message of "Fri, 19 Oct 2007 17:16:53 +1000."
	<200710191716.53470.nickpiggin@yahoo.com.au>
Cc: linux-mtd@lists.infradead.org, Erez Zadok <ezk@cs.sunysb.edu>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org, jffs-dev@axis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <200710191716.53470.nickpiggin@yahoo.com.au>, Nick Piggin writes:
[...]
> Hmm, looks like jffs2_write_end is writing more than we actually ask it
> to, and returns that back.
> 
>         unsigned aligned_start = start & ~3;
> 
> and
> 
>         if (end == PAGE_CACHE_SIZE) {
>                 /* When writing out the end of a page, write out the
>                    _whole_ page. This helps to reduce the number of
>                    nodes in files which have many short writes, like
>                    syslog files. */
>                 start = aligned_start = 0;
>         }
> 
> These "longer" writes are fine, but they shouldn't get propagated back
> to the vm/vfs. Something like the following patch might fix it.
> 
> 
> --Boundary-00=_lnFGHwOggSRGKPd
> Content-Type: text/x-diff;
>   charset="utf-8";
>   name="jffs2-writtenlen-fix.patch"
> Content-Transfer-Encoding: 7bit
> Content-Disposition: attachment;
> 	filename="jffs2-writtenlen-fix.patch"

Nick, the patch worked.  All of my unionfs-over-jffs2 tests passed.

Thanks,
Erez.
