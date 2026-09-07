Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA546C79F89
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tnq5xl4v4xNRNWcU0iDML2WmEhG+xamQALP9flcKkr0=; b=nAIkkY7jv4cr4BfwHSp4ZskWlv
	hxV+s2OkBU94EGGxQAY6GvquvdaefmqjnLn+RK27pAy7ZgHg95/ZQEf/LF365FBSBt80udQwvWJtE
	ERmztwrqsVhalSOhuPJVEkYe4fQd50P9+8AJ/pMyoovItzPtmbE1AiDpro6+P6irh1zT786ewvvgD
	9d9guoZL17Xz2RSp27aYoiRNiNTs0cSz4VUaV6uk+x+4V0qFYNB+YnWkeUZIXKRkEF8r2dwlbkdEM
	5aRcdiTo/FFbkNQP7EZYSdMw5tK0FJx7K/aWZvtOBcotKgVkzmx2z5NYylu5D2YSfJKyIi531hmhY
	EEAqTsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YyC-00000006sk6-1rNa;
	Mon, 07 Sep 2026 13:01:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Yy5-00000006shd-2VUT;
	Mon, 07 Sep 2026 13:01:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E584A44033;
	Mon,  7 Sep 2026 13:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 48E861F00A3E;
	Mon,  7 Sep 2026 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788786060;
	bh=F4VPyTZ54caW5/2FxinE0de1h566CHchl8PU7RTCzwc=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=lXXFAFrMyZ9iKDuZFZc+3TX/Lq9T58AIoBg9QtiliUStbSJuHnH3Yra7cawchxONc
	 O4kY5HVIfpMwr47rs4xxpDXqtpktWvgbvzG4EIsoU/GCNyr7J73CNyhrDtAV65us3e
	 6vnJLJoU64Q4Ig23QTnsF6BAXMStV4cs9FmR3Il80hrD0E5D6plOYUWP4HD3J3eW2V
	 6fl7sYBKhBdbOOavIU70LSIsaH1ublZBgOzdQ4JXqcVhooea+IZpPurqWGh/7o/xk6
	 lEeOONnJcPoDBjBzw8ZJJQN8Q3jHPuEhOyes4E8fnutATQMJIaQdC3MzBx56TKDb1Z
	 i3IYSINXbNXRw==
Mime-Version: 1.0
Date: Mon, 07 Sep 2026 15:00:56 +0200
Message-Id: <DL93QHVC01B9.3U3K1G8NC0MZA@kernel.org>
Subject: Re: [PATCH v7 3/7] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
From: "Michael Walle" <mwalle@kernel.org>
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 <pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
 <linusw@kernel.org>, <gregkh@linuxfoundation.org>,
 <mathieu.dubois-briand@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260812104955.485667-1-manikandan.m@microchip.com>
 <20260812104955.485667-4-manikandan.m@microchip.com>
In-Reply-To: <20260812104955.485667-4-manikandan.m@microchip.com>
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
Content-Type: multipart/mixed; boundary="===============1355014916414523073=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1355014916414523073==
Content-Type: multipart/signed;
 boundary=cfe8a98efb2086f550102e1210fdc67d01fd1cb7f4b563889cc6dc1396e2;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--cfe8a98efb2086f550102e1210fdc67d01fd1cb7f4b563889cc6dc1396e2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Aug 12, 2026 at 12:49 PM CEST, Manikandan Muralidharan wrote:
> The SPI NOR core already reads the SFDP tables during enumeration and
> caches them in nor->sfdp->dwords (see spi_nor_parse_sfdp()). Re-expose
> that cached data as a read-only NVMEM device, in on-flash byte order,
> rooted at the flash's SFDP child node (compatible "jedec,sfdp").
>
> This lets NVMEM cells reference any SFDP data: a fixed-layout for
> parameters at a known offset, or an nvmem-layout parser for vendor data
> whose location must be discovered at runtime. The device is only register=
ed
> when an "sfdp" node is present in the device tree.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 78 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd0..0425af6e898f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
>  #include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
> @@ -3001,6 +3002,75 @@ static void spi_nor_init_fixup_flags(struct spi_no=
r *nor)
>  		nor->flags |=3D SNOR_F_IO_MODE_EN_VOLATILE;
>  }
> =20
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
> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
> +{
> +	struct device *dev =3D nor->dev;
> +	struct nvmem_config config =3D { };
> +	struct nvmem_device *nvmem;
> +	struct device_node *np;
> +
> +	if (!nor->sfdp)
> +		return 0;
> +
> +	np =3D of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
> +	if (!np)
> +		return 0;

What if there is no jedec,sfdp node? Should this be added anyways?

> +
> +	config.dev =3D dev;
> +	config.of_node =3D np;

What about just:
	config.of_node =3D of_get_compatible_child(dev_of_node(dev), "jedec,sfdp")=
;

> +	config.name =3D "sfdp";
> +	config.id =3D NVMEM_DEVID_AUTO;
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
> +	of_node_put(np);

This now leaves the nvmem device with a dangling pointer. What I
meant in my previous reply, was that you'll add an of_node_get() to
the nvmem_register(), so the nvmem subsystem will have its own
tracking.

-michael

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
> +
>  /**
>   * spi_nor_late_init_params() - Late initialization of default flash par=
ameters.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -3204,6 +3274,14 @@ static int spi_nor_init_params(struct spi_nor *nor=
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


--cfe8a98efb2086f550102e1210fdc67d01fd1cb7f4b563889cc6dc1396e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCap61iBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/icDAF/VWHm4cvVi6eH69TujKUb5gNmCdX4yjPu
yiP2Tou8p7PZd9X/jzhrqIfV0NcAs73vAX4yR4pFZ09gnQn+PF04tW9ejbu3Ytxe
rKK0mE3hj2BhqFjwL4hmXUDfY7oWmgCUgvc=
=u9Aa
-----END PGP SIGNATURE-----

--cfe8a98efb2086f550102e1210fdc67d01fd1cb7f4b563889cc6dc1396e2--


--===============1355014916414523073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1355014916414523073==--

