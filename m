Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02383FA3741
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1kuZSSwjo3MArJRzCWjrfR5HgKao7Oy+xekGjEy9kk=; b=ZQ+4gKyFGLBrTV
	XzQfUfuma05Vp8f3SSliC0PY5IRPhpGi1VZHcX9SwwCKWCzD3tkkgneQ481lCN6Q+evr5dMjFsU8o
	k8o/JsNJtHaQslC6aDptRsQcBDF392NG/JPkxz1TMWWG2Wc94esr/uqtEHhxipi4GPLRNk1+h7+A5
	o5Ai6/QYEcIDm7wqlboUjyRPeGvVRAtwB2UcdLZf7LOl5Ks8FzcfC5be/V0SETT3X6SoyaTngyMOC
	amsehz10YjMJl4PJ8F3oA+19UBRnqFHXQjwiMl8MRmjr8F39TLZhOTJ6eleTmJkzMItGed+HovioI
	kKu/m4eXMnb0Vj6m2Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaWK-00EEVA-7x; Mon, 31 Oct 2022 19:32:28 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaWH-00EEUd-Rk; Mon, 31 Oct 2022 19:32:27 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13b23e29e36so14556580fac.8;
        Mon, 31 Oct 2022 12:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVVqsExfMH5y/nVKQLe7SB8sVIcEpxDpkI7AXNSICDk=;
        b=i8m0fKWiS2i7mxZtjN5xNsHND9tLFqUMeQVu2JKZxgroQmOrN+StczawWqTZe/XtF9
         kBlXfGyju1C0VFYQF++UwNfjBhHaFp/XCVCIo2miEKQjV9FwY8LijwSGDGEIHNdnv8KN
         WJBVvCU0U0d6TVV8juQprHgSoil23gkxCsdHVgUhiITAKoh5LW2khM5d68XnJsqwYuKR
         FxfXUZTeLyUZDaMAz0ekyqwvEkLEW65N2Cm+E0Z/UJoJwKqinWkpiCQT0zwcuiIq8oUY
         VAiWGIPVui6H46nhY0Gz+W13EziKiwk5OltgI655Aqs9iSo4w9Fltka11Q+q4F8ZfSt6
         CldQ==
X-Gm-Message-State: ACrzQf1gf09zP1GsWdU2WGtPX3cLTd8R1A7Avu7AKyrgUTShCVv0N4S1
	lqmjw/RDDWQ5XefF++KSGg==
X-Google-Smtp-Source: AMsMyM51Ay/CK4pAwfGf+l/L2CO2NolCQmH5Ou1KvFFhPO09DUo2mDuk+qqH803TerpG8A6bPcDstw==
X-Received: by 2002:a05:6870:d78c:b0:136:ddfe:bf16 with SMTP id bd12-20020a056870d78c00b00136ddfebf16mr8358187oab.86.1667244744371;
        Mon, 31 Oct 2022 12:32:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m33-20020a056870562100b0012779ba00fesm3512244oao.2.2022.10.31.12.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:32:23 -0700 (PDT)
Received: (nullmailer pid 3293099 invoked by uid 1000);
	Mon, 31 Oct 2022 19:32:25 -0000
Date: Mon, 31 Oct 2022 14:32:25 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: mtd: Clarify all partition subnodes
Message-ID: <20221031193225.GA3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_123225_916826_53719339 
X-CRM114-Status: GOOD (  18.08  )
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

On Sat, Oct 29, 2022 at 01:59:22AM +0200, Miquel Raynal wrote:
> Over time the various ways to define MTD partitions has evolved. Most of
> the controllers support several different bindings. Let's define all
> possible choices in one file and mark the legacy ones deprecated. This
> way, we can just reference this file and avoid dupplicating these
> definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 25b91f25fcf4..9fcaa61b046c 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,7 +21,25 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +  partitions:
> +    type: object
> +    properties:
> +      '#address-cells': true
> +      '#size-cells': true

These should only be 1 or 2 which I don't think is defined anywhere 
else.

> +
> +    patternProperties:
> +      "partition@[0-9a-f]+":
> +        $ref: partitions/partition.yaml
> +
>  patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
> +  "^partition@[0-9a-f]+":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
>    "^otp(-[0-9]+)?$":
>      type: object
>      $ref: ../nvmem/nvmem.yaml#
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
