Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111YPm-0005Ml-00
	for mtd@infradead.org; Tue, 6 Jul 1999 17:49:50 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: Alexander Larsson <alex@cendio.se>, mtd@infradead.org
Subject: Re: Flash drivers and filesystem (fwd) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Jul 1999 17:49:44 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E111YPg-00061T-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  What is this applied against? This looks remarkably like it would fit
> nicely with the more general chagnes I made... 

Against Alex's original patch, I believe.

> Everyone rewriting the flash chip code for every new device is getting
> old :> 

Indeed. I'm working on recombining them all into one - was yours based upon
mine, or were they both based on something I can't find any more (I honestly
can't remember)?

Once we've done that, I'll look at putting up a public CVS server.




----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
