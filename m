Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U9wLL-0006TX-2M
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2013 11:35:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>, Ricard Wanderlof
 <ricard.wanderlof@axis.com>
Subject: RE: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Mon, 25 Feb 2013 11:35:16 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E99A0D6@DBDE01.ent.ti.com>
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
 <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
 <512B2DC6.8090104@parrot.com>
 <20980858CB6D3A4BAE95CA194937D5E73E99A07D@DBDE01.ent.ti.com>
 <alpine.DEB.2.00.1302251109570.3736@lnxricardw.se.axis.com>
 <512B468B.6060902@parrot.com>
In-Reply-To: <512B468B.6060902@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Ricard Wanderlof a =E9crit :
> > On Mon, 25 Feb 2013, Gupta, Pekon wrote:
> >
> >> But assuming there is no file-system OOB metadata | cleanmarker to be
> stored (like in UBIFS)
> >> Do we still need to transfer OOB data from Host processor to NAND
> device ?
> >> If yes, then ECC calculation & correction which at times is main bottl=
e-neck
> in NAND accesses,
> >> may be best done at Host-processor side..
> >>
> >> Also, In-case there is some file-system metadata to be stored in
> OOB|spare area along with ECC,
> >> how do we ensure that layout of metadata does not overlap with ECC
> syndrome in BENAND ?
> >> Is the BENAND capable of re-adjusting its ECC layout ?
> >
> > BENAND uses a separate non-addressable area for its on-chip ECC. Thus,
> > the complete OOB area is available for the user (except bad block marke=
r
> > bytes).
> There are 2 generations of BENAND :
> - old generation that use oob for its on-chip ECC
> - new generation that use a separate non-addressable area
>=20
> I believe the patch is for the old generation because it create a special=
 layout
> :
>=20
> +
> +static struct nand_ecclayout benand_oob_128 =3D {
> +       .oobfree =3D {
> +               {.offset =3D 2, .length =3D 3},
> +               {.offset =3D 18, .length =3D 3},
> +               {.offset =3D 34, .length =3D 3},
> +               {.offset =3D 50, .length =3D 3},
> +               {.offset =3D 66, .length =3D 3},
> +               {.offset =3D 82, .length =3D 3},
> +               {.offset =3D 98, .length =3D 3},
> +               {.offset =3D 114, .length =3D 3},
> +       }
> +};
>=20
>=20
> >
> > IIUC, however, BENAND has a restriction on how data can written to the
> > flash. For instance, for a BENAND with 2k pages and 64 bytes OOB per pa=
ge,
> > each 512 byte area is paired with 16 bytes of the OOB. When writing usi=
ng
> > the on-chip ECC, one must write the 512 area of the main page followed =
by
> > the paired 16 bytes in the OOB area, without writing a new column addre=
ss
> > to the flash. It is also possible just to write the main area, but then
> > the paired OOB bytes cannot be written at a later date, as that will ca=
use
> > overwriting of the on-chip ECC, causing read errors during subsequent
> > read.
> >
Thanks much.. This was a nice information.=20
This probably also means that on-die ECC would also cover the meta-data=20
present in OOB area, that is why BENAND require 16bytes of OOB to be input=
=20
along with 512bytes main-area data.

> > I don't know if it's possible to write the whole 2k page in one go,
> > followed immediately by the 64 byte OOB. I think not, but the
> > documentation is not clear on this point IMHO, and I have not tested it=
.
> >
> I think it is possible : on our test we didn't deactivate the soc nand
> controller ecc : it wrote 2K of data + OOB with its ecc. And it was worki=
ng.
>=20
However, above test shows that OOB area is not covered in on-die ECC calcul=
ation.
You can check if OOB area was also covered in on-die ECC calculation,=20
by purposely introducing a bit-flip in OOB area.


> I believe it is what they wanted when using a separate non-addressable ar=
ea.
> They wanted to provide new generation nand flash that require more ecc
> correction, but that is transparent for the host (very little software
> modification : check status bit in read).
>=20
But having separate ECC checks:
- One by Host-Processor (stored in OOB),
- And another on-die ECC (stored in non-accessible area)
May not actually help in finding more number of bit-flips, because both=20
algorithms may be just duplicating each.=20
(example: Calculating BCH8 twice does not increase its capability to=20
detect more number of errors, because both checks are on same main-data).

>=20
>=20
> >
> > The most efficient use of BENAND is probably to avoid using the OOB if
> > possible, and just use the main area. This does require that the driver=
 be
> > configured accordingly which is a pity in a production environment wher=
e
> > one wants to have as wide a range of chips to choose from during the
> > production run.
>=20
> Yes using OOB is asking for trouble with new nand.
>
In such case, is it correct to assume both JFFS2 and YAFFS2 (with out-of-ba=
nd tags),=20
cannot be used with Old-type BENAND, (which use oob-data for its on-die ECC=
) ?
because both JFFS2 and YAFFS2 save some metadata in OOB.


with regards, pekon=20
>=20
> Matthieu
