Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqga5-0002hs-1z
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 13:45:43 +0000
Date: Wed, 22 Mar 2017 14:45:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Campbell
 <ijc+devicetree@hellion.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, "galak@codeaurora.org"
 <galak@codeaurora.org>
Subject: Re: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Message-ID: <20170322144507.4d80d2cc@bbrezillon>
In-Reply-To: <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
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

Hi Bean,

On Wed, 22 Mar 2017 13:20:04 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> >+micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip
> >*chip,
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t *buf, int oob_required,
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int page)
> >+{
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 int status;
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 int max_bitflips =3D 0;
> >+
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 micron_nand_on_die_ecc_setup(chip, true);
> >+
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 status =3D chip->read_byte(mtd);
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (status & NAND_STATUS_FAIL)
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mtd->ecc_stats.failed++;
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * The internal ECC doesn't tell us the number of bitflips
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * that have been corrected, but tells us if it recommends to
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * rewrite the block. If it's the case, then we pretend we had
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * a number of bitflips equal to the ECC strength, which will
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * hint the NAND core to rewrite the block.
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 else if (status & NAND_STATUS_WRITE_RECOMMENDED)
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 max_bitflips =3D chip->ecc.strength;
> >+
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 chip->cmdfunc(mtd, NAND_CMD_READ0, -1, -1);
> >+
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 nand_read_page_raw(mtd, chip, buf, oob_required, page);
> >+
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 micron_nand_on_die_ecc_setup(chip, false);
> >+
> >+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return max_bitflips;
> >+} =20
>=20
>=20
> Hi,=20
> Let me give you some information, hopefully you can do some modification =
based on above codes.
>=20
> I noticed that this patches are based on MT29F1G08ABADAWP SLC NAND, it is=
 our 60s 34nm SLC NAND.
> So far, we have 2 series SLC NAND with implementations of on die ECC.
> 1. M79A for all 25nm (70series) SLC NAND with on-die ECC (M78A, M79A, and=
 future design M70A)
> 2. M60A for all 34nm (60series) SLC NAND with on-die ECC

Do you have an easy way to differentiate those 2 generations of chip,
or should we base our detection on the model name provided in the ONFI
parameter page?

>=20
> NAND_STATUS_FAIL:
> For the both of series SLC NAND with on-die ECC, SR bit 0 (NAND_STATUS_FA=
IL) indicates an uncorrectable read fail,
> data is lost, no recovery possible, unless we have software additional pr=
otection, the block is not necessarily
> bad but the data is lost.
>=20
> NAND_STATUS_WRITE_RECOMMENDED:
>=20
> For the NAND_STATUS_WRITE_RECOMMENDED, it only works on 60s NAND, it is 4=
 bit ECC, the status register only
> indicates if there is 0 or 1-4 correctable error bits. We don't want to t=
rigger refresh if only 1 or 2 bits fail.
> the base refresh is that if there 3 or 4 bitflips. But unfortunately we c=
an't get failed bit count trough read status register.=20
> SW workaround proposal:
> 1. If SR bit 3 is set to 1 it means 1~4 bitflips and correctable.
> 2. Read out the page with ECC ON
> 3. Read out the page with ECC OFF
> 4. Compare the data
> 5. Count the number of bitflips for the sectors (there are 4 ECC sectors)
> 6. if 3 or more fail bits, trigger fresh.=20
> I know this is not good solution, but if as long as NAND_STATUS_WRITE_REC=
OMMENDED is set, and trigger refresh,
> this will definitely increase NAND PE cycle.

We discussed that with Thomas when developing the solution. I suggested
to first go for a simple solution even if it implies unneeded PE
cycles when bitflips are detected, but maybe I was wrong. In any case,
it shouldn't be to hard to do what you suggest.

>=20
> For the 70s, it is 8 bits on-die ECC, the status register can report 7-8 =
bitflips (refresh recommended), 4-6 bitflips and 1-3 bitflips.
> So we can trigger refresh according to its bitflips status.

That's good news!

Thanks for your feedback.

Boris
