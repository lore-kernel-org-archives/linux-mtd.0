Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BajCr-0001xb-91
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 18:48:33 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200406170032.09129.tglx@linutronix.de>
References: <073c01c453ac$de849e10$0100a8c0@superfortress>
	<200406170032.09129.tglx@linutronix.de>
Content-Type: text/plain
Date: Wed, 16 Jun 2004 23:46:47 +0100
Message-Id: <1087426007.4530.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dan Brown <dan_brown@ieee.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Towards DiskOnChip support as a NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-06-17 at 00:32 +0200, Thomas Gleixner wrote:
> Can you make it optional to use or should we break the code in 
> drivers/mtd/devices to enforce the development on Dan's code in 
> drivers/mtd/nand ? 
> 
> dwmw2 ??
> 
> IMHO the current DOC code in drivers/mtd/devices has too many todo's which 
> inhibit proper usage. 

It's not so bad on the original DiskOnChip 2000 and Millennium devices.
I'd rather keep it an option for now, at least till the todo list for
the new nand-based driver is reduced. We need to get the HW ECC working
on the driver, and fix up NFTL to work with it. We also need to fix up
the probing to work properly -- currently my hack just had the address
hard-coded.

-- 
dwmw2
