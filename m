Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dmgmQ-0004Jp-Dd
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 13:42:16 +0000
Date: Tue, 29 Aug 2017 15:41:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: make Samsung SLC NAND usable again
Message-ID: <20170829154144.25f9d0ac@bbrezillon>
In-Reply-To: <20170829151807.3a31a1fe@karo-electronics.de>
References: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
 <1504001833-18097-2-git-send-email-LW@KARO-electronics.de>
 <20170829141658.252a84e0@bbrezillon>
 <20170829151807.3a31a1fe@karo-electronics.de>
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

On Tue, 29 Aug 2017 15:18:07 +0200
Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:

> Hi,
>=20
> On Tue, 29 Aug 2017 14:16:58 +0200 Boris Brezillon wrote:
> > Hi Lothar,
> >=20
> > On Tue, 29 Aug 2017 12:17:12 +0200
> > Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> wrote:
> >  =20
> > > commit c51d0ac59f24 ("mtd: nand: Move Samsung specific init/detection
> > > logic in nand_samsung.c") introduced a regression for Samsung SLC NAND
> > > chips. Prior to this commit chip->bits_per_cell was initialized by ca=
lling
> > > nand_get_bits_per_cell() before using nand_is_slc().
> > > With the offending commit this call is skipped, leaving
> > > chip->bits_per_cell cleared to zero when the manufacturer specific
> > > '.detect' function calls nand_is_slc() which in turn interprets
> > > bits_per_cell !=3D 1 as indication for an MLC chip.
> > > The effect is that e.g. a K9F1G08U0F NAND chip is falsely detected as
> > > MLC NAND with 4KiB page size rather than SLC with 2KiB page size. =20
> >=20
> > Oops, sorry for this regression.
> >  =20
> > >=20
> > > Add a call to nand_get_bits_per_cell() before calling the .detect hook
> > > function in nand_manufacturer_detect(), so that the nand_is_slc()
> > > calls in the manufacturer specific code will return correct results. =
=20
> >=20
> > I'd prefer a different solution (see below).
> >  =20
> > >=20
> > > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > > ---
> > >  drivers/mtd/nand/nand_base.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_bas=
e.c
> > > index 9900476..bcc8cef1 100644
> > > --- a/drivers/mtd/nand/nand_base.c
> > > +++ b/drivers/mtd/nand/nand_base.c
> > > @@ -3820,10 +3820,13 @@ static void nand_manufacturer_detect(struct n=
and_chip *chip)
> > >  	 * nand_decode_ext_id() otherwise.
> > >  	 */
> > >  	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
> > > -	    chip->manufacturer.desc->ops->detect)
> > > +	    chip->manufacturer.desc->ops->detect) {
> > > +		/* The 3rd id byte holds MLC / multichip data */
> > > +		chip->bits_per_cell =3D nand_get_bits_per_cell(chip->id.data[2]); =
=20
> >=20
> > I'd prefer not to force this bit_per_cell detection here. How about
> > explicitly calling nand_decode_ext_id() from the samsung and hynix =20
> > ->detect() hooks (see proposed diff below)? =20
> >  =20
> I chose the same place in the code flow where this initialization had
> been before. And it does only that portion of nand_decode_ext_id() that
> was executed prior to the vendor specific code in the old code.
> A call to nand_decode_ext_id() would do more than has been done
> previously.

My main concern is, can we be sure this portion of the 3rd byte is
always used to encode the bits-per-cell information? NAND vendors tend
to take liberties with the NAND ids fields and I fear we'll someday have
a NAND that does not follow this encoding scheme.
This being said, find_full_id_nand() also calls
nand_get_bits_per_cell() even though it's using full-id information for
other characteristics, which tend to confirm noone ever had a NAND
abusing this bits-per-cell field.

I'll just take your patch as is and add Cc-stable a Fixes tags.

Note that I'm planning to rework the NAND detection logic a bit to let
manufacturer code tweak the characteristics even if the NAND is ONFI or
JEDEC compliant (see below).

>=20
> I prefer not to have to rely on every single manufacturer dependent
> code calling this function on its own. But you are the maintainer and
> have to decide finally.
> With my second patch it should be easy to spot when the call is missing
> though.

Yep, your second patch is fine.

>=20
> Another alternative were to let nand_is_slc() do the initialization
> from id_data when it is first called (bits_per_cell =3D=3D 0).

Well, you could do

	return bits_per_cell <=3D 1

but I think your WARN() is appropriate (though I'd put it somewhere
else, like just after the detection logic).

--->8---
diff --git a/drivers/mtd/nand/nand_amd.c b/drivers/mtd/nand/nand_amd.c
index 170403a3bfa8..95342862fd31 100644
--- a/drivers/mtd/nand/nand_amd.c
+++ b/drivers/mtd/nand/nand_amd.c
@@ -21,7 +21,9 @@ static void amd_nand_decode_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd =3D nand_to_mtd(chip);
=20
-	nand_decode_ext_id(chip);
+	/* Skip ID decoding for JEDEC or ONFI chips. */
+	if (chip->onfi_version || chip->jedec_version)
+		return;
=20
 	/*
 	 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c6c18b82f8f4..0640687b50c2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3982,9 +3982,9 @@ static bool find_full_id_nand(struct nand_chip *chip,
 }
=20
 /*
- * Manufacturer detection. Only used when the NAND is not ONFI or JEDEC
- * compliant and does not have a full-id or legacy-id entry in the nand_ids
- * table.
+ * Manufacturer detection. This follows the regular ONFI, JEDEC or ID deco=
ding
+ * detection and allows driver specific code to tweak the NAND chip
+ * characteristics.
  */
 static void nand_manufacturer_detect(struct nand_chip *chip)
 {
@@ -3995,8 +3995,6 @@ static void nand_manufacturer_detect(struct nand_chip=
 *chip)
 	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
 	    chip->manufacturer.desc->ops->detect)
 		chip->manufacturer.desc->ops->detect(chip);
-	else
-		nand_decode_ext_id(chip);
 }
=20
 /*
@@ -4128,7 +4126,7 @@ static int nand_detect(struct nand_chip *chip, struct=
 nand_flash_dev *type)
 	chip->chipsize =3D (uint64_t)type->chipsize << 20;
=20
 	if (!type->pagesize)
-		nand_manufacturer_detect(chip);
+		nand_decode_ext_id(chip)
 	else
 		nand_decode_id(chip, type);
=20
@@ -4136,6 +4134,7 @@ static int nand_detect(struct nand_chip *chip, struct=
 nand_flash_dev *type)
 	chip->options |=3D type->options;
=20
 ident_done:
+	nand_manufacturer_detect(chip);
=20
 	if (chip->options & NAND_BUSWIDTH_AUTO) {
 		WARN_ON(busw & NAND_BUSWIDTH_16);
diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index b12dc7325378..b77b45c4ed03 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -547,6 +547,10 @@ static void hynix_nand_decode_id(struct nand_chip *chi=
p)
 	bool valid_jedecid;
 	u8 tmp;
=20
+	/* Skip ID decoding for JEDEC or ONFI chips. */
+	if (chip->onfi_version || chip->jedec_version)
+		return;
+
 	/*
 	 * Exclude all SLC NANDs from this advanced detection scheme.
 	 * According to the ranges defined in several datasheets, it might
@@ -554,10 +558,8 @@ static void hynix_nand_decode_id(struct nand_chip *chi=
p)
 	 * If that the case rework the test to let SLC NANDs go through the
 	 * detection process.
 	 */
-	if (chip->id.len < 6 || nand_is_slc(chip)) {
-		nand_decode_ext_id(chip);
+	if (chip->id.len < 6 || nand_is_slc(chip))
 		return;
-	}
=20
 	/* Extract pagesize */
 	mtd->writesize =3D 2048 << (chip->id.data[3] & 0x03);
diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsun=
g.c
index 1e0755997762..9da0a2101d63 100644
--- a/drivers/mtd/nand/nand_samsung.c
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -21,6 +21,10 @@ static void samsung_nand_decode_id(struct nand_chip *chi=
p)
 {
 	struct mtd_info *mtd =3D nand_to_mtd(chip);
=20
+	/* Skip ID decoding for JEDEC or ONFI chips. */
+	if (chip->onfi_version || chip->jedec_version)
+		return;
+
 	/* New Samsung (6 byte ID): Samsung K9GAG08U0F (p.44) */
 	if (chip->id.len =3D=3D 6 && !nand_is_slc(chip) &&
 	    chip->id.data[5] !=3D 0x00) {
@@ -89,8 +93,6 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 				chip->ecc_step_ds =3D 0;
 			}
 		}
-	} else {
-		nand_decode_ext_id(chip);
 	}
 }
=20
diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshib=
a.c
index fa787ba38dcd..1aa56363bc16 100644
--- a/drivers/mtd/nand/nand_toshiba.c
+++ b/drivers/mtd/nand/nand_toshiba.c
@@ -21,7 +21,9 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd =3D nand_to_mtd(chip);
=20
-	nand_decode_ext_id(chip);
+	/* Skip ID decoding for JEDEC or ONFI chips. */
+	if (chip->onfi_version || chip->jedec_version)
+		return;
=20
 	/*
 	 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
