Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BEBC7EE2A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 22:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qVeSu1QB9KpQEJxg1wewNyUZtoXRSBHvR3f3mPEacg=; b=nA4GVfqvXiobEB
	uN+aBX1AFf7ojB13padPKqsAeUrF3F2DwQMvzWnvxJNbQDNkny5nCCHbfWdTJhBcgOmYvITVfo1Io
	oukSwdAnnb3xg/rhpemPN/ZB8PQ2lUcxHn0JaY0muOk+X9o6nLu9QQY+fJb/lFmXuOK7Pnf0Y762n
	KeOQf51WmPqeVnoPEfy06e4Ex/0g8T4oOcgFTaIDLLJhco5bvr/bZ0fvxadH0SUngFbgBYV7jSYsN
	1UX8BoUIayx3lIJm9Np44smoFtv1pFQ9pr6zHX00r3W+a2OexaC9Pa9OdmJjs8LHH0O914xNxh3TU
	SyPU1Re0G8UkcSHZz41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UY9-001N38-08;
	Wed, 31 May 2023 22:44:13 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4UXo-001MlS-0g
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 22:43:58 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2042C2C00B8;
	Thu,  1 Jun 2023 10:43:47 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685573027;
	bh=ODkHDBMzn3prvfeednZ/XfpWu2daBvR6MQnbPOCcr9Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=m2pTps4d+e2qfepLh2vl/T6OZJpinYryQEo/owcll1jTrz95zdySPydmgyeWzIBF0
	 dZlPkQLx2B+k6q1JV2HE9wP3MtyebYyCSmnk+YQwQhPBwXAD+YJtPjoBsPApxIcaaO
	 isociIMkS01q+mpdxR0GBvf4tsKFnIJUfOBwbk2HA75NvG8s2oO5NHt63Xk+SE8YbQ
	 263qyk6KjhCY/TnGjxWMRX90L6QPvz7TOVsCTIrIKA7QuLfrsQw1qkd2DPtm/PS+rG
	 uMUTgOANVUMBuwBFVqQQkM3XKFG1VzvdPeQNf4r5PcbQ+dVQowfpyH/USpRg10G3CV
	 G+uz3E0dWqbHw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6477cda20000>; Thu, 01 Jun 2023 10:43:47 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 10:43:46 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Thu, 1 Jun 2023 10:43:46 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "enachman@marvell.com"
	<enachman@marvell.com>, Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v7 3/4] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Thread-Topic: [PATCH v7 3/4] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Thread-Index: AQHZk1IoMAbW60jvr0qoP82+zj4DOK90MugA
Date: Wed, 31 May 2023 22:43:46 +0000
Message-ID: <40bb4ad8-2bec-4eae-d0c8-c9aa31e03f32@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
 <20230530235456.1009082-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20230530235456.1009082-4-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <6D81B5783BFD2D41A00284EF5D509ECE@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Score: -1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_154352_733909_9191E9BF 
X-CRM114-Status: GOOD (  15.23  )
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

Hi Miquel,

On 31/05/23 11:54, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
>
> Switch the DT binding to a YAML schema to enable the DT validation.
>
> Dropped deprecated compatibles and properties described in txt file.
>
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
<snip>
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> new file mode 100644
> index 000000000000..7cd4a2e99343
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/marvell,nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell NAND Flash Controller (NFC)
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: marvell,armada-8k-nand-controller
> +          - const: marvell,armada370-nand-controller

On this specific point. Was your intention to allow just the 
"marvell,armada-8k-nand-controller" compatible?

I made it a list as the existing usage is `compatible = 
"marvell,armada-8k-nand-controller", 
"marvell,armada370-nand-controller";` but an earlier comment you made 
suggested that your intention was to allow just the 8k compatible on 
it's own. Looking at the driver it doesn't do any is_compatible() checks 
so I don't think it cares (currently).

> +      - enum:
> +          - marvell,armada370-nand-controller
> +          - marvell,pxa3xx-nand-controller
> +          - marvell,armada-8k-nand
> +          - marvell,armada370-nand
> +          - marvell,pxa3xx-nand
> +
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
