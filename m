Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0C7C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 20:57:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F84A61028
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 20:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F84A61028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTYX+8fqUCc+ve50F/Grsogfbc90DUFhuv+FAvvSuks=; b=Ku8DNDgKZCvIZsFMiWCsqRaiVs
	kzgCcRdenjptjJSOUfYJmt+2pzSZU58BSGqkIqahaIlTm7VbZSRS1s3t6pANd34B5QQkoW1UwIONq
	DFawVi1cm7/TfoQ8Fk5zojtTTojuSyTr+CysB0Tex1owSPxAQzJCKX3ezsm9H+BOYFXWkzM4pmpbF
	7OSw30JDG4AtuYHFrDSk4rXI4qAVFAAxDVwc/hTIyEIpGPKncUHjNyrgCqhJReg0LNPQtOSV0wk3A
	1InjXI+oQhm91TxRc703Y53o7022Jtek3RQgX5ddcb2LE7BPzVsNgnz1jLRhxTxyMTiT6tAY17Ydj
	cepPnGNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljpiW-002idD-NO; Thu, 20 May 2021 20:56:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljpiS-002id4-L9
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 20:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l4I9W+oQyUB0gGtJVJXQlMSy/Pup9jiF/aG4pznxFn0=; b=FTVvFevQBX/9t2FWyw14MaqpV6
 Pjk0mWulvXkZ8K1TfR2Et/c9cb+7aDvMdhOmdHbmMf8Ox2urWHjHAfry6RZNiCVgfN4fG6tfgWtIO
 SPXQlDxs+qgfZlxpxoBFs393ua9bLwzxX+ZHGo46v8C3G2nDN5k+iLM3Dbqb/WAAoC3jF9fmmkmGv
 8QnPO4EOqTH93K4VnbZbiRvpSCzdDhg+dTWod1P/tfbz9OkmkAUktgp6lZLsLK372T7Xo8W5ejrZH
 +SbyXRFff1hVgONhZ10XgZwKBBA9aowChMDgi2j+SljNudps/Ti852hAhLUGTy/gQBUe0D/TbOEJS
 HmBzV+bg==;
Received: from mail-oo1-f54.google.com ([209.85.161.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljpiP-00Gf2E-Qu
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 20:56:23 +0000
Received: by mail-oo1-f54.google.com with SMTP id
 q17-20020a4a33110000b029020ebab0e615so2171562ooq.8
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 13:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l4I9W+oQyUB0gGtJVJXQlMSy/Pup9jiF/aG4pznxFn0=;
 b=LggSsyNf1o1mkn7rj8rZdoKFKcZszvTuUCkhhHs2Zl5YWcmFFI7ZVxS1S4O9gBXmYx
 aoqOoLnK0PCxvC6Ow+ABRs6hUZJwbyYTyNDgH1PeBZZjX2MiLLwI3LWdmIwHFl4Bf8b2
 46n8lIrGBXtEg3qNuEk7OKh+dyXlaFTy+7tSbIqkK67CKJnMVkmv+R1ICdtcju7Ypikw
 JoDDc81Pj0PkV6cnDIWuI1m/h3ougNblXii3tca2/dvLOKYGHBebsCsU0eUM56HIYCqf
 sOIQYERB74NZL++BSvx/2xeNrrKw9fA+VG1NDC/BWVkk0WX7+6OaYKEST9sudtU5a0ZH
 Znhw==
X-Gm-Message-State: AOAM533LYxvYqy8Tqb6u+1UxCk1sxXISUafpSafWWnopRkM+4bJsxgPT
 F0U6gioVU5/kw9YM6O1Tqg==
X-Google-Smtp-Source: ABdhPJyyMEBBBaasIm9Wg/4whAtyNFr7C3CLW9p5Ga2XlkhiT1kUH75c2bv8f8zbQmLoBfL/v4dEsQ==
X-Received: by 2002:a4a:b301:: with SMTP id m1mr3620456ooo.7.1621544180334;
 Thu, 20 May 2021 13:56:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u13sm763117oop.40.2021.05.20.13.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 13:56:19 -0700 (PDT)
Received: (nullmailer pid 1949863 invoked by uid 1000);
 Thu, 20 May 2021 20:56:18 -0000
Date: Thu, 20 May 2021 15:56:18 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Helmut Grohne <helmut.grohne@intenta.de>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v20 18/19] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Message-ID: <20210520205618.GA1900624@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-19-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-19-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_135621_894259_174BB4E2 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, May 19, 2021 at 08:26:35PM +0200, Miquel Raynal wrote:
> Add a yaml description of this NAND controller which is described as a
> subnode of the SMC bus.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> new file mode 100644
> index 000000000000..609726ed72de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> @@ -0,0 +1,45 @@
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
> +          - arm,pl353-nand-r2p1
> +
> +  reg:
> +    items:
> +      - items:
> +        - description: CS with regard to the parent ranges property
> +        - description: Offset of the memory region requested by the device
> +        - description: Length of the memory region requested by the device
> +
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    nand0: nand-controller@0,0 {
> +      compatible = "arm,pl353-nand-r2p1";
> +      reg = <0 0 0x1000000>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +    };
> -- 
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
