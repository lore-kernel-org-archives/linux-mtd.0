Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnLBC-0008DN-Kt
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2018 09:55:00 +0000
Date: Wed, 8 Aug 2018 11:54:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: vf610_nfc: explicitly disable
 interrupts first
Message-ID: <20180808115437.34365451@xps13>
In-Reply-To: <20180806092909.28980-2-stefan@agner.ch>
References: <20180806092909.28980-1-stefan@agner.ch>
 <20180806092909.28980-2-stefan@agner.ch>
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

Hi Stefan,

Stefan Agner <stefan@agner.ch> wrote on Mon,  6 Aug 2018 11:29:08 +0200:

> Explicitly disable all interrupts on probe. This should be the
> default state, but the bootloader could leave the device in any
> state. No issues have been observed so far, but it is still worth
> fixing it.
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf61=
0_nfc.c
> index 740a91c5c86e..52e7811c0bde 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -130,8 +130,13 @@
>  #define CONFIG_PAGE_CNT_SHIFT			0
> =20
>  /* NFC_IRQ_STATUS Field */
> +#define WERR_IRQ_BIT				BIT(31)
> +#define DONE_IRQ_BIT				BIT(30)
>  #define IDLE_IRQ_BIT				BIT(29)
> +#define WERR_EN_BIT				BIT(22)
> +#define DONE_EN_BIT				BIT(21)
>  #define IDLE_EN_BIT				BIT(20)
> +#define WERR_CLEAR_BIT				BIT(19)
>  #define DONE_CLEAR_BIT				BIT(18)
>  #define IDLE_CLEAR_BIT				BIT(17)
> =20
> @@ -819,6 +824,10 @@ static int vf610_nfc_probe(struct platform_device *p=
dev)
> =20
>  	init_completion(&nfc->cmd_done);
> =20
> +	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, WERR_EN_BIT);
> +	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, DONE_EN_BIT);
> +	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
> +

Why not just one call with:

	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, WERR_EN_BIT | DONE_EN_BIT | IDLE_EN_B=
IT);

The comment applies for the next patch as well.

>  	err =3D devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, mtd=
);
>  	if (err) {
>  		dev_err(nfc->dev, "Error requesting IRQ!\n");

Thanks,
Miqu=C3=A8l
