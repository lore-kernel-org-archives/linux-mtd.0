Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11eLK4-00054L-00
	for mtd@infradead.org; Thu, 21 Oct 1999 17:44:16 +0100
To: Ian Eure <ieure@uswest.net>
Cc: linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: Linux + DiskOnChip problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Oct 1999 17:44:15 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11eLK3-00018z-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


ieure@uswest.net said:
> I have stripped the kernel down as small as I can get it, and I still
> can't boot it with the DOC. Does anyone know if there is some solution
> to this dilemma, or should I just bite my tongue and use a LILO
> floppy? I'd rather not, since the netboot stuff is really cool. :^) 

For a start, unless you're helping to beta test my GPL'd DiskOnChip driver for 
Linux from http://www.linux-mtd.infradead.org/ then I don't want to help you.

If you'll download and test it, then you're permitted to read the rest of this 
mail...

 ... do you promise ? ....


If you're netbooting, you can just dump the firmware completely. Scribble over 
the first 48k of the DiskOnChip by using the direct access device /dev/mtd0 
and then it'll never try to load the BIOS again. 

We have also been discussing possible alternatives to this which allow you to 
actually boot from the DiskOnChip. It should be fairly simple to throw 
together a boot loader which fetches the kernel out of the device, puts it in 
place and executes it - without understanding the NFTL translation layer at 
all. Sort of like LILO but not.

Another alternative would be to take my driver and try to replace their 
provided firmware with my code - and to reduce the amount of caching which it 
does. I'm fairly sure that the reason it's sucking up all your RAM is because 
it is caching block information from the NFTL. That's not strictly necessary - 
it's a performance boost, but not if it prevents your system from booting.



----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
