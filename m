Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAyUr-0005Zt-6Y
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 14:00:57 +0000
Date: Tue, 24 Apr 2018 16:00:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ronak Desai <ronak.desai@rockwellcollins.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: Re: [PATCH] Added set feature command in FSL IFC nand controller
 driver for ONFI nand
Message-ID: <20180424160028.1de6cfb6@xps13>
In-Reply-To: <CADFuHZ6tJOVzhZOede_DvCbzBC_iJNJ4zpZtU4RtAp0sRJpOUw@mail.gmail.com>
References: <1523992259-56588-1-git-send-email-ronak.desai@rockwellcollins.com>
 <20180422190743.36e65119@xps13>
 <CADFuHZ4i52AxD6G3xf_RyWD7Z5bs-2-zXddMevBsKYkT=JTWCg@mail.gmail.com>
 <20180424115618.70438e41@xps13>
 <CADFuHZ6tJOVzhZOede_DvCbzBC_iJNJ4zpZtU4RtAp0sRJpOUw@mail.gmail.com>
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

Hi Ronak,

On Tue, 24 Apr 2018 08:51:48 -0500, Ronak Desai
<ronak.desai@rockwellcollins.com> wrote:

> On Tue, Apr 24, 2018 at 4:56 AM, Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > Hi Ronak,
> > =20
> >> >> +/**
> >> >> + * fsl_ifc_onfi_set_features- set features for ONFI nand
> >> >> + * @mtd: MTD device structure
> >> >> + * @chip: nand chip info structure
> >> >> + * @addr: feature address.
> >> >> + * @subfeature_param: the subfeature parameters, a four bytes arra=
y.
> >> >> + */
> >> >> +static int fsl_ifc_onfi_set_features(struct mtd_info *mtd, struct =
nand_chip *chip,
> >> >> +                     int addr, uint8_t *subfeature_param)
> >> >> +{
> >> >> +     int status;
> >> >> +     int i;
> >> >> +
> >> >> +#ifdef CONFIG_SYS_NAND_ONFI_DETECTION
> >> >> +     if (!chip->onfi_version ||
> >> >> +         !(le16_to_cpu(chip->onfi_params.opt_cmd)
> >> >> +           & ONFI_OPT_CMD_SET_GET_FEATURES))
> >> >> +             return -EINVAL;
> >> >> +#endif =20
> >> >
> >> > No need to do that, the core will take care of it, see [1]. =20
> >>
> >> Agree, I will remove this. =20
> >> > =20
> >> >> +
> >> >> +     /* Want data from start of the buffer */
> >> >> +     set_addr(mtd, 0, 0, 0); =20
> >> >
> >> > This is the only thing that differs from the core's implementation. I
> >> > see most of the time it is called from ->cmdfunc(), could you move it
> >> > there? If yes you could get rid of this entire hook and rely on the
> >> > core's function.
> >> > =20
> >> NAND_CMD_SET_FEATURES command sends the sub-feature param from flash
> >> buffer on the provided address and I added this here because I wanted
> >> to make sure
> >> that the data is set from start of the buffer. I looked at the core's
> >> implementation
> >> and I see that the NAND_CMD_SET_FEATURES  command is called first and =
then
> >> the data is filled into the buffer which will not work in case of my
> >> implementation.
> >> So, I will have to keep this here and the function, please suggest. I
> >> will wait for your
> >> feedback before submitting V2.  Moreover, I would suggest to check
> >> sequence in core's
> >> implementation as the command should run after setting the data and no=
t before. =20
> >
> > Not sure what you mean exactly by "NAND_CMD_SET_FEATURES is called first
> > and the data is filled into the buffer", could you please point out the
> > faulty section in the core so I can have a look?
> > =20
> I was pointing to the code in else part in "nand_set_features_op". FSL
> nand controller
> driver does not use "exec_op" so if I use nand_default_set_features
> from core as you suggested
> then code in the else part will be executed and as depicted below, the
> controller specific NAND_CMD_SET_FEATURES
> is called before writing the sub-feature parameters. Whereas in my
> implementation and I believe in general
> also you would want to call the controller specific "cmdfunc" only
> after writing the sub-feature parameters
> in buffer. Please correct me if I am missing anything here.
>=20
> 2193     } else {
> 2194         chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, feature, -1);
> 2195         for (i =3D 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
> 2196             chip->write_byte(mtd, params[i]);

The logic is supposedly the same between ->exec_op/->cmdfunc()
regarding this area, the NAND protocol requires the command
NAND_CMD_SET_FEATURES to be sent on the NAND bus together with 1/ the
feature (or address) and then 2/ the parameters. I don't think this is
wrong. You can check this matches the flowchart available p242 of the
ONFI specification [1].

>=20
> > Thanks,
> > Miqu=C3=A8l
> > =20
> >> >> +
> >> >> +     for (i =3D 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
> >> >> +             chip->write_byte(mtd, subfeature_param[i]);
> >> >> +
> >> >> +     chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, 0);

And this implementation does the opposite :)

> >> >> +
> >> >> +     status =3D chip->waitfunc(mtd, chip);
> >> >> +     if (status & NAND_STATUS_FAIL)
> >> >> +             return -EIO;
> >> >> +     return 0;
> >> >> +} =20
> >
> >
> > --
> > Miquel Raynal, Bootlin (formerly Free Electrons)
> > Embedded Linux and Kernel engineering
> > https://bootlin.com =20
>=20
>=20
>=20

[1] http://www.onfi.org/~/media/onfi/specs/onfi_4_0-gold.pdf?la=3Den

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
