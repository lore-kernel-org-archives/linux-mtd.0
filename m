Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZGbj-0007Bu-00
	for mtd-list@infradead.org; Sat, 03 Mar 2001 18:18:19 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14ZGbi-0007Bo-00
	for mtd@infradead.org; Sat, 03 Mar 2001 18:18:18 +0000
Date: Sat, 3 Mar 2001 18:18:13 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Schirmer / TayTron <schirmer@taytron.net>
cc: <mtd@infradead.org>
Subject: Re: AW: Some bugs
In-Reply-To: <BKEKLBIBFPNGJKJDEODFCEBMEIAA.schirmer@taytron.net>
Message-ID: <Pine.LNX.4.30.0103031754080.7202-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 3 Mar 2001, Florian Schirmer / TayTron wrote:

> So the problem must be either in the mtd cfi_cmd_set module (not swapping
> while writing data) or somethere in the kernel stuff. Any ideas? This is the
> only true problem at the moment i dont know a good workaround for.

Aha - writew is defined as little-endian. We should be using __raw_writew() 
in physmap.c, and possibly mb() after it.

I've committed that change - please test.

> Okay found the problem: EraseRegionInfo[0] is equal at both positions. And
> it's already in correct byteorder in BOTH positions. Swapping the order
> again in cfi_cmd_set_0001 causes the trouble. This results in erase size
> 0x200 instead of 0x20000. So please remove it.

OK, that's applied too, thanks.

> So please can you commit the 3 solved issues to cvs?

The first was already there. The above two just joined it. Please confirm 
that the writew change is working.

Thanks.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
