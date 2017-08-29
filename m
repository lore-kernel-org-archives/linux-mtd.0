Received: from smtprelay01.ispgateway.de ([80.67.29.23])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmgPY-0000cz-LJ
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 13:18:36 +0000
Date: Tue, 29 Aug 2017 15:18:07 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: make Samsung SLC NAND usable again
Message-ID: <20170829151807.3a31a1fe@karo-electronics.de>
In-Reply-To: <20170829141658.252a84e0@bbrezillon>
References: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
 <1504001833-18097-2-git-send-email-LW@KARO-electronics.de>
 <20170829141658.252a84e0@bbrezillon>
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

On Tue, 29 Aug 2017 14:16:58 +0200 Boris Brezillon wrote:
> Hi Lothar,
>=20
> On Tue, 29 Aug 2017 12:17:12 +0200
> Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:
>=20
> > commit c51d0ac59f24 ("mtd: nand: Move Samsung specific init/detection
> > logic in nand_samsung.c") introduced a regression for Samsung SLC NAND
> > chips. Prior to this commit chip->bits_per_cell was initialized by call=
ing
> > nand_get_bits_per_cell() before using nand_is_slc().
> > With the offending commit this call is skipped, leaving
> > chip->bits_per_cell cleared to zero when the manufacturer specific
> > '.detect' function calls nand_is_slc() which in turn interprets
> > bits_per_cell !=3D 1 as indication for an MLC chip.
> > The effect is that e.g. a K9F1G08U0F NAND chip is falsely detected as
> > MLC NAND with 4KiB page size rather than SLC with 2KiB page size.
>=20
> Oops, sorry for this regression.
>=20
> >=20
> > Add a call to nand_get_bits_per_cell() before calling the .detect hook
> > function in nand_manufacturer_detect(), so that the nand_is_slc()
> > calls in the manufacturer specific code will return correct results.
>=20
> I'd prefer a different solution (see below).
>=20
> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > ---
> >  drivers/mtd/nand/nand_base.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 9900476..bcc8cef1 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3820,10 +3820,13 @@ static void nand_manufacturer_detect(struct nan=
d_chip *chip)
> >  	 * nand_decode_ext_id() otherwise.
> >  	 */
> >  	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
> > -	    chip->manufacturer.desc->ops->detect)
> > +	    chip->manufacturer.desc->ops->detect) {
> > +		/* The 3rd id byte holds MLC / multichip data */
> > +		chip->bits_per_cell =3D nand_get_bits_per_cell(chip->id.data[2]);
>=20
> I'd prefer not to force this bit_per_cell detection here. How about
> explicitly calling nand_decode_ext_id() from the samsung and hynix
> ->detect() hooks (see proposed diff below)?
>=20
I chose the same place in the code flow where this initialization had
been before. And it does only that portion of nand_decode_ext_id() that
was executed prior to the vendor specific code in the old code.
A call to nand_decode_ext_id() would do more than has been done
previously.

I prefer not to have to rely on every single manufacturer dependent
code calling this function on its own. But you are the maintainer and
have to decide finally.
With my second patch it should be easy to spot when the call is missing
though.

Another alternative were to let nand_is_slc() do the initialization
from id_data when it is first called (bits_per_cell =3D=3D 0).


Lothar Wa=C3=9Fmann
