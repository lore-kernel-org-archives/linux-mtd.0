Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1066ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMMtsIxgEGA+TVNu5Oua5YzUK5OOKk7GnYOPJYeVphI=; b=HhNEOs0dYX1yJh
	lJjnURPUz56makq3ir+1NcKpLdTCIsUoxr+nH6W/xjEFnLFSkA7qZYaofr7JlazMS5E8UtAY4eP5e
	c9ogiprYHzy1amNwgm28lhXXzM47qzb2WN4o3MpTiZ0nNaG5uTkkCYL9gdNiuUBl3blKzDnnVKKd6
	wNR0+tTvUYjvYrCL8IE9qRHgxVA/0E+KCxQHXDI/QjKacRUzFnt7G0RfZzPTeQKUcDLwa2hZzd5yA
	bR1eHbcZk/h0awY/OkGXVgp6QJT9X6jw6dCL9k0kMlYd7O4h4NwLy4MkjUuP7wCZs7gQuHu2V9s5Q
	RYoly9rUqUntCoV901Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opc2t-00FQ9a-96; Mon, 31 Oct 2022 21:10:11 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opc2q-00FQ62-EO; Mon, 31 Oct 2022 21:10:09 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13ba9a4430cso14818988fac.11;
        Mon, 31 Oct 2022 14:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byO+eVFbmi2JQ5E3MJb1RGvLIDktwgzVitZO6ouN7wo=;
        b=aZjQmmX7kjkh6SZbISj/C2abIAOphXxm85KHR4lgb4ZGCUpBNcFl2gF5yWQtpGWWz4
         yfMg5XOYkC7rE6D9jXho69PNJ+Tb0oEgU3WAyVPYHTh3RhJOZLZ6tT7aQfb4X14bjBPN
         bfDD66IlQItQ4JQBinxnVo3AtcfJ9zNALofdcM2Ef9nVT6hmhhsplwOQz0uE2jRjxasm
         xFwPzVCuG109g1JO4vODRYu98GRIoVj6qZn3vxpr0Fs8Iro8n0kKX5+4aGQcmdVeU8PF
         Nlt8JvcJbvg9mUqhUNoNxk0L+ax7Ng/37zU14Qfk4bCMrkTk52KxMky0yj8jGbpmupQI
         OVMg==
X-Gm-Message-State: ACrzQf1KCM/LUcEIjCd0TwDJ9H6YM5UchTSPNb/l5iVP2Vz0SoD6BhLz
	TboZIv9xMka1Ocgg4lyffA==
X-Google-Smtp-Source: AMsMyM7dZOYdOCb1mto/Idcngckl/1c+JFp3aBXRCuJUrrtvUu24JUA3N2jFdQRjes/90Wb2FlzIkw==
X-Received: by 2002:a05:6870:e3d1:b0:13c:9dbb:7e95 with SMTP id y17-20020a056870e3d100b0013c9dbb7e95mr8929109oad.43.1667250607134;
        Mon, 31 Oct 2022 14:10:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r7-20020a4acb07000000b00494ed04f500sm2779419ooq.27.2022.10.31.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:10:06 -0700 (PDT)
Received: (nullmailer pid 3585087 invoked by uid 1000);
	Mon, 31 Oct 2022 21:10:08 -0000
Date: Mon, 31 Oct 2022 16:10:08 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 12/12] dt-bindings: mtd: Constrain the list of parsers
Message-ID: <20221031211008.GA3512582-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-13-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-13-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_141008_499829_A7B3DA40 
X-CRM114-Status: GOOD (  17.85  )
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

On Sat, Oct 29, 2022 at 01:59:33AM +0200, Miquel Raynal wrote:
> Parser compatibles cannot be used anywhere, and the list is limited. In
> order to constrain this list, enumerate them all under the top
> "partitions" subnode. New parsers will have to add their own compatible
> here as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index bddb7bdf441b..29db0b5c115e 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -27,13 +27,29 @@ properties:
>    partitions:
>      type: object
>      properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - fixed-partitions
> +            - arm,arm-firmware-suite
> +            - brcm,bcm4908-partitions
> +            - brcm,bcm947xx-cfe-partitions
> +            - nksys,ns-partitions
> +            - nvmem-cells
> +            - qcom,smem-part
> +            - redboot-fis
> +
>        '#address-cells': true
> +
>        '#size-cells': true

Alternatively, you could add a 'oneOf' with $ref's to each partition 
type. Then we don't have the same compatible in 2 places. If you do, 
then the partition schemas should have a 'select: false' so we don't 
apply the schema twice.

Or keeping it like this is fine too.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
