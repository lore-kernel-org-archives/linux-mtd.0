Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f45mp-0001RJ-5t
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 14:22:49 +0000
Date: Thu, 5 Apr 2018 16:22:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Xidong Wang
 <wangxidong_97@163.com>, Mans Rullgard <mans@mansr.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Marc
 Gonzalez" <marc.w.gonzalez@free.fr>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: rawnand: tango: Fix struct clk memory leak
Message-ID: <20180405162233.4e1dfdcd@xps13>
In-Reply-To: <8cffd501-b83f-8140-9cc6-021fcd90e277@sigmadesigns.com>
References: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
 <20180404082807.0f211578@xps13>
 <20180404090710.4f74b5b4@bbrezillon>
 <8cffd501-b83f-8140-9cc6-021fcd90e277@sigmadesigns.com>
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

Hi Marc,

On Thu, 5 Apr 2018 14:57:59 +0200, Marc Gonzalez
<marc_gonzalez@sigmadesigns.com> wrote:

> Use devm_clk_get() to let Linux manage struct clk memory.
>=20
> Fixes: 6956e2385a16 ("add tango NAND flash controller support")
> Reported-by: Xidong Wang <wangxidong_97@163.com>
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
> Missing clk_prepare_enable() would be handled in a separate patch.
> ---
>  drivers/mtd/nand/tango_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index c5bee00b7f5e..76761b841f1f 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -643,7 +643,7 @@ static int tango_nand_probe(struct platform_device *p=
dev)
> =20
>  	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
> =20
> -	clk =3D clk_get(&pdev->dev, NULL);
> +	clk =3D devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
> =20

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
