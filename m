Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9CWv-0002TI-NJ
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 06:22:32 +0000
Subject: Re: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: Artem Bityutskiy <dedekind@infradead.org>
To: simon polette <spolette@gmail.com>
In-Reply-To: <72795ccb0905260455x701ea6e9u5bafc7c394609a4b@mail.gmail.com>
References: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
	<1243323142.21646.129.camel@localhost.localdomain>
	<72795ccb0905260240q6389dd35j681dbe50a6d4990f@mail.gmail.com>
	<1243331031.21646.134.camel@localhost.localdomain>
	<72795ccb0905260247p6c204cc4w78eaafd28ffc3cf8@mail.gmail.com>
	<72795ccb0905260321n3b4646brb9adc90425b5304b@mail.gmail.com>
	<72795ccb0905260455x701ea6e9u5bafc7c394609a4b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 May 2009 09:21:54 +0300
Message-Id: <1243405314.11172.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk, spolette@adetelgroup.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-26 at 13:55 +0200, simon polette wrote:
> 2009/5/26 simon polette <spolette@gmail.com>:
> > 2009/5/26 simon polette <spolette@gmail.com>:
> >> 2009/5/26 Artem Bityutskiy <dedekind@infradead.org>:
> >>> On Tue, 2009-05-26 at 11:40 +0200, simon polette wrote:
> >>>> 2009/5/26 Artem Bityutskiy <dedekind@infradead.org>:
> >>>> > On Mon, 2009-05-25 at 17:44 +0200, simon polette wrote:
> >>>> >> +config       MTD_NAND_ATMEL_FLASH_BBT
> >>>> >> +     bool "Use On-Flash Bad Block Table"
> >>>> >> +     depends on MTD_NAND_ATMEL
> >>>> >> +     help
> >>>> >> +       This enables the On-Flash BBT, which mean that the bad blocks
> >>>> >> +       will be scanned one time then the BBT will be stored
> >>>> >> +       in flash, so scanning Nand flash for bad blocks will be no more
> >>>> >> +       necessary for the next boots.
> >>>> >> +
> >>>> >
> >>>> > I do not think you need a config option for this. It should be
> >>>> > a module parameter instead.
> >>>> >
> >>>> > --
> >>>> > Best regards,
> >>>> > Artem Bityutskiy (Битюцкий Артём)
> >>>> >
> >>>> >
> >>>>
> >>>> Yes, good idea, but do you think that I can keep a config option to
> >>>> define the default state of that param, it means doing something like
> >>>> :
> >>>> #ifdef CONFIG_MTD_NAND_ATMEL_FLASH_BBT
> >>>> static int use_on_flash_bbt = 1;
> >>>> #else
> >>>> static int use_on_flash_bbt = 0;
> >>>> #endif
> >>>> module_param(use_on_flash_bbt, int, 0);
> >>>
> >>> I think it is generally bad idea if each nand driver will
> >>> introduce a separate config option for this kind of stuff.
> >>>
> >>> You may always boot your kernel with something like
> >>> atmel_nand.on_flash_bbt=1 in the kernel parameters.
> >>>
> >>> --
> >>> Best regards,
> >>> Artem Bityutskiy (Битюцкий Артём)
> >>>
> >>>
> >>
> >> Ok, I asked this question cause it's what have been done in the nand
> >> diskonchip driver.
> >> I'll send you a new patch soon.
> >>
> >> Best regards,
> >>
> >> Simon Polette
> >> Adeneo - Adetelgroup
> >>
> >
> > So here is the new patch :
> >
> > Signed-off-by: Simon Polette <spolette@adetelgroup.com>
> > ---
> >  drivers/mtd/nand/atmel_nand.c |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> > index 47a33ce..e113594 100644
> > --- a/drivers/mtd/nand/atmel_nand.c
> > +++ b/drivers/mtd/nand/atmel_nand.c
> > @@ -24,6 +24,7 @@
> >
> >  #include <linux/slab.h>
> >  #include <linux/module.h>
> > +#include <linux/moduleparam.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mtd/nand.h>Signed-off-by: Simon Polette
> > <spolette@adetelgroup.com>
> > @@ -47,6 +48,9 @@
> >  #define no_ecc         0
> >  #endif
> >
> > +static int on_flash_bbt = 0;
> > +module_param(on_flash_bbt, int, 0);
> > +
> >  /* Register access macros */
> >  #define ecc_readl(add, reg)                            \
> >        __raw_readl(add + ATMEL_ECC_##reg)
> > @@ -465,6 +469,11 @@ static int __init atmel_nand_probe(struct
> > platform_device *pdev)
> >                }
> >        }
> >
> > +       if (on_flash_bbt) {
> > +               printk("atmel_nand: Use On Flash BBT\n");
> > +               nand_chip->options |= NAND_USE_FLASH_BBT;
> > +       }
> > +
> >        /* first scan to find the device and get the page size */
> >        if (nand_scan_ident(mtd, 1)) {
> >                res = -ENXIO;
> > --
> > 1.6.0.4
> >
> > --
> > Best regards,
> >
> > Simon Polette
> > Adeneo - Adetelgroup
> >
> A line have been mistakenly inserted into the patch, probably by a
> middle click, sorry for the inconvenience.
> 
> 
> Signed-off-by: Simon Polette <spolette@adetelgroup.com>
> ---
>  drivers/mtd/nand/atmel_nand.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 47a33ce..e113594 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -24,6 +24,7 @@
> 
>  #include <linux/slab.h>
>  #include <linux/module.h>
> +#include <linux/moduleparam.h>
>  #include <linux/platform_device.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
> @@ -47,6 +48,9 @@
>  #define no_ecc		0
>  #endif
> 
> +static int on_flash_bbt = 0;
> +module_param(on_flash_bbt, int, 0);
> +
>  /* Register access macros */
>  #define ecc_readl(add, reg)				\
>  	__raw_readl(add + ATMEL_ECC_##reg)
> @@ -465,6 +469,11 @@ static int __init atmel_nand_probe(struct
> platform_device *pdev)
>  		}
>  	}
> 
> +	if (on_flash_bbt) {
> +		printk("atmel_nand: Use On Flash BBT\n");
> +		nand_chip->options |= NAND_USE_FLASH_BBT;
> +	}

Is it please also possible to add KERN_INFO to the 'printk()'
please. And also add it to the already existing 'printk()' in
the driver: printk("No SmartMedia card inserted.\n");

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
