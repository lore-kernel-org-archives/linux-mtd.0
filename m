Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cWUEK-0007ut-Gd
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 20:31:46 +0000
Date: Wed, 25 Jan 2017 21:31:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Brian Norris
 <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] mtd: name the mtd device with an optional label
 property
Message-ID: <20170125213119.6409083e@bbrezillon>
In-Reply-To: <1485368255-12038-2-git-send-email-clg@kaod.org>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
 <1485368255-12038-2-git-send-email-clg@kaod.org>
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

On Wed, 25 Jan 2017 19:17:34 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This can be used to easily identify a specific chip on a system with
> multiple chips.
>=20
> Drivers wanting to support this new label property will benefit from
> it without a change. They might want to check in the future that
> mtd->name is NULL before assigning a default name to the mtd device.
> Other drivers will keep the current behavior, which is to override
> mtd->name with their own value.
>=20
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, can you have a look at this patch, and if you're okay with it,
queue it for 4.11. I'll soon post the atmel NAND controller driver
rework which will depend on this patch, and that'd be great to have
this dependency already applied.

Thanks,

Boris

> ---
>=20
>  Changes since v1:
>=20
>  - moved the use of the "label" property from mtd_set_dev_defaults()
>    to mtd_set_of_node() to let drivers keep control on how mtd->name
>    is set and allocated.
>=20
>  include/linux/mtd/mtd.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052b9ff9..f4fe15517295 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -24,6 +24,7 @@
>  #include <linux/uio.h>
>  #include <linux/notifier.h>
>  #include <linux/device.h>
> +#include <linux/of.h>
> =20
>  #include <mtd/mtd-abi.h>
> =20
> @@ -385,6 +386,7 @@ static inline void mtd_set_of_node(struct mtd_info *m=
td,
>  				   struct device_node *np)
>  {
>  	mtd->dev.of_node =3D np;
> +	of_property_read_string(np, "label", &mtd->name);
>  }
> =20
>  static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
