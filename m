Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11c3yK-00046S-00
	for mtd@infradead.org; Fri, 15 Oct 1999 10:48:24 +0100
To: "Olav W lfelschneider" <info@teratronik.de>
Cc: mtd@infradead.org
Subject: Re: Resetting a 24MB DoC2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Oct 1999 10:48:23 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11c3yJ-0007C3-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


info@teratronik.de said:
>  I tried your mtd on a DoC2000-24MB and managed to totally corrupt its
> data structures to a point where the original firmware doesn't work
> anymore. No dformat, no dupdate...

> Can you tell me how to reset the device into a vanilla state to start
> over again?

If you only need to be able to use it under Linux, use the nftl_format program 
which is included in the MTD code. 

Usage: nftl_format <mtddevice> [<startoffset> [<size>]]

You want a start offset of 49152 to leave the M-Systems firmware untouched, 
IIRC.

Alternatively, boot DOS and use their DFORMAT program, and then their driver 
will be able to understand it too. DFORMAT is capable of detecting the device 
and completely reprogramming it, even if the firmware isn't working.

info@teratronik.de said:
>  Meanwhile, I think I will change the M-Sys binary driver into a
> loadable module, so I can distribute it without violating the GPL. 

That's fairly simple to do - a handful of people have already done so. I've 
been using it like that - the only way I can try to fix the interoperation 
problems is to load my driver, modify the filesystem a bit, then load their 
driver and see if it barfs. By taking snapshots of the entire flash between 
each round of this, I can hopefully work out exactly what it is that I'm doing 
wrong.

Unfortunately, I haven't got their module unloading properly, so I have to 
reboot quite frequently while I'm doing this.

----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
