Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rHcV-0003Yu-00
	for mtd-list@infradead.org; Sun, 22 Apr 2001 12:01:35 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14rHcQ-0003Yo-00
	for mtd@infradead.org; Sun, 22 Apr 2001 12:01:34 +0100
Date: Sun, 22 Apr 2001 12:00:49 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: dhammika <dhammika@sri.receiptcity.com>
cc: <jffs-dev@axis.com>,  <mtd@infradead.org>
Subject: Re: jffs for amd Am29LV160BB
In-Reply-To: <3AE31067.9C72314B@sri.receiptcity.com>
Message-ID: <Pine.LNX.4.33.0104221143230.28567-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 22 Apr 2001, dhammika wrote:

> >They should work fine. Isn't the 29LV160 a 16Mib (== 2MiB) chip, though?
> >Meaning you have 4MiB of flash in total.
>
> i'm not really sure that i understand you, i have 32bit bus and _two_
> 4MB 16bit chips. so that would give me total of 8MB flash.

You have said that you're using two Am29LV160 chips. As far as I can tell
from the AMD web site, they're _not_ 4MiB chips, they're 2MiB chips...

(http://www.amd.com/products/nvd/techdocs/techdocs.html)

	Am29LV160D
	16 Mbit (2 M x 8-Bit/1 M x 16-Bit)

See also http://www.amd.com/products/nvd/techdocs/22358.pdf

> another thing that i noticed is that 29LV160DD and 29LV160DB chips are
> listed in amd_flash.c this file would be compiled for non-cfi compliant
> AMD chips, but AMD schematic for 29LV160D.. says that they are cfi
> compliant. am i missing something here ??

Those chips can be driven either by the old pre-CFI driver (which also
lists them explicitly as 2MiB chips), or by the new CFI driver. CFI
doesn't provide a common interface for driving flash chips - only a common
interface for querying them to see what interface you _do_ need for
driving them. In all cases, manufacturers have just added the CFI
capability and then continued to use the original 'command sets'. So after
the initial probe, the code for driving CFI type 2 (AMD) chips is
basically identical to the code in the old AMD-specific chip driver. Some
time in the 2.5 timeframe, we're hoping to merge them properly.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
