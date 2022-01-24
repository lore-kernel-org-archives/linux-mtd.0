Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE90DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLBdQpoSVLdczL97zZwVgwIxJPMaLrZgV7Q06MyWUgs=; b=4SGqMEmQ84Em3aGN0ysGeOWRB/
	iJAvMcpL1v27Je6zR+e8DgJVT9coSX/IzS1syx2tx1qNFGIZEJHpHwSSvPlLvOZf2XYlK+r5B+0bo
	NP98nf8+VLiv3aXZdu/lMVhGpQ7EJIVwLvmUaCehwhQlHJpRW9C4hdaQPSx2IDMHjo13wvI+SSMHU
	UlKnSN27VeV6r4NtcQp+QNoNYxutdkEp9FP8koBxotLuGek12u5aISo2YQCpJ6ay55ybFp7dy+0af
	WG+kDA4bM3FKj7Wf6QZn98IvpRFpQn2jshj3mdEASaxBvg+1hRSmDK1rHJnvsYVqWRu9aar1BWB2a
	0zXUkKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC7Pz-005P4A-I7; Mon, 24 Jan 2022 22:02:31 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC7Pw-005P3m-89
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 22:02:30 +0000
Received: by mail-lj1-x231.google.com with SMTP id q22so5203289ljh.7
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jan 2022 14:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=LA2Dp3HJ+xwYPvctInS9E+uCracwEfra/4AQRc/q/i0=;
 b=BQOMDC29L23HCp50plS0yQ/NcRC/zrbZlKyPEP7hOhInoYBVaeZUH24Z7ujpjPSKCU
 4d5+qyxQ4LX6diCvvQces0kuZXo6fg6qQu3yt0NTGH5DDu43/fuNDgAlvVsOXYzLXdMz
 vCSGclw87g/DJtyWWcd36nAyxixpmm5bnG47Pd51uQUDkTJAcNmoz4Ih9/JgpuGBbKpQ
 bFbgHBVgTYJAwrFnAAhhi25ez03beYnFLteivm/JrW3hVnn0bumg7OsK9xtb1QN7wuEw
 GyY1qY4Ykg8cKArvTqWuwpZfEEFVHUuatG7sJOlp39E74OlqYrFS1yflC+tz1X+usu85
 kPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=LA2Dp3HJ+xwYPvctInS9E+uCracwEfra/4AQRc/q/i0=;
 b=Wo3etpTKckEkIt4xGPLJ3Pb3ZqLkAQbcW0+6PCKrjKboqLv9Al/ruALAYKI73k/Dt0
 115YKNpFKH8kddakqep9HHMH/HUbllXGk9uoGIoiIJzZ4XjjaULZfZIqdliAv/Txpk7f
 /Ww92EF4VV9gyFLxMUBi1Pu+tqtM0Zuvgj54oTYISvEdT7SWexx5eoE18bUREOO8Ut4/
 dpy2jNi6Zs5OAJ2jg2B5/jVavFjpgbGGFDMtgVQfxlOn4OZ46YLfcubynKK+fiyKtKMX
 6XmKXdAb0Kq2cSQlOLZffR0G7FMAYYqw9SmQo8XOXtLki2FBpSLoot8FGPCUAZ0QWhBe
 Z8ug==
X-Gm-Message-State: AOAM532caB37nLqth3gxHg2hRTZXM0qXcc0AzGy2CoNXwcKqB5ZFwghe
 F7avAzrqqNG2OI4kYt4io6o=
X-Google-Smtp-Source: ABdhPJz7SiTWwM1H+y+TuRStbc/VlWAwhfC2TW8BWRBWGehkS9emEkYvDVPTtYW7cM/ER4AfOJWU/Q==
X-Received: by 2002:a2e:a4c6:: with SMTP id p6mr6750783ljm.20.1643061746303;
 Mon, 24 Jan 2022 14:02:26 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id m21sm101912ljh.137.2022.01.24.14.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 14:02:25 -0800 (PST)
Message-ID: <a823e730-853d-901b-1b9f-937e1ec76444@gmail.com>
Date: Mon, 24 Jan 2022 23:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: partitions: Document new
 dynamic-partitions node
To: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220120202615.28076-1-ansuelsmth@gmail.com>
 <20220120202615.28076-2-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220120202615.28076-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_140228_358575_A08B4674 
X-CRM114-Status: GOOD (  25.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 20.01.2022 21:26, Ansuel Smith wrote:
> Document new dynamic-partitions node used to provide an of node for
> partition registred at runtime by parsers. This is required for nvmem
> system to declare and detect nvmem-cells.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   .../mtd/partitions/dynamic-partitions.yaml    | 59 +++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> new file mode 100644
> index 000000000000..7528e49f2d7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/dynamic-partitions.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dynamic partitions
> +
> +description: |
> +  This binding can be used on platforms which have partitions registered at
> +  runtime by parsers or partition table present on the flash. Example are
> +  partitions declared from smem parser or cmdlinepart. This will create an
> +  of node for these dynamic partition where systems like Nvmem can get a
> +  reference to register nvmem-cells.
> +
> +  The partition table should be a node named "dynamic-partitions".
> +  Partitions are then defined as subnodes. Only the label is required
> +  as any other data will be taken from the parser.
> +
> +maintainers:
> +  - Ansuel Smith <ansuelsmth@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: dynamic-partitions
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: "partition.yaml#"
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    partitions {
> +        compatible = "qcom,smem";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +    };
> +
> +    dynamic-partitions {
> +      compatible = "dynamic-partitions";
> +
> +      art: art {
> +        label = "0:art";
> +        read-only;
> +        compatible = "nvmem-cells";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        macaddr_art_0: macaddr@0 {
> +          reg = <0x0 0x6>;
> +        };
> +
> +        macaddr_art_6: macaddr@6 {
> +          reg = <0x6 0x6>;
> +        };
> +      };
> +    };

First of all: I fully support such a feature. I need it for Broadom
platforms that use "brcm,bcm947xx-cfe-partitions" dynamic partitions.
In my case bootloader partition is created dynamically (it doesn't have
const offset and size). It contains NVMEM data however that needs to be
described in DT.

This binding however looks loose and confusing to me.

First of all did you really mean to use "qcom,smem"? My first guess is
you meant "qcom,smem-part".

Secondly can't we have partitions defined just as subnodes of the
partitions { ... }; node?


I think sth like below would make more sense:

partitions {
     compatible = "qcom,smem-part";

     art {
         label = "0:art";
         read-only;
         compatible = "nvmem-cells";
         #address-cells = <1>;
         #size-cells = <1>;

         macaddr_art_0: macaddr@0 {
             reg = <0x0 0x6>;
         };

         macaddr_art_6: macaddr@6 {
             reg = <0x6 0x6>;
         };
     };
};


Then I could also reuse that for something like:

partitions {
     compatible = "brcm,bcm947xx-cfe-partitions";

     partition-0 {
         compatible = "nvmem-cells";
         label = "boot";

         #address-cells = <1>;
         #size-cells = <1>;

         mac: macaddr@0 {
             reg = <0x100 0x6>;
         };
     }
};

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
