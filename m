Received: from mail-co1nam03on0124.outbound.protection.outlook.com
 ([104.47.40.124] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byaho-0000LK-Ez
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 08:34:05 +0000
From: "Esponde, Joel" <Joel.Esponde@Honeywell.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: spi-nor: fixed spansion quad enable
Date: Mon, 24 Oct 2016 08:33:11 +0000
Message-ID: <F6CD090A69E64C4289DC608E1C5D20242545487D@DE08W1305.global.ds.honeywell.com>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242544AEF1@DE08W1305.global.ds.honeywell.com>
 <f45e1845-573f-d0b7-0f23-abd035f25945@atmel.com>
In-Reply-To: <f45e1845-573f-d0b7-0f23-abd035f25945@atmel.com>
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

> -----Message d'origine-----
> De=A0: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Envoy=E9=A0: vendredi 21 octobre 2016 14:50
> =C0=A0: Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
> mtd@lists.infradead.org
> Objet=A0: Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
>=20
> >>> +	/* set SR & CR, enable quad I/O */
> >>>  	write_enable(nor);
> >>>
> >>>  	ret =3D write_sr_cr(nor, quad_en);
> >>>  	if (ret < 0) {
> >>> -		dev_err(nor->dev,
> >>> -			"error while writing configuration register\n");
> >>> +		dev_err(nor->dev, "error while writing SR and CR
> >> registers\n");
> >>>  		return -EINVAL;
> >>>  	}
> >>>
> >>> -	/* read back and check it */
> >>> +	ret =3D spi_nor_wait_till_ready(nor);
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >
> > I think that this wait is required with every memories that store Quad
> Enable bit in a non-volatile way.
> > I am using today a stripped down kernel with a rootfs based on UBIFS.
> > When this bit is set, UBIFS will start reading the memory 100ms after.
> > As this bit writing step takes up to 200ms, spansion memory is not read=
y
> and UBIFS will fail when trying to read the content of the partition.
> > As UBIFS has a recovery mechanism, it will even broke the file system.
> >
>=20
> I agree with you about adding the spi_nor_wait_till_ready() call. I plan =
to add
> it in my SFDP patch for the spansion_new_quad_enable(), if not done yet.
>=20

Good news !!
Because I think that this part of the patch is the most critical.
Without this, you may broke your filesystem so this is a big issue.

Best regards,

Jo=EBl
