Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85D1C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 20:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGQCUHSceHEW3dzKVgcWmeCmKl/GDADVEgkcgCErXhA=; b=3sj4k86knOQ8qZ
	rMX7IXStXUdkdeUamNOoux/XKqD/gawyihsG0JWChLrsgcc4UAUfPLwmaVi9iwbVRVnUXkXcrKH8j
	y1u4ZlhdSErgwD8I/MWYnnJERhxCx2+/mN2JVTy+zUnzBhrvTLWRQ38GHrPSahHxFEKTJR28Rr/05
	z6DNyWvknsmpupeX8VYpkjtQEtRNby75inDVL64Z2XBgLiQRGuPsTrcZwokkYkE51ypin+fffmPhn
	E5wlCUji5SLT1l6mIPd0LkbUIufri209+HmlwsDOzlSK7sskcQ2KgsVWR0mEZReVJW7qp4bc941rW
	0sG/TJ04uDu9E90iqLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr4Es-00Fqw1-MC; Tue, 17 May 2022 20:56:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr4Eq-00Fqtb-1F
 for linux-mtd@lists.infradead.org; Tue, 17 May 2022 20:56:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id p189so57700wmp.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 May 2022 13:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:from:to:cc:subject:references:mime-version
 :content-disposition:in-reply-to;
 bh=SttB0Al2SmA1Ml2eTj/wShEo5Nwp1X2GJB1Zw/Jq5fs=;
 b=XAvJ64DTg2filoPTc7irccoZINdkOQRv9oxEwoMQGDhK4O1U80pzXCFuZjJVE3FjWp
 wzyfulpgNydLZVyljEzJHhtWMj9TFHHiioK0yIligTXDdr1L2F7tFsWbpKCz8Nm7vjD1
 yiDrUo8mdB8Jqn5GQhTTPNZVk4ZnTLL07oF7cdSEAGneTPaznZcwQrFAIlMth93g4PyC
 sW2qatOQM3Lek969GECns1t2VlOEOK2/0KvGW+q6kJJ7DqrATSSGGlpJd9aWE8fozGGl
 r7K5fNQnME+1rDbh7xE5bhnLOB9GWe+Ucl/mHSw8/fHLTtRSNGDk5iq8NcGtQP8hlqGG
 h67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=SttB0Al2SmA1Ml2eTj/wShEo5Nwp1X2GJB1Zw/Jq5fs=;
 b=doucdRgD4ope1xh8vSmd32p6RtEQgcgY4I0HvRtGYHa6gHjzVO+z2LJXQM4KmmpXYz
 S+Aeu8f7cG7ls912uAlQ5AqGANlGDVocEBj2VRe6gVtOJ0a7UA1U+kAgj4jZ3cmdF8dL
 9DKIQ1HmnK2jxS+DV+4P9qzMwebV+phBOX25YQCJbWoV41aZd/N9Ycduep/gSjZx7890
 Qw5qKVhM7eVwoAjqxjIFK0y3tar9R7aye/1BCWmGswDmNd3OydXFlMjZ+CVDHhQN2Pk8
 fC9j8N18jW6tRQiQVBG7zNeaIMu4MzUBTguDSs2Jp2Gb0sJcJzT5iq//xeox6M7JY9FR
 8IDQ==
X-Gm-Message-State: AOAM53236GgPSHxgPAg6HiIrNChgY2vpgbYYCTH+YySmX49DoE+3mrUu
 oRcOblOOcw+sXvbUkTeoE0s=
X-Google-Smtp-Source: ABdhPJxlpNKQuhQSJ2hEFYuSL2olvE3fgInpxw9a5UdtqtVkXl3QVdrp6UlvAJnusHS8jfSHPkGvdg==
X-Received: by 2002:a7b:c5cd:0:b0:38c:8b1b:d220 with SMTP id
 n13-20020a7bc5cd000000b0038c8b1bd220mr22753995wmk.118.1652820972354; 
 Tue, 17 May 2022 13:56:12 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
 by smtp.gmail.com with ESMTPSA id
 e25-20020adfa459000000b0020c5253d8dcsm73870wra.40.2022.05.17.13.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:56:11 -0700 (PDT)
Message-ID: <62840beb.1c69fb81.9bdaf.070c@mx.google.com>
X-Google-Original-Message-ID: <YoQL6ULpjb9muRvn@Ansuel-xps.>
Date: Tue, 17 May 2022 22:56:09 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-pages binding
References: <20220503154353.4367-1-ansuelsmth@gmail.com>
 <20220503154353.4367-3-ansuelsmth@gmail.com>
 <20220516184912.GA3063673-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516184912.GA3063673-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_135616_113228_77FA0532 
X-CRM114-Status: GOOD (  23.86  )
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

On Mon, May 16, 2022 at 01:49:12PM -0500, Rob Herring wrote:
> On Tue, May 03, 2022 at 05:43:53PM +0200, Ansuel Smith wrote:
> > Document new qcom,boot_pages binding used to apply special
> 
> s/boot_pages/boot-pages/
> 
> > read/write configuration to boot pages.
> > 
> > QCOM apply a special configuration where spare data is not protected
> > by ECC for some special pages (used for boot partition). Add
> > Documentation on how to declare these special pages.
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > index 84ad7ff30121..fafeca0cafff 100644
> > --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > @@ -102,6 +102,26 @@ allOf:
> >              - const: rx
> >              - const: cmd
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,ipq8074-nand
> > +
> > +    then:
> > +      properties:
> > +        qcom,boot-pages:
> > +          $ref: /schemas/types.yaml#/definitions/uint32-matrix
> 
> You need to define the dimensions. Something like this:
> 
>              items:
>                items:
>                  - description: offset
>                  - description: size
>

Considering this is not limited to one item how should I declare that an
user can declare multiple items? (the user can declare multiple zones)
Declaring minItems without a maxItems? 

I assume in the suggested form it's assumed
minItems: 1
maxItems: 1
so this would be problematic.

> > +          description:
> > +            Some special page used by boot partition have spare data
> > +            not protected by ECC. Use this to declare these special page
> > +            by defining first the offset and then the size.
> > +
> > +            It's in the form of <offset1 size1 offset2 size2 offset3 ...>
> > +
> > +            Refer to the ipq8064 example on how to use this special binding.
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -135,6 +155,8 @@ examples:
> >          nand-ecc-strength = <4>;
> >          nand-bus-width = <8>;
> >  
> > +        qcom,boot-pages = <0x0 0x58a0000>;
> > +
> >          partitions {
> >            compatible = "fixed-partitions";
> >            #address-cells = <1>;
> > -- 
> > 2.34.1
> > 
> > 

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
