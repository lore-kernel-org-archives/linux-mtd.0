Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 112i0i-0007Mz-00
	for mtd@infradead.org; Fri, 9 Jul 1999 22:16:44 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org, rms@gnu.org
Subject: Re: Response from M-Systems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 09 Jul 1999 22:16:43 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E112i0h-0002gf-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  Ah, then it gets complex, since you don't have any patent right to
> give you have contradicted the terms of your own license. The
> conservative view is that anyone you give it to has no license to use
> it because they cannot comply with the license, 

I honestly can't see how. Much as I disagree with the concept of software 
patents, and I hope we don't have them inflicted upon us here in the UK - I 
can't see what the GPL's restriction is. I'm aware of the _intention_, but the 
GPL doesn't actually appear to assert the the code must be _usable_ by anyone. 

In fact, it explicitly states that it's only about "copying, distribution and
modification", and the patent doesn't attempt to restrict you from either of
those three activities; only from _using_ the code with non-M-Systems'
hardware. You can do what you like with it, but as soon as you actually start 
using it on hardware that's not produced by M-Systems, you're violating the 
patent.

Yes, this is a contentious statement for me to make, and one which runs 
contrary to the spirit of the GPL, but I really can't see where the flaw is in 
this logic.

Also, consider the context. I'm talking about releasing code myself under GPL 
- not suggesting that M-Systems do so. I'm trying to convince them that it's 
safe to allow me to do so; and to assist me by giving me specs. So this 'flaw' 
in the GPL actually works to our benefit in this case.

If someone duplicates their hardware, and it comes to court, then there are 
two possible scenarios:
 1. My reasoning is shown to be correct - M-Systems win the case.
 2. My reasoning is shown to be incorrect. Results:
	I was never allowed to release the code under GPL in the first place.
	--> The GPL license on the code the competitor is using is invalid.
	--> The competitor is using unlicensed code.
	--> The competitor is _also_ violating M-Systems' patents.

So either way, M-Systems have no reason to avoid giving me the specs for the 
hardware and allowing me to release GPL'd code. It's good for us and it's good 
for them. Worst case: The GPL on the code gets retracted at some later date, 
after we're all using it.

There's also the fact that any reverse-engineering would lead to BSD-licensed 
code, just to spite them - so releasing GPL'd code is in fact a way for them 
to _restrict_ the terms of the source distribution in the long term.


----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
