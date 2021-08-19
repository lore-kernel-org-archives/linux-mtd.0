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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AF1C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 13:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFF86113D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 13:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BFF86113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6SwLXIVlJVJCh7QCx0NM1E4jbj9hqGlty2wzhgaXu0=; b=y4jbwimfSKhKZWH5hUeSU7VDX8
	dTbK2XzaLbmFmjapCpQgNHCRY56Mj9nQVHVQgdL1rkULJP9MeY9004v4i5tS5fAtV3Hz8uIWJMXdK
	l//1lA0SBTvE+1VX/IrPIIfdR6C3WlwQ0ldwMq2Qd3Xfm7veK76Ilcf2+urwtNC9cAvDdjZCwbp+6
	f03Gw6Nmabscn+paHvIlR+zuyXSibf5U77TcQIck8nIGbWsGz0RhZnsz7/4kWU7BmTMbRqtltLsJF
	/qJ7UHmMo9XmXv7h7PFiCGF2rU59GlTQHLDV78nbYZRh5PeC5n8GbnEeXpLWEWnhA5GcwS+OtSnw7
	uv/0Ka9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGhz0-008Rp3-St; Thu, 19 Aug 2021 13:21:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGhyx-008Ro7-Tz
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 13:21:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r7so9198270wrs.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xtcA0Q51Ab2gDUHvKWadMAS32FJIwcbf7uqdag4aFgw=;
 b=lz3AxdkSOdaxsff8Al6AfTWQciSBbKeqxN29m/KMRbWKXw4/fgyKk+WmJ3QyUOixzN
 4y+KG309qv8rkghhhHNRjVwzQahlcuEF8Doq0LiHQSzU/UrguSZVcFsLMmJayxgm0ij7
 DqTbzqfCmAxDcIkhQyStvyWV+ku8uSeeX7dE8YJzyIVUpP80wgthC25SMYweNXtTQxd2
 jUYpv3DiHYgCuk8SxMaErfJkgf/6GXvet2x/3DRJNApy/VuzLhZHOeod4kvyeZkQA9ku
 C/I1gCo8fSlZRTkrqgpt1DYoLIzTdJHzUmyJQGy3YGKvzsZRU31V8uTvRHxX3uAQWw49
 Yagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xtcA0Q51Ab2gDUHvKWadMAS32FJIwcbf7uqdag4aFgw=;
 b=ZCilU4zRXxuSYXNHgK9s12c6JbtHZdq/Y9DyjBueniYWcofSMOQ52Eb00Na21DV1iA
 jPnn7NepHPa/aNB9sNK5TZ94okF9vB1zAoI9kJcKqH8iC5WJvHGMUF7u8dIf9Ux8khq4
 dK6pBAbwIZZEoY9JXnnYCyxh3EgZ/2vtluWkc0IwRdFIHlvpwcSyeYDPmDz7KJKTV9W1
 u1is9skx7gyR7EPIc1h/mtadCD5nOdPBwrUQ6S1VfsPF3sY+4pPHftB6KLExn2UMemrV
 fO6aEV2zwoyqVxcU0zQberHIGiFe0uzxdoG4ZR7cdo8akRpwOkgy9HT+IEi/gooSZIza
 jQlA==
X-Gm-Message-State: AOAM530boxc9nkMQ2zwTuWtEsJSHExKics7GpOMO7cX+8/khTgsqA6CV
 g0NKTQVrEOF+c9V320dlbng=
X-Google-Smtp-Source: ABdhPJz39Bt2kVM50Mk8FByewEg3lcDVqz/jK/N/qbprIAZwm7opqauve4ARpLRYoIa5SH1Y+OoKXw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr3961844wrs.284.1629379278262; 
 Thu, 19 Aug 2021 06:21:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id l17sm7319377wmq.44.2021.08.19.06.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:21:16 -0700 (PDT)
Date: Thu, 19 Aug 2021 15:21:15 +0200
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
Subject: Re: [PATCH v8 19/34] pwm: tegra: Add runtime PM and OPP support
Message-ID: <YR5ay6+r0hJsUbhy@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-20-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210817012754.8710-20-digetx@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_062120_027541_89D811C0 
X-CRM114-Status: GOOD (  17.30  )
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
Content-Type: multipart/mixed; boundary="===============8315293906677915171=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8315293906677915171==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vMbaQMXyoWqaG8Xh"
Content-Disposition: inline


--vMbaQMXyoWqaG8Xh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 04:27:39AM +0300, Dmitry Osipenko wrote:
> The PWM on Tegra belongs to the core power domain and we're going to
> enable GENPD support for the core domain. Now PWM must be resumed using
> runtime PM API in order to initialize the PWM power state. The PWM clock
> rate must be changed using OPP API that will reconfigure the power domain
> performance state in accordance to the rate. Add runtime PM and OPP
> support to the PWM driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/pwm/pwm-tegra.c | 104 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 85 insertions(+), 19 deletions(-)

Can this be safely applied independently of the rest of the series, or
are there any dependencies on earlier patches?

Thierry

--vMbaQMXyoWqaG8Xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEeWskACgkQ3SOs138+
s6GqkA//VEToPW4lCrJibs4kkno3t/HJrCc3QIgrT3KY7KgdOtg6fmvLz/8Bjja0
ut1YS/ozbt7FAgaf8YTyKMFOo8dv21DBdpit0bIWZWYvwh6P2SKB3p+1cFVN9jHZ
lXkRdCUVYqPSGJ2tEHZ6WZBA8KGc198UL3n5PzUQZhh4jRWgfXNLsI2Trp3uwr+T
9/v/xWmil3wiFAgf8H6GLwZ/M3+O9Q32eq6QI0SZOiE/Lj9mwPdZQXixXgDDk2td
dU/CQgmygPCYlcpVcwC1gmvzWcQp6Bffa/3xaRR2vIjSSZtjshQ08B01OOM3Wr/G
qcghnLX0Q3QooNx6alRRv+P1SZXW8u7xcL0HysovbD8IDpOgLBJYXo8IaCHfSlyF
EVVRXB8gMIQip8taMkL6jRVExNuNFDuIs6i2b/KaP2cd2p1mePZw1kS4vf8NJHX6
mJFe0u8P5aik2tEnXP4/M9J9+ZtMLxnRTqB3aK+chmG/KUA66hyMjM3DeEnxfIBL
6YcKjFjKUXVviacmnu+9PDPO4g43XS0M5um6eTtGYkV76kF/KlPYtLuLJG80QIgv
njHN5UN2AgTwaeSZYbDjZ/ldsO9H0aedYvFSyXUQio9GvHSws9WeJD+FVdXKmODO
mS+oMleXMvwiTrWNXKoEG5mTYd2GjUZ7mHsN36quci2pc+ZmYSE=
=0tJv
-----END PGP SIGNATURE-----

--vMbaQMXyoWqaG8Xh--


--===============8315293906677915171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8315293906677915171==--

