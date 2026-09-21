Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9A1C982E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:To:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=co0mS7MVjQ7Uo3RYIBOTnv5XcJtBinjvkJiIWaSrFmw=; b=klNKhQ6KZAbmBz0JBzcTM1UzJG
	CLh732uSUKhqjU+iyDyox/Op07uCDoI40AS3BnnTYf0d+uUizpV+PIv6+GE87VxyVoHWZzzcpmsCo
	KZnkO216wSa5n5HqUL7tq8zENufhJV805dPxeM3E+BKmh1OyqXLhjMxDck0qBSA2irUjNm87pkGlY
	5kaM2YM6bZ2UJBsB8/VM2fSRDzmZZHmvJgQ2lnaAFVsHB9A85wfW5WMCiC+vOvRu920/1BZyBWgwR
	OiJXzATwF1lsUoBG8pcza4e9umv4L/ysF3Xq9XGO4Mqpmpv+sJ66OfbzPMrPEgUmLdPpHG1M2S3Mo
	Ol0ArJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YPp-00000001Cps-4755;
	Mon, 21 Sep 2026 07:26:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YPo-00000001Cpb-2p6u
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 07:26:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 2D24C42B82;
	Mon, 21 Sep 2026 07:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8A0F91F000FF;
	Mon, 21 Sep 2026 07:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789975576;
	bh=8yW6mavFoEMcl7M1W8hv+ABf7tHoVIkL5Sy11O66P/Q=;
	h=Date:To:Subject:From:References:In-Reply-To;
	b=AsKpdfiObhPuA6EBwLXoiVWpHZfXwfcyXtBDQ8jIlBd+IY+mIF+x3VuBVX+96iR8n
	 n9SENI052ZqzSecf7dZJ24G1ufSX3TDBlwmK0djvW/ZZgMHgiyQk8Caz0w2dQyfuer
	 B6kZm5KsyWWztU+KTLyRg25K9tTXN/vpTRSHz0OfkKirbUUDXjL8cC3il0t3nkxjZf
	 MKhGnVN5hv7qZfoJIQqWuRPW9WSIuStKp3Ug3KsWe8BFXYIcBWk8TiKvsAz5dqUWhG
	 gJM9rnu5kDzkGuhCQqO8MzVMttx71AcAw4aOSLAKixSeH1vXuumLcPyChavCdFIg+b
	 cCMa/AVhBCZjw==
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 09:26:12 +0200
Message-Id: <DLKTDTVQ5G87.3RWBEBN7AV0UI@kernel.org>
To: <tze.yee.ng@altera.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: core: Fix use-after-free of spi_nor
 on unbind with open handles
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1788404586.git.tze.yee.ng@altera.com>
 <91e1b12d15d18361f77e5cca934fd4b37a47805b.1788404586.git.tze.yee.ng@altera.com>
In-Reply-To: <91e1b12d15d18361f77e5cca934fd4b37a47805b.1788404586.git.tze.yee.ng@altera.com>
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
Content-Type: multipart/mixed; boundary="===============7066980814864221732=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7066980814864221732==
Content-Type: multipart/signed;
 boundary=4da9529911c7f0f3bd8fc4358ce7ff4a6070f54486a57ccd61a1d0dccbb7;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--4da9529911c7f0f3bd8fc4358ce7ff4a6070f54486a57ccd61a1d0dccbb7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 5:14 AM CEST, tze.yee.ng wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
>
> The spi_nor is allocated with devm_kzalloc() on the SPI device, so a
> sysfs unbind frees it while /dev/mtdX is still open. A later close then
> oopses in spi_nor_put_device()->module_put() on the freed spi_nor.
> try_module_get() does not help: it blocks rmmod, not an unbind.
>
> Give the spi_nor (and its params and bouncebuf) a kref lifetime on the
> spi-mem probe path so it survives until the last MTD user is gone, and
> cache the controller module for the put path. The spimem and dirmaps
> stay owned by the SPI core, so spi_nor_remove() drains in-flight
> operations and sets nor->removed to fail later ones with -ENODEV.
> Legacy controllers are unchanged.
>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

Sashiko had some remarks:

https://sashiko.dev/#/patchset/cover.1788404586.git.tze.yee.ng%40altera.com

Also how does the other mtd subsystems (spi-nand?) doing this? Do we
have the wrong dev for devres?

-michael

> ---
>  drivers/mtd/spi-nor/core.c  | 111 ++++++++++++++++++++++++++++++++----
>  include/linux/mtd/spi-nor.h |  17 ++++++
>  2 files changed, 118 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8bc117b46e02..7fb61dde58f5 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -45,6 +45,9 @@
>  #define SPI_NOR_SRST_SLEEP_MIN 200
>  #define SPI_NOR_SRST_SLEEP_MAX 400
> =20
> +static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t sta=
rt, size_t len);
> +static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t sta=
rt, size_t len);
> +
>  /**
>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>   *			   extension type.
> @@ -1345,8 +1348,15 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
>  	else
>  		ret =3D wait_event_killable(nor->rww.wait,
>  					  spi_nor_rww_start_exclusive(nor));
> +	if (ret)
> +		return ret;
> =20
> -	return ret;
> +	if (nor->removed) {
> +		spi_nor_unlock_and_unprep(nor);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
>  }
> =20
>  void spi_nor_unlock_and_unprep(struct spi_nor *nor)
> @@ -1416,8 +1426,15 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor=
 *nor, loff_t start, size_t le
>  	else
>  		ret =3D wait_event_killable(nor->rww.wait,
>  					  spi_nor_rww_start_pe(nor, start, len));
> +	if (ret)
> +		return ret;
> =20
> -	return ret;
> +	if (nor->removed) {
> +		spi_nor_unlock_and_unprep_pe(nor, start, len);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
>  }
> =20
>  static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t sta=
rt, size_t len)
> @@ -1489,8 +1506,15 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor=
 *nor, loff_t start, size_t le
>  	else
>  		ret =3D wait_event_killable(nor->rww.wait,
>  					  spi_nor_rww_start_rd(nor, start, len));
> +	if (ret)
> +		return ret;
> =20
> -	return ret;
> +	if (nor->removed) {
> +		spi_nor_unlock_and_unprep_rd(nor, start, len);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
>  }
> =20
>  static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t sta=
rt, size_t len)
> @@ -3186,7 +3210,12 @@ static int spi_nor_init_params(struct spi_nor *nor=
)
>  {
>  	int ret;
> =20
> -	nor->params =3D devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL=
);
> +	/* Keep params on the kref lifetime so it survives unbind (see probe). =
*/
> +	if (nor->refcounted)
> +		nor->params =3D kzalloc(sizeof(*nor->params), GFP_KERNEL);
> +	else
> +		nor->params =3D devm_kzalloc(nor->dev, sizeof(*nor->params),
> +					   GFP_KERNEL);
>  	if (!nor->params)
>  		return -ENOMEM;
> =20
> @@ -3420,6 +3449,22 @@ static void spi_nor_resume(struct mtd_info *mtd)
>  		dev_err(dev, "resume() failed\n");
>  }
> =20
> +static void spi_nor_release(struct kref *kref)
> +{
> +	struct spi_nor *nor =3D container_of(kref, struct spi_nor, refcount);
> +
> +	kfree(nor->bouncebuf);
> +	kfree(nor->params);
> +	kfree(nor);
> +}
> +
> +static void spi_nor_release_device(void *data)
> +{
> +	struct spi_nor *nor =3D data;
> +
> +	kref_put(&nor->refcount, spi_nor_release);
> +}
> +
>  static int spi_nor_get_device(struct mtd_info *mtd)
>  {
>  	struct mtd_info *master =3D mtd_get_master(mtd);
> @@ -3434,6 +3479,12 @@ static int spi_nor_get_device(struct mtd_info *mtd=
)
>  	if (!try_module_get(dev->driver->owner))
>  		return -ENODEV;
> =20
> +	if (nor->refcounted) {
> +		/* Cache the module: the spimem/controller chain may be freed by put t=
ime. */
> +		nor->controller_module =3D dev->driver->owner;
> +		kref_get(&nor->refcount);
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -3443,6 +3494,14 @@ static void spi_nor_put_device(struct mtd_info *mt=
d)
>  	struct spi_nor *nor =3D mtd_to_spi_nor(master);
>  	struct device *dev;
> =20
> +	if (nor->refcounted) {
> +		module_put(nor->controller_module);
> +
> +		/* Must be last: this may free nor (and the embedded mtd). */
> +		kref_put(&nor->refcount, spi_nor_release);
> +		return;
> +	}
> +
>  	if (nor->spimem)
>  		dev =3D nor->spimem->spi->controller->dev.parent;
>  	else
> @@ -3655,8 +3714,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *=
name,
>  	 * than 1KB) after spi_nor_scan() returns.
>  	 */
>  	nor->bouncebuf_size =3D PAGE_SIZE;
> -	nor->bouncebuf =3D devm_kmalloc(dev, nor->bouncebuf_size,
> -				      GFP_KERNEL);
> +	if (nor->refcounted)
> +		nor->bouncebuf =3D kmalloc(nor->bouncebuf_size, GFP_KERNEL);
> +	else
> +		nor->bouncebuf =3D devm_kmalloc(dev, nor->bouncebuf_size,
> +					      GFP_KERNEL);
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
> =20
> @@ -3788,10 +3850,21 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  	if (ret)
>  		return ret;
> =20
> -	nor =3D devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
> +	/*
> +	 * An open /dev/mtdX handle can outlive unbind, so manage the spi_nor
> +	 * with a kref and drop the probe-time reference from a devres callback=
.
> +	 */
> +	nor =3D kzalloc_obj(*nor, GFP_KERNEL);
>  	if (!nor)
>  		return -ENOMEM;
> =20
> +	kref_init(&nor->refcount);
> +	nor->refcounted =3D true;
> +
> +	ret =3D devm_add_action_or_reset(dev, spi_nor_release_device, nor);
> +	if (ret)
> +		return ret;
> +
>  	nor->spimem =3D spimem;
>  	nor->dev =3D dev;
>  	spi_nor_set_flash_node(nor, dev->of_node);
> @@ -3830,9 +3903,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  	 */
>  	if (nor->params->page_size > PAGE_SIZE) {
>  		nor->bouncebuf_size =3D nor->params->page_size;
> -		devm_kfree(dev, nor->bouncebuf);
> -		nor->bouncebuf =3D devm_kmalloc(dev, nor->bouncebuf_size,
> -					      GFP_KERNEL);
> +		kfree(nor->bouncebuf);
> +		nor->bouncebuf =3D kmalloc(nor->bouncebuf_size, GFP_KERNEL);
>  		if (!nor->bouncebuf)
>  			return -ENOMEM;
>  	}
> @@ -3853,6 +3925,25 @@ static int spi_nor_remove(struct spi_mem *spimem)
>  {
>  	struct spi_nor *nor =3D spi_mem_get_drvdata(spimem);
> =20
> +	/*
> +	 * Drain in-flight operations and set nor->removed under the lock so
> +	 * later ones fail with -ENODEV before touching SPI-core state (spimem,
> +	 * dirmaps) freed after this returns. The wait is uninterruptible.
> +	 */
> +	if (!spi_nor_use_parallel_locking(nor))
> +		mutex_lock(&nor->lock);
> +	else
> +		wait_event(nor->rww.wait, spi_nor_rww_start_exclusive(nor));
> +
> +	nor->removed =3D true;
> +
> +	if (!spi_nor_use_parallel_locking(nor)) {
> +		mutex_unlock(&nor->lock);
> +	} else {
> +		spi_nor_rww_end_exclusive(nor);
> +		wake_up(&nor->rww.wait);
> +	}
> +
>  	spi_nor_restore(nor);
> =20
>  	/* Clean up MTD stuff. */
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 4b92494827b1..f8d5e3ca8371 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -7,6 +7,7 @@
>  #define __LINUX_MTD_SPI_NOR_H
> =20
>  #include <linux/bitops.h>
> +#include <linux/kref.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/spi/spi-mem.h>
> =20
> @@ -352,6 +353,18 @@ struct spi_nor_flash_parameter;
>   * @rww.used_banks:	bitmap of the banks in use
>   * @dev:		pointer to an SPI device or an SPI NOR controller device
>   * @spimem:		pointer to the SPI memory device
> + * @refcount:		reference count keeping the kzalloc()'d spi_nor alive
> + *			past driver unbind until the last MTD user releases the
> + *			device. Only valid when @refcounted is set.
> + * @controller_module:	controller module pinned in spi_nor_get_device() =
so
> + *			spi_nor_put_device() need not walk the possibly freed
> + *			spimem/controller chain. Only valid when @refcounted is
> + *			set.
> + * @refcounted:		true when the spi_nor lifetime is kref-managed (the
> + *			spi-mem spi_nor_probe() path). Legacy controllers that
> + *			embed or devres-allocate spi_nor leave this clear.
> + * @removed:		set on unbind to make subsequent MTD operations fail
> + *			with -ENODEV instead of touching released resources.
>   * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
>   *                      layer is not DMA-able
>   * @bouncebuf_size:	size of the bounce buffer
> @@ -393,6 +406,10 @@ struct spi_nor {
>  	} rww;
>  	struct device		*dev;
>  	struct spi_mem		*spimem;
> +	struct kref		refcount;
> +	struct module		*controller_module;
> +	bool			refcounted;
> +	bool			removed;
>  	u8			*bouncebuf;
>  	size_t			bouncebuf_size;
>  	u8			*id;


--4da9529911c7f0f3bd8fc4358ce7ff4a6070f54486a57ccd61a1d0dccbb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarDcFBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hJ/AGAmdWkhcFUK5YaCXcx0TD4eQk04TiQrx/3
NOdu7YvA1ALfLnNMS1LUjioBo6HGRp4/AYD8VlztQLjhmwsQKzwy+gn54D+39YUD
15YVSRp9SU4yBydCb7o7KBGAiyT/uRjRluQ=
=NmPV
-----END PGP SIGNATURE-----

--4da9529911c7f0f3bd8fc4358ce7ff4a6070f54486a57ccd61a1d0dccbb7--


--===============7066980814864221732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7066980814864221732==--

