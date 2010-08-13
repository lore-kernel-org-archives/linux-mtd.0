Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ojq8F-0003pw-Bu
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2010 09:00:56 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] NAND: add support for reading ONFI parameters from
	NAND device
Date: Fri, 13 Aug 2010 11:00:38 +0200
References: <201008121453.50207.ffainelli@freebox.fr>
	<201008122147.54733.ffainelli@freebox.fr>
	<4C64F34F.8020402@parrot.com>
In-Reply-To: <4C64F34F.8020402@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201008131100.38707.ffainelli@freebox.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Friday 13 August 2010 09:25:03 Matthieu CASTET wrote:
> Hello,
>=20
> Florian Fainelli a =E9crit :
> > Hello Brian,
> >=20
> > Le Thursday 12 August 2010 20:57:42, Brian Norris a =E9crit :
> >> Hello,
> >>=20
> >> I've got a few comments and a patch; I cannot test them, though,
> >> just build.
> >>=20
> >> On 08/12/2010 05:53 AM, Florian Fainelli wrote:
> >>> +static u16 onfi_crc(u16 crc, unsigned char const *p, size_t len)
> >>> +{
> >>> +   int i;
> >>> +   while (len--) {
> >>> +           crc ^=3D *p++<<  8;
> >>> +           for (i =3D 0; i<  8; i++)
> >>> +                   crc =3D (crc<<  1) ^ ((crc&  0x8000) ? 0x8005 : 0=
);
> >>> +   }
> >>> +   return crc;
> >>> +}
> >>=20
> >> Can this function safely be replaced by the library function crc16?
> >> #include <linux/crc16.h>
> >> u16 crc16(u16 crc, u8 const *buffer, size_t len);
> >=20
> > Certainly, thanks for noticing.
>=20
> No it is not the same crc16 endianness, one is big the other is little.

Maybe we should add a crc16_le to lib/crc16.c?

>=20
> >>> +
> >>> +   chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> >>> +
> >>> +   /* Read entire ID string */
> >>> +
> >>> +   for (i =3D 0; i<  8; i++)
> >>> +           id_data[i] =3D chip->read_byte(mtd);
> >>> +
> >>>=20
> >>>     if (!type->name)
> >>>    =20
> >>>             return ERR_PTR(-ENODEV);
> >>=20
> >> Do we really need a third chance to read the ID bytes? It seems like we
> >> can just read the whole string the second time instead of shortening it
> >> to two bytes and waiting to reread all 8 bytes until after the ONFI
> >> scan.
>=20
> Well onfi define only 2 bytes for id string, I though it was safer to
> not read beyond specification for onfi nand.
>=20
> >>> +                                   if (val&  (1<<  1))
> >>> +                                           chip->onfi_version =3D 10;
> >>> +                                   else if (val&  (1<<  2))
> >>> +                                           chip->onfi_version =3D 20;
> >>> +                                   else if (val&  (1<<  3))
> >>> +                                           chip->onfi_version =3D 21;
> >>> +                                   else
> >>> +                                           chip->onfi_version =3D 22;
> >>=20
> >> I cannot currently test ONFI on a real chip, but shouldn't the order of
> >> these conditionals be switched? It seems possible that the bits could =
be
> >> set high for more the one version (e.g., a chip supports 1.0 and 2.0, =
so
> >> we have val =3D 00000110 (binary), so the current logic would succeed =
at
> >> 1.0, not realizing that it supports 2.0. Again, I don't know about the
> >> actual behavior in a real chip, but anyway, it seems harmless to
> >> reverse this.
> >=20
> > I think you are right about this. We only have ONFI 1.0 compliant chips
> > right now, so we can't know for sure, but as you say, this is harmless.
>=20
> ok
>=20
>=20
> Matthieu
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
