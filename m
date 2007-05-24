Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HrBa8-0007K2-AR
	for linux-mtd@lists.infradead.org; Thu, 24 May 2007 07:34:24 -0400
Date: Thu, 24 May 2007 14:35:58 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
To: Andrew Victor <andrew@sanpeople.com>, dwmw2@infradead.org
Subject: Re: PATCH: at91_nand rdy_pin fix
Message-ID: <20070524143558.0bdae1f0@newbox>
In-Reply-To: <1179992828.13098.26.camel@fuzzie.sanpeople.com>
References: <51303.127.0.0.1.1179957194.squirrel@localhost>
	<1179992828.13098.26.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,

Corrected according to Andrew's comments:

The patch below fixes nand driver for AT91 boards which do not have NAND R/B signal
connected to gpio (rdy_pin is not connected).

Best regards, 
Ivan

Signed-off-by: Ivan Kuten <ivan.kuten@promwad.com>
Acked-by: Andrew Victor <andrew@sanpeople.com>

diff -urN linux-2.6.22-rc1-at91.orig/drivers/mtd/nand/at91_nand.c linux-2.6.22-rc1-at91/drivers/mtd/nand/at91_nand.c
--- linux-2.6.22-rc1-at91.orig/drivers/mtd/nand/at91_nand.c	2007-05-24 14:09:12 +0300
+++ linux-2.6.22-rc1-at91/drivers/mtd/nand/at91_nand.c	2007-05-24 14:09:42 +0300
@@ -128,7 +128,10 @@
 	nand_chip->IO_ADDR_R = host->io_base;
 	nand_chip->IO_ADDR_W = host->io_base;
 	nand_chip->cmd_ctrl = at91_nand_cmd_ctrl;
-	nand_chip->dev_ready = at91_nand_device_ready;
+
+	if (host->board->rdy_pin)
+		nand_chip->dev_ready = at91_nand_device_ready;
+
 	nand_chip->ecc.mode = NAND_ECC_SOFT;	/* enable ECC */
 	nand_chip->chip_delay = 20;		/* 20us command delay time */
 


On 24 May 2007 09:47:08 +0200
Andrew Victor wrote:

> hi Ivan,
> 
> > -       nand_chip->dev_ready = at91_nand_device_ready;
> > +
> > +       if (host->board->rdy_pin)
> > +               nand_chip->dev_ready = at91_nand_device_ready;
> > +       else
> > +               nand_chip->dev_ready = NULL;
> 
> Patch looks correct.
> 
> Since the at91_nand_host structure is allocated with kzalloc(),
> nand_chip->dev_ready is already initialized to NULL.
> So we don't really need the "else" part.
> 
> 
> Regards,
>   Andrew Victor
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
