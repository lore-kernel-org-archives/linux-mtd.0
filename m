Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cj37m-0002KS-R3
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 12:12:57 +0000
Date: Wed, 1 Mar 2017 13:12:32 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Frode Isaksen <fisaksen@baylibre.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Richard Weinberger
 <richard@nod.at>, Vignesh R <vigneshr@ti.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: Introduce bounce buffer to handle
 vmalloc'd buffers
Message-ID: <20170301131232.1a3fd2d1@bbrezillon>
In-Reply-To: <595ab823-cf40-3b27-55ec-3573cecb456b@baylibre.com>
References: <20170227120839.16545-1-vigneshr@ti.com>
 <20170227120839.16545-2-vigneshr@ti.com>
 <8e441369-5c15-d711-1789-b55eadf33c8f@nod.at>
 <65b4a156-f2a8-4c5e-4399-2024a147d5ec@atmel.com>
 <20170301111805.0eb23b76@bbrezillon>
 <595ab823-cf40-3b27-55ec-3573cecb456b@baylibre.com>
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

On Wed, 1 Mar 2017 12:18:30 +0100
Frode Isaksen <fisaksen@baylibre.com> wrote:

> On 01/03/2017 11:18, Boris Brezillon wrote:
> > On Wed, 1 Mar 2017 11:09:57 +0100
> > Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
> > =20
> >> Le 28/02/2017 =C3=A0 22:39, Richard Weinberger a =C3=A9crit : =20
> >>> Vignesh,
> >>>
> >>> Am 27.02.2017 um 13:08 schrieb Vignesh R:   =20
> >>>> Filesystems like UBIFS may pass vmalloc'd buffers to SPI NOR layer w=
hich
> >>>> will end up in SPI layer. SPI core does try to handle such buffers (=
see
> >>>> spi_map_buf()) by doing vmalloc_to_page() and creating scatterlist. =
But,
> >>>> its known that this does not work well with VIVT/aliasing cache
> >>>> architectures.
> >>>> This also fails when buffers are addressed using LPAE (buffers in re=
gion
> >>>> higher than 32 bit addressable region), if DMA is 32bit only.
> >>>>
> >>>> Introduce bounce buffers support in SPI NOR framework to handle
> >>>> vmalloc'd buffers. Use a pre-allocated per flash bounce buffer equal=
 to
> >>>> the sector size of the flash. Flash drivers can enable this feature =
by
> >>>> setting SNOR_F_USE_BOUNCE_BUFFER flag.
> >>>> This would also enable SPI NOR drivers to safely use DMA in their
> >>>> read/write callbacks.
> >>>>
> >>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
> >>>> ---
> >>>>  drivers/mtd/spi-nor/spi-nor.c | 30 +++++++++++++++++++++++++++---
> >>>>  include/linux/mtd/spi-nor.h   |  4 ++++
> >>>>  2 files changed, 31 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi=
-nor.c
> >>>> index 747645c74134..c241fefa5aff 100644
> >>>> --- a/drivers/mtd/spi-nor/spi-nor.c
> >>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >>>> @@ -17,6 +17,7 @@
> >>>>  #include <linux/mutex.h>
> >>>>  #include <linux/math64.h>
> >>>>  #include <linux/sizes.h>
> >>>> +#include <linux/mm.h>
> >>>> =20
> >>>>  #include <linux/mtd/mtd.h>
> >>>>  #include <linux/of_platform.h>
> >>>> @@ -1205,11 +1206,21 @@ static int spi_nor_read(struct mtd_info *mtd=
, loff_t from, size_t len,
> >>>> =20
> >>>>  	while (len) {
> >>>>  		loff_t addr =3D from;
> >>>> +		bool use_bb =3D false;
> >>>> +		u_char *dst_buf =3D buf;
> >>>> +		size_t buf_len =3D len;
> >>>> =20
> >>>>  		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
> >>>>  			addr =3D spi_nor_s3an_addr_convert(nor, addr);
> >>>> =20
> >>>> -		ret =3D nor->read(nor, addr, len, buf);
> >>>> +		if (!virt_addr_valid(buf) && nor->bounce_buf) {   =20
> >> Should we use is_vmalloc_addr() instead of virt_addr_valid() ?
> >>
> >> I guess virt_addr_valid() returns true even for kmalloc'ed buffers
> >> however the copy into the bounce buffer should be avoided for kmalloc'=
ed
> >> memory. =20
> > The test is !virt_addr_valid(), so we won't use the bounce buffer for
> > kmalloc-ed regions. I don't remember why we use virt_addr_valid()
> > instead of is_vmalloc_addr() in the NAND framework, but there was a
> > good reason (virt_addr_valid() is more restrictive, but I don't
> > remember why it's safer :)) =20
> I think virt_addr_valid() picks up both kmap'ed and vmalloc'ed pages as n=
ot valid...

Thanks for the remainder. So we definitely want to use
virt_addr_valid() here.
