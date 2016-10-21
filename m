Received: from mail-by2nam01on0098.outbound.protection.outlook.com
 ([104.47.34.98] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxXDN-0005sj-Hp
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 10:38:18 +0000
From: "Esponde, Joel" <Joel.Esponde@Honeywell.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: spi-nor: fixed spansion quad enable
Date: Fri, 21 Oct 2016 10:37:35 +0000
Message-ID: <F6CD090A69E64C4289DC608E1C5D20242544AEF1@DE08W1305.global.ds.honeywell.com>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
In-Reply-To: <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
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

First, thanks for your comments !
Please, see below mines.

> -----Message d'origine-----
> De=A0: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Envoy=E9=A0: jeudi 20 octobre 2016 17:23
> =C0=A0: Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
> mtd@lists.infradead.org
> Objet=A0: Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
>=20
> Hi Jo=EBl,
>=20
> Le 20/10/2016 =E0 15:43, Jo=EBl Esponde a =E9crit :
> > With the S25FL127S nor flash part, each writing to the configuration re=
gister
> takes hundreds of ms. During that  time, no more accesses to the flash
> should be done (even reads).
> >
> > This commit adds:
> > - a pre check of the quad enable bit to avoid a useless and time
> > consuming writing to the flash,
> > - a wait loop after the register writing until the flash finishes its w=
ork.
> >
> > This issue could make rootfs mounting fail when the latter was done too
> much closely to this quad enable bit setting step. And in this case, a dr=
iver as
> UBIFS may try to recover the filesystem and may broke it completely.
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++----
> >  1 file changed, 27 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > b/drivers/mtd/spi-nor/spi-nor.c index d0fc165..df43cd7 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1246,18 +1246,41 @@ static int spansion_quad_enable(struct spi_nor
> *nor)
> >  	int ret;
> >  	int quad_en =3D CR_QUAD_EN_SPAN << 8;
> >
> > +	/* check quad enable bit
> > +	 * as S25FL127S takes 200 ms to execute each write of SR & CR
> > +	 * registers even if data is the same, write step will be shorted
> > +	 * if not needed
> > +	 */
> > +	ret =3D read_cr(nor);
>=20
> Sorry but the Read Configuration Register (35h) command is not supported
> by all Spansion (or Spansion-like) memories.

I have a doubt here, if this is really the case, why read_cr() is already c=
alled at the end of the current implementation of the spansion_quad_enable(=
) function to check that quad enable bit is set?=20

> For more details, please refer to the JEDEC JESD216B specification, espec=
ially
> the part dealing with the "Quad Enable Requirements". An extract of this
> specification can also be found in this patch:
> https://patchwork.ozlabs.org/patch/678408/
>=20
> Please have a look at values 001b, 100b and 101b for the bits[22:20] of t=
he
> 15th DWORD.
>=20
> I think your patch is likely to introduce a regression on some old memory
> parts.
>=20
> However, *if* your S25FL127S memory implements the SFDP tables
> correctly, bits[22:20] of the 15th DWORD should be set to 101b, hence usi=
ng
> SFDP patch above should fix the issue:
> spansion_new_quad_enable() will be called instead of the current
> spansion_quad_enable(). This new function adds the very same test on the
> Quad Enable bit as your patch does.
>=20
> If you want to test the SFDP patch, you will need to apply the whole seri=
es
> which introduces some improvement on QSPI memory support:
> http://lists.infradead.org/pipermail/linux-mtd/2016-October/069554.html

Your patch using SFDP to dynamically manage memories seems really great (fr=
om a feature point of view, I am not yet able to have an opinion on the imp=
lementation...).

>=20
> I'm just cautious with Spansion memories: I tested one sample, and I gues=
s it
> was a S25FL127S, which claimed to be compliant with JESD216 rev B (minor =
6)
> but words after the 9th one were all 0xffffffff.
> JESD216 (minor 0) describes only 9 DWORDs in the Basic Flash Parameter
> Table
> JESD216 rev A (minor 5) introduces 7 new DWORDS, hence 16 DWORDS in the
> (BFPT).
> the 15th DWORD provides the Quad Enable Requirements, which describes
> the procedure to set the Quad Enable bit.
>=20
> If the BFPT of your S25FL127S is incomplete but the memory still claiming=
 to
> be
> JESD216 rev B compliant, neither spansion_quad_enable() nor
> spansion_new_quad_enable() would be called. Since the Quad Enable bit is
> non-volatile on Spansion memories, it will work if the bit as already bee=
n set
> before.
>=20

See below for code that should be IMO added because of the non-volatibility=
 of spansion memories.

> > +	if (ret < 0) {
> > +		dev_err(nor->dev, "error %d reading CR\n", ret);
> > +		return ret;
> > +	}
> > +	if (ret & CR_QUAD_EN_SPAN) {
> > +		/* quad enable bit is already set */
> > +		return 0;
> > +	}
> > +
> > +	/* set SR & CR, enable quad I/O */
> >  	write_enable(nor);
> >
> >  	ret =3D write_sr_cr(nor, quad_en);
> >  	if (ret < 0) {
> > -		dev_err(nor->dev,
> > -			"error while writing configuration register\n");
> > +		dev_err(nor->dev, "error while writing SR and CR
> registers\n");
> >  		return -EINVAL;
> >  	}
> >
> > -	/* read back and check it */
> > +	ret =3D spi_nor_wait_till_ready(nor);
> > +	if (ret)
> > +		return ret;
> > +

I think that this wait is required with every memories that store Quad Enab=
le bit in a non-volatile way.
I am using today a stripped down kernel with a rootfs based on UBIFS.
When this bit is set, UBIFS will start reading the memory 100ms after.
As this bit writing step takes up to 200ms, spansion memory is not ready an=
d UBIFS will fail when trying to read the content of the partition.
As UBIFS has a recovery mechanism, it will even broke the file system.

> > +	/* read CR and check it */
> >  	ret =3D read_cr(nor);
> > -	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
> > +	if (ret < 0) {
> > +		dev_err(nor->dev, "error %d reading CR\n", ret);
> > +		return ret;
> > +	}

This test on the validity of the returned data may also be useful.
When negative errors are returned, it is likely that the CR_QUAD_EN_SPAN bi=
t is set, and so, next test may be meaningless...

> > +	if (!(ret & CR_QUAD_EN_SPAN)) {
> >  		dev_err(nor->dev, "Spansion Quad bit not set\n");
> >  		return -EINVAL;
> >  	}
> >

Best regards,
Jo=EBl
