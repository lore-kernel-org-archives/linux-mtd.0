Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Haavard Skinnemoen
 <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu
 <rainyfeeling@outlook.com>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, <devicetree@vger.kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <4fc857bb-f4a1-e507-54bb-82c71bb7edca@microchip.com>
Date: Tue, 21 Feb 2017 14:02:57 +0100
MIME-Version: 1.0
In-Reply-To: <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 20/02/2017 à 13:28, Boris Brezillon a écrit :
> This is a complete rewrite of the driver whose main purpose is to
> support the new DT representation where the NAND controller node is now
> really visible in the DT and appears under the EBI bus. With this new
> representation, we can add other devices under the EBI bus without
> risking pinmuxing conflicts (the NAND controller is under the EBI
> bus logic and as such, share some of its pins with other devices
> connected on this bus).
> 
> Even though the goal of this rework was not necessarily to add new
> features, the new driver has been designed with this in mind. With a
> clearer separation between the different blocks and different IP
> revisions, adding new functionalities should be easier (we already
> have plans to support SMC timing configuration so that we no longer
> have to rely on the configuration done by the bootloader/bootstrap).
> 
> Also note that we no longer have a custom ->cmdfunc() implementation,
> which means we can now benefit from new features added in the core
> implementation for free (support for new NAND operations for example).
> 
> The last thing that we gain with this rework is support for multi-chips
> and multi-dies chips, thanks to the clean NAND controller <-> NAND
> devices representation.
> 
> This new driver has been tested on several platforms (at91sam9261,
> at91sam9g45, at91sam9x5, sama5d3 and sama5d4) to make sure it did not
> introduce regressions, and it's worth mentioning that old bindings are
> still supported (which partly explain the positive diffstat).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  MAINTAINERS                              |    2 +-
>  drivers/mtd/nand/Makefile                |    2 +-
>  drivers/mtd/nand/atmel/Makefile          |    4 +
>  drivers/mtd/nand/atmel/nand-controller.c | 2269 +++++++++++++++++++++++++++
>  drivers/mtd/nand/atmel/pmecc.c           | 1020 ++++++++++++
>  drivers/mtd/nand/atmel/pmecc.h           |   73 +
>  drivers/mtd/nand/atmel_nand.c            | 2479 ------------------------------
>  drivers/mtd/nand/atmel_nand_ecc.h        |  163 --
>  drivers/mtd/nand/atmel_nand_nfc.h        |  103 --
>  9 files changed, 3368 insertions(+), 2747 deletions(-)
>  create mode 100644 drivers/mtd/nand/atmel/Makefile
>  create mode 100644 drivers/mtd/nand/atmel/nand-controller.c
>  create mode 100644 drivers/mtd/nand/atmel/pmecc.c
>  create mode 100644 drivers/mtd/nand/atmel/pmecc.h
>  delete mode 100644 drivers/mtd/nand/atmel_nand.c
>  delete mode 100644 drivers/mtd/nand/atmel_nand_ecc.h
>  delete mode 100644 drivers/mtd/nand/atmel_nand_nfc.h

[..]

> + * A few words about the naming convention in this file. This convention
> + * applies to structure and function names.
> + *
> + * Prefixes:
> + *
> + * - atmel_nand_: all generic structures/functions
> + * - atmel_smc_nand_: all structures/functions specific to the SMC interface
> + *		      (at91sam9 and avr32 SoCs)
> + * - atmel_hsmc_nand_: all structures/functions specific to the HSMC interface
> + *		       (sama5 SoCs and later)
> + * - atmel_nfc_: all structures/functions used to manipulate the NFC sub-block
> + *		 that is available in the HSMC block
> + * - <soc>_nand_: all SoC specific structures/functions

Ok, good.

> + */

[..]

> +static irqreturn_t atmel_nfc_interrupt(int irq, void *data)
> +{
> +	struct atmel_hsmc_nand_controller *nc = data;
> +	u32 imr, sr;
> +
> +	regmap_read(nc->base.smc, ATMEL_HSMC_NFC_IMR, &imr);
> +	regmap_read(nc->base.smc, ATMEL_HSMC_NFC_SR, &sr);
> +
> +	sr &= imr;
> +
> +	if (sr)
> +		regmap_write(nc->base.smc, ATMEL_HSMC_NFC_IDR, sr);
> +
> +	if (sr == imr)
> +		complete(&nc->complete);
> +
> +	return sr ? IRQ_HANDLED : IRQ_NONE;
> +}

It can be good as well to print out the error conditions. Not that it
changes the behavior of the driver but it can warn us about issues like
in the old function nfc_read_status().

Othewise, I'm okay with the patch, so you can add my:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
-- 
Nicolas Ferre
