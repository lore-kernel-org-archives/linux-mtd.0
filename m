Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dXDLV-0003ki-Ab
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 21:14:27 +0000
Date: Mon, 17 Jul 2017 23:13:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: stefan@agner.ch, linux-mtd@lists.infradead.org, Fabio Estevam
 <fabio.estevam@nxp.com>
Subject: Re: [PATCH] mtd: nand: vf610: Check the return value from
 clk_prepare_enable()
Message-ID: <20170717231354.30550f43@bbrezillon>
In-Reply-To: <20170717230828.0c8853ca@bbrezillon>
References: <1500324959-7682-1-git-send-email-festevam@gmail.com>
 <20170717230828.0c8853ca@bbrezillon>
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

Le Mon, 17 Jul 2017 23:08:28 +0200,
Boris Brezillon <boris.brezillon@free-electrons.com> a =C3=A9crit :

> Le Mon, 17 Jul 2017 17:55:59 -0300,
> Fabio Estevam <festevam@gmail.com> a =C3=A9crit :
>=20
> > From: Fabio Estevam <fabio.estevam@nxp.com>
> >=20
> > clk_prepare_enable() may fail, so we should better check its return val=
ue
> > and propagate it in the case of error.
> >=20
> > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> > ---
> >  drivers/mtd/nand/vf610_nfc.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> > index 744ab10..9e49672 100644
> > --- a/drivers/mtd/nand/vf610_nfc.c
> > +++ b/drivers/mtd/nand/vf610_nfc.c
> > @@ -814,12 +814,16 @@ static int vf610_nfc_suspend(struct device *dev)
> > =20
> >  static int vf610_nfc_resume(struct device *dev)
> >  {
> > +	int err;
> > +
> >  	struct mtd_info *mtd =3D dev_get_drvdata(dev);
> >  	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> > =20
> >  	pinctrl_pm_select_default_state(dev); =20
>=20
> AFAICT pinctrl_pm_select_default_state() can also fail. What makes it
> different from clk_prepare_enable() failures?
>=20
> > =20
> > -	clk_prepare_enable(nfc->clk);
> > +	err =3D clk_prepare_enable(nfc->clk);
> > +	if (err)
> > +		return err;
> > =20
>=20
> I guess the idea was that clk_prepare_enabled already succeeded at probe
> time and there was not real reason for it to fail at resume time. But
> extra checks are never bad. BTW, I don't remember what happens if
> ->resume() returns an error. Does it prevent the whole system from =20
> resuming or just make this specific device unusable?

Just found the answer [1]: it's harmless.

[1]http://elixir.free-electrons.com/linux/latest/source/include/linux/pm.h#=
L262
