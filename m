Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16FAC3600A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SHTcungl17cqmPDi5LbBGBz8jZKyldV4Uzl95QaK3o=; b=TwEfgLNnIElBF8
	7HD4+a8Ju6nNCMxq94e6Nrh/w0dG26nzUN99HfX9RBGX5oRv9oTKHz9qOyFeB7dVPRgecMvHMiHzP
	PpzVU5W8Quin/RFkDjS+BCiYLZpofI4y5nMdvWJzuaOD2yLQx4borGPBWQ8cnOTKBQ2dL8JY88PmC
	T906Wsqci9EbIrxohDf9R8rjC6YD3lWAIL6Mh2EtPgqnDb1X62OJXuhh+RiDxixF7mKCEOM3fD5JW
	EV2+CeHVlJF6hq+wbhebTzcEnw7ATEYFWRYGdvSsnp2KFXY4R9iYI39VVbZhVhTkTJuNhfP8brMgn
	uQZlRoQZEH8Sl9cWe2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVfT-00000005ynY-2h8Q;
	Tue, 17 Sep 2024 10:42:47 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVfP-00000005ymL-3U49
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 10:42:45 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2f758f84dfbso43070781fa.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2024 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726569762; x=1727174562; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofmX+HKXE00WtuM13hFGpW8n7y4t1BDYpJWpTwCfwYg=;
        b=mZ+4eg2su0zV09d3BKDXYYLH1AhOYft2783yZAZGSpg9yj8sABFwUrJ4MLukBpk8VQ
         7CxL3cEgpHh2HPUxBQ4kWxdITOJst/YGiTyQm+1tlP8uyW5ZGscOKzHYE9+BlVaIdt9b
         palA0rM71cos/cArw3X0/SK+AmFBkVjgVF5M5UB45HKnh+m0aRqrE5t8KAWZd1mw4/Ak
         21lSsbPFatZXspqmSK/mQKQhicWe8CzQepOP1J65igQcFPiuzmUJrE+zabd0EGltnkwU
         lP9f2UMsi6oe6wFoA5DDfnf1pv+U9xUbsXS9EIGef9NAmeT5SpgxnpG6IkBrLmRQmNmD
         WXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726569762; x=1727174562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofmX+HKXE00WtuM13hFGpW8n7y4t1BDYpJWpTwCfwYg=;
        b=YGZ7nG46E1o57sHrN8kF1upPpjH5d/yHrRBxKtZxX5K3usWu0VCvJIf9cuY8MtZG8o
         VxkQ4FaE3ei+cWGLeDkgQpvggKb6A3ORRPTmWR3sYWn0CoeOtD9Sy2AYmQrLYdTkeE0J
         GEU5zO7a1Sdjm3T3f0U25pyF7m+3NR6chnsMZBg1bftjECGndxvVYptYJrpRitCeA0oH
         sRiwD7rgyFtUE6lz26+vJqjHFkylyuk7oe5hlf/3MSoWQ3XbfrySpsd1OzBpbvW3HUnm
         6Qm/9FR8CsB4zsmbbfwxz+kb9iQn1+OtITy9FZMFPYEDoEPwH3DRANrUgjfaHfWLv2CJ
         xxPg==
X-Forwarded-Encrypted: i=1; AJvYcCWNglFeV8oVyc67KKHaRROYP8BGHqobrtnXlTPS4dhS/Gal99cb/M7PnVKN+5F8rF6KWCqTFSy6m0I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyAa7s4aFHSdB6512gjMp6EDwtl+14VfaH36/wg9ZoHK+si68r
	8bjjoIrXRIh9ZHpJh8qnYpN5smAQWkaB1yJGCulGvtlY7GunYzUH3dJU/A56AsfvIkSFNujXHxe
	0ItFMCZJX249qHB5snKMS+WkXPA==
X-Google-Smtp-Source: AGHT+IE7wDEsYvo3hu0cfYozzAesa6JgzseU8Or3sJo+TYtS5n5WmyOVSXkx1QfoYY8onXcByFX6eMTMS9XFQBUU0jU=
X-Received: by 2002:a05:651c:b12:b0:2f7:6812:d0ae with SMTP id
 38308e7fff4ca-2f787dc301amr101396411fa.13.1726569761761; Tue, 17 Sep 2024
 03:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org>
In-Reply-To: <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Tue, 17 Sep 2024 12:42:05 +0200
Message-ID: <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_034244_499172_BF601132 
X-CRM114-Status: GOOD (  21.38  )
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

On Tue, 17 Sept 2024 at 12:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/09/2024 11:49, Erez Geva wrote:
> > From: Erez Geva <ErezGeva2@gmail.com>
> >
> > Some flash devices need OTP parameters in device tree.
> > As we can not deduce the parameters based on JEDEC ID or SFDP.
> >
> > Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> > ---
> >  .../bindings/mtd/jedec,spi-nor.yaml           | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > index 6e3afb42926e..d502b7fab2ce 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > @@ -90,6 +90,43 @@ properties:
> >        the SRWD bit while writing the status register. WP# signal hard strapped to GND
> >        can be a valid use case.
> >
> > +  opt_n_regions:
>
> No underscores, but hyphens.

I'll fix this.

>
> > +    type: u32
>
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see

I run "make dt_binding_check" on kernel 6.6.

> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
>
>
>
> Best regards,
> Krzysztof
>

Thanks for the feedback.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
