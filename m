Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ac6D-0006q7-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 11:27:21 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E74@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Erwin Authried <eauth@softsys.co.at>,
        "'David Woodhouse'"
	 <dwmw2@infradead.org>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: 16-bit JEDEC Flash 
Date: Wed, 7 Mar 2001 12:26:13 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I tried something like that before writing amd_flash.c, but I noticed that many non-CFI flashes don't support some of the things that CFI-flashes support (e.g. unlock bypass). And I think the safest way to know if a non-CFI flash has finished erasing or writing would be to check the toggle or data polling bit instead of udelaying.

If your 16-bit flash uses the AMD command set you can just add it to the table in amd_flash_probe() and it should work right away.

There are of course many similarities between cfi_cmdset_0002.c and amd_flash.c (a lot of it is stolen from cfi_cmdset_0002.c), and we ought to make some of the CFI-specific stuff non-CFI-specific so that it can be used from amd_flash.c also.

/Jonas

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Wednesday, March 07, 2001 11:46 AM
> To: Erwin Authried
> Cc: 'mtd@infradead.org'
> Subject: Re: 16-bit JEDEC Flash 
> 
> 
> 
> eauth@softsys.co.at said:
> > From the comments in jedec.c I figure out that 16-bit JEDEC flash is
> > not supported. There are still several manufacturers that produce
> > flash without CFI (e.g., Atmel). If that's true, wouldn't 
> it be better
> > to use the already existing cfi implementation to emulate a CFI
> > device, instead of implementing all that stuff again for non-CFI
> > flash? I believe it wouldn't be much more than having a 
> table with the
> > JEDEC id's as an index  that contains all the CFI parameters. 
> 
> Yes please, that seems like a sensible plan. :)
> 
> --
> dwmw2
> 
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
