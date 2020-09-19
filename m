Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33468C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 14:25:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D804521481
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 14:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQzZXn+K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2oYZ4BVC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D804521481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KjB+l/k7yF/axGBL+G6nXJBjiQryFaXtTFlbNG9/kCo=; b=NQzZXn+KeMTIWtW4UFc+BxtP4
	AZGGT6ZQN0rkFN5+Hr2wtfW1fhDB2PawMn/cbo1xppJfUcPjzBOYFchvlBW8N4Wsqxmyv2sMBeafx
	YfWPaUi5bS47LmPexOHQYVP85tCio+t2D3aza5Z9LFVojFntJU6Ulvn1hTrmriULitzNQ8XfzSWgA
	/nq9K19pT6Ra6SPSHZ2RiMK2zaEwvRtidOPHrzMOXXy4mXamE5vU5qXjJCDwLR31MGwT73rAgBepf
	//EjfDC/SEParWCzcCEBRmbvXvT2aAXKmOOHhfNpRRAzN6YJ6KO3JOaYkso+bkrts4eIWm8XFy/nJ
	lTmMtZKLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJdnf-0004IW-1l; Sat, 19 Sep 2020 14:25:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJdna-0004Gf-JT; Sat, 19 Sep 2020 14:25:11 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 610BA21707;
 Sat, 19 Sep 2020 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600525509;
 bh=kHRkKnYP82SMnFqUKvGenb2khehyXzI7WLF+nQ+tzgw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2oYZ4BVC2fLdI6wdQldYFviXX+QrY8yA0ESlee7qs0Kg3rxm+3/6PF7RDdoanWhzk
 7SCrbarFFlCxPmeN8jVVYZ6eN2Dx0WuxN9pBX7Bej1bF3XrffumU+pypQxtnac8AZo
 1o0OYgAJM/AzKyeyqbeC+5fYnJHhdKDn1nORlUAE=
Received: by mail-ej1-f54.google.com with SMTP id lo4so11839793ejb.8;
 Sat, 19 Sep 2020 07:25:09 -0700 (PDT)
X-Gm-Message-State: AOAM5305M1xkjEMWq8ETcpb32Z92LVrV3JwwMMbKPi0p7gAkWyMnRS0G
 KNlIOg2/VdY4uWW4JGgp1afzXQsaDl62WKucNTI=
X-Google-Smtp-Source: ABdhPJxqLwyyHgA5Kx4Q6V81m6PRoMJ6U0hi/KURq0qDLpn+NftnXz1sAVg2ynpJvB3sE/6Veg68lbEq0jaBtPYIvhc=
X-Received: by 2002:a17:906:4046:: with SMTP id
 y6mr43178032ejj.148.1600525507972; 
 Sat, 19 Sep 2020 07:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200904152404.20636-1-krzk@kernel.org>
 <20200904152404.20636-8-krzk@kernel.org>
 <81a8248f-0d02-5646-36b2-5d4c3a7c4211@linaro.org>
In-Reply-To: <81a8248f-0d02-5646-36b2-5d4c3a7c4211@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 19 Sep 2020 16:24:56 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdJhfUsTqrTCouF+xQ1ChBWipBc6UaOBbewSPfrEw9Mtg@mail.gmail.com>
Message-ID: <CAJKOXPdJhfUsTqrTCouF+xQ1ChBWipBc6UaOBbewSPfrEw9Mtg@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] dt-bindings: thermal: imx8mm-thermal: Add i.MX
 8M Nano compatible
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_102510_711599_41BB7617 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-watchdog@vger.kernel.org,
 linux-pwm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 19 Sep 2020 at 13:48, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 04/09/2020 17:23, Krzysztof Kozlowski wrote:
> > DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
> > to fix dtbs_check warnings like:
> >
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
> >     compatible:0: 'fsl,imx8mn-tmu' is not one of ['fsl,imx8mm-tmu', 'fsl,imx8mp-tmu']
> >     From schema: Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
> >
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
> >     compatible: ['fsl,imx8mn-tmu', 'fsl,imx8mm-tmu'] is too long
> >
> >   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
> >     compatible: Additional items are not allowed ('fsl,imx8mm-tmu' was unexpected)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
>
> Shall I pick this patch separately or did you merge the entire series ?

Thanks. Rob already picked this up.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
