Received: from smtprelay05.ispgateway.de ([80.67.31.100])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmhc1-0003Ne-PJ
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 14:35:34 +0000
Date: Tue, 29 Aug 2017 16:34:59 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: make Samsung SLC NAND usable again
Message-ID: <20170829163459.6ab1378a@karo-electronics.de>
In-Reply-To: <20170829154144.25f9d0ac@bbrezillon>
References: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
 <1504001833-18097-2-git-send-email-LW@KARO-electronics.de>
 <20170829141658.252a84e0@bbrezillon>
 <20170829151807.3a31a1fe@karo-electronics.de>
 <20170829154144.25f9d0ac@bbrezillon>
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

Hi,

On Tue, 29 Aug 2017 15:41:44 +0200 Boris Brezillon wrote:
> On Tue, 29 Aug 2017 15:18:07 +0200
> Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:
>=20
> > Hi,
> >=20
> > On Tue, 29 Aug 2017 14:16:58 +0200 Boris Brezillon wrote:
> > > Hi Lothar,
> > >=20
> > > On Tue, 29 Aug 2017 12:17:12 +0200
> > > Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:
> > >  =20
> > > > commit c51d0ac59f24 ("mtd: nand: Move Samsung specific init/detecti=
on
> > > > logic in nand_samsung.c") introduced a regression for Samsung SLC N=
AND
> > > > chips. Prior to this commit chip->bits_per_cell was initialized by =
calling
> > > > nand_get_bits_per_cell() before using nand_is_slc().
> > > > With the offending commit this call is skipped, leaving
> > > > chip->bits_per_cell cleared to zero when the manufacturer specific
> > > > '.detect' function calls nand_is_slc() which in turn interprets
> > > > bits_per_cell !=3D 1 as indication for an MLC chip.
> > > > The effect is that e.g. a K9F1G08U0F NAND chip is falsely detected =
as
> > > > MLC NAND with 4KiB page size rather than SLC with 2KiB page size. =
=20
> > >=20
> > > Oops, sorry for this regression.
> > >  =20
> > > >=20
> > > > Add a call to nand_get_bits_per_cell() before calling the .detect h=
ook
> > > > function in nand_manufacturer_detect(), so that the nand_is_slc()
> > > > calls in the manufacturer specific code will return correct results=
. =20
> > >=20
> > > I'd prefer a different solution (see below).
> > >  =20
> > > >=20
> > > > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > > > ---
> > > >  drivers/mtd/nand/nand_base.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_b=
ase.c
> > > > index 9900476..bcc8cef1 100644
> > > > --- a/drivers/mtd/nand/nand_base.c
> > > > +++ b/drivers/mtd/nand/nand_base.c
> > > > @@ -3820,10 +3820,13 @@ static void nand_manufacturer_detect(struct=
 nand_chip *chip)
> > > >  	 * nand_decode_ext_id() otherwise.
> > > >  	 */
> > > >  	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
> > > > -	    chip->manufacturer.desc->ops->detect)
> > > > +	    chip->manufacturer.desc->ops->detect) {
> > > > +		/* The 3rd id byte holds MLC / multichip data */
> > > > +		chip->bits_per_cell =3D nand_get_bits_per_cell(chip->id.data[2])=
; =20
> > >=20
> > > I'd prefer not to force this bit_per_cell detection here. How about
> > > explicitly calling nand_decode_ext_id() from the samsung and hynix =20
> > > ->detect() hooks (see proposed diff below)? =20
> > >  =20
> > I chose the same place in the code flow where this initialization had
> > been before. And it does only that portion of nand_decode_ext_id() that
> > was executed prior to the vendor specific code in the old code.
> > A call to nand_decode_ext_id() would do more than has been done
> > previously.
>=20
> My main concern is, can we be sure this portion of the 3rd byte is
> always used to encode the bits-per-cell information? NAND vendors tend
> to take liberties with the NAND ids fields and I fear we'll someday have
> a NAND that does not follow this encoding scheme.
> This being said, find_full_id_nand() also calls
> nand_get_bits_per_cell() even though it's using full-id information for
> other characteristics, which tend to confirm noone ever had a NAND
> abusing this bits-per-cell field.
>=20
> I'll just take your patch as is and add Cc-stable a Fixes tags.
>=20
OK.

> Note that I'm planning to rework the NAND detection logic a bit to let
> manufacturer code tweak the characteristics even if the NAND is ONFI or
> JEDEC compliant (see below).
>=20
> >=20
> > I prefer not to have to rely on every single manufacturer dependent
> > code calling this function on its own. But you are the maintainer and
> > have to decide finally.
> > With my second patch it should be easy to spot when the call is missing
> > though.
>=20
> Yep, your second patch is fine.
>=20
> >=20
> > Another alternative were to let nand_is_slc() do the initialization
> > from id_data when it is first called (bits_per_cell =3D=3D 0).
>=20
> Well, you could do
>=20
> 	return bits_per_cell <=3D 1
>=20
That would just cover up the fact, that noone cared for correctly
initializing the bits_per_cell field.
=20
> but I think your WARN() is appropriate (though I'd put it somewhere
> else, like just after the detection logic).
>=20
IMO it is in exactly the right place, where the variable in question is
to be used.


Lothar Wa=C3=9Fmann
