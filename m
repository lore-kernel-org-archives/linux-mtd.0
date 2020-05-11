Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6FBC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 22:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82AD206F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 22:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0ewXGio"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E82AD206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0Y1lltEtdu4qews3PKxwA6pOmji5Ce6bJUHMaSQb6E=; b=r0ewXGiosNOCpY
	945liAvRXN3Gp9o+xNqgm+YwsshOxJKq/bZj1u9E0FW0JPUosBB658kvX5zMso9PxsMvutU978O+w
	VHJOtg8dbnvNyWKVLZEcj1L1khSk9ouhUq6nPjIsPIMieUiZzdc/enkqNpublojquAFcNLsMXRZN5
	f7PGT7CHU2FWzeYgWKJ7B4v/r60OU28oHcpIK3wFOyopWvpABh+9zX07iANMSN3+4jcGGjVcqD/AO
	l24J7Drz1aIA5IylUQlsQkiigADk/8fpjoT4hFC5xlKRROClIlFF2O9sv0Qg9//ZJ5rC2NpU81gMt
	aLbmGzWL7rVOj1GEVjlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHDI-0007Hc-94; Mon, 11 May 2020 22:47:56 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHDF-0007Gh-DC
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 22:47:55 +0000
Received: by mail-ot1-f65.google.com with SMTP id 63so1599219oto.8
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 15:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FBCSWYQOACSW+NmV5Hv5SV07fxhPe1QJYaBtFG5Lk6o=;
 b=RL2Nu8AKv4vTli9dz1mwKbzBGhzYEC4FEiyjErRBVqGDpqHT5jhxvI5QzP2ni0f/R9
 Wurk8SpJnEhVheXXwwUQDw1WtPGbfApvtcVq0Enb7lCEas5/JxhpRuYNkjKj3ZPdhDcm
 JnwXGG51GbSOxLGlnKDXGGPjJlYflWUQNFxPTZoh94zFcxaNJqqa3vvQ/7gwaWBF+Rtl
 3zjR7EiipbpiuARyoTPBLt6spMs3nCgSy01FE+qbhqtVHIo2GnLZfzj3zj5ZCgsJqp5f
 vM29rm5E2VRntOMNReGifoLJEIq4ceHdDRWNeaiyyrd3Rpwfa19T+Qxcsq1eazwjx2PS
 lGJA==
X-Gm-Message-State: AGi0PuZuqdrNxkAbPTWCG0D5q2kqqUdJ3ZxaxJ1ovPYsLWhpchACdOCq
 CZBiCHF2/zkTFdkRiEqIegfUIQg=
X-Google-Smtp-Source: APiQypL4PYdJeBWPhWWPxR3FdrQJgI8lMTdi7bTlT0Jg8FJD1NabXquhyKLcISJV9QlkiKoQlJ6zUQ==
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr15655881ota.4.1589237268644; 
 Mon, 11 May 2020 15:47:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y10sm3170211ooq.2.2020.05.11.15.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:47:48 -0700 (PDT)
Received: (nullmailer pid 24853 invoked by uid 1000);
 Mon, 11 May 2020 22:47:47 -0000
Date: Mon, 11 May 2020 17:47:47 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/8] dt-bindings: pinctrl: Convert ingenic, pinctrl.txt to
 YAML
Message-ID: <20200511224747.GA19685@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_154753_447161_98078F0A 
X-CRM114-Status: GOOD (  19.57  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Apr 26, 2020 at 08:58:51PM +0200, Paul Cercueil wrote:
> Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
> 
> In the process, some compatible strings now require a fallback, as the
> corresponding SoCs are pin-compatible with their fallback variant.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 ----------
>  .../bindings/pinctrl/ingenic,pinctrl.yaml     | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 81 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> new file mode 100644
> index 000000000000..adf462cc2737
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs pin controller devicetree bindings
> +
> +description: >
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  For the Ingenic SoCs, pin control is tightly bound with GPIO ports. All pins
> +  may be used as GPIOs, multiplexed device functions are configured within the
> +  GPIO port configuration registers and it is typical to refer to pins using the
> +  naming scheme "PxN" where x is a character identifying the GPIO port with
> +  which the pin is associated and N is an integer from 0 to 31 identifying the
> +  pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
> +  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
> +  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
> +  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
> +  pins.
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  nodename:
> +    pattern: "^pin-controller@[0-9a-f]+$"

That would have been more consistent, but 'pinctrl@...' is the standard.

> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4740-pinctrl
> +        - ingenic,jz4725b-pinctrl
> +        - ingenic,jz4760-pinctrl
> +        - ingenic,jz4770-pinctrl
> +        - ingenic,jz4780-pinctrl
> +        - ingenic,x1000-pinctrl
> +        - ingenic,x1500-pinctrl
> +        - ingenic,x1830-pinctrl
> +      - items:
> +        - const: ingenic,jz4760b-pinctrl
> +        - const: ingenic,jz4760-pinctrl
> +      - items:
> +        - const: ingenic,x1000e-pinctrl
> +        - const: ingenic,x1000-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^gpio@[0-9]$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - ingenic,jz4740-gpio
> +          - ingenic,jz4725b-gpio
> +          - ingenic,jz4760-gpio
> +          - ingenic,jz4770-gpio
> +          - ingenic,jz4780-gpio
> +          - ingenic,x1000-gpio
> +          - ingenic,x1500-gpio
> +          - ingenic,x1830-gpio
> +
> +      reg:
> +        items:
> +          - description: The GPIO bank number
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +        description:
> +          Refer to ../interrupt-controller/interrupts.txt for more details.
> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - interrupts
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pin-controller@10010000 {
> +      compatible = "ingenic,jz4770-pinctrl";
> +      reg = <0x10010000 0x600>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      gpio@0 {
> +        compatible = "ingenic,jz4770-gpio";
> +        reg = <0>;
> +
> +        gpio-controller;
> +        gpio-ranges = <&pinctrl 0 0 32>;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&intc>;
> +        interrupts = <17>;
> +      };
> +    };

What about pinctrl child nodes?
 
> -- 
> 2.26.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
