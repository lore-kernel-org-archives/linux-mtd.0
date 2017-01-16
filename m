Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cT7P2-0000h5-Ak
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 13:32:53 +0000
Date: Mon, 16 Jan 2017 14:32:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Message-ID: <20170116143230.09b000ce@bbrezillon>
In-Reply-To: <1484573225-19095-2-git-send-email-clg@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-2-git-send-email-clg@kaod.org>
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

On Mon, 16 Jan 2017 14:27:03 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This can be used to easily identify a specific chip on a system with
> multiple chips.
>=20
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/mtdcore.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 052772f7caef..bf61557b599d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -654,6 +654,13 @@ static int mtd_add_device_partitions(struct mtd_info=
 *mtd,
>   */
>  static void mtd_set_dev_defaults(struct mtd_info *mtd)
>  {
> +	/*
> +	 * If DT support is enabled and we have a valid of_node pointer, try to
> +	 * extract the MTD name from the label property.
> +	 */
> +	if (IS_ENABLED(CONFIG_OF) && mtd->dev.of_node)
> +		of_property_read_string(mtd->dev.of_node, "label", &mtd->name);
> +
>  	if (mtd->dev.parent) {
>  		if (!mtd->owner && mtd->dev.parent->driver)
>  			mtd->owner =3D mtd->dev.parent->driver->owner;
