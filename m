Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6EAC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLikRWBKEaOb2Dz/BrD3GjBtOGivP59MLkdICLGllEQ=; b=OJliUFqSpHtxLU
	t7mtv711h9TjhpvN+/JnRoMaq4qQV1l/5HnTNiPzdIyU6U7RPKcPxnkMZO8YmJwmJC+QkDOeUfC8c
	5oICT2IYzx379CHKvj1mbfFpyVpZa6DWQa2+rCNlEG8uQVv7n70VfCg+jbasjH5zm/vawNy9bZZvV
	YpbIkBcKsVdL3GA/HhrFpuPURycInpBfUAT+feRURNNok7hIf0XXRiGEQyYGz/31cQoBbeyzpS1/q
	zgxmuFzZWuF6wPiy/Xllh4Teq6LtbRE74NAmGSei3/5lK9xOBaVXkS1mM5LdB0FnlKKr6bb3IpoA0
	payAtx3Kx7DELREv//5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVoa-006NgC-Ik; Tue, 07 Jun 2022 09:47:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVWZ-006E3L-T7; Tue, 07 Jun 2022 09:29:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2579SvHT126954;
	Tue, 7 Jun 2022 04:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654594137;
	bh=Nyq1TKZIJGCjqSBfilV1ispV0YrXu83a8Dkd9vgWxVQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Vpt6++216SyMW8110zf+/0xnsrVnAN1wv/+pjnDzkKWxJzLYzazUaoyvO7NLf4nb9
	 PaJI2XU3SRsSeKDDPvl4u6wd+PIwbCHOHiTsywvksnD4HY8AZW7LGzBbex7Tdh01FQ
	 Ij9mbtl57BCvsfQvDvSfY086nI26vhfv/dIt1PpU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2579Svuq007627
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jun 2022 04:28:57 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 04:28:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 04:28:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2579Sufl051892;
	Tue, 7 Jun 2022 04:28:57 -0500
Date: Tue, 7 Jun 2022 14:58:56 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh
 Raghavendra <vigneshr@ti.com>, Joel Stanley <joel@jms.id.au>,
        <kernel@pengutronix.de>, Michael Walle <michael@walle.cc>,
        Andrew Jeffery
	<andrew@aj.id.au>,
        =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
        <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 02/14] mtd: spi-nor: aspeed-smc: Make
 aspeed_smc_unregister() return void
Message-ID: <20220607092856.jh7jj4snlobx2kae@ti.com>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
 <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603210758.148493-3-u.kleine-koenig@pengutronix.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_022920_171966_8F4C499C 
X-CRM114-Status: GOOD (  21.27  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Uwe,

On 03/06/22 11:07PM, Uwe Kleine-K=F6nig wrote:
> The function returns zero unconditionally, so simplify to make it
> obvious there is no error to handle in the callers.
> =

> This is a preparation for making platform remove callbacks return void.

Cedric recently ported the driver to SPI MEM and it has now hit the =

linux-next tree [0]. This driver is planned to be removed. Can you =

please check if the new driver has this issue, and fix it there?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit?id=3D9c63b846e6df43e5b3d31263f7db545f32deeda3

> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/s=
pi-nor/controllers/aspeed-smc.c
> index acfe010f9dd7..bd149104533a 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -399,7 +399,7 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *=
nor, loff_t to,
>  	return len;
>  }
>  =

> -static int aspeed_smc_unregister(struct aspeed_smc_controller *controlle=
r)
> +static void aspeed_smc_unregister(struct aspeed_smc_controller *controll=
er)
>  {
>  	struct aspeed_smc_chip *chip;
>  	int n;
> @@ -409,13 +409,13 @@ static int aspeed_smc_unregister(struct aspeed_smc_=
controller *controller)
>  		if (chip)
>  			mtd_device_unregister(&chip->nor.mtd);
>  	}
> -
> -	return 0;
>  }
>  =

>  static int aspeed_smc_remove(struct platform_device *dev)
>  {
> -	return aspeed_smc_unregister(platform_get_drvdata(dev));
> +	aspeed_smc_unregister(platform_get_drvdata(dev));
> +
> +	return 0;
>  }
>  =

>  static const struct of_device_id aspeed_smc_matches[] =3D {
> -- =

> 2.36.1
> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
