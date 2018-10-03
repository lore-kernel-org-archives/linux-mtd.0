Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7oPq-0004LD-OH
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 21:10:44 +0000
Date: Wed, 3 Oct 2018 23:10:21 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/8] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
Message-ID: <20181003231021.730ee909@bbrezillon>
In-Reply-To: <20181003193859.23928-8-ricardo.ribalda@gmail.com>
References: <20181003193859.23928-1-ricardo.ribalda@gmail.com>
 <20181003193859.23928-8-ricardo.ribalda@gmail.com>
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

On Wed,  3 Oct 2018 21:38:59 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Allow creating gpio-addr-flash via device-tree and not just via platform
> data.
>=20
> Option parsing has been moved to separated functions.
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/maps/gpio-addr-flash.c | 95 +++++++++++++++++++++++++++---
>  1 file changed, 87 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-a=
ddr-flash.c
> index 9e370e3158cd..1be2df81087a 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -7,6 +7,7 @@
>   *
>   * Copyright =C2=A9 2000 Nicolas Pitre <nico@cam.org>
>   * Copyright =C2=A9 2005-2009 Analog Devices Inc.
> + * Copyright =C2=A9 2018 Ricardo Ribalda <ricardo.ribalda@gmail.com>

Would you mind moving the copyright update to a separate patch?


> +
> +static void gf_device_parse_register(struct platform_device *pdev,
> +				     struct async_state *state)
> +{
> +	static const char * const part_probe_types[] =3D {
> +		"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
> +	struct device_node *dn;
> +
> +	dn =3D pdev->dev.of_node;
> +	if (!dn) {
> +		struct physmap_flash_data *pdata;
> +
> +		pdata =3D dev_get_platdata(&pdev->dev);
> +		mtd_device_parse_register(state->mtd, part_probe_types, NULL,
> +					  pdata->parts, pdata->nr_parts);
> +		return;
> +	}
> +
> +	mtd_device_parse_register(state->mtd, part_probe_types, NULL, NULL, 0);


Looks like you keep ignoring the mtd_device_parse_register() return.
Probably something you should fix at some point.
