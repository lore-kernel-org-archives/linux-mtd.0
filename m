Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE56C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 14:15:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E436020639
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 14:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ni1tqk5a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyrzDX2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E436020639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1liHuylbBQYx2yVo78Io9suNE9zuBCxXnAF65lGfVg0=; b=ni1tqk5aB06xfNwbc6oW7ixzZ
	mfmlGYBwXWb12LPXTj3PFz6Idmch+EmVicR2Ox9UymgiyV2meQkTcok2z7RBCOq1TeH/8xcxQiwhc
	elhYOssqUED/uuWjl2Ev6JpK3TX/lVEbHUFjUxD7s6tdRL6w3hmMZ/7ewSbwT+90apDBSo+dgknMG
	SWKLy0QSz+nh1kmoN7G15ykNIjFl8+8wNbWCgGOEkgcjb5OsmtRwVzqUtBIhBTLU6d7GU5tpUhasq
	6LZDicI9yl9F9Sb7kc3J8DKW4tnI/4ytXsdv+3eiKJwJgcM0iI2VSGjCRli9ZzheXC5F8JwRZl+6d
	sPmaG2aXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL5YJ-0006GG-RJ; Wed, 23 Sep 2020 14:15:23 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL5YC-0006Dc-AR; Wed, 23 Sep 2020 14:15:17 +0000
Received: by mail-wr1-x442.google.com with SMTP id s12so157744wrw.11;
 Wed, 23 Sep 2020 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CCpG6jWr4GZzW1CfQaSnnmzY1h1hQX+z5GfUGphu6mo=;
 b=WyrzDX2hgEfYU9YEV2oB2Vy6Tk0kl11zvxMh4GY5Zt2ZGXDlcM0bIRvJURSeI8ygz8
 K7BOrYW6NZZZZ8WNO359lHGhMUBKLp8RYVFb1RA9XE6CqaxCBH28mpQ9VlNnCEYpp3oB
 YaiQ5Pj3XC5d+3qWk61xf4Xl2LYrqI3P+6YmLSDhln3QT1ToaJ/YKV/EMYVvYoFY1K/n
 CYQfJkBIqbqGPooaLBU3l8dRSPFw3jl+SdGXFuDyljkKofyPmTaHKCbPTQL6hm3orrk/
 wFBw5Rfz51qnFjDZ6W5wZswA+McLUuOlY4QMfhiXajTRVEeG7MBrNA9HnrmSlEwbsek2
 V/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CCpG6jWr4GZzW1CfQaSnnmzY1h1hQX+z5GfUGphu6mo=;
 b=Pf7wJ+bf8vCiVmOEA3k4bp7YKj3U/Lvu8gY5nLbJOu6MDWlbWJwFLpSsdZ6wB5+iup
 DkxpjXZEsLFl/sUSyu25si+uryv6yX1LsPJ3vQ1NA7MUyKsimfiUb0eIKNMykCuifmx7
 8lIS2+8+qMrEry4gWy6XM1m791rC9LBK0R/PMWwCniy37E9+60l+7j29vowklFdp4X3m
 3ezK3xLWt2uDlO17dE1wLp83yu7G7nJJhvsvKpasVZMuXIw1bv5gUkP+ZwKtO0BHRR0g
 QuG7fQpDHdaFuLrE47CQQcoD9K7FjauWnUpi0kreFqRySa8zII1KO9Vda7rBIFjQdGGk
 C8yw==
X-Gm-Message-State: AOAM530gE/2Vwmmr8mK/0uP9TCZvd2pLgNto0R7WnYfaKOCSEr2/yNEa
 dwV++RYzgxqzXX/4ns5t0Pg=
X-Google-Smtp-Source: ABdhPJxE/2vXIiL4kN9hTjYGmAYGf/ntfPr0bNkLM/DKOX5sQazw3tKXKwd9st2bXep+5i7oBXEVXA==
X-Received: by 2002:a5d:568d:: with SMTP id f13mr1056599wrv.303.1600870515112; 
 Wed, 23 Sep 2020 07:15:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id o4sm29300893wru.55.2020.09.23.07.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 07:15:13 -0700 (PDT)
Date: Wed, 23 Sep 2020 16:15:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 06/19] dt-bindings: pwm: imx-pwm: Add i.MX 8M
 compatibles
Message-ID: <20200923141511.GF1848911@ulmo>
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-7-krzk@kernel.org>
 <20200923115201.GD1846003@ulmo>
 <CAJKOXPcZuonCBK1Fc9r=rHzOL02MArrsE=R4x1tWGqov2nP0fA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJKOXPcZuonCBK1Fc9r=rHzOL02MArrsE=R4x1tWGqov2nP0fA@mail.gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_101516_396476_E0693BFE 
X-CRM114-Status: GOOD (  20.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============3381471681904920439=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3381471681904920439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 04:08:53PM +0200, Krzysztof Kozlowski wrote:
> On Wed, 23 Sep 2020 at 13:52, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> >
> > On Tue, Aug 25, 2020 at 09:35:23PM +0200, Krzysztof Kozlowski wrote:
> > > DTSes with new i.MX 8M SoCs introduce their own compatibles so add th=
em
> > > to fix dtbs_check warnings like:
> > >
> > >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
> > >     compatible:0: 'fsl,imx8mm-pwm' is not one of ['fsl,imx1-pwm', 'fs=
l,imx27-pwm']
> > >     From schema: Documentation/devicetree/bindings/pwm/imx-pwm.yaml
> > >
> > >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
> > >     compatible: ['fsl,imx8mm-pwm', 'fsl,imx27-pwm'] is too long
> > >
> > >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
> > >     compatible: Additional items are not allowed ('fsl,imx27-pwm' was=
 unexpected)
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/pwm/imx-pwm.yaml | 14 +++++++++++-=
--
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > Applied, thanks.
>=20
> Thanks Thierry, but this was already picked up by Rob into DT tree.

I hadn't seen any email and since Rob had given a reviewed-by I assumed
this was supposed to be picked up into subsystem trees. I'll drop it
again.

Thierry

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rWG8ACgkQ3SOs138+
s6FYZA/+J5rgjcPTqcNSA6/9QwG56DhiJV6FV2eQhf5UbL1l2RFHvVGpAnZxjxM7
UFP1CVWZIFEYJlXCAjEjHeKrz8wz/M8+j2UYqzCnew7XwH2QOKvJRiQYyjMzJyLh
Z9AI7zgkZXqz0xH+WIjkynmWnoz1jZw2Ct331f2jaPHmkD4B2CURyhkVtVNhW0Kr
5Vq8t7NQ7tqQjh2+q4cxf6ge1zc1J2PCNNdc6MDdTHFTBhpqGp4IF7Sx7aMq79OT
/JtEp0TZohhPUXtkDl1ZghDzryf9pksNOf+HwgpgrbrbZl5tP0y2K3TL+9uIXjfT
6clna7VIx9ofQpnAeL1RzJMGM93laLOpvdcAj02cgUcNcOU3Bj3oVGBx076M8WyA
i58nto1/wlQEcZzlMcQigyNCFWu6nhXjebM5U9WdEWAm9xkGv4OSbHQw7ZV7TM8b
JI334Uvholn1f99bt3JosCAOYTV/88sn4Px8SAxvwGy6EttBPKdnUvBwZdk86xTa
eKbDtGkvF2pFAgaO7ylV2ADQnVW+A3JEXF+RbT/u5jiFiHUEz8XncHiJmB+e4xrf
4W3V2QqbWkF6y7BQ+OaNYk98m5dkNE/e7kSCdXcmjjJwazDunejXvQvnNDr70LIP
oNqvMzEtfA0q5K2Fee3TyE31GBycFO3i6PjxrIad0PsInjVV2Ok=
=J7v2
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--


--===============3381471681904920439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3381471681904920439==--

