Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IAkj-0001um-00
	for mtd-list@infradead.org; Mon, 15 Jan 2001 14:36:57 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14IAkh-0001ug-00
	for mtd@infradead.org; Mon, 15 Jan 2001 14:36:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0101151730520.31216-100000@godzilla.axis.se> 
References: <Pine.LNX.4.21.0101151730520.31216-100000@godzilla.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: mtd@infradead.org
Subject: Re: mtdpart.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 15 Jan 2001 14:36:08 +0000
Message-ID: <26715.979569368@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjorn.wesen@axis.com said:
>  It can be a hidden CONFIG option, like Config.in sets it
> automatically for those physmappings that require it, and then just
> remove the logic to do that in the Makefile - I can check that in if
> you want :) 

Yes please.


bjorn.wesen@axis.com said:
> Axis flash: Found 1 x16 CFI device at 0x0 in 16 bit mode Number of
> erase regions is zero

That shouldn't happen. Where did you put that check? Can you enable 
DEBUG_CFI? What does it print just after you read it from the flash
at line 545:
#ifdef DEBUG_CFI
        printk("Number of erase regions: %d\n", num_erase_regions);
#endif

Having that set to zero is OK for a CFI flash - it means you erase the 
whole device in one go. But that's not the case for your device, or indeed 
any device I've yet encountered, so it's not supported by the code yet.

I'll update my own tree for the board on my desk and check it's still
working for me since the changes to fix 16-bit devices in 8-bit mode were
merged. I have AMD chips in 1x16 arrangement too.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
