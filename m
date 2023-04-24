Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B81BC7618E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Apr 2023 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+eHWD5hhHo9wpOsD62maivIsCQrR29HxBR9vG6A50o=; b=ALTemnjy/OeAmz
	fg6imq4kNJG0LIvDxbruIOhKoUMlwovfOOcv1WQbiuhGQIEZu8coKvn+s3f34KcdzAT18KpLV2VaN
	im8wOlBHruCWPxmNtGHAg5rruovTP4syWOHQuIB94KAhzWP15dnM69vOdkl7/VPkw5yUHjC1QsY+i
	7vLCbZSsIsub1ks7+OPmLm8YN91jwSU5A+zk7aHQc+a8A8yukqV191NjB/0UNU7jtLOC0U9nQTB+M
	eU91A0i85AroGRon6p+bt3CLkD3MLtqkhAHEyDg6c3OtJUswDu50Z/0ELEq0X6HVEhjkl2j0/9FZh
	xmn4r/P0qjJwa8DXL9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqytA-00GmdE-2V;
	Mon, 24 Apr 2023 16:18:04 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqyt7-00Gmcp-2n
	for linux-mtd@lists.infradead.org;
	Mon, 24 Apr 2023 16:18:03 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-38e9dfa543bso1055796b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2023 09:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682353079; x=1684945079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ef/nUWAo93ykxRt/lNEQT+96fr8F/oVSX+sFEFLjUo=;
        b=Uoz0q8/4n+9B/FsYwS0Ugs1oUjSHsljd852FkpKyFUiga0iezRgjDGvBJMlzHT2XVM
         wh5Xbs5WbfX5KQZs64er1YA/I2si+LDrwEK73/mF0uYpLyiuXZMlvCRp1F7CN4jnaI9I
         TnXjPcvzxedtGsD+5oWQmQexcAk3iBla/t2EATm1fqN1OrgKyyt4tuRGGLSaUiLRiTd9
         m2kZzQiNlpO5stbQGsUB+jBAU/1u8TtKaJP8baQR86nVM9rMuuGkVDMSCPXWNku9oQMv
         fVQhmvl0M/iOju4R72LDLhuNa4Rigvjr16cn1fSkOdyC0WJcNb56Vov3Dys/tCtViuJq
         7IOg==
X-Gm-Message-State: AAQBX9eKBofdUcWqzUgutv7A2fA1BuZrxkYUZ4tjJe2cnjIzi1zy/2pU
	HvAQWE/4grVdcDQ1hYR/zw==
X-Google-Smtp-Source: AKy350bn6N/FuqwHS0N9uitfDp4zpaNUuskHXzrku67V02VC/o8cVZMjd+m40+pv8Qvhp8DC1RToVg==
X-Received: by 2002:a05:6808:d46:b0:38c:ec:8b0f with SMTP id w6-20020a0568080d4600b0038c00ec8b0fmr8454350oik.16.1682353078268;
        Mon, 24 Apr 2023 09:17:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z8-20020aca3308000000b0038c35f512a2sm4730805oiz.56.2023.04.24.09.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 09:17:57 -0700 (PDT)
Received: (nullmailer pid 2768718 invoked by uid 1000);
	Mon, 24 Apr 2023 16:17:56 -0000
Date: Mon, 24 Apr 2023 11:17:56 -0500
From: Rob Herring <robh@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lukasz Majewski <lukma@denx.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/43] dt-bindings: mtd: add DT bindings for ts7250 nand
Message-ID: <20230424161756.GG2701399-robh@kernel.org>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230424123522.18302-23-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424123522.18302-23-nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_091801_920138_9111D200 
X-CRM114-Status: GOOD (  16.45  )
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

On Mon, Apr 24, 2023 at 03:34:38PM +0300, Nikita Shubin wrote:
> Add YAML bindings for ts7250 NAND.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  .../bindings/mtd/technologic,nand.yaml        | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/technologic,nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
> new file mode 100644
> index 000000000000..3234d93a1c21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/technologic,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Technologic Systems NAND controller
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: technologic,ts7200-nand
> +      - const: gen_nand

Not a useful compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells': true
> +  '#size-cells': true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: true

No, 'true' is not allowed here.

> +
> +examples:
> +  - |
> +    nand-parts@0 {
> +      compatible = "technologic,ts7200-nand", "gen_nand";
> +      reg = <0x60000000 0x8000000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      partition@0 {
> +        label = "TS-BOOTROM";
> +        reg = <0x00000000 0x00020000>;
> +        read-only;
> +      };
> +
> +      partition@20000 {
> +        label = "Linux";
> +        reg = <0x00020000 0x07d00000>;
> +      };
> +
> +      partition@7d20000 {
> +        label = "RedBoot";
> +        reg = <0x07d20000 0x002e0000>;
> +        read-only;
> +      };
> +    };
> +
> +...
> -- 
> 2.39.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
