Return-path: <David.Woodhouse@mvhi.com>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111E4e-0004gp-00
	for mtd@infradead.org; Mon, 5 Jul 1999 20:06:40 +0100
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu
Subject: Re: FFS2 and MTDs (flash) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Jul 1999 20:06:38 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E111E4d-0002HU-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
>  Yes, there is lots of benifit to being able to mount a FFS filesystem
> over a loop device or on a RAM disk or something else. There is also
> lots of benifit to being able to create the FFS off the flash and then
> write the whole thing in one go. For my purposes that is a crucial
> feature. Also since the MTD's are presented as block devices you can
> mount other FS's like romfs in read-only mode.  

OK - that sounds reasonable.

jgg@ualberta.ca said:
>  Things will also run a bit faster if the buffer cache is used to hang
> onto some often used filesystem meta data in main memory.

Think of CFI-compliant flash mapped into the host's address space. Why cache 
it in RAM when you can just point a page table at the original?

> XIP is not directly possible with FFS2 as it places no constraints on
> alignment (like romfs).

So what they say on their web site about XIP is all crap? Of course, I suppose 
that shouldn't surprise me :)

Is it possible to run Linux on FFS2 without some kind on UMSDOS-like 
translation layer? Are we going to want to write our own version which is 
POSIX-compliant?

>  You're welcome to my code so far if you are interested, I have
> support for an Octagon 5066, a V-Max 301 and untested support for
> something called a MixCom card. 

Yes please - that'd be useful.

> BTW, I thought Disk on a chip used an ATA interface, and wasn't really
> a MTD? 

No, it maps into the host's memory map between 0xD0000 and 0xE0000 and has a 
custom ASIC to interface to the flash. The old versions behaved very similarly 
to EMS, paging in different blocks of flash - but the new version is very 
different, and very strange. 

It's CompactFlash that uses an ATA interface, either PCMCIA-ATA or raw IDE. So
you don't even need PCMCIA support to use it, I believe.


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
