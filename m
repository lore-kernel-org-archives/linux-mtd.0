Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112KPd-0006PN-00
	for mtd@infradead.org; Thu, 8 Jul 1999 21:04:53 +0100
To: "D. Jeff Dionne / VE3DJF" <jeff@ampr.harc.on.ca>
Cc: mtd@infradead.org
Subject: 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Jul 1999 21:04:52 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E112KPc-0005ge-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



Hmmm. Majordomo bounced my mail too - it seems we're not allowed to use the 
s-word at all....


jeff@ampr.harc.on.ca said:
>  Just joined the mailing list (likely you saw my [word that majordomo 
> doesn't like] go by, I copied the address blindly and later noticed I sent
> it to the list and not the majordomo :-( )

No - the subscr^H^H^H^H^H^H request got caught by majordomo and didn't get sent
to the list.

Strangely, your second mail got caught by the same rule, and didn't get sent 
to the list either. Try it again and see if it's just sulking at you for 
sending the request to the wrong address :)

> Anyway, having come over from the uClinux project, I am very
> interested in anything you may have.  I can also lend a hand.  We've
> had XIP from FLASH now for about a year, but are stuck using ROMfs
> (which as you know is read only). 

> So I'll be the newbe and ask...  What's the current status of the project?

We don't have XIP. We _do_ have FTL, and are working on FFS2. The situation is 
something like this:

Two years ago, I was employed by Nortel to provide a driver for M-Systems' 
Disk-On-Chip 1000, and I started a generic system for 'Memory Technology 
Devices', based heavily on David Hinds' similar work in the PCMCIA subsystem. 

This has lain fallow since then, except when people have asked me about it, 
when I've pointed them at the tarball and told them to play with it if they so 
desire.

Since then, at least two other people have come up with similar implementations
and added drivers for their own hardware. I'm currently working on
identifying the best features of all of them, and combining them into a single 
system to which we can port all the available hardware drivers.

You can find three of these implementations on ftp.linux-mtd.infradead.org in 
the /pub/mtd directory:

  flash.diff		- Kernel patch to support FTL on CFI-compliant flash
  mtd-990108.tar.gz	- My original tarball - midlevel glue layer,
						FTL driver,
						Disk-On-Chip 1000 driver,
						Uncached system RAM driver.
  mtd-19990629-jgg.tar.gz - Modified version of the above, with some extra
				sensible features in the midlevel layer,
				and a couple more hardware drivers.

That's basically the current status - fairly fragmented. I hope that within a 
week or so we can have the whole lot working together, and agree on a feature 
set for it. Any input from the uClinux project would be very much appreciated.



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
