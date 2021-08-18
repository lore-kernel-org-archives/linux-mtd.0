Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D690C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 13:53:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3490760238
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 13:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3490760238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQRNI2OA5ueSoSndE13LsaURe8IsJ6t7J5Rfzjc0e1Q=; b=XFhbMB9+adbPCtH+sAl550bHAr
	po+1fXPvf+/R38eW0jXIoFl94xuBmUJvJ1+VkoXEwghADya2boCJSXWxTmvMYHSPhD1mJjxL7IGF1
	oNt4voY1NAZQGmL4suvbEerOkwqscV3R7bp43hVKbDi7RIf4ezvKHpbqpkwoU8/roB2vS4ASyhPkS
	8ApN7gFA5SeC5yCltNfFuVnrIUYYgKNPWcCBtmOlD4T8G+hlziT8VLTRaDjLsO/qru+vbkHeFZ24u
	TWFVkPrptzORSgSHrEwt/BrfZIlYnqPqoIxATDqgUz1Tmu6VP/K7h8q0pesQeln8E8c5Pmlmy8xWt
	BndsjBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLzv-005lns-Cp; Wed, 18 Aug 2021 13:52:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLzs-005lmd-8H
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 13:52:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id u15so1695620wmj.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jOgcnBwrOLmqSugnm3cp6EhHEP/odkYp7u8LvN4y0lg=;
 b=sv1dJcbG/BmMEmc0L+mtgvhWHKBbBbMVxUrY86wqc5u6HQET66cZYEITfXJUNSTHEn
 jrjfV5d7wUQ3g5J9iHFadGhO8iEq42lKjTSMiagkIaX4AuP/rzNr4xMyozgDu5uPaS6h
 2UBX+3owGSOx0k9y7k052QcjRE5XDy7vJKzh9Q4bsty2sAy4aRWu7htOyNA23eybNJL/
 4+7RwBpzp4J5zPZ3+2N4LPiO2AlJc03/lV6N3wt/00s0qVHAu6wrV6KpyXWLLSMEpr1P
 rNXFpJDHlrxZW1dTPZBGwEqqMYIxsfxbNJEuKIjWJBrd8XNDoHi8ZJB42Q72+nkmSUtW
 B3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jOgcnBwrOLmqSugnm3cp6EhHEP/odkYp7u8LvN4y0lg=;
 b=rOOvisFuLUWD2aTeEr/TVM7+UOj1oicstbJDH46pD3P2ZE+k737XU9K434MbwPvEgK
 NuKnuqQXBc0IJd0TGtR8mNKZ5mXS+t0Z9/XN4/xMK4xabBF2Urz0Bf7H9pj2A+7LMS1+
 Q4Lbx32mM0HV/nA4/IOFwvVn7x/be2l7jAyR5T/kvCYj1P+ivK1YpKrBEufWN/Scl5CM
 fQ0uadO4FjSG/ZCPZpGYW4hVDeHcIrnZfRc5G4t4CvHtxfvoSDvKW1vs1erazUtX3xQB
 zxblkLnvU41ds8AV0EH9MDws2mFbMGfuK9PZAPT1xHJ/gU39vHSnqu2vEFfOpsJs2Dx0
 KAPQ==
X-Gm-Message-State: AOAM531m92uITZNeS48rm1Pz2RXWMyps4uhjgk7Qo9R5iIvTvETMeZUS
 DtGkXF6dg8vekgKFVc+NT8A=
X-Google-Smtp-Source: ABdhPJw2fCynEGecoHcSqyOPIsKQC3v0OYqKKW2tVbDgrsUECsFVvJCMwg2XxFHkvZO2YGRpijpYYw==
X-Received: by 2002:a1c:7902:: with SMTP id l2mr8617935wme.71.1629294766382;
 Wed, 18 Aug 2021 06:52:46 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d4sm6036923wrz.35.2021.08.18.06.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 06:52:45 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:52:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
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
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
Message-ID: <YR0QrFGZs6iQv1N3@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
 <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
 <06128217-92e1-9b66-64ea-91855d041121@gmail.com>
MIME-Version: 1.0
In-Reply-To: <06128217-92e1-9b66-64ea-91855d041121@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_065248_364909_EF9FFA87 
X-CRM114-Status: GOOD (  19.89  )
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
Content-Type: multipart/mixed; boundary="===============4051354754207139121=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4051354754207139121==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="axwoZ8lGgPeVqxL6"
Content-Disposition: inline


--axwoZ8lGgPeVqxL6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 04:44:30AM +0300, Dmitry Osipenko wrote:
> 18.08.2021 04:15, Rob Herring =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> +  tegra-clocks:
> >> +    description: child nodes are the output clocks from the CAR
> >> +    type: object
> >> +
> >> +    patternProperties:
> >> +      "^[a-z]+[0-9]+$":
> >> +        type: object
> >> +        properties:
> >> +          compatible:
> >> +            allOf:
> >> +              - items:
> >> +                  - enum:
> >> +                      - nvidia,tegra20-sclk
> >> +                      - nvidia,tegra30-sclk
> >> +                      - nvidia,tegra30-pllc
> >> +                      - nvidia,tegra30-plle
> >> +                      - nvidia,tegra30-pllm
> >> +              - const: nvidia,tegra-clock
> > You are saying the first string must be both one of the enums and=20
> > 'nvidia,tegra-clock'. You don't get an error because your pattern=20
> > doesn't match 'sclk'.
> >=20
>=20
> Could you please rephrase or clarify? If pattern doesn't match 'sclk',
> then it must match any other enum. I'm not sure what you're meaning.

"sclk" doesn't match "^[a-z]+[0-9]+$" because it's missing at least one
digit at the end. Perhaps that last + was supposed to be *?

>=20
> The 'nvidia,tegra-clock' actually could be removed since it's
> superfluous now. I'll consider the removal in v9.

It also looks like your schema was meant to be something like:

	compatible:
	  - items:
	      - enum:
	          - nvidia,tegra20-sclk
	          - nvidia,tegra30-sclk
	          - nvidia,tegra30-pllc
	          - nvidia,tegra30-plle
	          - nvidia,tegra30-pllm
	      - const: nvidia,tegra-clock

Note how the const: element is indented one more level. Now this means:
one of the enumeration values, followed by the constant value. That
matches what the example has.

That said, I agree that nvidia,tegra-clock seems a bit useless. There's
really no such thing as a generic clock, they're all different in some
way.

Thierry

--axwoZ8lGgPeVqxL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdEKkACgkQ3SOs138+
s6GVTA/+I75N/HheGyhGoMpEMo6FfeNzU7R/+NHB2FRurB/YrTa13bWZugoiwK1g
mphbxP5cVRf0bIp0B+K6eGuJtpoZleqT4Yd9ltzPj9QTo4jRjJfJpsv/enqpIKeV
hbbkb2LbO6wCifNJX5SEKvd4tP0eBZSJ/2yL+k7iZeAhu/gvAEpqc8W6Qu4tw8QN
T4dCZJObKv3yb2C9Yawh+cZ8FRKtUOBYLVR7pUuDf0iMMz+J/WaPVU8w8t9AYSoE
Luza/xoK5cyV1lia8TRRyZS16Y1Cq3Sdd+CZwSS5yL/NOgbbxX99brpelLlYiC4z
otx+pCoIgMjy7aeDt+FMUondNXka7Mf7gcSoCanpN5hbh4kyeRthkrD4MTmYJauA
1vcF0d/FFVCeT9wJ8R9adYBEzfMtqRojwYGibR/A/6tkbbg7BBwzXE0XQvLxwilO
idyOaV7eId9T7X6eIUv60hJ0pK5uSjrANgTZcSuq2MZSaAhYDeTjZuRtwTF4FgoD
/TGRVW15AIQDfopJMoXUCYXWxgoK4pGFLBKSMcaN5MZzas28c6BNZamkU/pdm/mZ
8GUmd6C29iG6w9wsMQxQ8lgvxUXR7Fe6rCtDUH23EqLJZp9GC8tmJa+cDPzuqQPY
5jYDCJOHyLz4Gc9lpyjeddOQv7y5FF5qQ1i9TYKuH8wGwEIeO1s=
=E/0K
-----END PGP SIGNATURE-----

--axwoZ8lGgPeVqxL6--


--===============4051354754207139121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4051354754207139121==--

