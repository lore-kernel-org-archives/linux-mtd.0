Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11FHey-0004t7-00
	for mtd@infradead.org; Fri, 13 Aug 1999 14:46:16 +0100
To: David Hinds <dhinds@zen.stanford.edu>
Cc: mtd@infradead.org
Subject: Re: mtd-19990809 including readonly DiskOnChip driver. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Aug 1999 14:46:15 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11FHex-0001OL-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dhinds@zen.stanford.edu said:
>  That's certainly true: PCMCIA currently treats cards with no CIS as
> static RAM cards.  Mostly because the issue has never really come up
> for me.  I think that's a bit different from an unqualified "they do
> not work very well at all". 

OK then - would you accept a patch which performs CFI or JEDEC identification 
in the case that there's no CIS, rather than just assuming SRAM? Jason, would 
you be willing to write this and submit it to him?

Also, how would you like us to go about making PCMCIA devices use the MTD 
system? 

>From what I understand of Jason's "mapped" helper, it provides simple way for 
MTD devices with memory windows to SRAM or NOR flash to provide a single 
'change window mapping' routine, and then to be handled automatically. Am I 
right in thinking that most (all?) PCMCIA memory devices work this way? 

If so, I think the best way to get PCMCIA devices to use this system with 
minimal code duplication is to write a new driver for PCMCIA MTDs, which links 
to Jason's helper code. That way, the original drivers aren't littered with 
ifdefs which make them difficult to maintain.

We can provide those drivers separately, as part of our tarball, until such 
time as we get Linus to include the MTD subsystem into his kernel, hopefully 
near the start of the 2.5 series. At that point, they can be imported into 
your PCMCIA tree for conditional compilation when the MTD system is detected 
in the kernel.

How does that sound?



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
