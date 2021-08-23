Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1807C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55702613B1
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55702613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8tjmcbTQUVE1OZwf35IlPVeTWN3qC/QmLan19QHqi4=; b=Hsj9SZoszLKFBWbU9ULaWYT7DL
	IKy0zoY3N4ZsCjL3ATXF19VPhe12/hbvQ29qusRcUAp4iuYMMMZLojHSlpgfD6OkHR31L7/zcP4ki
	cpf3QCRoctvCgUWh+Mh5Lejoe1H3g9RhUoJmZ5ufl75DJqzk+iemI1OA2ZOUjomOYR9YHNAdt0SDT
	P+v0WKoJ1B1nbYpla/htKzT/d7rgXBhu01POBonFuhHd/qapykfAsc6UwY/1y9QATbSMHfF9A1+iP
	JFAUf6qSEQ4KalP27BnRCUO6TVmiDr6hfhPI/gpmm8xS2H6V8mGb+8Ay6QeWRp/WO3g5qiMBv+dOE
	v+2kHj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIB0g-00HFg7-21; Mon, 23 Aug 2021 14:33:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIB0d-00HFfF-5O
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 14:33:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so133867wml.3
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kKNTgN3mFZPjHxMm9PJkyaGLg0UeM0w5/suyeTcMCds=;
 b=Ez/HiDH3tFmVC4uKBvHgtFzVhf5NyUU42y+5Lk7iQk7CbnDkPYMGOlaMnc0A7HLBJw
 eWugtLu8U4/9o5aEJf48iw+G6cKxrmqxzYQvyXaTFxF/VLYSaCfpeh/+AGmp8SBxu1lB
 qm3zidvf28w2SRNDLu8OhnQzo5muVjjRhaIGvozxNPOQrjNBvXf8nq85yo6HQzlBKLmU
 nzja6sHIhvGl2u+EqnRtgSQJl/7h2YONt5JGKSF2dBwOkwinufFPGqE+7KXbsWH7nTD8
 XY3kngutJ1H7lJa8xJhpA6dHcDU3twBm/CLhiMZ/5aYAACW7FswYmospyPXglG3MHnPd
 fAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kKNTgN3mFZPjHxMm9PJkyaGLg0UeM0w5/suyeTcMCds=;
 b=ZGN9iJHpiSC9maa4O0yIJ94JWUIrteApqeoJKsoCdvEu7vMVDzn2GOm51K3z/FK0fK
 ISS7sx0YZSXm9Q9Tyhg4WLn+oPUEQUk2z715X53kSORA2QfXOuwnDQOp8QoqMp53is4+
 P4KQORYxkr5mdkQjf0CMW10LhsbujPt8LPeG91uONQF6+cEJ8liuX+sBgDd6rF02b29j
 +/HUHpISkoCJs556fXMsqq6ZdUN3ljJ9Xh7KDlm2NSfpaA2BnXDTftpllwy/FJ1x4Zyn
 IOQK5wCO9Q4X9AMkaC+CxFkk54KZWpfEqlhZlxr6THL/jB2WdX2duCDkpibweJftDC90
 efqw==
X-Gm-Message-State: AOAM533qVB8hPiT68mM5ypL4OaD7itY67Egnb71Lb5jdeLlm9b2X+Aj4
 piortjoYqkKmWKZx72Rc/xQ=
X-Google-Smtp-Source: ABdhPJxBq4Nvsa0gnzzH4WFHk2SbkxyCPoHtvepGuqxwqRXVQN0QX9rC0+5h+ZD3D695iv58bgjotw==
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr16739221wme.125.1629729185109; 
 Mon, 23 Aug 2021 07:33:05 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id w18sm16192391wrg.68.2021.08.23.07.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 07:33:03 -0700 (PDT)
Date: Mon, 23 Aug 2021 16:33:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
Message-ID: <YSOxnqiia+FqfOX6@orome.fritz.box>
References: <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
 <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box>
 <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
 <YR+VDZzTihmpENp6@orome.fritz.box>
 <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
 <89ea1694-be9e-7654-abeb-22de0ca5255a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <89ea1694-be9e-7654-abeb-22de0ca5255a@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_073307_259971_41B9D99A 
X-CRM114-Status: GOOD (  33.76  )
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
Content-Type: multipart/mixed; boundary="===============5467138933090509649=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5467138933090509649==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PvC9h3QplaOMl/PL"
Content-Disposition: inline


--PvC9h3QplaOMl/PL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2021 at 08:45:54PM +0300, Dmitry Osipenko wrote:
> 20.08.2021 16:08, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> I suppose if there's really no good way of doing this other than
> >> providing a struct device, then so be it. I think the cleaned up sysfs
> >> shown in the summary above looks much better than what the original
> >> would've looked like.
> >>
> >> Perhaps an additional tweak to that would be to not create platform
> >> devices. Instead, just create struct device. Those really have
> >> everything you need (.of_node, and can be used with RPM and GENPD). As=
 I
> >> mentioned earlier, platform device implies a CPU-memory-mapped bus,
> >> which this clearly isn't. It's kind of a separate "bus" if you want, so
> >> just using struct device directly seems more appropriate.
> >=20
> > Just a heads up. If you don't use a platform device or have a driver
> > associated with it for probing, you need to manage the attachment to
> > genpd yourself. That means calling one of the dev_pm_domain_attach*()
> > APIs, but that's perfectly fine, ofcourse.
> >=20
> >>
> >> We did something similar for XUSB pads, see drivers/phy/tegra/xusb.[ch]
> >> for an example of how that was done. I think you can do something
> >> similar here.
>=20
> We need a platform device because we have a platform device driver that
> must be bound to the device, otherwise PMC driver state won't be synced
> since it it's synced after all drivers of devices that reference PMC
> node in DT are probed.

I think the causality is the wrong way around. It's more likely that you
added the platform driver because you have a platform device that you
want to bind against.

You can have drivers bind to other types of devices, although it's a bit
more work than abusing platform devices for it.

There's the "auxiliary" bus that seems like it would be a somewhat
better fit (see Documentation/driver-api/auxiliary_bus.rst), though it
doesn't look like this fits the purpose exactly. I think a custom bus
(or perhaps something that could be deployed more broadly across CCF)
would be more appropriate.

Looking around, it seems like clk/imx and clk/samsung abuse the platform
bus in a similar way, so they would benefit from a "clk" bus as well.

Thierry

--PvC9h3QplaOMl/PL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEjsZsACgkQ3SOs138+
s6HWKw//TNblAAi6ou9PE5WJAlqkp8eN3KFkESiKa0yzPJmK4PheTbR+7TxztdtD
v78kTE37Wr/vLdqlIV3gfL9ZjFiYhBJinwopw7zGhYIru1NVclli3In+/nQdUoGe
vqQOmq0yycyituaGXERlH9HrODsY9IG3DP4XqTd9bBz1JfexxnEVxHvXdzWmoQ/i
pHg7547O5QhpmEMurZ+anNAFCw9J9QhltISWXBSZdl1HDXBF7u7yABLXLggp6RFm
xJN7I3DdVVYkB091DX8wfW19TXaDcZ4eOtNQ1PdpfL1FgeRhLm48VYhB1CQhSWcs
+uyGzqS2dROvSyoUCXqUxYr4NdijJX17VOpO8BVWcpJMQo97EDNxa6Ga92TmXAV4
o+NEivB2893mE0b268rDZ128qhimB7qfM9UT8XFuOWTHiwtGanWBQ/OQ0VYBDVvn
qArreV+6jLdYLjqAiq6DYDoT3s9gVp/xvWfp9F+PW6YlUPldiEUx0eTDK31T4nx2
xRnoASYIbUDfcHvOQWTmwFm1YLxDad/c+oNuCuFjNtG1P8EzRmmkwz4FU0J4uLGd
kTxIyxpRrHp1A2gFthkPvtvrucMlVXW/pTMMCSZtPafWNdhQgCohiy0wnW6pI9sg
v4qJ6n+ieKZRQw1RlSLliu81UJk/CcANuJDeI3CknDm79oVZQDA=
=YrRu
-----END PGP SIGNATURE-----

--PvC9h3QplaOMl/PL--


--===============5467138933090509649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5467138933090509649==--

