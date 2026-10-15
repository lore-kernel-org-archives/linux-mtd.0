Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83398CC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeLiZOAz2LMMoTJ0dG9PetmSyI8K9bCTVYx+3LKyzRQ=; b=s78CxP1CWuYTME1RH2bvbXCfhZ
	c9snUaU6+u2CwoTH23tZP2B1c25RV+MlVto375hHG0qUaetXAT3D3jiYuqkf492fzwjyNp18B8Ox3
	ynXcJ3DVn94AmUj5xHThhxvgIPAsMEBfH4N5r595CVerwHcD5lhVbO8TuDT/a4TLq0tmKV2z41JHe
	hbwy9WL1a5ErbxFaAQsGQvbLL+TeGqvtKfO6YbRHAh0KRSnj3FakZXLWjynSP0rx0rILOZak5y39q
	ovaqQrJ73fGj/8IOrkbCYSwtcRsjJoazy113wgMqX9ht4a4sQwpslPu5hOWHaSAHVbaCP2Fb1ypPS
	OH6rpx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHe9-0000000HFF8-356K;
	Thu, 15 Oct 2026 09:21:09 +0000
Received: from 0001.3ffe.de ([159.69.201.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHe7-0000000HFDz-0MrB;
	Thu, 15 Oct 2026 09:21:08 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 57DC648D;
	Thu, 15 Oct 2026 11:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1792056064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RhOXfJe2evQSmltYZcqoysV/ojsK0GjNWYjg2pyAuN0=;
	b=qkTBo9hI6+sPXqeenT12ELPrdYL0GOJOtyFSPIXgxRq6GK4IMmNUqa4zVqQwJyGhapmTjI
	ku5fbIeLlZw9IMaQV0mZxTKY7LL9rrPyW0jWHGVvz4VcSokzRzM+x9FQfuq8p5uBKgDVL1
	wtN+QkhNuhLSM3kvlPcr7dkJPfzp0F4NcZ4qJxGJ4svJz0IrIXK5JIxlR0zK3Z8rl8WU8D
	+VI81JPzU0CjbUX7sCpRqh40Fky5f3U0viqxNrw55gL8fqrdBVObQaQcLOzzGF0DCgapz2
	Nv2v9AHnch1xy+b/hPijrh81mUG2kPf0svxawFPomN+5yrYI4o7MY9XDkHXEuA==
Mime-Version: 1.0
Date: Thu, 15 Oct 2026 11:21:02 +0200
Message-Id: <DM5AUTOSX5TD.2RD50MZ8S8GAF@walle.cc>
Subject: Re: [PATCH v8 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
From: "Michael Walle" <michael@walle.cc>
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 <pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <aaro.koskinen@iki.fi>, <gregkh@linuxfoundation.org>,
 <mathieu.dubois-briand@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1790847519.git.manikandan.m@microchip.com>
 <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
In-Reply-To: <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_022107_273340_372E08D2 
X-CRM114-Status: GOOD (  29.53  )
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
Content-Type: multipart/mixed; boundary="===============4294679875070562085=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4294679875070562085==
Content-Type: multipart/signed;
 boundary=499acbdbca56ee494925b2505869d62d751ec95367d3b21bbc9e541b217b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--499acbdbca56ee494925b2505869d62d751ec95367d3b21bbc9e541b217b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 14, 2026 at 8:40 AM CEST, Manikandan Muralidharan wrote:
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
> index 8bc117b46e02..4e47459b1679 100644
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

I've missed replying to your former question about this, sorry. Yeah
I was implying to always add the nvmem device regardless of the
device tree. I don't see a reason why it should only be added if dt
node is there. Userspace might still do something useful with it.

So if you'll respin a new version you can remove the check,
otherwise it could be a follow-up patch.

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael


> +
> +	config.dev =3D dev;
> +	config.of_node =3D np;
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


--499acbdbca56ee494925b2505869d62d751ec95367d3b21bbc9e541b217b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatCa/hEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+AyOAYDi48emPwhdKyXoa8JthR5GGnUzBcZHL2J2
pZ6C6SSkmiXIHMoOJ/Th4WD1Cl8r1AgBf0EKFYwI9hHKsvev5mSZE2raQt8NV+Ew
jpesdTau2EQaMxsXwnVl9FK/rXeEsy0+Hw==
=sngz
-----END PGP SIGNATURE-----

--499acbdbca56ee494925b2505869d62d751ec95367d3b21bbc9e541b217b--


--===============4294679875070562085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4294679875070562085==--

