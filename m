Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJyqz-0000QC-7Y
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2013 04:17:50 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
 by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2P4Hj8A008808
 for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2013 23:17:46 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
 by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2P4Hiwf003309
 for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2013 09:47:45 +0530 (IST)
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
Date: Mon, 25 Mar 2013 04:17:44 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9A48A5@DBDE01.ent.ti.com>
References: <1363352378-2825-1-git-send-email-pekon@ti.com>,
 <51431F08.7050103@parrot.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9A288C@DBDE01.ent.ti.com>
 <514735D5.3010105@parrot.com>
In-Reply-To: <514735D5.3010105@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Hi Matthieu,

I have tried to elaborate on my patch below. Hopefully this explains=20
intend & implementation. The patch adds interface for=20
chip->ecc.write_subpage to generic driver, so that any driver can=20
extend or reuse it for supporting subpage writes. Current generic driver=20
only supports subpage reads.

> >> The problem is that lot's of controller driver with hw ecc hack the ec=
c
> interface.
> >
> >> For example the TI omap driver don't use the data pointer of
> ecc.calculate but
> >> use the data send on the nand interface.
> >
> > [Pekon]: Yes i agree. But what I see in TI's hack also that ECC is
> calculated for
> > each subpage separately. Its just that instead of using data in
> > chip->buffers->databuf
> > TI's driver uses data which is present in controller's internal buffers=
,
> which
> > should be the way if we are depending on Hardware (controller) to do
> ECC.
> > Is this something different from other Hardware based ECC
> implementations?
> Yes for example some controller have ecc that for a 0xff page is not 0xff=
.
> And this ecc is generated on the fly : you can't xor it before writing it=
 to
> the
> flash.
>=20
[Pekon]: TI GPMC controller also behaves in same way.
It also generates non 0xff ECC for a blank page, therefore in function=20
'nand_write_subpage_hwecc()', I'm explicitly replacing h/w controller's=20
ECC with 0xff for blank | untouched subpages. So that existing data is=20
not mangled.


> I know that omap driver with ELM error correction did not generated 0xff
> ecc for
> a black page. I wonder if it works why your patch.
>=20
[Pekon]: ELM is used on read-path (ECC-correction), while my patch=20
below is for write-path, writing at granularity of sub-pages.Also, the patc=
h=20
is in generic nand-driver (nand_base.c). not limited to usage with TI OMAP.
I think there is some confusion, so I'll try to elaborate the patch:

 +static int nand_write_subpage_hwecc(struct mtd_info *mtd,
+				struct nand_chip *chip, uint32_t offset,
+				uint32_t data_len, const uint8_t *data_buf,
+				int oob_required)
+{
+	uint8_t *oob_buf  =3D chip->oob_poi;
+	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
+	int ecc_size      =3D chip->ecc.size;
+	int ecc_bytes     =3D chip->ecc.bytes;
+	int ecc_steps     =3D chip->ecc.steps;
+	uint32_t *eccpos  =3D chip->ecc.layout->eccpos;
+	uint32_t start_step =3D offset / ecc_size;
+	uint32_t end_step   =3D (offset + data_len - 1) / ecc_size;
+	int oob_bytes       =3D mtd->oobsize / ecc_steps;
+	int step, i;
+
+	for (step =3D 0; step < ecc_steps; step++) {
+		/* configure controller for WRITE access */
+		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
+
+		/* write data (untouched subpages already masked by 0xFF) */
+		chip->write_buf(mtd, data_buf, ecc_size);
[Pekon]: writing main area of flash sub-page, which is already padded with =
0xff
to make it of page-size, in nand_do_write_ops(): // partial page write=20
	if (unlikely(column || writelen < (mtd->writesize - 1))) {
	....
			memset(chip->buffers->databuf, 0xff, mtd->writesize);
			memcpy(&chip->buffers->databuf[column], buf, bytes);
	...
		}
+
+		/* mask ECC of un-touched subpages by padding 0xFF */
+		if ((step < start_step) || (step > end_step))
+			memset(ecc_calc, 0xff, ecc_bytes);
+		else
+			chip->ecc.calculate(mtd, data_buf, ecc_calc);
+
[Pekon]: As mentioned earlier, many H/W controllers generate non-0xff=20
ECC for blank pages, so above code will explicitly pad ECC with 0xff for=20
un-touched | blank sub-pages, so that their ECC is not mangled.
+		/* mask OOB of un-touched subpages by padding 0xFF */
+		/* if oob_required, preserve OOB metadata of written subpage */
+		if (!oob_required || (step < start_step) || (step > end_step))
+			memset(oob_buf, 0xff, oob_bytes);
+
[Pekon]: MTD layer may also provide some, file-system metadata to=20
be written in OOB area corresponding to written sub-page. Above code=20
pads 0xff to OOB buffer corresponding to un-touched | blank subpage=20
to preserve existing OOB data from being overwritten.=20
Usage:
-> UBIFS : does not have any FileSystem meta-data stored OOB.
-> JFFS2: has clean-markers written to OOB.
-> YFFS2: has statistical metadata written to OOB.
-> LOGFS: (don't know)
[Pekon]: However, it should be noted here that both FS meta-data=20
and ECC can be scattered at any byte-positions, depending on OOB
layout. So, alternative is to completely block any File-system=20
metadata while using sub-page format.=20
+		data_buf +=3D ecc_size;
+		ecc_calc +=3D ecc_bytes;
+		oob_buf  +=3D oob_bytes;
+	}
+
+	/* copy calculated ECC for whole page to chip->buffer->oob */
+	/* this include masked-value(0xFF) for unwritten subpages */
+	ecc_calc =3D chip->buffers->ecccalc;
+	for (i =3D 0; i < chip->ecc.total; i++)
+		chip->oob_poi[eccpos[i]] =3D ecc_calc[i];
+
[Pekon]: Here ECC is copied to OOB buffer for flashing.
+	/* write OOB buffer to NAND device */
+	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+
[Pekon]: Actual ECC is flashed to OOB area here, Thus even if the controlle=
r
generates non-0xff ECC for blank-pages, we above code handles it.
+	return 0;
+}
static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			   const uint8_t *buf, int oob_required, int page,
-			   int cached, int raw)
+		uint32_t offset, int data_len, const uint8_t *buf,
+		int oob_required, int page, int cached, int raw)
 {
-	int status;
+	int status, subpage;
+
+	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
+		chip->ecc.write_subpage)
+		subpage =3D offset || (data_len < mtd->writesize);
+	else
+
[Pekon]: modifying existing 'nand_write_page' to accommodate=20
'column' address for adding nand_write_subpage support.
@@ -3458,6 +3527,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.read_oob =3D nand_read_oob_std;
 		if (!chip->ecc.write_oob)
 			chip->ecc.write_oob =3D nand_write_oob_std;
+		if (!chip->ecc.read_subpage)
+			chip->ecc.read_subpage =3D nand_read_subpage;
+		if (!chip->ecc.write_subpage)
+			chip->ecc.write_subpage =3D nand_write_subpage_hwecc;
[Pekon]: populating functions for subpage support.
-> reusing existing nand_read_subpage.
-> adding new nand_write_subpage.

[Pekon]: The problem is that I only have access only to TI OMAP
boards,  so I'm unable to test this patch across different manufacturers.=20
So, in case anyone can help me with testing on non TI board,=20
it would be great.


with regards, pekon

>=20
> Matthieu
