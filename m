Received: from mail-eopbgr730135.outbound.protection.outlook.com
 ([40.107.73.135] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9Bg5-0000jK-BP
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 14:04:06 +0000
From: "Esponde, Joel" <Joel.Esponde@Honeywell.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek Vasut
 <marex@denx.de>
Subject: RE: [PATCH] mtd: spi-nor: fixed spansion quad enable
Date: Tue, 22 Nov 2016 14:02:48 +0000
Message-ID: <F6CD090A69E64C4289DC608E1C5D20242545AED8@DE08W1305.global.ds.honeywell.com>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242544AEF1@DE08W1305.global.ds.honeywell.com>
 <f45e1845-573f-d0b7-0f23-abd035f25945@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242545487D@DE08W1305.global.ds.honeywell.com>
 <eb2ce083-3854-a0a3-c82e-345b4de3dc26@atmel.com>
In-Reply-To: <eb2ce083-3854-a0a3-c82e-345b4de3dc26@atmel.com>
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

I apologize but I did not have time to work on this.
I will try to send you the patch this evening (European time).

Regards,

Jo=EBl Esponde
Honeywell | Safety and Productivity Solutions

> -----Message d'origine-----
> De=A0: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Envoy=E9=A0: mercredi 16 novembre 2016 13:58
> =C0=A0: Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
> mtd@lists.infradead.org; Marek Vasut <marex@denx.de>
> Objet=A0: Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
>=20
> Hi Joel,
>=20
> +Marek
>=20
> Le 24/10/2016 =E0 10:33, Esponde, Joel a =E9crit :
> > Hi Cyrille,
> >
> >> -----Message d'origine-----
> >> De : Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> >> Envoy=E9 : vendredi 21 octobre 2016 14:50 =C0 : Esponde, Joel
> >> <Joel.Esponde@Honeywell.com>; linux- mtd@lists.infradead.org Objet :
> >> Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
> >>
> >>>>> +	/* set SR & CR, enable quad I/O */
> >>>>>  	write_enable(nor);
> >>>>>
> >>>>>  	ret =3D write_sr_cr(nor, quad_en);
> >>>>>  	if (ret < 0) {
> >>>>> -		dev_err(nor->dev,
> >>>>> -			"error while writing configuration
> register\n");
> >>>>> +		dev_err(nor->dev, "error while writing SR and CR
> >>>> registers\n");
> >>>>>  		return -EINVAL;
> >>>>>  	}
> >>>>>
> >>>>> -	/* read back and check it */
> >>>>> +	ret =3D spi_nor_wait_till_ready(nor);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>
> >>> I think that this wait is required with every memories that store
> >>> Quad
> >> Enable bit in a non-volatile way.
> >>> I am using today a stripped down kernel with a rootfs based on UBIFS.
> >>> When this bit is set, UBIFS will start reading the memory 100ms after=
.
> >>> As this bit writing step takes up to 200ms, spansion memory is not
> >>> ready
> >> and UBIFS will fail when trying to read the content of the partition.
> >>> As UBIFS has a recovery mechanism, it will even broke the file system=
.
> >>>
> >>
> >> I agree with you about adding the spi_nor_wait_till_ready() call. I
> >> plan to add it in my SFDP patch for the spansion_new_quad_enable(), if
> not done yet.
> >>
> >
> > Good news !!
> > Because I think that this part of the patch is the most critical.
> > Without this, you may broke your filesystem so this is a big issue.
> >
> > Best regards,
> >
> > Jo=EBl
> >
>=20
> I've recently tested with two Winbond QSPI memories, W25Q256 and
> W25M512 and now I can confirm that the issue you reported also applies to
> those memories:
> if spi_nor_wait_till_ready() is not called after write_sr_cr(), the next =
SPI
> command may be sent too quickly and bad data may be read.
> Indeed, this issue occured in some bare metal (boot loader) code, when I
> performed a Fast Read 1-4-4 (EBh) command right after the Write Status
> Register
> (01h) command, without polling the BUSY bit with Read Status Register (05=
h)
> commands.
>=20
> Also the W25Q256 datasheet I have claims that the memory supports the
> Read Status Register2 (35h) however the data read from the SFDP table of
> my memory sample tells that the Quad Enable bit should be set only using
> the Write Status Register (01h) command with 2 data bytes (SR1 then SR2)
> and without using the Read Status Register 2 (35h) command:
>=20
> Indeed, bits[22:20] of the 15th dword in the Basic Flash Parameter Table
> (BFPT) are 100b and not 101b!
>=20
> 100b: QE is bit 1 of status register 2. It is set wia Write Status with t=
wo
>       data bytes where bit 1 of the second byte is one.
>=20
> 101b: QE is bit 1 of status register 2. Status register 1 is read using R=
ead
>       Status instruction 05h. Status register 2 is read using instruction=
 35h.
>       QE is set via Write Status instruction 01h with two data bytes wher=
e bit
>       1 of the second byte is one.
>=20
> I didn't test whether the datasheet is right and the 35h command is actua=
lly
> supported by those Winbond memories so their bits[22:20] of the 15th
> dword in the BFPT should have been set to 101b instead of 100b.
> However I'd rather be compliant with the JESD216B specification.
>=20
> So could you please send a new version of your patch adding only the
> spi_nor_wait_till_ready() call but without adding other read to the Statu=
s
> Register 2/Control Register 1 (35h)?
>=20
> The 2nd procedure, which uses the 35h instruction to check whether the
> Quad Enable bit has already been set, will be implemented by
> spansion_new_quad_enable() from the SFDP patch. I've already fixed this
> patch to add the call of spi_nor_wait_till_ready().
>=20
> With both your patch and mine, we will fix the issue and still be complia=
nt
> with the SFDP specification.
>=20
> Best regards,
>=20
> Cyrille
