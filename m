Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from lightning.swansea.uk.linux.org ([194.168.151.1] helo=the-village.bc.nu)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11IJ6M-0001fb-00
	for mtd@infradead.org; Sat, 21 Aug 1999 22:55:02 +0100
Subject: Re: First release of write support for DiskOnChip 2000
To: David.Woodhouse@mvhi.com (David Woodhouse)
Date: Sat, 21 Aug 1999 22:54:15 +0100 (BST)
Cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu
In-Reply-To: <E11Hr6R-0006rr-00@devel2.axiom.internal> from "David Woodhouse" at Aug 20, 99 05:01:15 pm
Content-Type: text
Message-Id: <E11IJ5d-0000ys-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> proper arbitration of access to the flash other than sti(), and some other 
> cleanups. My request for clever people who know about Reed-Solomon ECC codes 
> to package up their brain and send it to me still remains.

Look in drivers/char/ftape/lowlevel/ftape-ecc.c




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
