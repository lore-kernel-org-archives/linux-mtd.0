Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvIUb-0006DD-LY
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 07:36:09 +0000
Date: Fri, 22 Sep 2017 09:34:56 +0200
From: Oleksij Rempel <ore@pengutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
Subject: Re: nand: denali: issue with 4.13
Message-ID: <20170922073456.t25jl34k4irl7g6w@pengutronix.de>
References: <25edd455-ad6c-f222-f552-2aa3d807112a@pengutronix.de>
 <CAK7LNASR_1OsR+Dp3J7=Mtii_Ysp72DhWFXSYoeFVLiFPXu2AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Description: 
Content-Disposition: inline
In-Reply-To: <CAK7LNASR_1OsR+Dp3J7=Mtii_Ysp72DhWFXSYoeFVLiFPXu2AA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Sep 21, 2017 at 08:00:34PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> 2017-09-21 15:44 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
> > Hi Masahiro,
> >
> > you are probably the expert of denali nand driver.
> > With kernel v4.13 i have following issue, it works on FPGASoC 5CSEBA5U...
> > but is now working on FPGASoC 5CSXFC6C6U... both of them have same NAND
> > chip, and seems to have similar IP core.
> >
> > FPGASoC 5CSXFC6C6U...:
> > ====================================================================
> > [    0.095899] console [ttyS0] disabled
> > [    0.095941] ffc02000.serial0: ttyS0 at MMIO 0xffc02000 (irq = 38,
> > base_baud = 6250000) is a 16550A
> > [    0.702041] console [ttyS0] enabled
> > [    0.706986] brd: module loaded
> > [    0.716232] loop: module loaded
> > [    0.720074] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c
> 
> 
> This line is strange.  It failed to read Manufacturer ID.
> The 0x2c should be Manufacturer ID, not Chip ID.
> 
> 
> I am guessing we need to wait a bit
> after the NAND_CMD_READID.
> 
> Please try the following ugly patch.

Suddenly this patch makes no difference.
the initial patch was describing an issue with interrupts:
============================================================================
FogBugz #163905: Support Denali NAND driver on socfpga platform

This patch addresses a few bugs and features in the Denali NAND
driver on the socfpga platform.

First the bugs:

- Reading ONFI parameters would cause a timeout, because
the code sent the wrong commands to the controller/device.  That was
fixed, and in the process, code was added to wait for the appropriate interrupt.
============================================================================

> 
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index bcc8cef1..2443e3d 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -744,10 +744,11 @@ static void nand_command(struct mtd_info *mtd,
> unsigned int command,
>         case NAND_CMD_ERASE2:
>         case NAND_CMD_SEQIN:
>         case NAND_CMD_STATUS:
> -       case NAND_CMD_READID:
>         case NAND_CMD_SET_FEATURES:
>                 return;
> -
> +       case NAND_CMD_READID:
> +               udelay(5);
> +               return;
>         case NAND_CMD_RESET:
>                 if (chip->dev_ready)
>                         break;
> @@ -874,10 +875,11 @@ static void nand_command_lp(struct mtd_info
> *mtd, unsigned int command,
>         case NAND_CMD_ERASE2:
>         case NAND_CMD_SEQIN:
>         case NAND_CMD_STATUS:
> -       case NAND_CMD_READID:
>         case NAND_CMD_SET_FEATURES:
>                 return;
> -
> +       case NAND_CMD_READID:
> +               udelay(5);
> +               return;
>         case NAND_CMD_RNDIN:
>                 nand_ccs_delay(chip);
>                 return;
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
