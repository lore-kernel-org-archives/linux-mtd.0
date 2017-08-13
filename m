Date: Sun, 13 Aug 2017 10:02:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: mtk: fix error return code in mtk_ecc_probe()
Message-ID: <20170813100212.57ad0b65@bbrezillon>
In-Reply-To: <20170809163521.GA4941@embeddedgus>
References: <20170809163521.GA4941@embeddedgus>
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

Le Wed, 9 Aug 2017 11:35:21 -0500,
"Gustavo A. R. Silva" <gustavo@embeddedor.com> a =C3=A9crit :

> platform_get_irq() returns an error code, but the mtk_ecc driver
> ignores it and always returns -EINVAL. This is not correct and,
> prevents -EPROBE_DEFER from being propagated properly.
>=20
> Print and propagate the return value of platform_get_irq on failure.
>=20
> This issue was detected with the help of Coccinelle.

Applied.

Thanks,

Boris

>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/nand/mtk_ecc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
> index 6c3a4aa..7f3b065 100644
> --- a/drivers/mtd/nand/mtk_ecc.c
> +++ b/drivers/mtd/nand/mtk_ecc.c
> @@ -464,8 +464,8 @@ static int mtk_ecc_probe(struct platform_device *pdev)
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get irq\n");
> -		return -EINVAL;
> +		dev_err(dev, "failed to get irq: %d\n", irq);
> +		return irq;
>  	}
> =20
>  	ret =3D dma_set_mask(dev, DMA_BIT_MASK(32));
