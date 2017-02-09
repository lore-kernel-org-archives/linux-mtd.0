Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cbitw-0003fG-Cr
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 07:12:22 +0000
Date: Thu, 9 Feb 2017 08:11:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] mtd: name the mtd device with an optional label
 property
Message-ID: <20170209081155.48aba234@bbrezillon>
In-Reply-To: <20170208223859.GK94627@google.com>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
 <1485368255-12038-2-git-send-email-clg@kaod.org>
 <20170208223859.GK94627@google.com>
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

On Wed, 8 Feb 2017 14:38:59 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, Jan 25, 2017 at 07:17:34PM +0100, C=C3=A9dric Le Goater wrote:
> > This can be used to easily identify a specific chip on a system with
> > multiple chips.
> >=20
> > Drivers wanting to support this new label property will benefit from
> > it without a change. They might want to check in the future that
> > mtd->name is NULL before assigning a default name to the mtd device.
> > Other drivers will keep the current behavior, which is to override
> > mtd->name with their own value.
> >=20
> > Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >=20
> >  Changes since v1:
> >=20
> >  - moved the use of the "label" property from mtd_set_dev_defaults()
> >    to mtd_set_of_node() to let drivers keep control on how mtd->name
> >    is set and allocated.
> >=20
> >  include/linux/mtd/mtd.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 13f8052b9ff9..f4fe15517295 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -24,6 +24,7 @@
> >  #include <linux/uio.h>
> >  #include <linux/notifier.h>
> >  #include <linux/device.h>
> > +#include <linux/of.h>
> > =20
> >  #include <mtd/mtd-abi.h>
> > =20
> > @@ -385,6 +386,7 @@ static inline void mtd_set_of_node(struct mtd_info =
*mtd,
> >  				   struct device_node *np)
> >  {
> >  	mtd->dev.of_node =3D np;
> > +	of_property_read_string(np, "label", &mtd->name); =20
>=20
> Seems like this could be done only if '!mtd->name'?
>=20
> As it stands, you're still clobbering some names, e.g. ones from
> physmap_of.c.

Indeed. I thought all users of
mtd_set_of_node()/nand_set_flash_node()/spi_nor_set_flash_node() were
calling this function before initializing mtd->name, which is
apparently not true.

> Notably, this driver already supports a "linux,mtd-name"
> (which your new property should probably supersede), but it seems like
> you're breaking compatibility.

Well, we're not really breaking things until someone starts defining a
'label' property under the flash node ;-). Moreover, if we want to
deprecate 'linux,mtd-name' in favor of 'label', we should definitely
override the 'linux,mtd-name' value with the 'label' one if someone
defined both (which is bad ;-)).

Anyway, I agree, we'd better check if !mtd->name before assigning the
label name.
Cedric, can you send a v3?
