Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cW1ra-0008U3-NY
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 14:14:24 +0000
Date: Tue, 24 Jan 2017 15:13:53 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Message-ID: <20170124151353.5bbffae0@bbrezillon>
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

Hi C=C3=A9dric,

On Mon, 16 Jan 2017 14:27:03 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This can be used to easily identify a specific chip on a system with
> multiple chips.
>=20
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
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

I realize this kind of thing would be better placed in mtd_set_of_node()
(see the patch below). Modifying the mtd->name pointer in the back of
MTD drivers is not such a good idea (suppose the driver allocated the
memory with a regular kmalloc() and tries to free mtd->name in the remove
path).

If we move that to mtd_set_of_node(), drivers that wants to support this
label property just have to check if mtd->name is NULL (after calling
mtd_set_of_node() or nand_set_flash_node()) before assigning a default
name.
For unmodified drivers we keep the existing behavior: they'll just
unconditionally override mtd->name with their own value (which might or
might not be dynamically allocated).

>  	if (mtd->dev.parent) {
>  		if (!mtd->owner && mtd->dev.parent->driver)
>  			mtd->owner =3D mtd->dev.parent->driver->owner;

--->8---
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 13f8052b9ff9..a12b68f941e3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -385,6 +385,8 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
                                   struct device_node *np)
 {
        mtd->dev.of_node =3D np;
+
+       of_property_read_string(np, "label", mtd->name);
 }
=20
 static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
