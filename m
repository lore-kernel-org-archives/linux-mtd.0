Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137vTi-0003iu-00
	for mtd-list@infradead.org; Fri, 30 Jun 2000 08:44:46 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137vTg-0003io-00
	for mtd@infradead.org; Fri, 30 Jun 2000 08:44:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000629222128.18411.qmail@web5304.mail.yahoo.com> 
References: <20000629222128.18411.qmail@web5304.mail.yahoo.com> 
To: Juan Gonzo <kayemmess@yahoo.ca>
Cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: using MTD with 2.2.14 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Jun 2000 08:47:50 +0100
Message-ID: <29179.962351270@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kayemmess@yahoo.ca said:
> Our group has a target board consisting of an ARM processor and Intel
> Strataflash with an embedded Linux OS running kernel 2.2.14.

I also have a target board consisting of an ARM processor and Intel
Strataflash with an embedded Linux OS running kernel 2.2.14.

> ...should switch to 2.2.16.  Currently this ins't possible for our
> project, so will MTD (JFFS) work properly for me with 2.2.14?

I'd be surprised if it doesn't - my current code isn't being tested on 
anything _but_ 2.2.14/StrongARM.


>  If I apply 'mtd-patch-2.2.16', I can enable these with 'make
> oldconfig', but am I not supposed to use this patch since it is for
> 2.2.16?

That's fine - you can use that and it _should_ apply cleanly.


> undefined reference to `put_module_symbol'

> But these functions are in the 2.2.16 patch, aren't
> they?  What am I doing wrong?

They're definitely in the patch. Did it fail to apply them for some reason? 

The {get,put}_module_symbol() patch is also available separately as 
mtd/patches/put_module_symbol-2.2.1x.patch. Try applying that and see what 
happens.

It's easy enough to do it by hand. Add __MOD_INC_USE_COUNT(mp) in the right 
place in the existing get_module_symbol() routine, and add the new 
put_module_symbol() routine from the patch. Then add the prototype to 
module.h and an export entry to ksyms.c



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
