Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK78f-0004Mj-UN
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 15:49:58 +0000
From: Marek Vasut <marex@denx.de>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add Pm25LD020 and GD25Q41B chip ID.
Date: Tue, 28 Jul 2015 17:49:31 +0200
Cc: Michal Suchanek <hramrach@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>, Ben Hutchings <ben@decadent.org.uk>,
 "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)" <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1438073915.git.hramrach@gmail.com>
 <201507281633.47322.marex@denx.de>
 <CACna6ryGDsL4cP_tvWrZ+wkBx3_+PhP1mu2RzS32HzBbB2kCmA@mail.gmail.com>
In-Reply-To: <CACna6ryGDsL4cP_tvWrZ+wkBx3_+PhP1mu2RzS32HzBbB2kCmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201507281749.31916.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 05:22:17 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 28 July 2015 at 16:33, Marek Vasut <marex@denx.de> wrote:
> > On Tuesday, July 28, 2015 at 11:07:58 AM, Michal Suchanek wrote:
> >> First chip reads Pm25LD020 or Pm25L0020. Found on some WD HDD PCB.
> >> Identified as PMC Pm25LD020.
> >> Flash read does not return consistent data which explains why the disk
> >> died.
> >>=20
> >> Second chip reads something like 25Q41BT. Found on Esspif ESP8266 based
> >> ESP-01 board. Identified as Giga Devices GD25Q41B.
> >>=20
> >> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> >> ---
> >>=20
> >>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>=20
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c
> >> b/drivers/mtd/spi-nor/spi-nor.c index cba3bd0..e55689d 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -558,6 +558,7 @@ static const struct spi_device_id spi_nor_ids[] =
=3D {
> >>=20
> >>       { "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE)
> >>       },
> >>      =20
> >>       /* GigaDevice */
> >>=20
> >> +     { "gd25q41b", INFO(0xc84013, 0, 64 * 1024,  8, SECT_4K) },
> >>=20
> >>       { "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
> >>       { "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
> >>       { "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
> >>=20
> >> @@ -601,6 +602,7 @@ static const struct spi_device_id spi_nor_ids[] =
=3D {
> >>=20
> >>       /* PMC */
> >>       { "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC)
> >>       }, { "pm25lv010",   INFO(0,        0, 32 * 1024,    4,
> >>       SECT_4K_PMC) },
> >>=20
> >> +     { "pm25ld020",   INFO(0x7f9d22, 0, 64 * 1024,    4, SECT_4K) },
> >>=20
> >>       { "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
> >>      =20
> >>       /* Spansion -- single (large) sector size only, at least
> >=20
> > You might want to split this into two patches, but see my comment on 1/2
> > and please wait for Brian's confirmation there before you do anything.
>=20
> Since these flashes are from 2 different vendors, it may make sense to
> use 2 separated patches. I don't care too much however.
>=20
> Adding these entries is OK in general.

Thanks for clarifying, I'll make sure to remember this :)

Best regards,
Marek Vasut
