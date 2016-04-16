Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arKoI-0006az-7Q
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 07:38:31 +0000
Date: Sat, 16 Apr 2016 09:38:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Haavard Skinnemoen
 <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre
 <nicolas.ferre@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Alan Stern
 <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 03/12] avr32: set Atmel NAND ECC algorithm explicitly
Message-ID: <20160416093806.7da3d660@bbrezillon>
In-Reply-To: <1460750052-16285-4-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-4-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 15 Apr 2016 21:54:03 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).

Not sure we really need to add this ->ecc_algo field: none of the
existing AVR32 boards use software BCH implementation, and I don't
expect to see new AVR32 boards :-). How about setting NAND_ECC_HAMMING
when ecc_mode =3D=3D NAND_ECC_SOFT directly in the atmel_nand driver?

>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  arch/avr32/boards/atngw100/setup.c      | 1 +
>  arch/avr32/boards/atstk1000/atstk1002.c | 1 +
>  include/linux/platform_data/atmel.h     | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/arch/avr32/boards/atngw100/setup.c b/arch/avr32/boards/atngw=
100/setup.c
> index afeae89..b059b97 100644
> --- a/arch/avr32/boards/atngw100/setup.c
> +++ b/arch/avr32/boards/atngw100/setup.c
> @@ -98,6 +98,7 @@ static struct atmel_nand_data atngw100mkii_nand_data __=
initdata =3D {
>  	.enable_pin	=3D GPIO_PIN_PE(23),
>  	.bus_width_16	=3D true,
>  	.ecc_mode	=3D NAND_ECC_SOFT,
> +	.ecc_algo	=3D NAND_ECC_HAMMING,
>  	.parts		=3D nand_partitions,
>  	.num_parts	=3D ARRAY_SIZE(nand_partitions),
>  };
> diff --git a/arch/avr32/boards/atstk1000/atstk1002.c b/arch/avr32/boards/=
atstk1000/atstk1002.c
> index 6c80aba..6b45faf 100644
> --- a/arch/avr32/boards/atstk1000/atstk1002.c
> +++ b/arch/avr32/boards/atstk1000/atstk1002.c
> @@ -96,6 +96,7 @@ static struct atmel_nand_data atstk1006_nand_data __ini=
tdata =3D {
>  	.rdy_pin	=3D GPIO_PIN_PB(30),
>  	.enable_pin	=3D GPIO_PIN_PB(29),
>  	.ecc_mode	=3D NAND_ECC_SOFT,
> +	.ecc_algo	=3D NAND_ECC_HAMMING,
>  	.parts		=3D nand_partitions,
>  	.num_parts	=3D ARRAY_SIZE(nand_partitions),
>  };
> diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform=
_data/atmel.h
> index 3c8825b..a283b3d 100644
> --- a/include/linux/platform_data/atmel.h
> +++ b/include/linux/platform_data/atmel.h
> @@ -33,6 +33,7 @@ struct atmel_nand_data {
>  	u8		cle;			/* address line number connected to CLE */
>  	u8		bus_width_16;		/* buswidth is 16 bit */
>  	u8		ecc_mode;		/* ecc mode */
> +	enum nand_ecc_algo ecc_algo;		/* ecc algorithm */
>  	u8		on_flash_bbt;		/* bbt on flash */
>  	struct mtd_partition *parts;
>  	unsigned int	num_parts;



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
