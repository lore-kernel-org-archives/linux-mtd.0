Date: Fri, 17 Mar 2017 07:36:57 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
 linux-mtd@lists.infradead.org, jason@lakedaemon.net, andrew@lunn.ch,
 richard@nod.at, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH] mtd: nand: orion: fix clk handling
Message-ID: <20170317073657.7dee7c51@bbrezillon>
In-Reply-To: <20170316215031.GB27118@gandalf>
References: <20170312213406.20987-1-gmbnomis@gmail.com>
 <20170313071241.y5ydl274t22awrys@pengutronix.de>
 <20170316101211.332a53e0@bbrezillon>
 <20170316215031.GB27118@gandalf>
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

On Thu, 16 Mar 2017 22:50:31 +0100
Simon Baatz <gmbnomis@gmail.com> wrote:

> On Thu, Mar 16, 2017 at 10:12:11AM +0100, Boris Brezillon wrote:
> > On Mon, 13 Mar 2017 08:12:41 +0100
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:
> >  =20
> > > Hello Simon,
> > >=20
> > > On Sun, Mar 12, 2017 at 10:34:06PM +0100, Simon Baatz wrote: =20
> > > > The clk handling in orion_nand.c had two problems:
> > > >=20
> > > > - In the probe function, clk_put() was called for an enabled clock,
> > > >   which violates the API (see documentation for clk_put() in
> > > >   include/linux/clk.h)
> > > >=20
> > > > - In the error path of the probe function, clk_put() could be called
> > > >   twice for the same clock.
> > > >=20
> > > > In order to clean this up, use the managed function devm_clk_get() =
and
> > > > store the pointer to the clk in the driver data.
> > > >=20
> > > > Fixes: baffab28b13120694fa3ebab08d3e99667a851d2 ('ARM: Orion: fix d=
river probe error handling with respect to clk')
> > > > Cc: <stable@vger.kernel.org> # v4.5+
> > > > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> > > > ---
> > > >  drivers/mtd/nand/orion_nand.c | 42 +++++++++++++++++++++----------=
-----------
> > > >  1 file changed, 21 insertions(+), 21 deletions(-)
> > > >=20
> > > > diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion=
_nand.c
> > > > index 4a91c5d000be..b355aa738fae 100644
> > > > --- a/drivers/mtd/nand/orion_nand.c
> > > > +++ b/drivers/mtd/nand/orion_nand.c
> > > > @@ -23,6 +23,11 @@
> > > >  #include <asm/sizes.h>
> > > >  #include <linux/platform_data/mtd-orion_nand.h>
> > > > =20
> > > > +struct orion_nand_info {
> > > > +	struct nand_chip chip;
> > > > +	struct clk       *clk;
> > > > +};
> > > > +
> > > >  static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, uns=
igned int ctrl)
> > > >  {
> > > >  	struct nand_chip *nc =3D mtd_to_nand(mtd);
> > > > @@ -75,20 +80,21 @@ static void orion_nand_read_buf(struct mtd_info=
 *mtd, uint8_t *buf, int len)
> > > > =20
> > > >  static int __init orion_nand_probe(struct platform_device *pdev)
> > > >  {
> > > > +	struct orion_nand_info *info;
> > > >  	struct mtd_info *mtd;
> > > >  	struct nand_chip *nc;
> > > >  	struct orion_nand_data *board;
> > > >  	struct resource *res;
> > > > -	struct clk *clk;
> > > >  	void __iomem *io_base;
> > > >  	int ret =3D 0;
> > > >  	u32 val =3D 0;
> > > > =20
> > > > -	nc =3D devm_kzalloc(&pdev->dev,
> > > > -			sizeof(struct nand_chip),
> > > > +	info =3D devm_kzalloc(&pdev->dev,
> > > > +			sizeof(struct orion_nand_info),
> > > >  			GFP_KERNEL);
> > > > -	if (!nc)
> > > > +	if (!info)
> > > >  		return -ENOMEM;
> > > > +	nc =3D &info->chip;
> > > >  	mtd =3D nand_to_mtd(nc);
> > > > =20
> > > >  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > @@ -145,15 +151,13 @@ static int __init orion_nand_probe(struct pla=
tform_device *pdev)
> > > >  	if (board->dev_ready)
> > > >  		nc->dev_ready =3D board->dev_ready;
> > > > =20
> > > > -	platform_set_drvdata(pdev, mtd);
> > > > +	platform_set_drvdata(pdev, info);
> > > > =20
> > > >  	/* Not all platforms can gate the clock, so it is not
> > > >  	   an error if the clock does not exists. */
> > > > -	clk =3D clk_get(&pdev->dev, NULL);
> > > > -	if (!IS_ERR(clk)) {
> > > > -		clk_prepare_enable(clk);
> > > > -		clk_put(clk);
> > > > -	}
> > > > +	info->clk =3D devm_clk_get(&pdev->dev, NULL);
> > > > +	if (!IS_ERR(info->clk))
> > > > +		clk_prepare_enable(info->clk);   =20
> > >=20
> > > Orthogonal to your patch I suggest:
> > >=20
> > > -	info->clk =3D devm_clk_get(&pdev->dev, NULL);
> > > -	if (!IS_ERR(info->clk))
> > > -		clk_prepare_enable(info->clk);
> > > +	info->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> > > +	if (IS_ERR(info->clk)) {
> > > +		ret =3D PTR_ERR(info->clk);
> > > +		if (ret !=3D -EPROBE_DEFER)
> > > +			dev_err(...);
> > > +		return ret;
> > > +	}
> > >  =20
> >=20
> > In the meantime, maybe you can do:
> >=20
> > 	info->clk =3D devm_clk_get(&pdev->dev, NULL);
> > 	if (IS_ERR(info->clk)) {
> > 		ret =3D PTR_ERR(info->clk);
> >=20
> > 		if (ret =3D=3D -ENOENT) {
> > 			/*
> > 			 * This clk is optional, assign it to NULL when
> > 			 * it's not present.
> > 			 */
> > 			info->clk =3D NULL;
> > 		} else {
> > 			if (ret =3D=3D -EPROBE_DEFER)

I meant !=3D -EPROBE_DEFER here.

> > 				dev_err(...);
> >=20
> > 			return ret;
> > 		}
> > 	}
> >=20
> > This way, you won't have to check the info->clk value when you call
> > clk_prepare_enable() or clk_disable_unprepare().
> >  =20
>=20
> Yes, this makes things simpler. I will add a second patch improving
> the error handling in v2 as you and Uwe suggested.
>=20
>=20
> - Simon
