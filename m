Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCF3C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:57:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDA364FD6
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EDA364FD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=apv84sGxgfAN3nGBdUbJ7/lbZ2e3xW3MT/IU8JLRzr8=; b=YgDRZJIbKSdo+8qIdIF+3zoGm
	e0PQPX7FLDmmqCNidbHiSLSB16XVJYpi+RTIGLdluO7L+kvAG/hLAOdGfrXk049uWznsaFRGEx5SG
	Gj1yZnWt7CQwcR2/HwaWH3vrLaZuuq82J1D3NVVGwtmKzwBhojfY+IBQKg16iKqx7udOAn6kqya4T
	zhUhc6d9ytA/6lucJ4bJA5I9+tlTwByoduFoipF/nzqQnPhX09FM4KAQ+gglxwvjAnGV6arlXBCqP
	lmJQglpdyonZsfRB+GWsRaZIZda/VJvj/LfWoqhimVobUgFeiup7qmOmLy9yRNGnX/iCMsN0mY0Vz
	D6u5DcyuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKPYM-009mMF-2b; Thu, 11 Mar 2021 17:56:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKPYI-009mLh-7k
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 17:56:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id y16so3060436wrw.3
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 09:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5Zk3zgGqTX1e9ZGhYNvo16p2qHC5ENH2WzO7ak0uUDo=;
 b=V6m1Xq1O2QNWYiFlp+5jGaiC0fFnE+i9xD9PtKvExrnwD87oX1OJn/i1JTp9CZReAV
 IvL7rh1GKdl8eeS621o1OomOGXBeKtXZJfk/nraxPcGLrQ4Ses8hr1Kn48RUzQ14GyQ6
 SpEQbAJgTOekgl8FkiG3axkwtncDCDdqVyNKVrf8OjSc7tgCSH8XhcFv0XPOcv2nuhsF
 NDfeE/whtlQ7Mmoe6vDE14aatS3/CZkle2aKsbT84uUvlI7VNY00rLR30/LV1SrIB3ns
 Ilo65Jd8Nx0qVWLcx5CVkkiopDFg7mZIt7QohIEmVEA4uOua11nAJrcwguADdfzt7OGf
 DufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5Zk3zgGqTX1e9ZGhYNvo16p2qHC5ENH2WzO7ak0uUDo=;
 b=nvGJWtuQGva/UsFKjuJWk2iiROfkXJFyUWZDDnDO+nagoI8P+0SZ8OD++prRlUWr2c
 GVYliodeeViPQpuERoaLDuK0UM+qOKRjNTt/jmlpAQ+549OA2CiPPxB/XaujQFlmj7cc
 j+ZtINMJ786P+AyZKHdDwet9QwoEruFeDDmK6dAJPsQX5v3PlSMacU15B4s/8pzzz4OZ
 JnAsItzYfk7b4CeTZrE0ZgAcg8Ke1AxIb8GfrTrGRQ8O4xlZjHXzuJ3aPljcyfai35wN
 9vJpl4YhtvZaTLKI/H4btXNyYxVbMHI8eO0SQrwzcivUGjO4dNxkCmmWgSwdOF28wUCl
 gQnA==
X-Gm-Message-State: AOAM531BhwzDkZS/V4tivFw6JR47sxtZlrCe1F7oLkY7DEEojF681SdO
 Ek62sk+OAmA/Cug1cN+gc/9StocpwCk=
X-Google-Smtp-Source: ABdhPJxzDDlgHSqQ446a5JHiZM0Gr3mIEa+SY6AlUpvbpESKEjmOaPIFAW5hF02zGLDL40wcGacWIA==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr10004926wrg.362.1615485408720; 
 Thu, 11 Mar 2021 09:56:48 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.gmail.com with ESMTPSA id v18sm5676827wrf.41.2021.03.11.09.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:56:48 -0800 (PST)
Date: Thu, 11 Mar 2021 11:50:25 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Message-ID: <YEn18b9m5mHX8eO7@Ansuel-xps.localdomain>
References: <20210311051309.16789-1-ansuelsmth@gmail.com>
 <20210311051309.16789-2-ansuelsmth@gmail.com>
 <20210311173221.GB866234@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311173221.GB866234@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_175650_388245_1F235CE5 
X-CRM114-Status: GOOD (  20.37  )
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

On Thu, Mar 11, 2021 at 10:32:21AM -0700, Rob Herring wrote:
> On Thu, Mar 11, 2021 at 06:12:48AM +0100, Ansuel Smith wrote:
> > Document nvmem-cells compatible used to treat mtd partitions as a
> > nvmem provider.
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> > new file mode 100644
> > index 000000000000..b53faf87d4e4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvmem cells
> > +
> > +description: |
> > +  Any partition containing the compatible "nvmem-cells" will register as a
> > +  nvmem provider.
> > +  Each direct subnodes represents a nvmem cell following the nvmem binding.
> > +  Nvmem binding to declare nvmem-cells can be found in:
> > +  Documentation/devicetree/bindings/nvmem/nvmem.yaml
> > +
> > +maintainers:
> > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > +
> > +allOf:
> > +  - $ref: "../../nvmem/nvmem.yaml#"
> 
> I'd rather have the 'absolute' path:
> 
> /schemas/nvmem/nvmem.yaml
> 
> Otherwise,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
>

Should I send a v7?

> > +
> > +properties:
> > +  compatible:
> > +    const: nvmem-cells
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    partitions {
> > +      compatible = "fixed-partitions";
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +
> > +      /* ... */
> > +
> > +      };
> > +      art: art@1200000 {
> > +        compatible = "nvmem-cells";
> > +        reg = <0x1200000 0x0140000>;
> > +        label = "art";
> > +        read-only;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        macaddr_gmac1: macaddr_gmac1@0 {
> > +          reg = <0x0 0x6>;
> > +        };
> > +
> > +        macaddr_gmac2: macaddr_gmac2@6 {
> > +          reg = <0x6 0x6>;
> > +        };
> > +
> > +        pre_cal_24g: pre_cal_24g@1000 {
> > +          reg = <0x1000 0x2f20>;
> > +        };
> > +
> > +        pre_cal_5g: pre_cal_5g@5000{
> > +          reg = <0x5000 0x2f20>;
> > +        };
> > +      };
> > +  - |
> > +    partitions {
> > +        compatible = "fixed-partitions";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        partition@0 {
> > +            label = "bootloader";
> > +            reg = <0x000000 0x100000>;
> > +            read-only;
> > +        };
> > +
> > +        firmware@100000 {
> > +            compatible = "brcm,trx";
> > +            label = "firmware";
> > +            reg = <0x100000 0xe00000>;
> > +        };
> > +
> > +        calibration@f00000 {
> > +            compatible = "nvmem-cells";
> > +            label = "calibration";
> > +            reg = <0xf00000 0x100000>;
> > +            ranges = <0 0xf00000 0x100000>;
> > +            #address-cells = <1>;
> > +            #size-cells = <1>;
> > +
> > +            wifi0@0 {
> > +                reg = <0x000000 0x080000>;
> > +            };
> > +
> > +            wifi1@80000 {
> > +                reg = <0x080000 0x080000>;
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.30.0
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
