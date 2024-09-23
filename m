Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD58CF9C5B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syVKkLxn4LGoTiuCZEbaZhVC58BEo9LauLyYc0qzp1k=; b=L+3g5ibjK1tMks
	1bWhDVrvOxXf35zFJ2dse62+U30accXlQaX8QZ6UNTdBRVd0l+uIC26mfLmf6Oan6DzSe6mSagJPp
	QLAKUd6MADOoxO4PekYiu/wMbHO7wibT/etG/khtKaFoENgRia1JBR7Yr0FfTeN4ai+cF2xqAMwMT
	EteH1AKQB6Mg2I3BHuCR1JuFnkKz0SX/GLBFVnmbM3GckDagxLcAYPgQIPtalmeIRkAZ3A9mfzjIT
	+FW2FrClkJYo8GbJ2xAiWO5FGhZ2+xP3V9PmeUcHWdlDmInvHwY+iDJZdduYhi7xpZNcEAfzTvMsA
	dWjQ9fvAKLl1kktdp+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfGy-0000000GoTI-3IRq;
	Mon, 23 Sep 2024 09:22:24 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfGX-0000000GoPC-0GBj
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 09:21:58 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a8d43657255so660410866b.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 02:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727083314; x=1727688114; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BeTrBA1N+lrnARk4DKq2IC2AoEA+AXYxT54TqSLaEmk=;
        b=jbT2aZE9bWQ8R8j9KJQJWxV+ru+mnHWFULTQFG1PbuGL7GTg22DS/chqy+IFPgQnvw
         iFpwosxVIjYuJj5w4gBP0c2u2qYLuOdD8jgOmyKZ6O8frB/QuoKgF1PX5xrxS7KilBnj
         yo1f5iHEKOWsHUSF1IPgdBe8XeTBAQx/6KagYt2cyT1q5SgX3//oRM+yFAKfZmE42/3F
         SYWIoLCJyqoJ8DQRLxgmf58mG1gTE/AVMhYOu7oijx4xlGsjn4TjUfRicYe40ASMERxR
         8PmI4j9yjuDfVY97pnYst2f3/GeyjgJgel+FPJ3sPwntSrfHDp9dyZKJnhxl0VP+bNF/
         az4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083314; x=1727688114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeTrBA1N+lrnARk4DKq2IC2AoEA+AXYxT54TqSLaEmk=;
        b=E/8PeeIfk//9U3LTsA3afJz3Zp72ZRLEFLlqNweZtO4+9FbxcBCiGhwlplzKRQ8wLV
         +tw+R00lRHVPY8IO5jFkIX8dbQb9W28kkCgtiOl+w400dGlpvixa/LFnuc6qQgNwLuYQ
         4PsisQZOB2T2BT1bwb2Imypf3s8ryU3NUSNbn85EmmPsA4+dsISJVDGeruDhSoHs4lVr
         xy2R2bKDTDt/e3V3lJjOCZ6OPEsFYDLDeR/VYefMTGy5e/nClBjqGoCVk9LVjDB35PBK
         p1HixERNWwHkgUyKzTBhpCpHMx5DOgG824M0mH4YLHbFPk5VwS/D9eoR52nlks+Nr1yh
         ojSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlJAlDLxTDTfbu0EVLeVq6O/IeX6t3EzAWdJxl3Y3hI8utPIpGdjuHewT71jwlqcMMbd7qBvBHJOQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyR/isOAXsalKXxLETR2hCaFgzedIjEiXVokmlCfBS2SUQzFxMT
	TMa7IejFgZeSIbOSImdONAAqkGwAYZyWjBWoLOyY0Dh2WhNUIWw4yJF4cIKpDseTUJ8ZnxnI4pk
	OIe4N5QWPXUjN9PgvHjJwlJ2UTA==
X-Google-Smtp-Source: AGHT+IHjgBHsrSF7iNusLMRgxzz/fWBBlO0MNCoYDwKJjaxi1mIfKT0+RFXnJc+GyzvY9qykBS2XovckNAslXQJxNNU=
X-Received: by 2002:a17:907:c7c3:b0:a86:96ca:7f54 with SMTP id
 a640c23a62f3a-a90d4fde858mr992207466b.21.1727083314069; Mon, 23 Sep 2024
 02:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-4-erezgeva@nwtime.org>
 <2fo7pndjqieq6lfydmq2pnwb374oqoqnrcsezycgougmr7mtl5@2wm6fe3inf5u>
In-Reply-To: <2fo7pndjqieq6lfydmq2pnwb374oqoqnrcsezycgougmr7mtl5@2wm6fe3inf5u>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 11:21:17 +0200
Message-ID: <CANeKEMPjLYbBi0AXkEdNum=kqtVe_mfTcVf4zUvJsszVhnh+pw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_022157_143847_8F2EA128 
X-CRM114-Status: GOOD (  36.52  )
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

On Sun, 22 Sept 2024 at 22:40, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Sep 20, 2024 at 08:12:29PM +0200, Erez Geva wrote:
> > From: Erez Geva <ErezGeva2@gmail.com>
> >
> > Some flash devices need OTP parameters in device tree.
> > As we can not deduce the parameters based on JEDEC ID or SFDP.
> >
> > Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> > ---
> >  .../bindings/mtd/jedec,spi-nor.yaml           | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > index 6e3afb42926e..4f7bb3f41cb1 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > @@ -90,6 +90,43 @@ properties:
> >        the SRWD bit while writing the status register. WP# signal hard strapped to GND
> >        can be a valid use case.
> >
> > +  otp-n-regions:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Some flash devices need OTP parameters in the device tree.
> > +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> > +      This parameter indicates the number of OTP regions.
>
> OTP regions where? In DTS? On flash itself?

Where can OTP regions be?
Can you please be serious?
If you have any suggestions, I am happy to hear.
I did ask before.

>
> > +      The value must be larger or equal to 1 and mandatory for OTP.
>
> Don't repeat constraints in free form text. Add proper minimum and

Sure, I will add a minimum.

> default, although it is confusing - property is not required but it is
> mandatory for OTP?

You are welcome to suggest a better rephrase.
Using OTP settings is optional.
If you set OTP then the number of regions and region length are mandatory.
While offset and base are optional for OTP settings.


>
>
>
> > +
> > +  otp-len:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Some flash devices need OTP parameters in the device tree.
> > +      As we can not deduce the parameters based on JEDEC ID or SFDP.
>
> Don't repeat the same.

Is there a grouping description?

>
> > +      This parameter indicates the size (length) in bytes of an OTP region.
>
> What if each region has different length? Is it possible?

Yes, there are. Old Mactronix have chips with the first region bigger
than the second region.
As these are old chips, we may skip the support of them.

>
> > +      Currently the driver supports symmetric OTP,
> > +       which means all regions must use the same size.
>
> Drop unneeded space in front.

OK

>
> > +      The value must be positive and mandatory for OTP.
>
> Same comments as before.
>
> > +
> > +  otp-offset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Some flash devices need OTP parameters in the device tree.
> > +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> > +      This parameter indicates the offset in bytes of
> > +       an OTP region relative to its previous.
> > +      User can omit it if the offset equals the length.
> > +      Or in case we have a single OTP region.
> > +
> > +  otp-base:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Some flash devices need OTP parameters in the device tree.
> > +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> > +      This parameter indicates the base in bytes of the first OTP region.
> > +      User can omit it if the base is zero.
>
> so default: 0?

Sure.

>
> I am not sure, but all this looks like duplicated description of nvmem
> cells or some sort of partitions.
>
> Considering that this is first time the binding mentions OTP, I really
> do not get what you are doing it. If the properties are to stay, please
> describe better the problem (and hardware!) in commit msg.

OK, good point.

Thanks for the feedback.

>
> Best regards,
> Krzysztof
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
