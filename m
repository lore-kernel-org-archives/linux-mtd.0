Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FD3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Jul 2022 19:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfUl8R0+JEdR/vjCa+TiFOMwAkmEp/nW47qjk2oZs2w=; b=0eCbbW2CF1sS2/
	b6tqH2VCJwgKw7Z4QjuR6mJGaU6ORopiYk1nau+As3HjUhxI1TXqCXvNU3/r145xj7RNQ55vXEhyt
	/VS4tQwFBarFICpvdPIw0DXVQQGL5OT9gV4o1HPRl6G+blqS7C41PEbM5EYcoLZ/+NT1tLQre39Sg
	1xB26eGlMyJEipUwIN5eDcxWPYitr3iazeLuh26j19070FSxuhwj6L681FXEUak4pKj8UfgiltUlP
	Qpo9LOhuReTDr/yNZQ27paQp8010iwFyJcYW8rJuTShVM5Ts1Z4x6UPLH0d23rTNjA4jOoC5RW6Am
	hv+bF67HCF+4ZzpDgJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Mco-006gku-Vk; Fri, 01 Jul 2022 19:48:23 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Mcm-006gih-95
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2022 19:48:21 +0000
Received: by mail-io1-f48.google.com with SMTP id z191so3229990iof.6
        for <linux-mtd@lists.infradead.org>; Fri, 01 Jul 2022 12:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FvaQQWjHYOEcRrLtlLyreRaclOOr6cqwHamUJzc2xGk=;
        b=FM0yZXpFkqwxWvFF39N3CcybiAaGRFmFUomssYzlkVpQM4QgJjC6v7ryi4xLZJf8dX
         Q7B5GwdsSstkjTl91/H1/hnRANiHU21i2zgxLzsKneojgfN4kFLZ50Y2i73ojgn5Gnbu
         BUgxolxBGt1/uC+Id7tODokRFi4+ZB1YN6N/JbNtQ2I99tBKd3GzjmZDQiCIoBA1pe/X
         vqZpKElQXgBenDwUupoep3Mp/0gOvCgEN6VPPQbUOTVvC3l3ojcZQTB0gzwR7JZtXoP4
         ECdFDKjbkreS3ZbDChL/ckAtKVTFlVPqbjfLLpmO54qF0NQIosQK5bKUIf2y3Q5TP2BO
         HbmQ==
X-Gm-Message-State: AJIora+pi9I6wniyFWtzvlfHx5IPKQJ0KowoPa5dszjmf12Tv4T/UElR
	AMw79p13ksHXtG6Fj81xHReQz7W8GQ==
X-Google-Smtp-Source: AGRyM1u+m/9bEbKmZiLyDoKSlGtY2Ou9knWrqcAFjOUqiJ14gO9HioztwuaIaq74jb8/BYmTmYBb9w==
X-Received: by 2002:a05:6638:2191:b0:33e:9c94:69ed with SMTP id s17-20020a056638219100b0033e9c9469edmr3177346jaj.80.1656704895070;
        Fri, 01 Jul 2022 12:48:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o18-20020a02cc32000000b00339df371fb4sm2924149jap.123.2022.07.01.12.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 12:48:14 -0700 (PDT)
Received: (nullmailer pid 1401994 invoked by uid 1000);
	Fri, 01 Jul 2022 19:48:13 -0000
Date: Fri, 1 Jul 2022 13:48:13 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tlanger@maxlinear.com, rtanwar@maxlinear.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v2 1/8] dt-bindings: mtd: intel: lgm-nand: Fix compatible
 string
Message-ID: <20220701194813.GA1399013-robh@kernel.org>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
 <20220629213508.1989600-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629213508.1989600-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_124820_357138_7576467D 
X-CRM114-Status: GOOD (  18.10  )
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

On Wed, Jun 29, 2022 at 11:35:01PM +0200, Martin Blumenstingl wrote:
> The driver which was added at the same time as the dt-bindings uses the
> compatible string "intel,lgm-ebunand". Use the same compatible string
> also in the dt-bindings.
> 
> Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> index 30e0c66ab0eb..c45dd87fb5fd 100644
> --- a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml

The fix for the $id was to also rename the file.

> @@ -14,7 +14,7 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: intel,lgm-nand
> +    const: intel,lgm-ebunand
>  
>    reg:
>      maxItems: 6
> @@ -75,7 +75,7 @@ additionalProperties: false
>  examples:
>    - |
>      nand-controller@e0f00000 {
> -      compatible = "intel,lgm-nand";
> +      compatible = "intel,lgm-ebunand";
>        reg = <0xe0f00000 0x100>,
>              <0xe1000000 0x300>,
>              <0xe1400000 0x8000>,
> -- 
> 2.37.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
