Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3ysd-0006my-9T
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 14:52:19 +0000
Message-Id: <6.0.1.1.0.20040318154520.01ec5658@192.168.2.1>
Date: Thu, 18 Mar 2004 15:52:14 +0100
To: tglx@linutronix.de
From: llandre <r&d@wawnet.biz>
In-Reply-To: <200403181411.25596.tglx@linutronix.de>
References: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
 <200403181411.25596.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Large block NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

> > I'm going to write a driver for the Samsung Flash K9F1G08U0M (128MB).
> > The main characteristics are:
> > - erase block size: 128 KB
> > - page program size: 2 KB
> > - total chip size: 128 MB
> > - tR = 25 us
> >
> > This chip is not fully compatible with the standard NAND flash commands
> > defined in
> > nand.h (Samsung call these devices "large block").
> > Thus, in my understanding, I must provide the following custom functions:
> > my_board_nand_command
> > my_board_nand_wait
> > my_board_nand_block_bad
>
>Those functions should be incorporated into nand.c, as they are generic. So
>all boards which use those "large block" devices can use them.
>
>Be aware, that the available NAND aware filesystems must be changed too, as
>they are not aware of pagesizes > 512 byte, but if IIRC  the datasheet
>details it is possible to write 4  512 byte sub-pages to the device without
>violating the specs. Anyway changes will be neccecary.

I see.

> > Anybody wrote a driver for a similar device?
> > Have the MTD maintainers already planned to support these devices?
>
>Yep, but nobody forced me / us to implement it by paying for it. :)

In case we decide to implement this feature by ourselves:
1) will the code be included in the public CVS tree?
2) will we guided by you and David in order to write the code the right way (I
mean, for example, using the correct notations and coding style)?



Regards,

llandre 
