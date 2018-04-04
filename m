Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3bu0-0007PX-77
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 06:28:14 +0000
Date: Wed, 4 Apr 2018 08:28:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xidong Wang <wangxidong_97@163.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Marc Gonzalez
 <marc.w.gonzalez@free.fr>, Mans Rullgard <mans@mansr.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] mtd:nand:fix memory leak
Message-ID: <20180404082807.0f211578@xps13>
In-Reply-To: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
References: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
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

Hi Xidong,

As part of a reorganization in the NAND subsystem, you should now
prefix your commit title this way:

        mtd: rawnand: tango: fix memory leak

Not sure if this patch is candidate to cc:stable?

On Wed,  4 Apr 2018 11:05:51 +0800, Xidong Wang
<wangxidong_97@163.com> wrote:

> In function tango_nand_probe(), the memory allocated by
> clk_get() is not released on the normal path and
> the error path that IS_ERR(nfc->chan) returns true.

The fact that the error path returns true looks out of topic, can you
remove it? Just saying that you fix a memory leak is enough I guess.

> This will result in a memory leak bug.
>=20
> Signed-off-by: Xidong Wang <wangxidong_97@163.com>
> ---
>  drivers/mtd/nand/tango_nand.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index c5bee00b..8083459 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -648,12 +648,15 @@ static int tango_nand_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(clk);
> =20
>  	nfc->chan =3D dma_request_chan(&pdev->dev, "rxtx");
> -	if (IS_ERR(nfc->chan))
> +	if (IS_ERR(nfc->chan)) {
> +		clk_put(clk);
>  		return PTR_ERR(nfc->chan);
> +	}
> =20
>  	platform_set_drvdata(pdev, nfc);
>  	nand_hw_control_init(&nfc->hw);
>  	nfc->freq_kHz =3D clk_get_rate(clk) / 1000;
> +	clk_put(clk);

If the clock is used only here, better do the frequency derivation
right after the clock_get(), and follow with a clk_put()? This way you
don't have to change the error path and 'related' actions remain
grouped.

Thanks for fixing this,
Miqu=C3=A8l


--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
