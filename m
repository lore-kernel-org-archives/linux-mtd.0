Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BABC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRi7kmVnCQV0+TQlzCieZCN3BXzp8a3g8cnG1sYsXMw=; b=QL9wtjztiToT8B
	xtXEjKGcjvUItvdvnF83zTioCVsMZNleVhyZVJfljHXKW7Yv8ghYSIKTGmJcy4fdZ7cOcz1zqzUzX
	ZSVx4MAZNRx4wOBdLZ6CSHs4JVv7koD1Jyu1Q28N0DckF8lwtbSuvD9UbWXVDGx8JHwxu8Dun4o3m
	+Gr/rfwQNsc+5NqNiAgH6qqacabQfERAh1XzltFIcwn167Pm43Un7v0dUQ80ckwx2lQ/hz0mtcs0W
	CnFnUsrvqlvh+4II1C+L+vBQ+TYwQwoigjiSCH/BHio5g28ayN5gfr9WQU1FRQvOB+rXfD8Yt+AW6
	tKF0bTR6sc8/I0oZ7WNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrO8Y-003O1q-Vz; Wed, 18 May 2022 18:11:07 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrO8W-003O1L-9c
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 18:11:05 +0000
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-edeb6c3642so3774542fac.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 11:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2SbH21NI1RxYzUW8Fc68yUKxfiyOdhoY7sVVRkwTa5c=;
 b=2kZpZ1ufon0cE+NTpsOf6mMhHw50zNRSp0JQI7VevVH9M2G8rQwOr9xQMebGqkAx0L
 MSRSeCZab1g7OqXh0gu5m9HxNHhjgcfqS3tiqSzGNXXKmn2MdclEvDJWJDUrKN29Fa6t
 t16nlfimzimS2Fi2FmQnN501+WyRJSuYOq1aov2obbP4mCqkRmiLAX/KKdvcmtjeG1V6
 Vzvh6SqVbTOVqzD0IpJFOYQDiIvDxD5sSZpz72WO7dBL1pHUIUBB7QXf2t9HRZdIn8Vm
 1XwK7lc3FASTzxy/IrSKlbXZPe1t7cEefByzF947BjrrBIVnysTVnWoh2vXCC+qpBavF
 EMUg==
X-Gm-Message-State: AOAM5326tdn9g/ENNk6iIFbuLaLMUhjukvV3DoiZbQLE7hvRFeG+E3X/
 jt+eECk8CvnRDbCQI10VeQ==
X-Google-Smtp-Source: ABdhPJyY34Vx2sbvEO/kb6TuZqgF4pxQHTW0SZ1pk0lPygem0MFJXB98JiXyUZaeU/emLp1lwUyc5g==
X-Received: by 2002:a05:6870:64a6:b0:f1:e54f:5923 with SMTP id
 cz38-20020a05687064a600b000f1e54f5923mr798509oab.123.1652897461805; 
 Wed, 18 May 2022 11:11:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e133-20020acab58b000000b00325cda1ff99sm1019554oif.24.2022.05.18.11.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 11:11:00 -0700 (PDT)
Received: (nullmailer pid 3615615 invoked by uid 1000);
 Wed, 18 May 2022 18:11:00 -0000
Date: Wed, 18 May 2022 13:11:00 -0500
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
Message-ID: <20220518181100.GG3302100-robh@kernel.org>
References: <20220503154353.4367-1-ansuelsmth@gmail.com>
 <20220503154353.4367-3-ansuelsmth@gmail.com>
 <20220516184912.GA3063673-robh@kernel.org>
 <62840beb.1c69fb81.9bdaf.070c@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62840beb.1c69fb81.9bdaf.070c@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_111104_373415_5E092FDE 
X-CRM114-Status: GOOD (  23.13  )
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

On Tue, May 17, 2022 at 10:56:09PM +0200, Ansuel Smith wrote:
> On Mon, May 16, 2022 at 01:49:12PM -0500, Rob Herring wrote:
> > On Tue, May 03, 2022 at 05:43:53PM +0200, Ansuel Smith wrote:
> > > Document new qcom,boot_pages binding used to apply special
> > 
> > s/boot_pages/boot-pages/
> > 
> > > read/write configuration to boot pages.
> > > 
> > > QCOM apply a special configuration where spare data is not protected
> > > by ECC for some special pages (used for boot partition). Add
> > > Documentation on how to declare these special pages.
> > > 
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 22 +++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > index 84ad7ff30121..fafeca0cafff 100644
> > > --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > @@ -102,6 +102,26 @@ allOf:
> > >              - const: rx
> > >              - const: cmd
> > >  
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - qcom,ipq8074-nand
> > > +
> > > +    then:
> > > +      properties:
> > > +        qcom,boot-pages:
> > > +          $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > 
> > You need to define the dimensions. Something like this:
> > 
> >              items:
> >                items:
> >                  - description: offset
> >                  - description: size
> >
> 
> Considering this is not limited to one item how should I declare that an
> user can declare multiple items? (the user can declare multiple zones)
> Declaring minItems without a maxItems? 
> 
> I assume in the suggested form it's assumed
> minItems: 1
> maxItems: 1
> so this would be problematic.

No, the outer 'items' being a schema rather than a list means it applies 
to all items and does not set a size of (offset, size) pairs.

If you do have a maximum number, you could set the range.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
