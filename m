Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDPn9-00066E-Ff
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:07:51 +0000
Date: Fri, 19 Oct 2018 10:05:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Cyrille Pitchen - M19942 <cyrille.pitchen@microchip.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Marek Vasut
 <marek.vasut@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Make SFDP-based 4B_OPCODE support
 detection works correctly
Message-ID: <20181019100533.4f8ac8d4@bbrezillon>
In-Reply-To: <166fc7d5-695f-5c60-be07-c819736a123d@microchip.com>
References: <20181017144424.17554-1-boris.brezillon@bootlin.com>
 <166fc7d5-695f-5c60-be07-c819736a123d@microchip.com>
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

On Fri, 19 Oct 2018 09:50:31 +0200
Cyrille Pitchen - M19942 <cyrille.pitchen@microchip.com> wrote:

> Hi Boris,
>=20
> looks good, just a small remark below:
>=20
> Le 17/10/2018 =C3=A0 16:44, Boris Brezillon a =C3=A9crit=C2=A0:
> > Some flash_info entries have the SPI_NOR_4B_OPCODES to let the core
> > know that the flash supports 4B opcode. While this solution works fine
> > for id-based caps detection, it doesn't work that well when relying on
> > SFDP-based caps detection. Let's add an SNOR_F_4B_OPCODES flag so that
> > spi_nor_parse_bfpt() can add it when the BFPT_DWORD1_ADDRESS_BYTES
> > field is set to BFPT_DWORD1_ADDRESS_BYTES_4_ONLY.
> >=20
> > Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
> >  include/linux/mtd/spi-nor.h   |  1 +
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-no=
r.c
> > index 9407ca5f9443..85e57e9ea1b5 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >  		break;
> > =20
> >  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> > +		nor->flags |=3D SNOR_F_4B_OPCODES; =20
>=20
> if spi_nor_parse_sdfp() fails, there is a kind of roll-back operation done
> in spi_nor_init_params() to set the struct spi_nor *nor back to its previ=
ous
> state.
>=20
> 		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> 			nor->addr_width =3D 0;
> 			nor->mtd.erasesize =3D 0;
> 		} else {
> 			[...]
>=20
> maybe "nor->flags &=3D ~SNOR_F_4B_OPCODES;" should be added there.

Actually, it should be

	if (!(info->flags & SPI_NOR_4B_OPCODES))
		nor->flags &=3D ~SNOR_F_4B_OPCODES;

but yes, this is missing. I'll fix that in v3.

> If this roll-back block grows too much, maybe we could introduce a
> void spi_nor_roll_back_sfdp(struct spi_nor *nor) function.
> Also it would make the roll back operation more explicit.

I'm wondering why we revert everything when a single bit is bit
reported as inconsistent in the SFDP table? I mean, it's not unusual
for NOR vendors to make mistake, and we should probably allow
vendor/chip specific code to fix the SFDP table at runtime instead of
discarding all the useful information we might have extracted.

Note that we recently introduced such a ->fixup() hook for the ONFI
param page in the raw NAND framework [1].=20

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/drivers/mtd/nand/raw?h=3Dv4.19-rc8&id=3D00ce4e039ad5bded462931606c3063ff6=
91964b7
