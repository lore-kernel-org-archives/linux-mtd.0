Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 120VsI-00079x-00
	for mtd-list@infradead.org; Tue, 21 Dec 1999 20:27:14 +0000
Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 120VsH-00079r-00
	for mtd@imladris.mvhi.com; Tue, 21 Dec 1999 20:27:13 +0000
Date: Mon, 20 Dec 1999 08:37:34 +0000 (GMT)
From: Kira Brown <kira@linuxgrrls.org>
To: Bjorn Eriksson <mdeans@algonet.se>
cc: MTD <mtd@imladris.mvhi.com>
Subject: RE: Data Reliability
In-Reply-To: <01BF4BB3.38321A20.mdeans@algonet.se>
Message-ID: <Pine.LNX.4.10.9912200834320.17765-100000@tetchy.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 21 Dec 1999, Bjorn Eriksson wrote:
> 
>  Uhm, do you let your SC410 keep cruising at 99MHz?

Nope; I have a little program that bumps it down to 8MHz as soon as
powerfail is detected.

> ISTR that these "funky memory retention caps" (FMRC:) holds up kinda
> bad under heavy load.

Yes.  But well enough, we find.

> P.s Do you know any venues for SC4xx designs/info/refs? Considering how 

I'd have to ask David (our hardware designer).  He knows this thing inside
and out.

> many people are designing with this beast there preciously little noise on 
> the Web. Right now I'm fighting GPCSA who stubbornly asserts his right to 
> drive *ALL* the GPIO_CS's

Ooooh, that's *good*.  We just bite the bullet and build more hardware
when we need that sort of thing...

kira.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
