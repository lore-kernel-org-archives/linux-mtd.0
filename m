Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JXWR-0005nV-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 09:35:35 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13JXWQ-0005nP-00
	for mtd@infradead.org; Tue, 01 Aug 2000 09:35:34 +0100
Message-ID: <39868C80.6C48378E@arcom.co.uk>
Date: Tue, 01 Aug 2000 09:38:24 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Booting from flash
References: <398598C4.D6FC3ED8@arcom.co.uk> <25533.965057345@cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> dvrabel@arcom.co.uk said:
> >  How would I go about getting linux to boot of flash.
> 
> See Jason's stuff in the boot/ directory of my CVS tree. I haven't looked
> at it. Other people are booting off flash quite happily.

Thanks.

> > If I'm using FTL do I need to make GRUB/LILO understand FTL?
> 
> Yes. But why are you using FTL? It's patented and you're not permitted to
> use it on non-PCMCIA devices. You should probably be using JFFS instead.

Woah! This sort of restriction should be listed in the README or website
to prevent dumb people like me from using it by mistake.
 
> (You'd need to get your bootloader to understand JFFS, too, but keep an eye
> on handhelds.org where that task is fairly high up on the TODO list.)
> 
> > The board I'm using is a standard PC architecture.
> 
> Wimp.

Not my fault. I just work here.  In fact I'm just a lowly student
working during summer hence all the clueless questions.
 
David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
