Return-path: <David.Woodhouse@mvhi.com>
Received: from localhost ([127.0.0.1] ident=root)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10kQOg-0002Hn-00
	for mtd@imladris.demon.co.uk; Thu, 20 May 1999 11:49:54 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for mtd@imladris.demon.co.uk (multi-drop); Thu, 20 May 1999 11:49:54 +0100 (BST)
Received: from punt-1.mail.demon.net by mailstore for mtd@imladris.demon.co.uk
          id 927197389:10:04584:74; Thu, 20 May 99 10:49:49 GMT
To: Werner Almesberger <almesber@lrc.di.epfl.ch>
Cc: Linux-MTD mailing list <mtd@imladris.demon.co.uk>
Subject: Re: RFC: kernel-based PCMCIA ... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 May 1999 11:37:16 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10kQCS-0001AQ-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


< Followup to a post to linux-kernel, archived at 
	http://www.deja.com/getdoc.xp?AN=479544719&fmt=text >

Hello Werner,

almesber@lrc.di.epfl.ch said:
> ... for getting access to storage cards in early stages of porting,
> where user space development is still difficult. (E.g. because there's
> no libc port, no distribution, etc.)
> 
> This patch is vs. 2.3.3. Documentation is included.
>
>  Comments ? 

Not only 'in early stages of porting', but for root filesystems on embedded 
devices, where initrd is a blatant waste of space.

I've been looking at this for some time, on and off, and have produced a 
generic 'memory technology device' layer which will allow simple hardware 
drivers to be interfaced to a more generic upper layer which covers such 
things as the FTL filesystem.

My code borrowed very heavily from David Hinds' existing such code in the 
PCMCIA distribution.

Also, Alexander Larsson has produced some code very similar in principle to 
these. 

I have recently started a mailing list (mtd@imladris.demon.co.uk,
majordomo-managed) for discussion of this. It might be useful if you could join
us there. 

The tentative conclusion that (I think) we've reached so far is that we will
use Alexander's version of the code as a basis for further work. 

We will attempt to make this provide all the functionality required by the
existing MTD layer in the PCMCIA code, with a view to including it in the 2.3
kernels, and converting the PCMCIA code to use it (when present).

I'm actively working on drivers for the Disk-On-Chip 2000 from M-systems. We 
already have drivers for CFI-compliant flash memories, and for the ISA flash 
cards from M-Systems. There is also a driver to use uncacheable main memory as 
a memory device, which I've used mainly for testing.

My main concern at the moment is producing a standalone driver for the DoC2000,
with FTL built-in to it, for embedded systems using the 2.0 kernel. As soon as
I've done that, I'll be turning back to the generic subsystem design, and
producing a DoC2000 driver for the new system.

I suppose that we should start by taking Alexander's code and merging in all
the functionality required by the PCMCIA system, at which point we can look at
making it presentable to Linus for 2.3.soon. New memory hardware drivers can be
added as and when they're completed.

My main criterion for this 'merge' (and I'm sure that David Hinds will back me
up on this one) is that it should be simple for the PCMCIA code to switch 
between the two subsystems, preferably with no more than a few #ifdefs in a 
single header file.

As an aside - we may have patent problems with using FTL on anything other 
than PCMCIA devices. Our position on this is as yet undecided. 
I've suggested that perhaps the flags for each low-level device should include
a PCMCIA/ NON-PCMCIA bit, and the default configuration of the FTL driver
should refuse to work with non-PCMCIA devices. I don't really know what else we
can do.

Anyway, I hope that I've wittered for long enough to spark some productive 
debate on the subject. As soon as we have some conclusions, I'll put up a web 
site for the project, too, on http://imladris.mvhi.com/mtd/ 

I'd like to set up a list archive, too - but I'm busy on trying to hack the 
Disk-On-Chip. Any volunteers for the task, please contact me and I'll give you 
an account to play with.


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
