Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6786CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TGEjJ/9Ff/aNiqrarHvi5FwR55uWCFU6C2rs0WRoP8=; b=OV0S7gOrXlfmjm
	TLHB+UWZRtT/9V4GunQedLcDMYl10TzW0BWsMMI5UKC2DUzvePPPYx0eVM2fye54e2xBpV1wy909Q
	G74vZSE5Bsh9ZVlOLtzj2bg5BTHX5mZt4xHXIOWNOHrMNjCirGmnh29NmcXlufg7qJJqtPVRXL50B
	l+9H14Y8WlItJNao07ORyjYcHTOTGwCY9FBEunyNPeLOKofTOG1lBXAicygNf1Qgg8npgBuNzFDkT
	RcKusGxYGUdoo/TjwHDmyJGSH6TfdnHmTJ8FUy9uwzI2FK1buVV8xRq3BVoxhNoYXToV64IGlkFvs
	S50lvj193NFGNm2XIZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqfmS-009emP-Az; Mon, 16 May 2022 18:49:20 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqfmQ-009ekP-3p
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 18:49:19 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so10668593oty.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2022 11:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TtCUUUT+nHAc8CW7oHLx12ILRqYzV6X9OXA+TWI+EEw=;
 b=5vcjlZDPIb+2QioUeVoAv3G5PCbRBdfAnMXa2O7oOKIzLqr7+CTPYTjCj4RU09jsRC
 jMX0HYq3bt2OWOXtUdhDb0dDw2mQHfPiPLKy4VJPl2zxmbGSfEvAv2k5o6/Crx6LJUOv
 KNsdyUhHgCxbiPhKIzh8HoUAHKa3gcAjjDcOFizbeSZzuhPEXtyfScqjN27wswbd7K9B
 oZJVbXlpaC34n8ysZjotgU0xLkcV5ckWTUF4yc1eHx8lOcEllDif78w+I9phpqjvetj7
 l03gPs4ebFw3wbqoikNg/mZonJ9kH884vNzE1umHM64idUjpimKtfu2C54o7YF6hZN7i
 MYxQ==
X-Gm-Message-State: AOAM533BULkUbl8vOLS5VAUUljm++pqySoEhk1GlLzf0OchWJA1YfY3P
 Gf+VJmGGSdBsL4EVJcqadiuJ7MezPg==
X-Google-Smtp-Source: ABdhPJxWWS6qu5qSJOpfAr1qWYqIWns8KVfKkkW1r2Y0uSLIoj2zOsjB8OHgBlBnp2+p9gsPvcRjZQ==
X-Received: by 2002:a05:6830:264f:b0:606:7dbc:aebb with SMTP id
 f15-20020a056830264f00b006067dbcaebbmr6641366otu.93.1652726954709; 
 Mon, 16 May 2022 11:49:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m19-20020a4add13000000b0035f627ac898sm4375618oou.10.2022.05.16.11.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 11:49:13 -0700 (PDT)
Received: (nullmailer pid 3068015 invoked by uid 1000);
 Mon, 16 May 2022 18:49:12 -0000
Date: Mon, 16 May 2022 13:49:12 -0500
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-pages binding
Message-ID: <20220516184912.GA3063673-robh@kernel.org>
References: <20220503154353.4367-1-ansuelsmth@gmail.com>
 <20220503154353.4367-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503154353.4367-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_114918_194346_60827EB5 
X-CRM114-Status: GOOD (  19.29  )
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

On Tue, May 03, 2022 at 05:43:53PM +0200, Ansuel Smith wrote:
> Document new qcom,boot_pages binding used to apply special

s/boot_pages/boot-pages/

> read/write configuration to boot pages.
> 
> QCOM apply a special configuration where spare data is not protected
> by ECC for some special pages (used for boot partition). Add
> Documentation on how to declare these special pages.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> index 84ad7ff30121..fafeca0cafff 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> @@ -102,6 +102,26 @@ allOf:
>              - const: rx
>              - const: cmd
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-nand
> +
> +    then:
> +      properties:
> +        qcom,boot-pages:
> +          $ref: /schemas/types.yaml#/definitions/uint32-matrix

You need to define the dimensions. Something like this:

             items:
               items:
                 - description: offset
                 - description: size

> +          description:
> +            Some special page used by boot partition have spare data
> +            not protected by ECC. Use this to declare these special page
> +            by defining first the offset and then the size.
> +
> +            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
> +
> +            Refer to the ipq8064 example on how to use this special binding.
> +
>  required:
>    - compatible
>    - reg
> @@ -135,6 +155,8 @@ examples:
>          nand-ecc-strength = <4>;
>          nand-bus-width = <8>;
>  
> +        qcom,boot-pages = <0x0 0x58a0000>;
> +
>          partitions {
>            compatible = "fixed-partitions";
>            #address-cells = <1>;
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
