Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11eD1g-0004Yh-00
	for mtd@infradead.org; Thu, 21 Oct 1999 08:52:44 +0100
To: "Mark Ferrell" <mferrell@nortelnetworks.com>
cc: mtd@infradead.org
Subject: Re: pmc551 status 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Thu, 21 Oct 1999 08:52:43 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11eD1f-0002cH-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


mferrell@nortelnetworks.com said:
>  And that's it.  It opens the device for a short duration of time ..
> but nothing comes forth.  I tried all sortsa fun with noluck.  Any
> ideas, suggestions, large bat's to beat the system about the head
> with? 

Hmmm. To test your driver itself, use the character devices, which are what 
/dev/mtd0 ought to be.

When you're sure that's OK, you ought just to be able to load the mtdblock 
device (after your driver) and use /dev/mtdblock0 too. There may be bugs in 
the mtdblock code, however.

Can you trace and send me the oops that you get if you load mtd, pmc551, then 
mtdblock in that order?

Also, it's worth checking that the mtdblock code actually sets the size of the 
block device. The kernel might be refusing to pass on any read() requests 
because we've left the device size set to zero.

----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
