Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCRkh-0006KI-NH
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 14:54:53 +0000
Date: Wed, 8 Nov 2017 15:54:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wenyou
 Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Kamal
 Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH v2 3/6] mtd: nand: use a static data_interface in
 the nand_chip structure
Message-ID: <20171108155429.790ede16@bbrezillon>
In-Reply-To: <20171107145419.22717-4-miquel.raynal@free-electrons.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-4-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue,  7 Nov 2017 15:54:16 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
> index 5d1533bcc5bd..5eac097be7f8 100644
> --- a/drivers/mtd/nand/nand_timings.c
> +++ b/drivers/mtd/nand/nand_timings.c
> @@ -283,17 +283,17 @@ const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode)
>  EXPORT_SYMBOL(onfi_async_timing_mode_to_sdr_timings);
>  
>  /**
> - * onfi_init_data_interface - [NAND Interface] Initialize a data interface from
> + * onfi_fill_data_interface - [NAND Interface] Initialize a data interface from
>   * given ONFI mode
> - * @iface: The data interface to be initialized
>   * @mode: The ONFI timing mode
>   */
> -int onfi_init_data_interface(struct nand_chip *chip,
> -			     struct nand_data_interface *iface,
> +int onfi_fill_data_interface(struct nand_chip *chip,
>  			     enum nand_data_interface_type type,
>  			     int timing_mode)
>  {
> -	if (type != NAND_SDR_IFACE)
> +	struct nand_data_interface *iface = &chip->data_interface;
> +
> +	if (iface->type != NAND_SDR_IFACE)

You should test type, not iface->type.
