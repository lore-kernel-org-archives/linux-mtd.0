Return-path: <David.Woodhouse@mvhi.com>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 10kTnD-0002SN-00
	for mtd@imladris.mvhi.com; Thu, 20 May 1999 15:27:27 +0100
To: Mike Kilburn <mkilburn@ftel.net>
Cc: mtd@imladris.mvhi.com
Subject: Re: Re[2]: RFC: kernel-based PCMCIA ... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 May 1999 15:27:26 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E10kTnC-0001T8-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


mkilburn@ftel.net said:
>  Is there any beta code available for this. We have a PC104 with a 4M
> boot flash from M-Systems. The vendor of the PC104 wont give us any
> hardware  details on accessing the Flash and they say they are working
> with M-Systems to have a driver in a month or so. We dont want to be
> dependent on them for a driver.

There's some very preliminary stuff, which isn't anywhere near working at the
moment. 

I've tried a few approaches - I've disassembled the entire binary Linux driver,
and looked at how it deals with the device. I've also traced the BIOS startup
code on the device, including converting parts of it into C code and running 
them. I'm about to start with Dosemu, getting it to log all accesses to the 
device - I don't have a bus analyser or I'd do it that way.

Often with things like this, you'll see bits of how it works, and understand
what they were thinking when they designed it - and you'll be able to make 
(correct) assumptions about how it all goes together. The DoC2000 seems to be 
a product of a warped imagination, though - I have no clue what it's doing 
most of the time.

It doesn't look like it ever actually maps the flash in the CPU's memory map, 
though - it may well only allow sequential cpu-driven reads of individual 
bytes, which would explain the extremely poor performance of the thing.

I'm currently trying to tidy up the notes I do have, and will post them to the 
list later this afternoon, to see if anyone else has any more insight into the 
thing than I have.

> > As an aside - we may have patent problems with using FTL on anything
> > other than PCMCIA devices. 

> Why would a PCMICA be any different than a Flash on a PC104 cpu card?

>From a technical viewpoint - no reason at all. However, M-Systems apparently
own the patent, and have granted free use of it with PCMCIA devices. Using it 
on non-PCMCIA devices doesn't come under that blanket permission, so approval 
would have to be obtained from them.



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
