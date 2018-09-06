Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxyx1-0003Wd-6l
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 18:24:21 +0000
Date: Thu, 6 Sep 2018 20:23:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: core: add get_mtd_device_by_node
Message-ID: <20180906202355.47b3fd3b@xps13>
In-Reply-To: <20180906161413.6335-2-kernel@nospam.obeliks.de>
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
 <20180906161413.6335-2-kernel@nospam.obeliks.de>
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

Hi Bernhard,

Minor nits below.

Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote on Thu,  6 Sep
2018 18:14:11 +0200:

> Add function to retrieve a mtd device by its OF node. Since drivers can
> assign arbitrary names to mtd devices in the absence of a label
> property, there is no other reliable way to retrieve a mtd device for a
> given OF node.
>=20
> Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
> ---
>  drivers/mtd/mtdcore.c   | 39 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |  2 ++
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 97ac219c082e..e59b6a06814c 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -926,6 +926,45 @@ struct mtd_info *get_mtd_device_nm(const char *name)
>  }
>  EXPORT_SYMBOL_GPL(get_mtd_device_nm);
> =20
> +/**
> + *	get_mtd_device_by_node - obtain a validated handle for an MTD device
> + *	by of_node
> + *	@name: OF node of MTD device to open

Should be @of_node

> + *
> + *	This function returns MTD device description structure in case of
> + *	success and an error code in case of failure.
> + */
> +struct mtd_info *get_mtd_device_by_node(const struct device_node *of_nod=
e)
> +{
> +	int err =3D -ENODEV;
> +	struct mtd_info *mtd =3D NULL, *other;
> +
> +	mutex_lock(&mtd_table_mutex);
> +
> +	mtd_for_each_device(other) {
> +		if (of_node =3D=3D other->dev.of_node) {
> +			mtd =3D other;
> +			break;
> +		}
> +	}
> +
> +	if (!mtd)
> +		goto out_unlock;
> +
> +	err =3D __get_mtd_device(mtd);
> +	if (err)
> +		goto out_unlock;
> +
> +	mutex_unlock(&mtd_table_mutex);
> +	return mtd;
> +
> +out_unlock:
> +	mutex_unlock(&mtd_table_mutex);
> +	return ERR_PTR(err);
> +}
> +EXPORT_SYMBOL_GPL(get_mtd_device_by_node);
> +
> +

Extra space here

>  void put_mtd_device(struct mtd_info *mtd)
>  {
>  	mutex_lock(&mtd_table_mutex);
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index cd0be91bdefa..fe71358f8eaa 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -570,6 +570,8 @@ extern struct mtd_info *get_mtd_device(struct mtd_inf=
o *mtd, int num);
>  extern int __get_mtd_device(struct mtd_info *mtd);
>  extern void __put_mtd_device(struct mtd_info *mtd);
>  extern struct mtd_info *get_mtd_device_nm(const char *name);
> +extern struct mtd_info *get_mtd_device_by_node(
> +		const struct device_node *of_node);
>  extern void put_mtd_device(struct mtd_info *mtd);
> =20
> =20

Otherwise,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
