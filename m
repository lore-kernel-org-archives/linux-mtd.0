Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139FKH-0005T8-00
	for mtd-list@infradead.org; Tue, 04 Jul 2000 00:08:29 +0100
Date: Mon, 3 Jul 2000 17:12:18 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>,
    mtd@infradead.org
Subject: Re: Status of MTD for CFI
In-Reply-To: <Pine.LNX.4.21.0006292149210.991-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.3.96.1000703170541.5555B-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Thu, 29 Jun 2000, David Woodhouse wrote:

> Jgg is apparently looking at support for JEDEC flash chips which aren't
> CFI-compliant.

I popped my current codes up at http://amber.deltatee.com/~jgg/mtd/jedec/

I've never actually tried it in the kernel yet, but the logic all appears
correct and it is in the right sort of format, have been using it to flash
kernels into the SIMM for booting this board. It needs testing and fixing
to support 8bit interfaces, I have to steal an octagon board so I can test
that. 

If someone desperately needs this then they are certainly welcome to
fiddle with it.

It supports most of the old style AMD uniform sector size chips, maybe
others. Works on my 16 chip banked flash SIMM, which is the most
complicated situation possible!

Anyhow, I am going on a trip soon to Florida and then up to OLS.. after
that I need to do a bunch of VHDL, but I should have time to finish it
off and write a JFFS bootloader.

Thanks,
Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
