Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJKv-0003hv-Dj
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:58:16 +0000
Date: Tue, 4 Sep 2018 23:57:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Kees Cook
 <keescook@chromium.org>
Subject: Re: [PATCH] mtd: rawnand: jz4780: use struct_size() in devm_kzalloc()
Message-ID: <20180904235750.3e34397d@xps13>
In-Reply-To: <20180823193332.GA31602@embeddedor.com>
References: <20180823193332.GA31602@embeddedor.com>
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

Hi Gustavo,

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote on Thu, 23 Aug
2018 14:33:32 -0500:

> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>=20
> struct foo {
> 	int stuff;
>         void *entry[];
> };
>=20
> instance =3D devm_kzalloc(dev, sizeof(struct foo) + sizeof(void *) * coun=
t, GFP_KERNEL);
>=20
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
>=20
> instance =3D devm_kzalloc(dev, struct_size(instance, entry, count), GFP_K=
ERNEL);
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/nand/raw/jz4780_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz=
4780_nand.c
> index db4fa60..ac62395 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -352,7 +352,7 @@ static int jz4780_nand_probe(struct platform_device *=
pdev)
>  		return -ENODEV;
>  	}
> =20
> -	nfc =3D devm_kzalloc(dev, sizeof(*nfc) + (sizeof(nfc->cs[0]) * num_bank=
s), GFP_KERNEL);
> +	nfc =3D devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
>  	if (!nfc)
>  		return -ENOMEM;
> =20

Applied to nand/next.

Thanks,
Miqu=C3=A8l
