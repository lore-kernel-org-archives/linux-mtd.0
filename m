Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1397tX-0003uH-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 16:12:23 +0100
Subject: Re: garbage collect
To: dwmw2@infradead.org (David Woodhouse)
Date: Mon, 3 Jul 2000 16:12:10 +0100 (BST)
Cc: nico@cam.org (Nicolas Pitre), jgg@ualberta.ca (Jason Gunthorpe),
	bjorn.wesen@axis.com (Bjorn Wesen), jffs-dev@axis.com,
	mtd@infradead.org
In-Reply-To: <Pine.LNX.4.21.0006281950320.1463-100000@imladris.demon.co.uk> from "David Woodhouse" at Jun 28, 2000 07:54:46 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <E1397tM-0004tu-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> MTD devices are not even vaguely related to block devices, and don't go
> anywhere near the buffer cache.

The interesting question is should they. Withouth them going via the block
layer you wont be able to mirror them or potentially run a loopback fs over
them soon

> 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
