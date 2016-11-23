Received: from mail-dm3nam03on0123.outbound.protection.outlook.com
 ([104.47.41.123] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9YXB-0004ww-Us
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2016 14:28:28 +0000
From: "Esponde, Joel" <Joel.Esponde@Honeywell.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2] mtd: spi-nor: fixed spansion quad enable
Date: Wed, 23 Nov 2016 14:27:23 +0000
Message-ID: <F6CD090A69E64C4289DC608E1C5D20242545B1DA@DE08W1305.global.ds.honeywell.com>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <1479853468-119195-1-git-send-email-joel.esponde@honeywell.com>
 <a60225d9-674e-422c-aa1b-ed232e8650cb@atmel.com>
In-Reply-To: <a60225d9-674e-422c-aa1b-ed232e8650cb@atmel.com>
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

Thanks for your explanations and patience!
I will try to avoid these "noob" mistakes next time! :-)

Jo=EBl Esponde
Honeywell | Safety and Productivity Solutions

> -----Message d'origine-----
> De=A0: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Envoy=E9=A0: mercredi 23 novembre 2016 11:39
> =C0=A0: Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
> mtd@lists.infradead.org
> Objet=A0: Re: [PATCH v2] mtd: spi-nor: fixed spansion quad enable
>=20
> Hi Joel,
>=20
> Le 22/11/2016 =E0 23:24, Jo=EBl Esponde a =E9crit :
> > With the S25FL127S nor flash part, each writing to the configuration re=
gister
> takes hundreds of ms. During that  time, no more accesses to the flash
> should be done (even reads).
> >
> > This commit adds a wait loop after the register writing until the flash
> finishes its work.
> >
> > This issue could make rootfs mounting fail when the latter was done too
> much closely to this quad enable bit setting step. And in this case, a dr=
iver as
> UBIFS may try to recover the filesystem and may broke it completely.
>=20
> Just few formal remarks about common usage and according to
> Documentation/process/submitting-patches.rst:
> - The summary phrase of the subject line should describe changes in
> imperative
>   mood, so please use something like
>   "mtd: spi-nor: fix spansion_quad_enable..." instead of
>   "mtd: spi-nor: fixED spansion_quad_enable...".
> - The commit message should be line wrapped at 75 columns.
> - You must add your "Signed-off-by:". It is mandatory to know who's
> introduced
>   the commit when browsing the logs.
>=20
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index d0fc165..a945122 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1255,7 +1255,11 @@ static int spansion_quad_enable(struct spi_nor
> *nor)
> >  		return -EINVAL;
> >  	}
> >
> > -	/* read back and check it */
> > +	ret =3D spi_nor_wait_till_ready(nor);
> > +	if (ret)
> I agree this is not done in macronix_quad_enable() but maybe a dev_err()
> message may notify about the reason of the failure, just like what is don=
e for
> write_sr_cr() and read_cr().
> This point is optional!
>=20
> > +		return ret;
> > +
> It seems there is a tab at the beginning of the empty line above.
>=20
> > +	/* read CR and check it */
> Your patch deals with the missing call of spi_nor_wait_till_ready() so th=
ere is
> no strong reason to also modify the comment about read_cr().
> The general idea is to make the patch modify only what needs to be.
>=20
> >  	ret =3D read_cr(nor);
> >  	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
> >  		dev_err(nor->dev, "Spansion Quad bit not set\n");
> >
>=20
> Finally, it may help you to run the scripts/checkpatch.pl tool on your pa=
tch so
> this script reports you any warnings and errors in the syntax before
> submitting your patch.
>=20
> Best regards,
>=20
> Cyrille
