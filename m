Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBC8C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 05:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A3162071E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 05:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEX/P6FN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A3162071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P27gcp4VQxF8ax1G8FSx2uwKqWPl2M6MYmrGi8ERg7g=; b=VEX/P6FNC1lKuvHnUi+qTXMV9
	dU32TbhxH3TEu81GveYeO+VhVmtcHrK9/WSxP1IXNFnDZpiqjQShEF9sJOUlsuokzRng5Td5N4/+8
	/W86Qj4/qHhdWTzm9gFRplVwdkBmHAO07Zi6y4z6CaRdqcOTzVyYKbr3sPlbdGk6MirLoBFcd9eC3
	HMa8QiXEPOeGeKalizKy60dms4ZGJEh2Z1ioN2K4SwP/yx7YFnuCcfSZHUIl7akt4nSP5SKyLbFyF
	IRTpD0tOCyd33AMRNjgFo1yrFbB7DDOUSYI44s7z58NOYqCotHPFAF8t7IB1FpTGpBHPCmUHdevx3
	nWnR89aHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA4yc-0000FE-Jz; Mon, 24 Aug 2020 05:25:02 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA4ya-0000Dp-MB
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 05:25:01 +0000
Received: from [2001:67c:670:100:1d::c0] (helo=ptx.hi.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kA4yP-0002k3-0d; Mon, 24 Aug 2020 07:24:49 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kA4yM-0000FJ-Og; Mon, 24 Aug 2020 07:24:46 +0200
Date: Mon, 24 Aug 2020 07:24:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/22] dt-bindings: gpio: fsl-imx-gpio: Add gpio-ranges
 property
Message-ID: <20200824052446.GE13023@pengutronix.de>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823161550.3981-2-krzk@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:22:41 up 186 days, 12:53, 138 users,  load average: 0.06, 0.11,
 0.10
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_012500_843467_E1F76A30 
X-CRM114-Status: GOOD (  17.84  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Anson Huang <Anson.Huang@nxp.com>, linux-gpio@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 23, 2020 at 06:15:30PM +0200, Krzysztof Kozlowski wrote:
> The GPIO controller node can have gpio-ranges property.  This fixes
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
>     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> index 454db20c2d1a..1fac69573bb9 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> @@ -51,6 +51,9 @@ properties:
>  
>    gpio-controller: true
>  
> +  gpio-ranges:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -62,6 +65,18 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mp-gpio
> +    then:
> +      properties:
> +        gpio-ranges:
> +          minItems: 1
> +          maxItems: 2

Why do you limit this to fsl,imx8mp-gpio? The i.MX5,6,7 dtsi files use
gpio-ranges as well and other i.MX dtsi files could also use it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
