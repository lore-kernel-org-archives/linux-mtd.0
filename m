Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJsL7-0007ne-Gi
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 16:30:05 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LJsL5-0003mx-4P
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 16:30:03 +0000
Received: from woodchuck.wormnet.eu ([77.75.105.223])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2009 16:30:03 +0000
Received: from alex by woodchuck.wormnet.eu with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2009 16:30:03 +0000
To: linux-mtd@lists.infradead.org
From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH RFC 0/3] [MTD] NAND: common driver for ts78xx/ts72xx
	platforms
Date: Mon, 5 Jan 2009 14:23:54 +0000
Message-ID: <qoh936-is3.ln1@woodchuck.wormnet.eu>
References: <20081229214647.GF3381@woodchuck>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Has *anyone* got anything to say about these patches?  Can I assume the 
silence would mean they would be accepted if I sent them in 'offically'?

Cheers

Alex

Alexander Clouter <alex@digriz.org.uk> wrote:
> 
> I have been sitting on this driver for a while so it's long overdue that 
> I actually attempt to get it tidied up and in a state usable for others.
> 
> These patches add support for the NAND found in technologic systems ARM 
> boards[1].  The platform specific parts (IO address and parititoning 
> schemes) have been movied into platform specific files whilst the driver 
> it's self can be used as a complete replacement for the ts7200.c NAND 
> driver.
> 
> N.B. the ts78xx patch you will be unable to apply as it depends on some 
>        yet to be mainline'd code.  It's inclusion here is just so you 
>        can see how the same driver is used on multiple platforms
> 
> N.B.2 I have been unable to test directly the ts72xx platform as Ido not 
>        own the hardware, I only have a ts7800.  Seems to compile 
>        though with no problems. :)
> 

-- 
Alexander Clouter
.sigmonster says: A journey of a thousand miles begins with a cash advance.
