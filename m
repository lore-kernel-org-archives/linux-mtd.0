Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYHDy-0003fA-Ow
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 20:07:21 +0000
Date: Sun, 7 Jan 2018 21:07:03 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Vignesh R <vigneshr@ti.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, broonie@kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, nicolas.ferre@microchip.com,
 radu.pirea@microchip.com
Subject: Re: [PATCH 1/3] mtd: spi-nor: add optional DMA-safe bounce buffer
 for data transfer
Message-ID: <20180107210703.31fdf0a0@bbrezillon>
In-Reply-To: <ae977280-28b4-d746-da4b-0f807dad609d@wedev4u.fr>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <fc2440c6f52877f28286d89691049e5cba10e6a7.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <1126731d-cbf7-8fbf-34ab-8ccf1cc8241f@ti.com>
 <ae977280-28b4-d746-da4b-0f807dad609d@wedev4u.fr>
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

On Tue, 26 Dec 2017 14:59:00 +0100
Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote:

> Hi Vignesh
>=20
> Le 26/12/2017 =C3=A0 14:42, Vignesh R a =C3=A9crit=C2=A0:
> > Hi Cyrille,
> >=20
> > Thanks for doing this series! One comment below.
> >=20
> > On 24-Dec-17 10:06 AM, Cyrille Pitchen wrote:
> > [...] =20
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-n=
or.c
> >> index 8bafd462f0ae..59f9fbd45234 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -14,8 +14,10 @@
> >>  #include <linux/errno.h>
> >>  #include <linux/module.h>
> >>  #include <linux/device.h>
> >> +#include <linux/highmem.h>
> >>  #include <linux/mutex.h>
> >>  #include <linux/math64.h>
> >> +#include <linux/mm.h>
> >>  #include <linux/sizes.h>
> >>  #include <linux/slab.h>
> >> =20
> >> @@ -1232,6 +1234,56 @@ static const struct flash_info spi_nor_ids[] =
=3D {
> >>  	{ },
> >>  };
> >> =20
> >> +static bool spi_nor_is_dma_safe(const void *buf)
> >> +{
> >> +	if (is_vmalloc_addr(buf))
> >> +		return false;
> >> +
> >> +#ifdef CONFIG_HIGHMEM
> >> +	if ((unsigned long)buf >=3D PKMAP_BASE &&
> >> +	    (unsigned long)buf < (PKMAP_BASE + (LAST_PKMAP * PAGE_SIZE)))
> >> +		return false;
> >> +#endif
> >> +
> >> +	return true;
> >> +}
> >> + =20
> >=20
> > Better way would be to use virt_addr_valid():
> > static bool spi_nor_is_dma_safe(const void *buf)
> > {
> > 	return virt_addr_valid(buf);
> > }
> >=20
> > Regards
> > Vignesh
> >  =20
>=20
> Thanks for the advice :)
>=20
> https://patchwork.kernel.org/patch/9768341/
> Maybe I could check both virt_addr_valid() and object_is_on_stack() too ?

Yep, see the explanation given here [1].

[1]http://elixir.free-electrons.com/linux/v4.15-rc6/source/Documentation/DM=
A-API-HOWTO.txt#L132
