Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAugY-0004c2-HH
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 09:56:59 +0000
Date: Tue, 24 Apr 2018 11:56:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ronak Desai <ronak.desai@rockwellcollins.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: Re: [PATCH] Added set feature command in FSL IFC nand controller
 driver for ONFI nand
Message-ID: <20180424115618.70438e41@xps13>
In-Reply-To: <CADFuHZ4i52AxD6G3xf_RyWD7Z5bs-2-zXddMevBsKYkT=JTWCg@mail.gmail.com>
References: <1523992259-56588-1-git-send-email-ronak.desai@rockwellcollins.com>
 <20180422190743.36e65119@xps13>
 <CADFuHZ4i52AxD6G3xf_RyWD7Z5bs-2-zXddMevBsKYkT=JTWCg@mail.gmail.com>
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

> >> +/**
> >> + * fsl_ifc_onfi_set_features- set features for ONFI nand
> >> + * @mtd: MTD device structure
> >> + * @chip: nand chip info structure
> >> + * @addr: feature address.
> >> + * @subfeature_param: the subfeature parameters, a four bytes array.
> >> + */
> >> +static int fsl_ifc_onfi_set_features(struct mtd_info *mtd, struct nan=
d_chip *chip,
> >> +                     int addr, uint8_t *subfeature_param)
> >> +{
> >> +     int status;
> >> +     int i;
> >> +
> >> +#ifdef CONFIG_SYS_NAND_ONFI_DETECTION
> >> +     if (!chip->onfi_version ||
> >> +         !(le16_to_cpu(chip->onfi_params.opt_cmd)
> >> +           & ONFI_OPT_CMD_SET_GET_FEATURES))
> >> +             return -EINVAL;
> >> +#endif =20
> >
> > No need to do that, the core will take care of it, see [1]. =20
>=20
> Agree, I will remove this.
> > =20
> >> +
> >> +     /* Want data from start of the buffer */
> >> +     set_addr(mtd, 0, 0, 0); =20
> >
> > This is the only thing that differs from the core's implementation. I
> > see most of the time it is called from ->cmdfunc(), could you move it
> > there? If yes you could get rid of this entire hook and rely on the
> > core's function.
> > =20
> NAND_CMD_SET_FEATURES command sends the sub-feature param from flash
> buffer on the provided address and I added this here because I wanted
> to make sure
> that the data is set from start of the buffer. I looked at the core's
> implementation
> and I see that the NAND_CMD_SET_FEATURES  command is called first and then
> the data is filled into the buffer which will not work in case of my
> implementation.
> So, I will have to keep this here and the function, please suggest. I
> will wait for your
> feedback before submitting V2.  Moreover, I would suggest to check
> sequence in core's
> implementation as the command should run after setting the data and not b=
efore.

Not sure what you mean exactly by "NAND_CMD_SET_FEATURES is called first
and the data is filled into the buffer", could you please point out the
faulty section in the core so I can have a look?

Thanks,
Miqu=C3=A8l

> >> +
> >> +     for (i =3D 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
> >> +             chip->write_byte(mtd, subfeature_param[i]);
> >> +
> >> +     chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, 0);
> >> +
> >> +     status =3D chip->waitfunc(mtd, chip);
> >> +     if (status & NAND_STATUS_FAIL)
> >> +             return -EIO;
> >> +     return 0;
> >> +}


--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
