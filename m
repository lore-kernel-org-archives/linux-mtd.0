Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B7606A335
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CfU3ZHm5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z47ZNjNR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xRB2tbU+V9bb7Tj5PJcjim3lPO8+PAD8xcnwzMnZyUU=; b=CfU3ZHm5f7iUUOZ61J4A70s4A7
	IxNNRhCx/OtNBJj1ktSHY5g2cbOArx90boNUtDEPxmv11wmEosr2OJ+S2XfGpOLM4Ebt88uIUUrz/
	eMRbO0noJNO5qcreooPzblS4gDA7ZN4zch6gmr9SvUVlBtJxwLNx61QqdmSwuxi1u8JiQs23IIBWR
	GPa4XrDp70/RKH0aAO8wjw+c2JZl6kAiGA9ID+E/70bbSMC9D8XGT3kpFy/FKka1tWb8d5Ez1gIA7
	AxH/bxuBTZxNKp3B9vUgdUUtFPACtYwxjqb/Eh2pcRk68zYEQJvbIa5d4AueWA8TNHBvV7u3iSMXR
	P2Bu4eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNo9-0000000EyHA-1x70;
	Fri, 20 Nov 2026 12:33:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNo8-0000000EyGL-0uoi
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 12:33:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 935AC4024C;
	Fri, 20 Nov 2026 12:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 900061F000D3;
	Fri, 20 Nov 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178015;
	bh=Cd4xaVepHD72b7QviLbxkG3jPYSQ+lzF4/87vIxXYlw=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=Z47ZNjNRpA9CyKNaylkPEkwMygpR3kcuL/gT9XIn892aoeg8o2G6nKyaHsLEhp6dj
	 qC/Gcoq4O9fB/ayzLR4w1bswm7EeG3KFmj4yCRR8dEashZHo4lL9Xw1+/crZxQLU3a
	 rQVIIL8tDP6euNmGIpuXqWHO8oSsJh1eUTMRDZ/mE8Ux9hqVcOVECpe0SD32s97KHz
	 Ey+teYRqtAzd+L4nK92DSVikbtt6+8w8NEh1XDCMUYVE1frIMtCHEhS7JhvBujClJK
	 OGsOBsgLhCZpZNvmEUbXDGeC1L56gG6OuwtDF3ZjKv4N2fcP0zzNq5qrXL8TigIdOz
	 WpKzCaAbBQztw==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 20 Nov 2026 13:33:31 +0100
Message-Id: <DN01HTG5U6PY.1I5VK9AJ07JLO@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michal.simek@amd.com>, <git@amd.com>, "Amit Kumar Mahapatra"
 <amit.kumar-mahapatra@amd.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Srikanth Boyapally" <srikanth.boyapally@amd.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Store GPIO info for resetting device
 during resume
X-Mailer: aerc 0.20.0
References: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
 <20261120-nor_11_20-v1-1-70332a54037f@amd.com>
In-Reply-To: <20261120-nor_11_20-v1-1-70332a54037f@amd.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3689812318316715739=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3689812318316715739==
Content-Type: multipart/signed;
 boundary=9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Nov 20, 2026 at 12:01 PM CET, Srikanth Boyapally wrote:
> From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>
> Upon resume, SPI-NOR triggers the hardware reset API to reset the flash
> device by toggling the GPIO. This step is necessary because after resume,
> the flash needs to be put in SDR mode. To facilitate this, SPI-NOR needs
> GPIO information to reset the flash device. Therefore, a gpio_desc member
> is added to the spi_nor structure to retain the GPIO information and
> utilize it for resetting the device.
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 11 +++++++----
>  include/linux/mtd/spi-nor.h |  2 ++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 90524c58602e..11227f8fa8ea 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3389,11 +3389,14 @@ static int spi_nor_set_mtd_info(struct spi_nor *n=
or)
> =20
>  static int spi_nor_hw_reset(struct spi_nor *nor)
>  {
> -	struct gpio_desc *reset;
> +	struct gpio_desc *reset =3D nor->reset;
> =20
> -	reset =3D devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR_OR_NULL(reset))
> -		return PTR_ERR_OR_ZERO(reset);
> +	if (!reset) {

Please set this the proper way in spi_nor_scan() and just use it
here.

-michael

> +		reset =3D devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
> +		if (IS_ERR_OR_NULL(reset))
> +			return PTR_ERR_OR_ZERO(reset);
> +		nor->reset =3D reset;
> +	}
> =20
>  	/*
>  	 * Experimental delay values by looking at different flash device
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3e3c6b10186..46b1f92a490a 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -374,6 +374,7 @@ struct spi_nor_flash_parameter;
>   *                      settings that can be overwritten by the spi_nor_=
fixups
>   *                      hooks, or dynamically when parsing the SFDP tabl=
es.
>   * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
> + * @reset:		GPIO descriptor for device reset.
>   * @priv:		pointer to the private data
>   */
>  struct spi_nor {
> @@ -415,6 +416,7 @@ struct spi_nor {
>  		struct spi_mem_dirmap_desc *rdesc;
>  		struct spi_mem_dirmap_desc *wdesc;
>  	} dirmap;
> +	struct gpio_desc	*reset;
> =20
>  	void *priv;
>  };


--9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawA+GxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i+IAF+JMf0qAHeaawsOdQyUSgx97VR4Xj5/77x
sC0kOwHMuzvBbaakKD/Vs6k/7fPLxd/rAYCu8W7HFLv1JUDjtdhNE6qWAob3Ae4/
hIrMfmbPavGNziIF+dVDy78K63tG7oF7q/0=
=1hpv
-----END PGP SIGNATURE-----

--9582cc259129a8f4ebe4b845f7eb0ba9f1675c988c8d1e0c944e8705bca3--


--===============3689812318316715739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3689812318316715739==--

