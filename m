Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D124EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C0E661077
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C0E661077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2W2GrnOE/A6QO0j7WVMIVGkqqQDJMWGvjIWGg/GVPE=; b=I3hLJtxrlagH3W
	vJy215AgZeCqILnH74441CGPBejzhtXJ4fzNF1iXMrtiRWVEcuZwLIeHiRPe3FgFIA8asPCWgPdmz
	IFLj0kpFyQEvmzpgeK7c8D8umpSKq+dvrB4kfW7g1YLtDtQRov+jnGI0MJg1s1ULHZLmVRWnTG4Ce
	T4rdZVuz8kuJuZt2n+HiLbsyIkqr3f+YvUc6cODvj1VPlloevUZkw3F0ZzWQdJNsZNhP2n8OfOBG1
	LItI2aKHbSjNyMyY8ad73E8Y68FVTu3nvWtgjQ/qhIEZ1xG9F6GJRG6xmmI6274/OX8AS7tC9g+Cq
	lqEww9BK70tU5IWsuGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKus-0029OZ-TP; Mon, 20 Sep 2021 15:09:10 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKup-0029MP-1u
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 15:09:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id m3so66769132lfu.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 08:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zHBcy62XBnwwIXR6J0uJZFxZPjvGorUc2wPW3wjD7m8=;
 b=DO5x9hFYScnYzeAJQV+nm5mz3uSaWz+2uG8C6WGB09WCtCoEtj3VeVAULgoR7t4icc
 l3cAnhjyZdjYexiF6AvgsxL6aSGoR1Wts5KS4UY/gRg1kopMBSHCt7rDFC9rX4WUHPff
 vaJU04Zppn4ym8YDhHWpDIg1fxhHC9YxeujQoTRdw/vdOQT8nPYClU8JnTwfDn8+dB19
 opjDk1x8kg0LrnI4u+QQMWt5FvDPc9dY0yChZyohWP+NvdToQlnnLmKmxtIuxcCUmz67
 G7gynfWVZ1fyhZaCHLUza5XppEO/j6S03WiRZ2kbo6/B6rsm1rxYtBTu/HTTFZNROLzS
 LdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zHBcy62XBnwwIXR6J0uJZFxZPjvGorUc2wPW3wjD7m8=;
 b=JibHQ9e1i32R5puGb3f3panSfwi6f+dZ3RVqFItdNbW54PBq5wRgONc6ODwRy+1ikj
 GE4NFJwMCga8TtLEn+r2ekuTzsa3s8B0oGBrhA8XnVtFrGXBlAdSQ2pW9QXn5NNH6OVb
 OSmrpywX8+7QeToNlyIfjP7lvCVWzow17wLj8gWgCKMoYF67l30oIaXET6SP4QI/3akV
 CuOv0kTR0bKh7DdXaRgpKWoxeqyGA1qQp+R8NMMN+Y5x3auh1Hq5J1R06sa7+M/rAzRd
 28kxn+csbnCOuyrTD2l3oLAoLODS/d6a7/IcAx2jvSxrqk00Q9ApwWuLc50j7Nlot1gY
 hwLA==
X-Gm-Message-State: AOAM532UzJvrfgV+SoHQ1ymdEOHZqZFn521xaHLZJ07x6RUvTJHs1Enp
 SBB4nSUSXaHu8B/xSBv4GyU=
X-Google-Smtp-Source: ABdhPJy4OYzYqeDYcjPz6Mwx9k9+fK4xv1m5cyhQyXfKOeYKeK4hSfbYYvdWr5tpKKfZUg9/vzt5MQ==
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr22868490ljk.121.1632150414239; 
 Mon, 20 Sep 2021 08:06:54 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
 by smtp.gmail.com with ESMTPSA id v26sm1319921ljv.77.2021.09.20.08.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:06:53 -0700 (PDT)
Date: Mon, 20 Sep 2021 18:06:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, michael@walle.cc
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema
 format
Message-ID: <20210920150651.vvdhennblwhdi3jw@mobilestation>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-2-a-nandan@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920142713.129295-2-a-nandan@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_080907_176930_373D00CA 
X-CRM114-Status: GOOD (  26.76  )
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

Hello Apurva

On Mon, Sep 20, 2021 at 07:57:12PM +0530, Apurva Nandan wrote:
> Convert spi-nand.txt binding to YAML format with an added example.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
>  .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml

Thanks for the bindings conversion patch. There are several comments
below. But before addressing them it would be better to also get a
response from Rob.

> 
> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
> deleted file mode 100644
> index 8b51f3b6d55c..000000000000
> --- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -SPI NAND flash
> -
> -Required properties:
> -- compatible: should be "spi-nand"
> -- reg: should encode the chip-select line used to access the NAND chip
> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> new file mode 100644
> index 000000000000..601beba8d971
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI NAND flash
> +
> +maintainers:
> +  - Apurva Nandan <a-nandan@ti.com>
> +
> +allOf:
> +  - $ref: "mtd.yaml#"
> +
> +properties:
> +  compatible:
> +    const: spi-nand
> +
> +  reg:
> +    maxItems: 1
> +

> +  spi-max-frequency: true
> +  spi-rx-bus-width: true
> +  spi-tx-bus-width: true
> +  rx-sample-delay-ns: true

Since it's an SPI-client device there are more than these properties
could be set for it. See the SPI-controller bindings schema:
Documentation/devicetree/bindings/spi/spi-controller.yaml
So there is two possible ways to make it more generic:
1) Detach the spi-client part from the spi-controller.yaml bindings
into a dedicated DT-schema file and refer to that new scheme from
here.
2) Forget about these controller-specific properties and let the
parental SPI-controller bindings parsing them. Of course there must be
at least one of the next properties declared for it to work:
{unevaluatedProperties, additionalProperties}.

It's up to Rob to decided which approach is better though...

> +
> +  '#address-cells': true
> +  '#size-cells': true

Aren't they always equal to 1?

> +
> +additionalProperties:
> +  type: object

I'd suggest to elaborate the way the partition sub-nodes looks
like, for instance, the node names, supported compatible names,
labels, etc.

-Sergey

> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@6 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "spi-nand";
> +            reg = <0x6>;
> +            spi-max-frequency = <42000000>;
> +
> +            partitions {
> +                compatible = "fixed-partitions";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                partition@0 {
> +                    label = "boot";
> +                    reg = <0 0x200000>;
> +                };
> +
> +                partition@200000 {
> +                    label = "rootfs";
> +                    reg = <0x200000 0xce0000>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
