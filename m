Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11bmE8-0005yi-00
	for mtd@infradead.org; Thu, 14 Oct 1999 15:51:32 +0100
To: Andreas Kotes <count@flatline.de>
Cc: mtd@infradead.org
Subject: Re: Booting from 32MB DOC2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Oct 1999 15:51:29 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11bmE7-0001Cv-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


count@flatline.de said:
>  I would actually need to boot from it, actually with kernel 2.2.12 ..
> any news from this side? And, could you tell me which Firmware code to
> use? is it doc121.exb like I suspect?

It _should_ be. It's just that my NFTL driver leaves the device in a state
which their firmware doesn't grok, so it may not actually boot.

> > I'll be back on top of it within two weeks' time, and hope to submit a
> > working version to Linus as soon as I can, to make sure it gets into
> > 2.4.

> hm. any news here? 

I've got as far as merging it into 2.3.21. I haven't managed to get enough 
free minutes to actually make the patch and send it to Linus.



----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
