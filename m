Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiOxO-00022a-VP
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 09:47:51 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from NAND
	device
Date: Mon, 9 Aug 2010 11:43:00 +0200
References: <201007290047.06394.ffainelli@freebox.fr>
	<201008021355.52744.ffainelli@freebox.fr>
	<4C5FC97E.3030506@parrot.com>
In-Reply-To: <4C5FC97E.3030506@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201008091143.00480.ffainelli@freebox.fr>
Cc: Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Monday 09 August 2010 11:25:18 Matthieu CASTET wrote:
> Hi Florian,
>=20
> Florian Fainelli a =C3=A9crit :
> > Hi Matthieu,
> >=20
> > On Monday 02 August 2010 11:25:49 Matthieu CASTET wrote:
> >> Florian Fainelli a =C3=A9crit :
> >>> Hi Matthieu,
> >>>=20
> >>> On Thursday 29 July 2010 09:54:20 Matthieu CASTET wrote:
> >>>> Hi,
> >>>>=20
> >>>>=20
> >>>> Also you don't handle endianness (integer are little endian) for val=
ue
> >>>> in nand_onfi_params.
> >>>=20
> >>> Yes, so far the drivers using those values were doing the correct
> >>> endian conversion when they need to use them.
> >>=20
> >> In that case use le16, le32, ... type. Also prefer kernel type over
> >> uintx_t type.
> >>=20
> >>>> This won't work this unknown nand, and not work with some LP nand th=
at
> >>>> doesn't provide additional id bytes.
> >>>=20
> >>> So how do you see things regarding the provisioning of the relevant
> >>> ONFI parameters?
> >>=20
> >> I will see something like in the patch attached in
> >> http://article.gmane.org/gmane.linux.drivers.mtd/30935.
> >>=20
> >> ONFI parsing is done early in nand_get_flash_type (unknow chip or LP
> >> nand). If the ONFI parsing is ok we bypass the old identification
> >> method (additional id bytes).
> >=20
> > Looks ok to me.
> >=20
> >> As an example I attach a patch that mix your patch and mine.
> >>=20
> >>=20
> >> Matthieu
> >>=20
> >> PS : the NAND_ONFI flags seems useless, we can use onfi_version (0 mea=
ns
> >> no onfi).
> >=20
> > Right, thanks for noticing that.
> >=20
> > I got a couple of comments on your patch that I inlined, the rest looks
> > good.
> > --
> >=20
> > +#if 1
> > +       chip->onfi_version =3D 0;
> > +       if (!type->name || !type->pagesize) {
> > +               /* try ONFI for unknow chip or LP */
> > +               chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
> > +               if (chip->read_byte(mtd) =3D=3D 'O' &&
> > +                       chip->read_byte(mtd) =3D=3D 'N' &&
> > +                       chip->read_byte(mtd) =3D=3D 'F' &&
> > +                       chip->read_byte(mtd) =3D=3D 'I') {
> >=20
> > Why not use what was in our original patch and do the memcmp? That looks
> > cleaner to me and allows to invert the logic on the if statement to get
> > the code cleaner. That's just cosmetic anyway.
>=20
> I wanted to avoid to use read_buf, because some advanced controller
> (those who implement cmdfunc) need to overrides all io access.

Ok.

> But some driver assumed  that nand_scan_ident only used read_byte. That
> the case of the denali driver [1]. Using it will cause random read in
> memory and likely a kernel panic.

Ok, then I will update it as part as the patch adding ONFI reading so that =
it=20
is future-proof anyway.

>=20
> But we need read_buf for reading onfi page. Also these advanced
> controllers will break because they won't handle correctly in cmdfunc
> new NAND_CMD_READID and NAND_CMD_PARAM.
>=20
> I don't know what the best way to handle them.

Such driver need to handle those anyway.

>=20
> > +                       if (i < 3) {
> > +                               /* check version */
> > +                               int val =3D le16_to_cpu(p->revision);
> > +                               if (!is_power_of_2(val) || val =3D=3D 1=
 ||
> > val > (1 << 4)) {
> >=20
> > the !is_power_of_2 check does not work for ONFI version 2.1 (3), so I
> > would only keep the two other checks.
>=20
> Ok.
>=20
> Will you take care to post a new patch ?

Sure, thanks for your follow-up.

>=20
>=20
> Matthieu
>=20
>=20
> [1]
> /* register the driver with the NAND core subsystem */
>      denali->nand.select_chip =3D denali_select_chip;
>      denali->nand.cmdfunc =3D denali_cmdfunc;
>      denali->nand.read_byte =3D denali_read_byte;
>      denali->nand.waitfunc =3D denali_waitfunc;
>=20
>      /* scan for NAND devices attached to the controller
>       * this is the first stage in a two step process to register
>       * with the nand subsystem */
>      if (nand_scan_ident(&denali->mtd, LLD_MAX_FLASH_BANKS, NULL))
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
