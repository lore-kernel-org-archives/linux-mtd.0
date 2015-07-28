Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK77m-00042d-MX
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 15:49:03 +0000
From: Marek Vasut <marex@denx.de>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add GD25LQ32C 1.8V SPI NOR flash ID
Date: Tue, 28 Jul 2015 17:48:35 +0200
Cc: Michal Suchanek <hramrach@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>, Ben Hutchings <ben@decadent.org.uk>,
 "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)" <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1438073915.git.hramrach@gmail.com>
 <201507281633.19407.marex@denx.de>
 <CACna6rybkxWj0c6CTNSKq0_nVGNxgX0XZjLY_Yo7CX8_bKSwSg@mail.gmail.com>
In-Reply-To: <CACna6rybkxWj0c6CTNSKq0_nVGNxgX0XZjLY_Yo7CX8_bKSwSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201507281748.36015.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 05:19:18 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 28 July 2015 at 16:33, Marek Vasut <marex@denx.de> wrote:
> > On Tuesday, July 28, 2015 at 11:07:57 AM, Michal Suchanek wrote:
> >> This 1.8V SPI NOR flash is found on ARM Chromebook XE303C and reads
> >> something like 25LQ32VIG in the middle.
> >>=20
> >> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> >> ---
> >>=20
> >>  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>=20
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c
> >> b/drivers/mtd/spi-nor/spi-nor.c index d78831b..cba3bd0 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -559,6 +559,7 @@ static const struct spi_device_id spi_nor_ids[] =
=3D {
> >>=20
> >>       /* GigaDevice */
> >>       { "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
> >>=20
> >> +     { "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
> >>=20
> >>       { "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
> >>       { "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
> >=20
> > Don't we have DT bindings, so we can use jedec,spi-nor prop for all
> > new SPI NORs without growing this table ?
>=20
> You confused this table with the one in m25p80.c.

Uh oh, sorry.

Best regards,
Marek Vasut
