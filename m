Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from 24.64.25.86.ab.wave.home.com
	([24.64.25.86] helo=white.priv.deltatee.com ident=mail)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112cYq-00075o-00
	for mtd@infradead.org; Fri, 9 Jul 1999 16:27:36 +0100
Date: Fri, 9 Jul 1999 09:27:31 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: "D. Jeff Dionne / VE3DJF" <jeff@ampr.harc.on.ca>
cc: mtd@infradead.org
Subject: Re: your mail
In-Reply-To: <199907090709.HAA04138@ampr.harc.on.ca>
Message-ID: <Pine.LNX.3.96.990709092452.8974B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 9 Jul 1999, D. Jeff Dionne / VE3DJF wrote: 

> > Can you fire over your patch to ROMfs to make it do this? The 2.2.10
> > kernel version doesn't. 
> 
> Unfortunately, in it's current form it will not be of any use to you I suspect.
> It's for 2.0.37, and is tied up with another meg of patch.  It touches lots
> of stuff, and it needs cleaning :-(
> 
> We're also very 68k right now, so Linux/Intel would be some work.  You'll
> need fully position independant code to start with... Does -fpic go far enough
> on Intel?  You'll need to hack the ELF loader, we run a simple (low overhead)
> binary format.

Oh this is not at all what I was thinking, on Intel all we'd need to do is
setup the proper page tables so that each 4k page mapped to the correct 4k
chunk of flash, the FFS write unit size and alignment would be set to 4k
for executables. There should be no need to worry about pic and elf will
run fine like that too.
 
It should be really simple if someone can think up either a modification
to readpage() that adjusts the physical  location of the given page
structure or a new mmap that sets up a new page table mapping..

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
