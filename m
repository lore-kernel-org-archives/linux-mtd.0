From: linux@arm.linux.org.uk (Russell King - ARM Linux)
Date: Thu, 6 Mar 2003 23:28:54 +0000
Subject: Another mmap / jffs2 problem (was RE: 2.5.59-rmk1: unmap_vmas: VMA list is not sorted correctly!)
In-Reply-To: <002001c2e432$61b33f30$e55f040f@bergamot>; from ch@murgatroid.com on Thu, Mar 06, 2003 at 02:47:35PM -0800
References: <000d01c2e2ba$95246520$7a00000a@bergamot> <002001c2e432$61b33f30$e55f040f@bergamot>
Message-ID: <20030306232854.F982@flint.arm.linux.org.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, Mar 06, 2003 at 02:47:35PM -0800, Christopher Hoover wrote:
> 
> > I'm getting "unmap_vmas: VMA list is not sorted
> > correctly!" with 2.5.59-rmk1 on a badgepad4 
> > (SA-1110).  I take it that this is bad.  :-)
> 
> I tracked this down to the use of mmap within pppd
> (ppp-2.4.1/pppd/tdb.c) on a file in jffs2.  That last part -*- the
> mmap'ed file is in jffs2 -*- is key.
> 
> I don't always get the "VMA list is not sorted message", but pppd always
> segfaults when it starts mucking with the mmap'ed file data.
> 
> If I place the file in /tmp, which is a ramfs file system in my setup,
> pppd behaves.
> 
> Here's the segfault:
> 
> pppd-with-mmap: unhandled page fault at 0x000001e3, code 0xc334f007
> pgd = c334c000
> [000001e3] *pgd=c238b011, *pte=00000000, *ppte=00000000
> pc : [<40057f7c>]    lr : [<00026ad4>]    Not tainted
> sp : befffd14  ip : befffd28  fp : 00000000
> r10: 933f4b6e  r9 : 00000007  r8 : 000438c8
> r7 : befffd28  r6 : 0004df80  r5 : 00000004  r4 : 000001e4
> r3 : ffffffff  r2 : 00000004  r1 : 000001e3  r0 : befffd28
> Flags: nzCv  IRQs on  FIQs on  Mode USER_32  Segment user
> Control: C334F17F  Table: C334F17F  DAC: 00000015

This is a long standing problem - and, has been reported many times
here.  I don't remember the details, but I seem to remember that
pppd is buggy.

I think, if you strace pppd, you'll find that it tries to mmap something
just before it receives a segfault.  It receives the segfault because
the mmap failed and, iirc, it ignores the mmap failure.

As far as the unmap_vmas message, if you could get a copy of the
/proc/<pid>/maps file while pppd is running, it might provide some
clues.
