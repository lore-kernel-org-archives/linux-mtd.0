Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4F3C44529
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 07:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmnz+pskYRXJvbAkgS3jwrHWmPitkvx0tHCAFcJjyfo=; b=pXTrU45fREmW487S0JLkLaeLsV
	d8uH7KrW75B//7Z6ugrb4+zkqtoCN4Zt5rTUknEVom76YNOBc5TRIzfD7P4119PY6FgrPvtqS/YG/
	AATPlSsP0gZSL3I0BHfi1Qn+GvKqyga94CqLSSfQc4c803y0TCsoTHzUNxtuW+J0JE8Y+2vDf+e0S
	q6xhxUsL3r4+jsHBk5KFS8Qwvvq68nlEivcPBByw8yBh/E1Sad9LO0aUGH/m3LhCsmOuRIHn8yF1Y
	b8KEt8Pba0m+nWv5980KSOcjuBtV0yqKk49W2NrfstvaLCjXTrBcBQT38XjzGQbwXKHoimuqK+pcl
	2GhKoY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4VL-00000008cLj-0sRS;
	Tue, 21 Jul 2026 07:03:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4VD-00000008cLB-3RYl;
	Tue, 21 Jul 2026 07:02:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 4DB59403DE;
	Tue, 21 Jul 2026 07:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A15EE1F000E9;
	Tue, 21 Jul 2026 07:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784617375;
	bh=OBsF4MqETY56ssEgpu6SKhe35ZopnEYwy2uOFqShRcc=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=DyLNqWZdhVBsfe38MWOiQ7wvrNaacFN0VQKb45lMHeGqFyyjmOWiGCZWPejEzeWxS
	 y6gGoLWvI/ZwPHJPRBsTH3rJ5oq1Mv4js2JCxKoGNDKIb2ys1WaLHM9SHcwVYvzaVz
	 6KZPXfsV6sUyyh5Ix9A3lR5ihn9TU1mAF3qQZoA/lZatOuWkJCS4ClwUPGDH8FdFC5
	 qys7ZFF5IKLLmzY886x/T8AouATRw22Ye35FdeciKurzyu3AMj55oVRfFuoqHhNDV6
	 7aWl18jzA6txmaYEKuKhGX7fs2rz36AJhSXRgT5HHbAd4+gOJYX7dXCUgRd9dvmqwo
	 5imnmCyv9OTIQ==
Mime-Version: 1.0
Date: Tue, 21 Jul 2026 09:02:50 +0200
Message-Id: <DK42262TYFG1.NZKF4VGZGSRM@kernel.org>
Subject: Re: [PATCH v5 3/7] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
From: "Michael Walle" <mwalle@kernel.org>
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 <pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260721052859.171341-1-manikandan.m@microchip.com>
 <20260721052859.171341-4-manikandan.m@microchip.com>
In-Reply-To: <20260721052859.171341-4-manikandan.m@microchip.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1975423644269165193=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1975423644269165193==
Content-Type: multipart/signed;
 boundary=f646fa6642aebc0291ef5150c4b7b201441504be25ea95e6750cba8492ba;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f646fa6642aebc0291ef5150c4b7b201441504be25ea95e6750cba8492ba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jul 21, 2026 at 7:28 AM CEST, Manikandan Muralidharan wrote:
> The SPI NOR core already reads the SFDP tables during enumeration and
> caches them in nor->sfdp->dwords (see spi_nor_parse_sfdp()). Re-expose
> that cached data as a read-only NVMEM device, in on-flash byte order,
> rooted at the flash's SFDP child node (compatible "jedec,sfdp").
>
> This lets NVMEM cells reference any SFDP data: a fixed-layout for
> parameters at a known offset, or an nvmem-layout parser for vendor data
> whose location must be discovered at runtime.The device is only registere=
d
> when an "sfdp" node is present in the device tree.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c |  8 ++++
>  drivers/mtd/spi-nor/core.h |  1 +
>  drivers/mtd/spi-nor/sfdp.c | 86 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd0..b833d8ec2d65 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3204,6 +3204,14 @@ static int spi_nor_init_params(struct spi_nor *nor=
)
>  		spi_nor_init_params_deprecated(nor);
>  	}
> =20
> +	/*
> +	 * Expose the SFDP table as an NVMEM device only when
> +	 * the flash actually provides one
> +	 */
> +	ret =3D spi_nor_register_sfdp_nvmem(nor);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D spi_nor_late_init_params(nor);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index ba2d1a862c9d..0a6484298c5c 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -698,6 +698,7 @@ int spi_nor_controller_ops_write_reg(struct spi_nor *=
nor, u8 opcode,
> =20
>  int spi_nor_check_sfdp_signature(struct spi_nor *nor);
>  int spi_nor_parse_sfdp(struct spi_nor *nor);
> +int spi_nor_register_sfdp_nvmem(struct spi_nor *nor);

That's probably not needed if..

>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 4600983cb579..704799fe92ae 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -6,6 +6,8 @@
> =20
>  #include <linux/bitfield.h>
>  #include <linux/mtd/spi-nor.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
>  #include <linux/sort.h>
> =20
> @@ -1612,3 +1614,87 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  	kfree(param_headers);
>  	return err;
>  }
> +
> +static int spi_nor_sfdp_reg_read(void *priv, unsigned int offset,
> +				 void *val, size_t bytes)
> +{
> +	struct spi_nor *nor =3D priv;
> +	struct sfdp *sfdp =3D nor->sfdp;
> +	size_t sfdp_size =3D sfdp->num_dwords * sizeof(*sfdp->dwords);
> +
> +	if (offset >=3D sfdp_size || bytes > sfdp_size - offset)
> +		return -EINVAL;
> +
> +	/* The cached SFDP is kept in on-flash (little-endian) byte order. */
> +	memcpy(val, (u8 *)sfdp->dwords + offset, bytes);
> +
> +	return 0;
> +}
> +
> +static void spi_nor_sfdp_nvmem_put_np(void *data)
> +{
> +	of_node_put(data);
> +}
> +
> +/**
> + * spi_nor_register_sfdp_nvmem() - expose the SFDP as a read-only NVMEM =
device
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * Expose the whole SFDP, in on-flash byte order, as a read-only NVMEM d=
evice
> + * rooted at the flash's SFDP child node (compatible "jedec,sfdp"). This=
 lets
> + * generic (fixed-layout) or vendor (nvmem-layout) cells reference any S=
FDP
> + * data. The device is only registered when a child node with the "jedec=
,sfdp"
> + * compatible is described in the device tree.
> + *
> + * Return: 0 on success or if there is nothing to do, -errno otherwise.
> + */
> +int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)

.. you move all this into the core, as the sfdp.c is just for
parsing the tables.

> +{
> +	struct device *dev =3D nor->dev;
> +	struct nvmem_config config =3D { };
> +	struct nvmem_device *nvmem;
> +	struct device_node *np;
> +	int ret;
> +
> +	if (!nor->sfdp)
> +		return 0;
> +
> +	for_each_available_child_of_node(dev_of_node(dev), np)
> +		if (of_device_is_compatible(np, "jedec,sfdp"))
> +			break;

There is already of_get_compatible_child() doing exactly this.

> +	if (!np)
> +		return 0;
> +
> +	/*
> +	 * Register the put before devm_nvmem_register() so it runs last on
> +	 * detach, after the NVMEM device that uses the node is gone.
> +	 */
> +	ret =3D devm_add_action_or_reset(dev, spi_nor_sfdp_nvmem_put_np, np);
> +	if (ret)
> +		return ret;
> +
> +	config.dev =3D dev;
> +	config.of_node =3D np;
> +	config.name =3D "sfdp";
> +	config.id =3D NVMEM_DEVID_AUTO;

Or rather NVEMEM_DEVID_NONE? There will ever be just one SFDP nvmem
device.

How does the sysfs path looks like?

-michael

> +	config.owner =3D THIS_MODULE;
> +	config.read_only =3D true;
> +	config.word_size =3D 1;
> +	config.stride =3D 1;
> +	config.size =3D (int)(nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords=
));
> +	config.reg_read =3D spi_nor_sfdp_reg_read;
> +	config.priv =3D nor;
> +
> +	nvmem =3D devm_nvmem_register(dev, &config);
> +	if (IS_ERR(nvmem)) {
> +		/* NVMEM support is optional. */
> +		if (PTR_ERR(nvmem) =3D=3D -EOPNOTSUPP)
> +			return 0;
> +		return dev_err_probe(dev, PTR_ERR(nvmem),
> +				     "failed to register SFDP NVMEM device\n");
> +	}
> +
> +	dev_dbg(dev, "exposed %d-byte SFDP as an NVMEM device\n", config.size);
> +
> +	return 0;
> +}

--f646fa6642aebc0291ef5150c4b7b201441504be25ea95e6750cba8492ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCal8ZmxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jI+gGApwOnOpXUv7Zjj+U2mJCjeDL0lR5USIAD
0l7ybzzM7hifaHLRlC77ydazna1FpzDhAYCtE8Ybt4b1fhNt3fuTqkrImKBWU89W
wwSrwwJi/Sz4H5ZWP3Im1o+w6tW/n4epJHc=
=dC2d
-----END PGP SIGNATURE-----

--f646fa6642aebc0291ef5150c4b7b201441504be25ea95e6750cba8492ba--


--===============1975423644269165193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1975423644269165193==--

