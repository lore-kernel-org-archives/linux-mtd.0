Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C94C43461
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 22:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B5BE2083B
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 22:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1iE8iyMu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d42dH4d2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B5BE2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lU8xYppulnc33NiPUHV9B/EIuRxZKce1HNpVVbG24W4=; b=1iE8iyMuYnQNS+y/aVtPa9H5z
	7WaYoMFpRvM9Au1mLNiTm/yRuauEf45faCU+sps48ngBjXZxwLbD1Wq8+mtWXbBjPm3GyJkhuiQoK
	8yz/f1Ro2j69phQxJQqpkE6z0Xb3vT3VTB1oYffMSgZzY46CTzBf8s0+1eqel96py2kfbcr2cy6ju
	surSNqktoIPnN71E8vt98POQdBT8JpruYl4RDn3wsJWvjUvzMMRuVEhTtz2JwDbC8+SgXY/NCVkCH
	iAthgCyz7D4xSxTKcg6AuMdo6sJW00OZ1gtJiGOp5hQjUobD6gwzEBKcgB3typfX7R5SnEht/w3bw
	mEHCsSWlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEKKG-0003mX-0T; Fri, 04 Sep 2020 22:36:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEKKC-0003li-40; Fri, 04 Sep 2020 22:36:53 +0000
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B47692145D;
 Fri,  4 Sep 2020 22:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599259010;
 bh=Z77smMqMlJ9InjnfOSLkOfrCVv21ZVMsWg97rhByuYA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d42dH4d2dmIZHNUOIPn2Xx9MDOlVwMecjUeWrrvxfpq6DK2RfQvJ6xLEXu/dqhvzS
 Z/ISTc0EKYUenUlG+YNk2cGRIJ9vj92JritbM+b60QJN529orldpgXxshMN/mRXRsl
 H5JpjCsVsztY+LzY2r0RUl6cSIkr06PafRhcGs0Y=
Received: by mail-ot1-f48.google.com with SMTP id u25so7302534otq.6;
 Fri, 04 Sep 2020 15:36:50 -0700 (PDT)
X-Gm-Message-State: AOAM530i0EHGAa6PddMPkW088kES41knhF2/pYd565yG5BuZNNJXnxF+
 dFr9ZURQuFsJGNAJ3oRFcSmPP4IfqN4VC9UWwQ==
X-Google-Smtp-Source: ABdhPJzgDGB2PMZG85xp4jfP9Au8Rn5zzR1d3vIUH17hhCmIoFGECB1Z1dXYQV5cZkVxUXSJH9qoAFDMcWerjSrzYOA=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr6724740otp.107.1599259010019; 
 Fri, 04 Sep 2020 15:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200904152404.20636-1-krzk@kernel.org>
 <20200904152404.20636-13-krzk@kernel.org>
In-Reply-To: <20200904152404.20636-13-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 4 Sep 2020 16:36:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+tGQhkqtQszOx7nvr1PR=YFz2p1=OnWQ8JxmSg4qNkHA@mail.gmail.com>
Message-ID: <CAL_Jsq+tGQhkqtQszOx7nvr1PR=YFz2p1=OnWQ8JxmSg4qNkHA@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] dt-bindings: mtd: gpmi-nand: Fix matching of
 clocks on different SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_183652_514278_4A77994E 
X-CRM114-Status: GOOD (  20.82  )
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
> Driver requires different amount of clocks for different SoCs.  Describe
> these requirements properly to fix dtbs_check warnings like:
>
>     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Do not require order of clocks (use pattern).

To the extent that you can, you should fix the order in dts files
first. If we just adjust the schemas to match the dts files, then
what's the point?

> ---
>  .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
>  1 file changed, 61 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> index 28ff8c581837..e08e0a50929e 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> @@ -9,9 +9,6 @@ title: Freescale General-Purpose Media Interface (GPMI) binding
>  maintainers:
>    - Han Xu <han.xu@nxp.com>
>
> -allOf:
> -  - $ref: "nand-controller.yaml"
> -
>  description: |
>    The GPMI nand controller provides an interface to control the NAND
>    flash chips. The device tree may optionally contain sub-nodes
> @@ -58,22 +55,10 @@ properties:
>    clocks:
>      minItems: 1
>      maxItems: 5
> -    items:
> -      - description: SoC gpmi io clock
> -      - description: SoC gpmi apb clock
> -      - description: SoC gpmi bch clock
> -      - description: SoC gpmi bch apb clock
> -      - description: SoC per1 bch clock
>
>    clock-names:
>      minItems: 1
>      maxItems: 5
> -    items:
> -      - const: gpmi_io
> -      - const: gpmi_apb
> -      - const: gpmi_bch
> -      - const: gpmi_bch_apb
> -      - const: per1_bch
>
>    fsl,use-minimum-ecc:
>      type: boolean
> @@ -107,6 +92,67 @@ required:
>
>  unevaluatedProperties: false
>
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx23-gpmi-nand
> +              - fsl,imx28-gpmi-nand
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: SoC gpmi io clock
> +        clock-names:
> +          items:
> +            - const: gpmi_io
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx6q-gpmi-nand
> +              - fsl,imx6sx-gpmi-nand
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: SoC gpmi io clock
> +            - description: SoC gpmi apb clock
> +            - description: SoC gpmi bch clock
> +            - description: SoC gpmi bch apb clock
> +            - description: SoC per1 bch clock
> +        clock-names:
> +          items:
> +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
> +            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"

BTW, you can make 'items' a schema rather than a list to apply a
constraint to all entries:

maxItems: 5
items:
  pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx7d-gpmi-nand
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: SoC gpmi io clock
> +            - description: SoC gpmi bch apb clock
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2

You can drop these. It's the default based on the size of 'items'.

> +          items:
> +            - pattern: "^gpmi_(io|bch_apb)$"
> +            - pattern: "^gpmi_(io|bch_apb)$"

Surely here we can define the order.

> +
>  examples:
>    - |
>      nand-controller@8000c000 {
> --
> 2.17.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
