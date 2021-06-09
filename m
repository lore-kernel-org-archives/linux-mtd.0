Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE455C48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E06361354
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E06361354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BOiXl/TUpC1w/9O75Ey3DSnsscz/O9/Obhrd0SjtpiI=; b=oLwsb1Fc1FFw56Jq9PBwDl+zLc
	yBVHlhNP9D9FvMi11FjhIJHkyZB5O3Ik6Lg3GxSrl6rT1vgOo0VduCBUWCOIrDXgiqPOQlTExWmJs
	YQfnot4+/LgDtWXISpbdfMjAOezcLq8QfArtl4aOiD50qBYxKLiUba8XWtaVyfhgPRZglKKeBTKY5
	M/93zV+2e5xGRNzzBTznP7p4DbE4ql1XHEMp23vP+rejLYMY/UBN0L/ua7X3OUc/WS1SDKKIanuPI
	GyGauFjNLhgZhvrn5OFWdqyemZ9XUCp/FaC3LFoMz4UeQ2yNRqk/7euiNt2z6wAAqnw4aZV/EuXOw
	8LBm2qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqxbQ-00DmTS-FU; Wed, 09 Jun 2021 12:46:37 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqx4d-00DaqB-Rg
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 12:12:45 +0000
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqx4c-0000WO-6Q
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 12:12:42 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so851351wrq.18
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 05:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YiKsApz3Kn55IWmxBblM0+f7lrgP6BHHgzZj0LGtc3w=;
 b=rgRzHYv/xKrJtvXUVHzZt+oVW/m5zXWyVmU6aPBMqwbmxvGmBBV7OP5mFfDV/rsvWE
 ypiDMIAI15mZGolNbKadmcfLJKUFyEJEuDUjKE6UuDodweXyuNkCXvy1NiPcCi6sGItm
 jgwE2EHTWuSmXQ8Eb9WY4Mc/WGjSj4KNAPINUaP++n5JHAk/Lg2dOxGFolmh+Ph8TQCD
 xAvciG9CmIHJ7XefOYaCv14ee8SNbZ+n033/6RGPu9BLf8wlSNaR3FdS0S4KtAMTfENP
 hA/vPln2MUrRp+NyL5DVYDQt6YWNobrIvfmOuSMKzM04zx7v/PfnkwwZEfnsl3GF8om3
 A8Jw==
X-Gm-Message-State: AOAM532s6xDxKWNVLjkdDdAr1pkuvKFW9PfYQLXLl5ql99DmttFypb0b
 GZ7Sqk7esLXSzeR7YwR0WKwNymmHTs/ioduXPXImRBmzcBHie5w6wnRpwHZ9QNk8TuOKIXYFN9m
 usIn+h0/WELNTHys21f8bHew29NJYCnIq8mt4Dn4ehKc=
X-Received: by 2002:a05:600c:3ba0:: with SMTP id
 n32mr9527873wms.107.1623240761876; 
 Wed, 09 Jun 2021 05:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0euTzMB48q6sD49NwO7dbIsHtvW8un1vfWvC33GDT6eTYVH+LHuyUI/ewSE9x5zE3LT1Eig==
X-Received: by 2002:a05:600c:3ba0:: with SMTP id
 n32mr9527834wms.107.1623240761587; 
 Wed, 09 Jun 2021 05:12:41 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id o26sm10206773wms.27.2021.06.09.05.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:12:41 -0700 (PDT)
Subject: Re: [PATCH v22 09/18] dt-binding: memory: pl353-smc: Convert to yaml
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-10-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e431d594-05cd-27b8-fcbe-11c310b99cd3@canonical.com>
Date: Wed, 9 Jun 2021 14:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609080112.1753221-10-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_051243_960277_61934726 
X-CRM114-Status: GOOD (  23.59  )
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

On 09/06/2021 10:01, Miquel Raynal wrote:
> Convert this binding file to yaml schema.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../memory-controllers/arm,pl353-smc.yaml     | 133 ++++++++++++++++++
>  .../bindings/memory-controllers/pl353-smc.txt |  45 ------
>  2 files changed, 133 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> new file mode 100644
> index 000000000000..1de6f87d4986
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/arm,pl353-smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM PL353 Static Memory Controller (SMC) device-tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> +
> +description:
> +  The PL353 Static Memory Controller is a bus where you can connect two kinds
> +  of memory interfaces, which are NAND and memory mapped interfaces (such as
> +  SRAM or NOR).
> +
> +# We need a select here so we don't match all nodes with 'arm,primecell'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - arm,pl353-smc-r2p1

That's a const... but also I don't get the need for select.

> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^memory-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - arm,pl353-smc-r2p1
> +          - enum:
> +              - arm,primecell

This looks unusual. Basically you change the bindings, because before
they required "arm,pl353-smc-r2p1", "arm,primecell".

Don't you want here items:
 - const: ...
 - const: ...
?

> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  reg:
> +    items:
> +      - description: configuration registers for the host and sub-controllers

Just maxItems. Description is obvious.

> +
> +  clocks:
> +    items:
> +      - description: the clock for the memory device bus
> +      - description: the main clock of the controller

Isn't apb_pclk the bus clock (so second item below)?

> +
> +  clock-names:
> +    items:
> +      - const: memclk
> +      - const: apb_pclk


> +
> +  ranges:
> +    minItems: 1
> +    maxItems: 3
> +    description: |
> +      Memory bus areas for interacting with the devices. Reflects
> +      the memory layout with four integer values following:
> +      <cs-number> 0 <offset> <size>
> +    items:
> +      - description: NAND bank 0
> +      - description: NOR/SRAM bank 0
> +      - description: NOR/SRAM bank 1
> +
> +  interrupts: true
> +
> +patternProperties:
> +  ".*@[0-9]+,[0-9]+$":

Match with start ^. I think you cannot have 9 nodes and hex can appear
in address so maybe:
"^.*@[0-3],[a-f0-9]+$":


> +    type: object
> +    description: |
> +      The child device node represents the controller connected to the SMC
> +      bus. The controller can be a NAND controller or a pair of any memory
> +      mapped controllers such as NOR and SRAM controllers.
> +

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
