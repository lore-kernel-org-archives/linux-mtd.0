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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EF4C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 11:53:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE1B21D41
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 11:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AtSjrkQj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODmaWdLB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE1B21D41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7eyBe/WGsguIvi7yNMssg3i6wYZGOuD8ahFTGRBvskE=; b=AtSjrkQjcDcGBvDKy9U8MqTit
	9GCS4dcoGSvJodLIRk4QcyPx/MtGiAoPcH72SE97ONVdl30V/f+3VbeD+Rgb5GSo/ZHnB5ThpcnJ2
	HnZwkeGbJrTeyufogNx+LKxMayYmKGRVdefSn1G1ouYZZScoxtgfgWmVS4xmTvRh60ReexnhDzU/q
	SKULJVtlvBxGjWZPW4bX+4QdBKs1nPsFsVDSunTone6AyMlq8kIydpRBciT4w3Or2IPSSpT7VIeY5
	lTzoLNpLyYCvZhqJ0EwYqky/4e0IHbmPoNLcF2hHyHEiW9wbSbtbbD9zQcYD46zP80s4sUssRJpXk
	3HhzXXu+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL3Jn-0007lP-1F; Wed, 23 Sep 2020 11:52:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL3Je-0007k3-0N; Wed, 23 Sep 2020 11:52:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id e17so6860926wme.0;
 Wed, 23 Sep 2020 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=62leXxkn6lfQBk0pj9IGOMm88gpEkBUQrcCqhx44WHI=;
 b=ODmaWdLBKOeSP1ZafWzo21vjJrHlk3UG4jvO8+g6WMM1BFtTLmzx1IjbGjRouQUa+7
 nAMc2SENwtPelG8pH3qifpRoFvyXIyHkkSpyttxOBSllpGFUWNDTbc7RWWZwDXiubVzz
 DId3At1uwFhl8QdtjFs9TEb9pLJUGmoMWNZljWBiFG6YHY/D5eEaVWfYRHdsGOT1LmMl
 WPXOjkI7LdOyCKmm8KnbDvvqWylTGVG9rccvd2qnBAegNKT8R9zR8wUu35rVANaWTR32
 pzLd85pgC4hOTjPoqQYRZACHbmH3e+lrH/elvTuoGpBsCqkzId/E+uobn2wcVgIWij43
 kdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=62leXxkn6lfQBk0pj9IGOMm88gpEkBUQrcCqhx44WHI=;
 b=XH5L+RIQclcuxD8UqYZwhl899pycabfgXDIcrlcWoqoU9EX35uFF1IqNQnz8VAgpZ1
 at5phw+QsTnLcruGL9c80jaeQn5BC0ErbsyoeaiPhmfZ38KmMDBotWH+iQ48rPSHKkC6
 EomG1RcZSpnvKwY2Q9m6+07CZzlc+CCJ6zLIe/AWWanQl2aVixrJwmq9mmHDgzqWp845
 Z+M74vOEL9wVGOksWETqJdhAGD666754Qcxl63rZ4J7EUARAgnChQtCDKiJ/bnmuJYWv
 fkeNo2AAx0xEjDB6Xjrx+JtbLsxZEaMmXrjv+ksCfyx6MPJMYqmvz7FzQjpfGmVquZb2
 FSbg==
X-Gm-Message-State: AOAM5330o9z73Jpvta15K8g9mKK1JROlbQfh0Lu5p0fLl2kSj1I34PNz
 M9PjkzO+hfpTWHmMW1xmNxU=
X-Google-Smtp-Source: ABdhPJwuky5Ub23hg9gD1yy7ZPW4fTKq0bW7//cbGIq+DmdbAGJe7JBSRBqC41QuYp6pi5kgGRRJBA==
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr5266287wml.180.1600861924874; 
 Wed, 23 Sep 2020 04:52:04 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id a20sm7785703wmm.40.2020.09.23.04.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 04:52:03 -0700 (PDT)
Date: Wed, 23 Sep 2020 13:52:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 06/19] dt-bindings: pwm: imx-pwm: Add i.MX 8M
 compatibles
Message-ID: <20200923115201.GD1846003@ulmo>
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-7-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200825193536.7332-7-krzk@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_075206_085182_6708274C 
X-CRM114-Status: GOOD (  15.48  )
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
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============4482257361867411873=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4482257361867411873==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 09:35:23PM +0200, Krzysztof Kozlowski wrote:
> DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> to fix dtbs_check warnings like:
>=20
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
>     compatible:0: 'fsl,imx8mm-pwm' is not one of ['fsl,imx1-pwm', 'fsl,im=
x27-pwm']
>     From schema: Documentation/devicetree/bindings/pwm/imx-pwm.yaml
>=20
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
>     compatible: ['fsl,imx8mm-pwm', 'fsl,imx27-pwm'] is too long
>=20
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: pwm@30660000:
>     compatible: Additional items are not allowed ('fsl,imx27-pwm' was une=
xpected)
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/pwm/imx-pwm.yaml | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rNuEACgkQ3SOs138+
s6GvDg/+Nro4jTSFhaaEb45wLg7Wg5AT70Vw7JpMwqEfIe5L3+HCzsAZX08eoriW
TwsrzDYwi1mA2E8LXgnab5e3AAgrQJO5HprXoQ0736DAqPzLovczCCUfBnS72FTM
gtWR/H60vrI/6jPUT+YqqvgtH1SQZIDSC0Sr936omELFXZ7N7kgTW1gTMR9jeMGj
eoEUbgMKztiNGZpCm/kRLffCONoKpyz/3luja+KXkB07rPVluMjwhaFBNYxr6oB2
K48rLlPN3B/3u+qD03bB4fBdycLNO0IjVepdM21pBsGyKAT4uYfl0wG86/ww99EB
1v9/vWoSmwnxVBuPDDj4ecj7iD3VExSDZ7x2vvID5NmhK3ndjisf8C979I48hvMo
maBVSISDlvaIs2KbzJt9JoqHYaBNJ4LUdTwnFfcVo0vT9EY0H9KvLbfw93I/0VjU
r9WMPCRYtEOiS5riua25jp9pSxcnQE92v5NyNEMg+sdJ9uyLPYo0NBFbhTskEjnC
7evLkq5xpYJywh6bQvhVOhnbCoVGAOdqOIJ25xSC2wF5vaCWWRhjDtsS7d/EbXql
tRX3gA2RlNUKlF1MlGp7TUtnWkl/EWtaWI26qm0/zuvyAnxGKBY5Eo4HUMGNtVWH
BgQsfOviGCcDALYVPWC6foLtzrsz8BMYVVi+7u2hD0FMOa29oas=
=09l4
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--


--===============4482257361867411873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4482257361867411873==--

