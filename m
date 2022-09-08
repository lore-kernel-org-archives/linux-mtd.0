Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44DBC54EE9
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yfoZn2o8/p6BnrC2D91NnRN+idLEUp0HwzSBQWW78A=; b=n0E35lFV09f82+
	n7CVzSvQEsunCQz+7sa779Mcm9S5Gt7cj7cwqrCz2Hd4TSOKKk/dYPWRp367Z1A76lcgdyHbs28Ob
	ykyhCnFxJZ+YLCjRC6zQz6/yvYyeeA4/sfw4tgp8QFdZL1JH9ye+Q6gOaSsmZWCXn9A6e7LQdh0+6
	GqkrnzilrghhPh3vPEJw8T1z1sFSb2e2d0yqKA+NVECOR7iw1tEtikzXWGMmxhyeOS5t6lRV7ZPWE
	oPBxOh4VOq0PX9CufwtWkmMeGlvCxZyF07yU6jg+Sxp3keQco4SNdLB/pTXoGtFvDs9cLt2YauaZQ
	3oOjm7EwNpyj8207dg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGXt-003B7Z-Vx; Thu, 08 Sep 2022 12:22:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGXr-003B5n-7a
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 12:22:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id s15so19681295ljp.5
        for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2022 05:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dLNfPVthIDGnvL7i64ft4qcn3DEatPgzaJhqNWGF3ts=;
        b=tN5ys6hDdHw2V6LYl85NdhEbAv3IBthZ49XCt6QVHcsdJiSzDwgWO76jDPCqgX/1Gx
         LOiVgL1JZCg0BPm/ibDkf8X0eKYaXRa4gZiB039yX4MW83KWnh8E1t9ku1w28Gih08wx
         QwPzF8AqW+VZUt6zSKCbJ/fl7Bwz/b5x67+dQw4D+5J3VfRCUisQrJcMt/p030+o42Lw
         jMs2ER9qlCtnOR3piKpSPueODGp4uGJO9mPy/P1KfuAFKjyShG96LsyLwbOYi20omXAq
         nxKLLs1eYiUUm4j4UIfk27EW7Ib66BCv4okEGWDaJSZ+tQQUOKKSkSCeSFKu4ijcEjUI
         dFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dLNfPVthIDGnvL7i64ft4qcn3DEatPgzaJhqNWGF3ts=;
        b=5Y0hEAer0u3HCcWr3zTiwwyTrtpAbeHLdq9k5voCQquo1AeSjnjYEnepKLfxNI7Bqi
         uo8kZQottTFQWk8cZQNCu/lz1t2cal+jloAEwSNT0mEQXkmNRg8MxZj/Mkh3GuJ736B5
         ioesZlMF4Q1p+/hU/57C5BxtlH+lhQkZKDX4uF0Iu7ryPGaTvurbyFikFWJOh/qSemVC
         tqPQ/uI9aBvnkbVh8Entw7mSwYQr8AMj0YuYFvFFGHFSMLaiG4lcVHr4pif9uavpddco
         pIHqfNYtxFb9OKYW4vFtkFBFLbXMDYhVOhr8n+d9OcUlAIe7x5GrJNCQBHTweYYdF9L7
         DlXQ==
X-Gm-Message-State: ACgBeo3R4B/ITV04+Z5hID9vWZ5nm5P8QvhwMfrSpvF9ePJ8Im7ydv4v
	qoKV/z4kkMMxa2B9OZJP73YSMg==
X-Google-Smtp-Source: AA6agR72b0agI2YyD/fb1KKijZU1ePELXly2WbC2r0DTgz9pIb4cJL9ka7vjZy0+P5dng67QOaXZmA==
X-Received: by 2002:a2e:2e07:0:b0:26a:c516:5a9a with SMTP id u7-20020a2e2e07000000b0026ac5165a9amr2247937lju.185.1662639729638;
        Thu, 08 Sep 2022 05:22:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a8-20020a056512200800b00497a0ea92desm1446135lfb.135.2022.09.08.05.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:22:09 -0700 (PDT)
Message-ID: <e0fe80b8-594a-5d7c-946f-751d59da6641@linaro.org>
Date: Thu, 8 Sep 2022 14:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 15/20] dt-bindings: nvmem: add YAML schema for the sl28
 vpd layout
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-16-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901221857.2600340-16-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_052211_299732_802F4236 
X-CRM114-Status: GOOD (  20.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/09/2022 00:18, Michael Walle wrote:
> Add a schema for the NVMEM layout on Kontron's sl28 boards.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v1:
>  - add custom select
>  - add description
>  - add "additionalProperties: false", I wasn't sure if all the
>    subnodes needs it. I'd say yes, but the brcm,nvram binding
>    doesn't have them neither.
> 
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> new file mode 100644
> index 000000000000..0c180f29e880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/layouts/kontron,sl28-vpd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVMEM layout of the Kontron SMARC-sAL28 vital product data
> +
> +maintainers:
> +  - Michael Walle <michael@walle.cc>
> +
> +description:
> +  The vital product data (VPD) of the sl28 boards contains a serial
> +  number and a base MAC address. The actual MAC addresses for the
> +  on-board ethernet devices are derived from this base MAC address by
> +  adding an offset.
> +
> +# We need a select here so we don't match all nodes with 'user-otp'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: kontron,sl28-vpd
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: kontron,sl28-vpd
> +      - const: user-otp
> +
> +  serial-number:

I will leave it for Rob to ack...

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
