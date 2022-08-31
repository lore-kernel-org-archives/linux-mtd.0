Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F7ECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb8T0xb2djQGCTOD1ut4PF+dFSHZTN6zKBNGKuJhSfo=; b=LAdrVMpikj+HIK
	8yBytOIu47l+UioZ6EQWapdknxi/jUfCvn1w4C23ZdPe7DA+HhzLQ1pXPVy5hEkf4hRiB61A4KSBP
	pipWPjdEbQCsn9nHLaPTm+mg/EqPcu5vnm8KszEDkFOWvneY1BZDWhgOKq/cknH8ESTNRZz89Ijrx
	7otXmzwgxfkR3WY4ZR4AXZlsyHFN3TW2tvZvK3o/GzutvroiARZUwk4mIco5UMteQ2qs8gvtyNM7i
	1YuE4ZY6EWcIyvjgmq0vj8LhNZkhmMhV14Ju8+Izy1RiHdVymNtrYpbL+k4P6tyPqmtPJ3ANdxBGv
	YmLpn93/1OlKioQiQtUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIQ5-004ffv-MT; Wed, 31 Aug 2022 07:45:53 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIPc-004fWS-Iw
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 07:45:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id q7so18755910lfu.5
        for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2022 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ouTFxY93nE4Z9QkhFZSLBKekqYyiBXQP19HgDhyZHSU=;
        b=KaH7MCXXGQGzFH3dRW0/Fv7P3w2fHAmtPvJFEJm8HRZTM7oPKNxSNuqnLws54cFdz2
         JJbSZe8FWP7wO+KfbvOdXyFVA4wSNxKYi27qCwXtuG1rVbEyDnnYT5SVwk+nVNo81PFm
         CJ7NBXtdCA5607gVeIVUC/chvc/oEX1EQ7Vl+1Lk3nd1xAglRlrqwBsW37MmJgqCps1B
         sewjrGFON/2R+WugFtQksVIEnAt5MCSCAsKLJuMEhEbW8gtpiUqnNcwzdHe5SE5WPJli
         dV7mrnvhlOfRfQIF50u9qmQm5Jp83VE4LhdQT2XLVJoCCS8p0fQV9fNsG/+vel5iApuB
         TALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ouTFxY93nE4Z9QkhFZSLBKekqYyiBXQP19HgDhyZHSU=;
        b=1gjHlE/1z9szGmU712yAdp20FUtOlIxUftrePTym5V3vSpeEDxpI3Wvq+0msuYbIo2
         IvqYZNefpYKo7pPtyT+B6U2Sn1kU587Hws9DxA2H+Oxest/Q9BgH3K1ZTY5QB2lXjHh6
         3kCh/A3ptGaWZRrw0kbCPhqXeVahhvB4yDsG+XlaAutlbFvy5lTDib0gg7eHWk1R659t
         mNDSrD5O+qiOBjVSZhuXhJZ0KzNC4iEjwgsbJxlNWsUWemcb/h0X3i9m/WNBHxhEzN5q
         V+1FUmeWD8M4l1K3/X42DjR+ZQx5gv/ou14u/Zq39tBjqYx/87ZWZVK9gzNpIetE5psS
         +Gtw==
X-Gm-Message-State: ACgBeo1hJdPta20ycDpWES+uflkMJmcs0SKP4AnAet7vcz6M3qVmYbUi
	gvPzjACNjYthXcUG6MVnc2ITLg==
X-Google-Smtp-Source: AA6agR7DzXu8IZaFW+OBdsWSDmCTnpWerpKoskVDkUfL/4niQUo3xpWIrSAl2jDIzTuo0en6kWFeyw==
X-Received: by 2002:a05:6512:2354:b0:48a:e29b:2bb4 with SMTP id p20-20020a056512235400b0048ae29b2bb4mr9582773lfu.435.1661931920194;
        Wed, 31 Aug 2022 00:45:20 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f12-20020a05651c02cc00b00261800f0e02sm53144ljo.26.2022.08.31.00.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 00:45:19 -0700 (PDT)
Message-ID: <b85276ee-3e19-3adb-8077-c1e564e02eb3@linaro.org>
Date: Wed, 31 Aug 2022 10:45:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 09/14] dt-bindings: nvmem: add YAML schema for the sl28
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
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-10-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825214423.903672-10-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_004524_711030_01A9A728 
X-CRM114-Status: GOOD (  22.33  )
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

On 26/08/2022 00:44, Michael Walle wrote:
> Add a schema for the NVMEM layout on Kontron's sl28 boards.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> new file mode 100644
> index 000000000000..e4bc2d9182db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
> @@ -0,0 +1,52 @@
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
> +properties:
> +  compatible:
> +    items:
> +      - const: kontron,sl28-vpd
> +      - const: user-otp
> +
> +  serial-number:
> +    type: object

You should define the contents of this object. I would expect this to be
uint32 or string. I think you also need description, as this is not
really standard field.

> +
> +  base-mac-address:

Fields should be rather described here, not in top-level description.

> +    type: object

On this level:
    additionalProperties: false

> +
> +    properties:
> +      "#nvmem-cell-cells":
> +        const: 1
> +

I also wonder why you do not have unit addresses. What if you want to
have two base MAC addresses?

> +required:
> +  - compatible

Other fields are I guess required? At least serial-number should be always?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      otp-1 {

Messed up indentation (use 4 spaces). Generic node name "otp".

> +          compatible = "kontron,sl28-vpd", "user-otp";
> +
> +          serial_number: serial-number {

What's the point of the empty node?

> +          };
> +
> +          base_mac_address: base-mac-address {
> +              #nvmem-cell-cells = <1>;
> +          };
> +      };
> +
> +...


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
