Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3xPO-0005l3-PP
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 13:18:02 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUR0064KWRZZJ@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 14:14:24 +0100 (MET)
Date: Thu, 18 Mar 2004 14:11:25 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
To: llandre <r&d@wawnet.biz>, linux-mtd@lists.infradead.org
Message-id: <200403181411.25596.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
Subject: Re: Large block NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 March 2004 13:14, llandre wrote:
> Hi all,
>
> I'm going to write a driver for the Samsung Flash K9F1G08U0M (128MB).
> The main characteristics are:
> - erase block size: 128 KB
> - page program size: 2 KB
> - total chip size: 128 MB
> - tR = 25 us
>
> This chip is not fully compatible with the standard NAND flash commands
> defined in
> nand.h (Samsung call these devices "large block").
> Thus, in my understanding, I must provide the following custom functions:
> my_board_nand_command
> my_board_nand_wait
> my_board_nand_block_bad

Those functions should be incorporated into nand.c, as they are generic. So 
all boards which use those "large block" devices can use them.

Be aware, that the available NAND aware filesystems must be changed too, as 
they are not aware of pagesizes > 512 byte, but if IIRC  the datasheet 
details it is possible to write 4  512 byte sub-pages to the device without 
violating the specs. Anyway changes will be neccecary.

> Anybody wrote a driver for a similar device?
> Have the MTD maintainers already planned to support these devices?

Yep, but nobody forced me / us to implement it by paying for it. :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
