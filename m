Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C11C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 09:16:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44B5E61406
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 09:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44B5E61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dqsN02i7Z1VAbteILhuWZQKgyVQjQYUayzyfcJiqJhM=; b=DvSbguItmyvAUmaEz9qR375Giu
	eXtIoNeL+vRNbAJK/n+U0yJLysZiPjMAqeptrySuV2um97DLBxwTx9JOrnv1/GlNRkrxmBaU2ru7o
	Pmt3NdUoVW86thC84lwxGEVGrGiRFPspPKjJB0ZEGarUT5pnel/6xL1vnBXRkBSL6rVCD3Tn2FaLY
	t7zYrrO3xqSp0yvlh0XYsjo7RN1g1yUX4qc8vxwaTZVAg9lY7lbxVJky05MMV7B8x0FtUvNiewOke
	QqulEBl+R52J70ydb6jFOkXhxhvWa3LPI0bJsKUygHZ1cUlDmHJaMQ00fR6aC3TWm8xM6/0GMJ6i8
	OsIkKnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrGmg-0008g1-Gb; Thu, 10 Jun 2021 09:15:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrGMO-00Hanc-Ky
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 08:48:22 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrGMM-0007vV-6c
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 08:48:18 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso572069wrf.4
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2021 01:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YCThDjpaFHnd9q5rWUaETkYePP9lVv23un9cpBMG23U=;
 b=rH/LvJ+BUQlD6cK9+AllnQXvi32ZGY/2pO7RdhJq+aK3w98fZtyLOawQ4ax1EB1QBt
 o6IhQE0hNhKeLLJ8wSAote7sjAI9P0jF9TP5amZdRHr4qdnZMa21+5ShEXZpcD6HSZE0
 zaSPdmu1NCS+gMLEQKwfuv1ayahw/rEMXRAOOIcRgDYfJ+jUZY3UQFuyqI32nXLZrPJF
 AfbHhTocbYESq3gPrcSNI0ZpfFIELmkF0bqL3cwZLyMbcVAMfiY89mIMHLWAjFYsX4Z3
 xq/7NuOiTVQrnSdE4WVGYOgL5bnWzZbqLhHBmkmHsIVWkTfpwZZuPN8tdrsaVyoZ4TB3
 E1UA==
X-Gm-Message-State: AOAM533TA/CzFDdsKvGH4Qd8i3XiO2vRjQP/wuJ1olOhCXPdxsRkwAA4
 RlvScqDHMFXDLXGkTkmqB9StTtwwKS4xm8sKaFbd+c7pF9b0VJhi4tqiiWBb3+gE1FtCJgSTKMZ
 Y72HE7HWtZAics63ecvv6l0UH5iaY92shI2WJ7AmTf64=
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr4101187wru.77.1623314897978;
 Thu, 10 Jun 2021 01:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnI69OSD3AX6rHDEwFixaiCIwaEQAjUyh8avsvzpR/BP415Z0ipn+qaT3Xcoa9ZnIkST0Cww==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr4101169wru.77.1623314897855;
 Thu, 10 Jun 2021 01:48:17 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id d131sm8758029wmd.4.2021.06.10.01.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 01:48:17 -0700 (PDT)
Subject: Re: [PATCH v23 17/18] dt-bindings: mtd: pl353-nand: Describe this
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
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-18-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ce97c460-14eb-a758-31f6-124585e733f1@canonical.com>
Date: Thu, 10 Jun 2021 10:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610082040.2075611-18-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_014820_768615_F7110B94 
X-CRM114-Status: GOOD (  15.98  )
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

On 10/06/2021 10:20, Miquel Raynal wrote:
> Add a yaml description of this NAND controller which is described as a
> subnode of the SMC bus.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> new file mode 100644
> index 000000000000..5f126bb9b202
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> @@ -0,0 +1,53 @@
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

I think you can skip the "items" here and leave only "const: foo".

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
