Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A64DC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 21:53:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82E123406
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 21:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82E123406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OCLwRlpYe5dAYGXeCNA6+oBYg7L9/5IlZ8YsAiTm3ME=; b=D0FG+BX7b6jXl4fUaM3xzTOei
	isLVD6y5Mr9EFQ04CclQuTTKcO7ZNB8bqJcDr4kD6S8bjlLlCp/ttoKVUswswlbejVfNeM09n/4dR
	MFwVFiwikqij/NsvZLLtByLpt1bjtdF3MJHiNiBjhBz+Oh1ZNN9o3dhbRgiOJFqTSxbrW5rCsg5yn
	uzCoEGs/hB7PHjW4pJ6cyuL+o4fCeufdXtqtJ9VLdrR9RrCnWxOqp4QzpQ7SrzhycsFMRPbAGiVEX
	nsyAsi/pSsKhMBqitbfzvluF5lSLgzRNGMv14tprd1mE2K92Zarkngg++wozQxztzz+3hkVBaf3so
	h90ubhCCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmOQz-0008WM-KV; Mon, 07 Dec 2020 21:52:41 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmOQw-0008Vi-Fw
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 21:52:39 +0000
Received: by mail-oi1-f195.google.com with SMTP id o25so17180585oie.5
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2020 13:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BF1tW52ALryUZKid8lBVkGB4okYZtkPfb/JX9FH4Smo=;
 b=VKcVhiFreH/G14/LxAaVAEtNVleC8VRkUN9Dapf33qX3U3D2lE+AUcMci61bzT/67m
 oq5SmvmcnebnjQjYkWJ7FSreIZu80RAzshIWASL3EmX4zVj/l44alSEA1eCFdJmhHoea
 tRHXmgNzqJr6sTpB85O3nzp1ICOWK+T5Qfk98uqedptvwJqdWu2gq1AxO/Y9Biw7pehB
 ARBw0lPgeh4LtP19YmaXuUMgdbQWGripmOHrfPjKGGz7XNlm0Wp2sXq9V7cYf6xnns3c
 MCH5wjBIpQaanUcCdZico1Bem4Nqbv4Q1Q540CRUlDqsKIosHBEM6ATqRNCpKbZwFitc
 6SVw==
X-Gm-Message-State: AOAM530epNdffMMRUplvm5NV1rRA9LEbYWXy4wQ6cLsrQI3vD0f+RY/v
 c+7hOQB9pe1Nb+uz04c45g==
X-Google-Smtp-Source: ABdhPJzBabPROxUsAAgxBwNPRqzXMt8tXAiikj8ao9VyU4y4TZD60k59EMloR0FVVTnixBGqZFonog==
X-Received: by 2002:aca:cf4a:: with SMTP id f71mr627363oig.157.1607377957848; 
 Mon, 07 Dec 2020 13:52:37 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f10sm2605122oti.11.2020.12.07.13.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:52:37 -0800 (PST)
Received: (nullmailer pid 896927 invoked by uid 1000);
 Mon, 07 Dec 2020 21:52:36 -0000
Date: Mon, 7 Dec 2020 15:52:36 -0600
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: partitions: Add binding for
 Qcom SMEM parser
Message-ID: <20201207215236.GB892840@robh.at.kernel.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_165238_563263_57A5A550 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 12:43:05PM +0530, Manivannan Sadhasivam wrote:
> Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
> parser.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> new file mode 100644
> index 000000000000..cf3f8c1e035d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SMEM NAND flash partition parser binding
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description: |
> +  The Qualcomm SoCs supporting the NAND controller interface features a Shared
> +  Memory (SMEM) based partition table scheme. The maximum partitions supported
> +  varies between partition table revisions. V3 supports maximum 16 partitions
> +  and V4 supports 48 partitions.

V3 vs. V4 (and any other version for that matter) is discoverable?

> +
> +properties:
> +  compatible:
> +    const: qcom,smem-part
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    flash {
> +        partitions {
> +            compatible = "qcom,smem-part";
> +        };
> +    };
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
