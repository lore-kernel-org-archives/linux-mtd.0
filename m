Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tBYH-0002t8-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 17:57:05 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tBY9-0002t2-00
	for mtd@infradead.org; Fri, 27 Apr 2001 17:56:57 +0100
Message-ID: <3AE9A4E4.EED412CA@daniel.com>
Date: Fri, 27 Apr 2001 11:57:08 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Alexander Melichenko <AlexanderM@lrpeople.com>
CC: mtd@infradead.org
Subject: Re: Boot kernel from flash on CDPSC520 w/o BIOS!
References: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk> <01042316543802.01109@rob> <3AE4B5B3.26E340E8@daniel.com> <01042412450101.00394@rob> <3AE5950D.D10C1F8B@daniel.com> <000d01c0cf12$129fd700$4d02010a@lrpeople.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alexander Melichenko wrote:

> Hello, Vipin!
> To boot kernel from flash I do :
> - reset the board (z).
> - init it (yi).
> - load lstart16.abs to it (ns lstart16.abs ff800, ns lstart16.abs 7ff800).

Nope. You need to load the lstart16.abs file to the BIOS FLASH chip, NOT to
the FLASH bank0

>
> - load zImage to it with offset 0 (ns zImage 0).

Where did you init the root fs? Whe  zFlashImage boots, it will look to mount
the root fs. Also you need to
tell zFlah image what the root device is. See the HOWTO for more details.

>
> After that I reboot CDP, but nothing is happening.
> What step is wrong?

This is quite a complicated procedure. Make sure that you can read/write the
/mtd partitions. Read the HOWTO.

Vipin

>
>
> Alexander Melichenko.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
