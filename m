From: dwmw2@infradead.org (David Woodhouse)
Date: 07 Mar 2003 06:53:36 +0000
Subject: Another mmap / jffs2 problem (was RE: 2.5.59-rmk1: unmap_vmas:
 VMA list is not sorted correctly!)
In-Reply-To: <003501c2e449$2fc65db0$e55f040f@bergamot>
References: <003501c2e449$2fc65db0$e55f040f@bergamot>
Message-ID: <1047020015.18755.31.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-03-07 at 01:30, Christopher Hoover wrote:
> > This is a long standing problem - and, has been reported many times
> > here.  I don't remember the details, but I seem to remember that
> > pppd is buggy.
> 
> Ah.  I looked at the code -- it seems that someone thought that mmap(2)
> returns 0 on error.  A couple of checks for -1 fixed it.  I'll forward a
> patch to the maintainers (attached here for anyone encountering this
> problem who finds this note).

I already bugged paulus about it last year sometime.

> Incidentally why does the mmap fail with EINVAL against a jffs2 file and
> succeed against a tmpfs file?  Is that by design?

Yes. We don't do shared writable mmap.

Except briefly in 2.5.5something where Linus broke the sys_mmap() logic
so it'd _appear_ to succeed but in fact give you a read-only mmap, and
then the process would die upon trying to write to it.

We fixed it -- I didn't track the fix so it might not have got applied.
I think it's in the archives of both lists. Look for posts from Andrew
Morton.

-- 
dwmw2
