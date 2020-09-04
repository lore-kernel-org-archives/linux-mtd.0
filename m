Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8197BC43461
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 22:31:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8CED2083B
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 22:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqbQI2cD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPfVtLk3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8CED2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/dI+j5zT36dwKYgYlIJe4QS8Sj1RfqjOdabaqwWckTA=; b=IqbQI2cD8XQLTIQJiy4hc+vTW
	F+dIkalf6lsUgg+LXxQacJGavhQaz42iJPyjw/YqjTHfmR3Cp02zNTa8bpdAMnQVYkwZ4+ELvS5Ty
	Gv6yQ3Vu2FShl9SwuydCpBbEk/o27PDjR4cNK+6Qg4aF84JMrhOwTwrhkOw05WiEky8mFZ1F426Cl
	hKaCAde8KFFn0v5I/fLZr/1QQCYdyt+HpqJ0KwIsNcovFw7HIUqPiBkzKy+uKPcKbe1Xx0gIATMab
	SPXhqh1zAT7345eg3RvbpTaG2+LrnQFfemzc79caR6Dvo8NO5k0MsEo+1q8brBlxbmIK9TPHMI5dn
	MAYTbfaeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEKDB-0002ym-2i; Fri, 04 Sep 2020 22:29:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEKD2-0002xY-Ep; Fri, 04 Sep 2020 22:29:29 +0000
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 705F5208FE;
 Fri,  4 Sep 2020 22:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599258566;
 bh=+8dgVfOXgmURomqOzPuR2s0d+0XktF+kVIZ4JamC1Yk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FPfVtLk3VgVy9YY2bppjWvDV2nvJ00oTy/jZPGsp1pSsT+kcmQKDELrZFVKOe/MW4
 zJ45aqs0sB4ogJLfi9CwwVOS1v0zgXZFL4fluzz0xaGojKmgqLJSTmIwDbIBjLZCDs
 e36mpUibGpzlRequFLGXPuBTspvr9u7SNO8bieYo=
Received: by mail-ot1-f50.google.com with SMTP id a65so7279372otc.8;
 Fri, 04 Sep 2020 15:29:26 -0700 (PDT)
X-Gm-Message-State: AOAM533rsqMN8KTDO/3HClMeE9NyZCP3BWIR8riK7VpnrZMNqgqFlawJ
 ccoaJritpJQn/E0NXfVQSFk5Zzbm2wL/yAuhRg==
X-Google-Smtp-Source: ABdhPJyg8Cu0lq2UsQBYhJV227Jo2feqOcJKLxrdCLPxr9lVLm9MUPpbfMcEDGy7OIP/8N+4iwU7/9VeNN4vhk5EUSE=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr7261177otp.192.1599258565768; 
 Fri, 04 Sep 2020 15:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200904152404.20636-1-krzk@kernel.org>
 <20200904152404.20636-14-krzk@kernel.org>
In-Reply-To: <20200904152404.20636-14-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 4 Sep 2020 16:29:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKOkerY14qc-7e5721Xsp0k6jm9oh1U1Lr-3SZA0HFgjw@mail.gmail.com>
Message-ID: <CAL_JsqKOkerY14qc-7e5721Xsp0k6jm9oh1U1Lr-3SZA0HFgjw@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] dt-bindings: mtd: nand-controller: Fix matching
 with size-cells==1
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_182928_611300_A604CA33 
X-CRM114-Status: GOOD (  17.97  )
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 9:25 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Most of Freescale/NXP GPMI device trees use size-cells==1 (even when
> actually not needed except few boards).  This fixes dtbs_check warnings
> like:
>
>     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: #size-cells:0:0: 0 was expected
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 40fc5b0b2b8c..0879e1108837 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -34,7 +34,10 @@ properties:
>      const: 1
>
>    "#size-cells":
> -    const: 0
> +    description:
> +      Depends on your controller. Put zero unless you need a mapping between CS
> +      lines and dedicated memory regions.
> +    enum: [0, 1]

Humm, seems that was to describe partitions, but the expectation of
the nand binding is describing nand chips. It seems the nand chips are
never described and on 1 board even has partitions. I think you should
fix the dts to move 'partition@N' nodes under 'partitions' which is
preferred and needed if you ever describe nand chips. And then fix
'#size-cells' to be 0.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
