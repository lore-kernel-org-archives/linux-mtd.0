Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14IB3Y-00020k-00
	for mtd-list@infradead.org; Mon, 15 Jan 2001 14:56:24 +0000
Date: Mon, 15 Jan 2001 17:59:10 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: mtdpart.c 
In-Reply-To: <26715.979569368@redhat.com>
Message-ID: <Pine.LNX.4.21.0101151757140.31216-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 15 Jan 2001, David Woodhouse wrote:
> > Axis flash: Found 1 x16 CFI device at 0x0 in 16 bit mode Number of
> > erase regions is zero
> 
> That shouldn't happen. Where did you put that check? Can you enable 
> DEBUG_CFI? What does it print just after you read it from the flash
> at line 545:
> #ifdef DEBUG_CFI
>         printk("Number of erase regions: %d\n", num_erase_regions);
> #endif

I did not put any check anywhere. It printed that out of its own free will
:) I enabled CONFIG_MTD_DEBUG with CONFIG_MTD_DEBUG_LEVEL @ 3, but no
other lines were printed (which is suspicious). 

> I'll update my own tree for the board on my desk and check it's still
> working for me since the changes to fix 16-bit devices in 8-bit mode were
> merged. I have AMD chips in 1x16 arrangement too.

Great.. something must have burped because in the 2.4.0-kernel version, it
at least found the chip even though cfi_probe failed.

-BW



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
