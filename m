From: yangxhui@i-net.com.cn (yxh)
Date: Fri, 14 Feb 2003 08:33:22 +0800
Subject: Q: MTD and NIC Roms...
References: <m3znp0zqaw.fsf@lnxi.com> <3E4B37CD.8090507@pobox.com>
 <m38ywkbpf1.fsf@lnxi.com>
Message-ID: <00dd01c2d3c0$ae5d8020$530ca8c0@yangxhui>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

----- Original Message ----- 
From: "Eric W. Biederman" <ebiederman@lnxi.com>
To: "Jeff Garzik" <jgarzik@pobox.com>
Cc: <linux-mtd@lists.infradead.org>; "David Woodhouse" <dwmw2@infradead.org>
Sent: Thursday, February 13, 2003 3:38 PM
Subject: Re: Q: MTD and NIC Roms...


> Jeff Garzik <jgarzik@pobox.com> writes:
> 
> > Eric W. Biederman wrote:
> > > Currently I have a patch to eepro100.c that adds an MTD map driver so
> > > the onboard rom can be written.  Making code like etherboot easier to
> > > flash etc.
> > [...]
> > > I am currently looking for ideas on ways to cleanly get this code
> > > into the kernel, and I am looking for ideas.  The map driver is
> > 
> > 
> > Well... this functionality has existed for a while, and it doesn't need to be in
> > the kernel :)
> > 
> > Donald Becker's diag suite can do flashing. ftp://www.scyld.com/pub/diag/  He
> > provides means to program the flash from userspace.
> 
> Not on the eepro100, it does look like one or two other kinds of nic
> are supported though.  His libflash.c is quite deficient when it comes
> to the number of flash chips supported, the correctness of the
> implementation of the cfi command set 2, and the completeness of it's
> probe routine.
> 
> None of which goes into the races, or the portability problems
> that arise from doing this in user space.
> 
> The linux mtd layer with it's larger user base, and the fact it sits
> in the does not have any of those problems with handling flash chips.
> And it steadily gets fewer problems as more kinds of flash chips are
> looked at, and the problems in the code are addressed generically.
> 
> > And I think that's the best place for it.  We _could_ bloat up the kernel code
> > by adding the ability flash -- but how many users is that going to serve, that
> > are not already served by existing programs?  So, I disagree with getting this
> > stuff into the kernel at all.
> 
> Given the lack of existing programs for the eepro100 every user served
> is a new one.  Plus with the better support libraries provided by the 
> linux mtd layer it is easier to do a quality job in the kernel.
> 
> I totally agree that this is not day to day functionality, and so it
> should not burden the fast common paths of the kernel.  The code was
> enclosed in a config option.  It is worth noting one of the busiest
> booths at LinuxWorld was the etherboot booth.  And by other counts
> as well there are quite a large number of users network booting.   So
> the potential user base is significant.
> 
> And as David said it really is not that much code.
> 
> Eric
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
