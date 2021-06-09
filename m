Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468F4C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:35:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 106A361364
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 106A361364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P0UCz++N2HfnQh7y71xH91GZJ2+i070yDJ9m6Uw8kfo=; b=oRR3szYHoda1JzzxezaCsXSMcF
	pzsXs5Aa3yvijRMc3305sPHLAxqQFXE+XMBCSHmShy5WIdd7juZkwksG0DfrUxoukuQ7ZAKOCESt6
	L0vAemv6sa0u+NBgPos1KG1dRS1UJuvuHbogixtEVloKvd+XNZ9Eu20oGc+PzEFF8YQi2Vwnor9IJ
	iBnftX1z6BY7aHLCHBcUxy6pxB4Q6ELehbHGSQuUGw7RrWUZPHxrWkBVRkzUHQwZ6w55YqFcCvAbt
	dNlu0hXI+QgcyuGYVTCn95/R7Y8HaFcniGKfQJDvGaepPVd/r5FnQy3rpMir1Seev47Ckkpd/JX0Z
	e0Ymo/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqxQ0-00Dihg-PS; Wed, 09 Jun 2021 12:34:49 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwtV-00DWEm-J1
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 12:01:15 +0000
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqwtT-0007mV-Mr
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 12:01:11 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so10646917wrd.7
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 05:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BnDNmk6xWB97FCQncGvxFKPZvRlOM5eWdMh+QD8JdRI=;
 b=FgXo7yxpmp5+dUPg2C/MRzEI7nGLHp1DEsBvPHBP4UkdsqfsH7QXtj/9KYmmS8I9FV
 OCZbppUm1Dgkmnov18XoPr/7EZ2xptVXQGbGJQpxtfdf6WQszNURf6GRKohMVpKBeMFl
 wHZyQ4qRYjI2FVNlQuG159A1nmgqiFDNKkEwG7OfLkyRpYV5WypfnFKRxs2Y9liQb39+
 Bq7DLgM7SBKGqZSiiV99NF9kPEsv8LjktH5pXBircsjAta3zVAbw7q0dOI402a8DOUTi
 /NKoCH6wcH3T/26k/pUXUwb068UtXQXytsFDcEgpCyIc4DbdQhgTT2ssqK5wDWgW5LpM
 hUPg==
X-Gm-Message-State: AOAM53252Dbzzs6kUY61mI+Pouts9bNg1N+0hOay1Hrce0GU9jqAuf5u
 66YINylD/x81uhWTLmcco2xDe06e0u3eEMJP6qQLcV8Cp/5PlfJXDvccmDicAqcwdOd1svTPzvk
 4yUVbxtB7bZ8QxZxhG3vSFtosKg3aMrGKJF75XW5FPt8=
X-Received: by 2002:a05:6000:1365:: with SMTP id
 q5mr8321946wrz.53.1623240071432; 
 Wed, 09 Jun 2021 05:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6QyzCjtadEKIFXtnlzXU2KdyF5rTVINfJlSQDUQHpJX/5LfLWsneFagASOptLJGfnUSn5Pg==
X-Received: by 2002:a05:6000:1365:: with SMTP id
 q5mr8321906wrz.53.1623240071182; 
 Wed, 09 Jun 2021 05:01:11 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id m22sm5703554wmq.21.2021.06.09.05.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:01:10 -0700 (PDT)
Subject: Re: [PATCH v22 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
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
 <20210609080112.1753221-18-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <57ef16cd-33e7-6c16-3a24-9634f47831b3@canonical.com>
Date: Wed, 9 Jun 2021 14:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609080112.1753221-18-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_050113_692117_AE89FD9A 
X-CRM114-Status: GOOD (  17.36  )
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
> Add a yaml description of this NAND controller which is described as a
> subnode of the SMC bus.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> new file mode 100644
> index 000000000000..e72fa14b4385
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/arm,pl353-nand-r2p1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PL353 NAND Controller device tree bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:

That's not an enum, but simple const without items.

> +          - arm,pl353-nand-r2p1
> +
> +  reg:
> +    items:
> +      - items:
> +          - description: CS with regard to the parent ranges property
> +          - description: Offset of the memory region requested by the device
> +          - description: Length of the memory region requested by the device

Doesn't it depend on parent's address/size cells?

> +
> +  "#address-cells": true
> +  "#size-cells": true

These should come from nand-controller.yaml

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
