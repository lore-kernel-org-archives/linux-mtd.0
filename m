Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139F7U-0005QX-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 23:55:16 +0100
Date: Mon, 3 Jul 2000 16:59:04 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: CFI flash in a PC?
In-Reply-To: <31462.962198615@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000703165748.5555A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Wed, 28 Jun 2000, David Woodhouse wrote:

> I'm trying to find a way of putting CFI flash chips into a PC, just to make 
> my life easier for the development stage - I'm getting extremely tired of 
> having to download an entire kernel to the embedded ARM board I'm testing 
> on, and write it to the flash chips it boots from, every time I want to 
> change a line of code.

What I did for doing the JEDEC driver was just develope and test the
driver without a kernel to get all the communication issues sorted out. I
downloaded it using Angel, quite speedy that way.
 
> Anyone have any ideas where I can find preferably an ISA or PCI board with 
> CFI flash chips on it, or failing that an IA32 single board computer with 
> flash built-in and a network interface? UK suppliers preferred but not 
> essential.

They are not too hard to make, PLD and some chips is all it takes.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
