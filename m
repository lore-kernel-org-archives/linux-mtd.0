Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484F6C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:10:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B91601FE
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 17:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17B91601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvOh5fTfwgD9efvnJR7UxaLHc0bGM5RbVipvmb1oFl8=; b=TfTSBAeB6ioTQfT6lVFrfpoZNC
	i4yFsXxFkjFDfKM5Ar8p+KDczpcpBSHIlYmM1D0Toce25vqY33PnR4Zm8qYCe0CMQ8/gVP8bgljUn
	S9vaf1Wn9SVKe5I7UKL3wNpCe301NzXskGWDC6VcLcLpNEEfoc3tMZtv3H7RKXm9VXvvOH6XEF1oT
	X7uAKYfHHL/Sf7taYFYFjke1zdw17IhTxbqan3ubf1i2RdWf7dJ7WA5V/8vuWZCo8yzEhDGL6a2O5
	yFWCzOsC5OAubUPQT9oRatCzuIdYmNl9/AkzTEcPb27nZ6Nk+U/HpB1UN/YiHYkhcvlSt7Hpnr0BJ
	PT+T0+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlXw-0094Z3-G6; Thu, 19 Aug 2021 17:09:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlSM-0092jf-HX
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 17:03:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso7294327wmj.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oJSyVi1Ti8Nnw90fU6cpGrkDUh7d4poA+u+RmE9yClc=;
 b=WjO9vG1rxjOXSea0lggzneOK1T6brU84ws+V+SOshWtWLDtP8dw4z3PqYpbiYfKli1
 rXcVeuPjT7MJg7Hy5j8m3cd8kdbRkCEcM1Y80y8aKWqMDBpsEeU4BdtyUa/ON6dEIpuI
 ZH83YfvUPLz7N8Eucoioijep/MF/3w0IGFv19+kQ9bZgPKOHNPjpkkiiG7frHJKiLmhR
 PSWLWci5igVYTxBtqkvlj5fV5Gwf9+1XGIFKjnJNTLfzWugJ7siIAcnkXrphSw12V8Us
 vFqkDjmlPCNix0bh4GlaOKtAD+MVeEwQ6e6JDKcS6m84MivgDrAwN5keeZsMvCUxJPh5
 owbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oJSyVi1Ti8Nnw90fU6cpGrkDUh7d4poA+u+RmE9yClc=;
 b=Ry3HeVJfn4/NK/i7OTVgifTJVQSI7fF3CgRp02iqH1tkNFm9BjjK8/y/X+tTgluk0N
 Xh2HjfBDP2aGdBTGtQUq0mu5GdaTdqtYVtYO7VTSO8k+aOmKUsg0hfxKKe2kIizWRQBl
 NC3MX8mAuBWpJCn+Y6zkL/2qpFKWWZA/wSoGYpMMhMUvlxPNPe8rUmKxWh6//wdbGh0w
 NKxLUe8cJJ7A3Lrm5ulGtkTqGIdsLcreWNsnvp+SJ7oyVQZfpNSgafptkt87bhWk/jSs
 H0ZXoBY3i6IhnmfA3+nWhU8TY5vHQ+8qh1rfUBxjlDnx+gwJi8MYxnXtci4kAB2VClXx
 kbeQ==
X-Gm-Message-State: AOAM530MyMxehELLOi2r1VPscbhfhWgk7BBEZY0Y/WZ1T2K+1b3U3zAj
 DLd7HbqT4JamYy88dlC2VzA=
X-Google-Smtp-Source: ABdhPJzLX7hjX9RRU2YIQz+WOkf7C4KD77ZHazVOwLC50X1dVFEX0qYgndjCiaQPFM42jC66tRB3Yw==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr14362707wmq.43.1629392630595; 
 Thu, 19 Aug 2021 10:03:50 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e3sm3493730wrv.65.2021.08.19.10.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:03:49 -0700 (PDT)
Date: Thu, 19 Aug 2021 19:03:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 20/34] mmc: sdhci-tegra: Add runtime PM and OPP support
Message-ID: <YR6O9Om+HzMMG8AR@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-21-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210817012754.8710-21-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_100354_631522_1A0074C5 
X-CRM114-Status: GOOD (  23.79  )
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
Content-Type: multipart/mixed; boundary="===============9132597446704839163=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9132597446704839163==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zkl/ZGRNLhkdNGO0"
Content-Disposition: inline


--Zkl/ZGRNLhkdNGO0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 04:27:40AM +0300, Dmitry Osipenko wrote:
> The SDHCI on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now SDHCI must be resumed using
> runtime PM API in order to initialize the SDHCI power state. The SDHCI
> clock rate must be changed using OPP API that will reconfigure the power
> domain performance state in accordance to the rate. Add runtime PM and OPP
> support to the SDHCI driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 146 ++++++++++++++++++++++++---------
>  1 file changed, 105 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 387ce9cdbd7c..a3583359c972 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -15,6 +15,8 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/mmc/card.h>
> @@ -24,6 +26,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/ktime.h>
> =20
> +#include <soc/tegra/common.h>
> +
>  #include "sdhci-pltfm.h"
>  #include "cqhci.h"
> =20
> @@ -123,6 +127,12 @@
>  					 SDHCI_TRNS_BLK_CNT_EN | \
>  					 SDHCI_TRNS_DMA)
> =20
> +enum {
> +	TEGRA_CLK_BULK_SDHCI,
> +	TEGRA_CLK_BULK_TMCLK,
> +	TEGRA_CLK_BULK_NUM,
> +};
> +
>  struct sdhci_tegra_soc_data {
>  	const struct sdhci_pltfm_data *pdata;
>  	u64 dma_mask;
> @@ -171,6 +181,8 @@ struct sdhci_tegra {
>  	bool enable_hwcq;
>  	unsigned long curr_clk_rate;
>  	u8 tuned_tap_delay;
> +
> +	struct clk_bulk_data clocks[TEGRA_CLK_BULK_NUM];

This doesn't seem worth it to me. There's a lot of churn in this driver
that's only needed to convert this to the clk_bulk API and it makes the
code a lot more difficult to read, in my opinion.

It looks like the only benefit that this gives us is that runtime
suspend and resume become a few lines shorter.

Thierry

--Zkl/ZGRNLhkdNGO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEejvQACgkQ3SOs138+
s6GP7Q//aRZFqje0kEFRTOZPc/3kSiWj3ZUdkPxBKI8ZmISgrBH2orJG4ZW3OaNl
CdiK1hqqEgEsJHuHndJqfCjxgwTwO/0zcGEwU6XcpaP0Zdh/IsIE1Qc4pHPWN7oQ
Mcu5gLnbaDh+ej6Xpw09BpTDoZtuD20vxOf7g97ZmKlWpKS2sFL4HuKcaYWMxoM0
43Qh7BuDv4iyY4BFdiNhEsh/Yx/2fFMjU8DQRbggqmePZYAyNDRDqOZ8vBpjmcIe
Ub0niDGP+iEcPtw2F14RVjhAkVnnw1/v4G1PAZ62bzJ7ZosDM3CuVWs3kf189rXq
i4xS1NBcSyntT2PBB8aaH6pyu0zCqEHyV8Q2PsCl1B88KdWmvraBlzWSu4cRZeMR
eIGVeA2YXUhzPfwGUch8dprkivWN2OhHc7V+NFZJcHV16+WEgObbQV6j9MYVBbfO
ZAuKtQshaQyjY0WcVTEog97Jrb7SYMLlILYwaHey6bGra1sQGK3jl+CEetSjsM6G
Y3bk4uoBl0s0lsMSh0j1TSrKUOvbOk8xduyNrwloqaiAQRhX2idPvikM3f3OsVRL
ejSpVy00UNbkUR4xl4v8U2MAJBCGID7q84IqDTwso3xZZ1pgH/H6YMzn2Tw2tTd4
kDLfxr2aUamBe71mE2uLiEoEuiBCUvQXgl3/Uqkg1+ke17HCIMI=
=AV2X
-----END PGP SIGNATURE-----

--Zkl/ZGRNLhkdNGO0--


--===============9132597446704839163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9132597446704839163==--

