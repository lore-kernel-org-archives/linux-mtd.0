Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345BAC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 16:42:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3041610A3
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 16:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3041610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KASOO3TLtumm8937gQK7yi9F7EtrNyQ1Q4nXsafxmC8=; b=Hv8CdoR5Mg4PZZrL12ZcMU6GXO
	3m1pFr3h4HVvy0535MMfSWdtS/jrZLixU9nqd4P0KJbVxkAzO2uahwbZgVWJXdOv0o9CsVPTbRPK/
	CH8kGXIQszW+2XwBUcfV3gqcr4K2eGrCn8wcZBtVzvkkJcZlB8JzUCzrYkEqL6T41Mu5Ltuort+vp
	hxhc09j8L4pw9/FiA8ckbVNUZjd7jd5Re9sPIgCnyX6KMhw77MoNt6r7VgvWLoLcUGlBstdR1nS6M
	2PMG+jw8MPFBd0gOs8KzOKSYn2DlPfuBe7XRo5FuRFwcKtESazyWjJ5QedCrqiConq8dJQqdf7Gci
	Mk0mbAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGOdq-006CcC-Kw; Wed, 18 Aug 2021 16:42:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGOdo-006CbO-AM
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 16:42:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id v4so4432486wro.12
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W5GdT8EduZhugpUzvA2/GGwOnhoyQZEiDeyMUn6wh8E=;
 b=bycOHzTRH+aRXcUmSXBOsZG5Gkzo5xIQfqMjeSwTAggOfBKGiaEZit8SDMA+PJV/4R
 +SioqGMlkGUdU6qIL2kxqre0MEaJPxbT+4UymP0e0nIcatW2YHuqV6G0EIqPFtuQCXGi
 Jbq09VFv7EPVyH4eqNrlwu5USRtrIn6CMQC5U3LS+A02T5Q9fvgScM1H4nhBKGtN6RUL
 Y7XsBkNrly0Ys3jNk9rVgELVdzM5wqEqZJwenqVHtLxnyDipXrN6bN2LOmUK3dXnQ22U
 JiAZrzffEiDVy9U9R9IWv6dEQafAII9n5gfOOnt2dMqQTo7gBmHpvFh40BS5bWEuQ0Sg
 o14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W5GdT8EduZhugpUzvA2/GGwOnhoyQZEiDeyMUn6wh8E=;
 b=KIlP7HmQPeJfBGPMoUC3LmFZHXjxVz8yqCQuwHmnNDVPqRZwoNPT8NFLfFVbSOkoeM
 GZWAXOKLJyqCF1gpDcxGKBU2RsjIEkaP3XjUfwNN/jDg3TMAIIUehr8qgPdm1fk32aE/
 mvM+rZHbxYKkQoZF21Dgha7Po5MmL0W0SmDxw6tBfmKl5h0xDgNILYNC52C9vSYTGiD6
 N5thINntEHpLjycU73pntGzHnwY/0uRl5JYUjgWcbGTYVwgAscJCGzDbKlav1BBoiE0D
 QOOO2udiHnrqRnAEjbfAX3Z711MXsa8mXgcwNGmRFbTwJDcrv2Bu/XDcI9mxM7Hcc0pZ
 26yA==
X-Gm-Message-State: AOAM531sGcKppuHgIKJ08l+rGX40N0jedwXMXLZwMIRm3Q3+08Ejy62d
 WdgZlnnIU/78nh8D6FPZTtk=
X-Google-Smtp-Source: ABdhPJybiNwCfJ6kqxUImknf7ykkkk34GLtm70yXj+iZARNGInDoPzAW6ue7Kn6H0xv3rLWosSR4+g==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr11446318wrt.226.1629304930527; 
 Wed, 18 Aug 2021 09:42:10 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id v12sm296002wrq.59.2021.08.18.09.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:42:09 -0700 (PDT)
Date: Wed, 18 Aug 2021 18:42:08 +0200
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
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
Message-ID: <YR04YHGEluqLIZeo@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
MIME-Version: 1.0
In-Reply-To: <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_094212_425335_942A6F1A 
X-CRM114-Status: GOOD (  22.30  )
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
Content-Type: multipart/mixed; boundary="===============4218722754906069005=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4218722754906069005==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZRswRx01OcPCxpgj"
Content-Disposition: inline


--ZRswRx01OcPCxpgj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 06:05:21PM +0300, Dmitry Osipenko wrote:
> 18.08.2021 17:07, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Aug 17, 2021 at 04:27:27AM +0300, Dmitry Osipenko wrote:
> > [...]
> >> +struct clk *tegra_clk_register(struct clk_hw *hw)
> >> +{
> >> +	struct platform_device *pdev;
> >> +	struct device *dev =3D NULL;
> >> +	struct device_node *np;
> >> +	const char *dev_name;
> >> +
> >> +	np =3D tegra_clk_get_of_node(hw);
> >> +
> >> +	if (!of_device_is_available(np))
> >> +		goto put_node;
> >> +
> >> +	dev_name =3D kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
> >> +	if (!dev_name)
> >> +		goto put_node;
> >> +
> >> +	pdev =3D of_platform_device_create(np, dev_name, NULL);
> >> +	if (!pdev) {
> >> +		pr_err("%s: failed to create device for %pOF\n", __func__, np);
> >> +		kfree(dev_name);
> >> +		goto put_node;
> >> +	}
> >> +
> >> +	dev =3D &pdev->dev;
> >> +	pm_runtime_enable(dev);
> >> +put_node:
> >> +	of_node_put(np);
> >> +
> >> +	return clk_register(dev, hw);
> >> +}
> >=20
> > This looks wrong. Why do we need struct platform_device objects for each
> > of these clocks? That's going to be a massive amount of platform devices
> > and they will completely mess up sysfs.
>=20
> RPM works with a device. It's not a massive amount of devices, it's one
> device for T20 and four devices for T30.

I'm still not sure I understand why we need to call RPM functions on a
clock. And even if they are few, it seems wrong to make these platform
devices.

Perhaps they can be simple struct device:s instead? Ideally they would
also be parented to the CAR so that they appear in the right place in
the sysfs hierarchy.

Thierry

--ZRswRx01OcPCxpgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdOGAACgkQ3SOs138+
s6G9mg/7B+N6pKP5RLa+6MqSqr6J1GJQB7fIfzIcmA+LrnV32JQkR+5m6b7bfiYa
DoWB783TtFILVyc4wpZ/rsEbV7fjEXQiyn4NP44rTeb/EIm54Ls30KodfLm2e+RB
bomthI0uoJmGnwrE/l73t4XFVGOfslcYBTGhJpGoS6y/mWsszBziqsv7TZjK9EFx
oBHc5ZPXK6jg2jNdB214Qt9mFH0Y4e23XwC8NH8YRmPANz+BHUX5yLOqpNzBFBqX
6pltXB/ddB7OMVqgbyghTDPHPr9TM86APIFi29w6aqeXx4JPrih2jtxugr7wDu1r
05XNQifCKrPCdLHRU6KmSCiOt+9cN3Ze4GIok4i/qVaSJh0oZip+rblv8GCeAXzV
zra4hTvTG6SNtcYqEZb87DpB7lzU5umKm11TQqjRDH+wEiXcCVFtY1qtvv/WZXfV
OXMG4pYoU70hxKnlp+MlhsX+1tkWnpb4us35yEYxAv7UqUEXPqaHdRNT4uO8tiGy
s80pZ6s3Bm1PGRo6wO3dvLh4OXT6QY2Ov+lwZmmUHurizSvRvZ/9B/pL6HLG3NWM
x1513tBCxJb9dMPsLPK9BZbY1mDopAa6XjMjiaIVkDbrEs7zF0doeksIw50os1Bk
dNgOWnghgHtl13lzRRLHi/H4onElpL3LCiDteV0kIurgC4v5DeM=
=SBkO
-----END PGP SIGNATURE-----

--ZRswRx01OcPCxpgj--


--===============4218722754906069005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4218722754906069005==--

