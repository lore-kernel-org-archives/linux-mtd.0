From: ch@murgatroid.com (Christopher Hoover)
Date: Thu, 6 Mar 2003 18:10:40 -0800
Subject: Another mmap / jffs2 problem (was RE: 2.5.59-rmk1: unmap_vmas: VMA list is not sorted correctly!)
In-Reply-To: <003501c2e449$2fc65db0$e55f040f@bergamot>
Message-ID: <003c01c2e44e$c0779680$e55f040f@bergamot>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

BTW, this is fixed in the ppd CVS:

http://www.samba.org/cgi-bin/cvsweb/ppp/pppd/tdb.c?r1=1.1&r2=1.2

-ch


> -----Original Message-----
> From: linux-arm-kernel-admin at lists.arm.linux.org.uk 
> [mailto:linux-arm-kernel-admin at lists.arm.linux.org.uk] On 
> Behalf Of Christopher Hoover
> Sent: Thursday, March 06, 2003 5:31 PM
> To: 'Russell King - ARM Linux'
> Cc: linux-arm-kernel at lists.arm.linux.org.uk; 'linux-mtd'
> Subject: RE: Another mmap / jffs2 problem (was RE: 
> 2.5.59-rmk1: unmap_vmas: VMA list is not sorted correctly!)
> 
> 
> 
> > This is a long standing problem - and, has been reported many times
> > here.  I don't remember the details, but I seem to remember that
> > pppd is buggy.
> 
> Ah.  I looked at the code -- it seems that someone thought 
> that mmap(2)
> returns 0 on error.  A couple of checks for -1 fixed it.  
> I'll forward a
> patch to the maintainers (attached here for anyone encountering this
> problem who finds this note).
> 
> Incidentally why does the mmap fail with EINVAL against a 
> jffs2 file and
> succeed against a tmpfs file?  Is that by design?
> 
> 
> > As far as the unmap_vmas message, if you could get a copy of the
> > /proc/<pid>/maps file while pppd is running, it might provide some
> > clues.
> 
> I'm still getting the occasion unmap_vmas message; I'll grab that info
> next time I see it.
> 
> Thanks again.
> 
> Cheers,
> -ch
> 
