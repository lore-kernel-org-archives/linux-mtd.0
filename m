Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdGb7-000276-5m
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 13:23:23 +0000
Date: Mon, 13 Feb 2017 14:22:50 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe LEROY <christophe.leroy@c-s.fr>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpio: make nCE GPIO optional
Message-ID: <20170213142250.7a10768a@bbrezillon>
In-Reply-To: <9cadc95b-dc67-9756-c244-9ce452ebeaf7@c-s.fr>
References: <20170210140110.87903682E7@localhost.localdomain>
 <20170213113024.6033990a@bbrezillon>
 <9cadc95b-dc67-9756-c244-9ce452ebeaf7@c-s.fr>
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

On Mon, 13 Feb 2017 13:58:24 +0100
Christophe LEROY <christophe.leroy@c-s.fr> wrote:

> Le 13/02/2017 =C3=A0 11:30, Boris Brezillon a =C3=A9crit :
> > On Fri, 10 Feb 2017 15:01:10 +0100 (CET)
> > Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > =20
> >> On some hardware, the nCE signal is wired to the ChipSelect associated
> >> to bus address of the NAND, so it is automatically driven during the
> >> memory access and it is not managed by a GPIO. =20
> >
> > Hm, I'm not sure how this can work, because, AFAIR, the nCE line needs
> > to stay low for the whole CMD+ADDR[+CMD] cycle, and with your patch
> > it's not guaranteed. =20
>=20
> Anyway, the patch just makes it possible to register the device=20
> allthough nCE GPIO is not defined.
> For people defining the nCE GPIO properly, the patch introduces no=20
> change at all.

Yes, I know that, just wanted to make sure that not explicitly
controlling the CE line was permitted. Modern controllers are indeed
controlling the CE line, but they usually ask you to specify the whole
CMD+ADDR[+CMD][+DATA] sequence.

>=20
> >
> > Can you tell us more about your NAND controller? =20
>=20
> [    0.498490] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> [    0.504906] nand: Micron MT29F2G08ABAEAWP
> [    0.508918] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048,=
=20
> OOB size: 64
>=20
> Diagrams on datasheet shows that CE\ can optionnaly go up between each=20
> access. See attached exemple.

I had a closer look at several datasheets (and the ONFI spec), and it
seems to be allowed as long as you follow the tCS and tCH requirements,
which I guess your controller is ensuring.

>=20
>=20
>=20
> > =20
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >> ---
> >>  drivers/mtd/nand/gpio.c | 18 ++++++++++++------
> >>  1 file changed, 12 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> >> index 0d24857..85294f1 100644
> >> --- a/drivers/mtd/nand/gpio.c
> >> +++ b/drivers/mtd/nand/gpio.c
> >> @@ -78,7 +78,9 @@ static void gpio_nand_cmd_ctrl(struct mtd_info *mtd,=
 int cmd, unsigned int ctrl)
> >>  	gpio_nand_dosync(gpiomtd);
> >>
> >>  	if (ctrl & NAND_CTRL_CHANGE) {
> >> -		gpio_set_value(gpiomtd->plat.gpio_nce, !(ctrl & NAND_NCE));
> >> +		if (gpio_is_valid(gpiomtd->plat.gpio_nce))
> >> +			gpio_set_value(gpiomtd->plat.gpio_nce,
> >> +				       !(ctrl & NAND_NCE));
> >>  		gpio_set_value(gpiomtd->plat.gpio_cle, !!(ctrl & NAND_CLE));
> >>  		gpio_set_value(gpiomtd->plat.gpio_ale, !!(ctrl & NAND_ALE));
> >>  		gpio_nand_dosync(gpiomtd);
> >> @@ -201,7 +203,8 @@ static int gpio_nand_remove(struct platform_device=
 *pdev)
> >>
> >>  	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
> >>  		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
> >> -	gpio_set_value(gpiomtd->plat.gpio_nce, 1);
> >> +	if (gpio_is_valid(gpiomtd->plat.gpio_nce))
> >> +		gpio_set_value(gpiomtd->plat.gpio_nce, 1);
> >>
> >>  	return 0;
> >>  }
> >> @@ -239,10 +242,13 @@ static int gpio_nand_probe(struct platform_devic=
e *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>
> >> -	ret =3D devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND =
NCE");
> >> -	if (ret)
> >> -		return ret;
> >> -	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
> >> +	if (gpio_is_valid(gpiomtd->plat.gpio_nce)) {
> >> +		ret =3D devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce,
> >> +					"NAND NCE");
> >> +		if (ret)
> >> +			return ret;
> >> +		gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
> >> +	}
> >>
> >>  	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
> >>  		ret =3D devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nwp, =20
