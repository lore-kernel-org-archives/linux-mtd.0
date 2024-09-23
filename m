Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D5DCF9C72
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bcX4NQWxRJ+ctth8vTLS4pQg7YAYHxTncyPs/nc4sc=; b=KoksUhdXjZ+2+f
	Wn47WQ5EOpaibF+QW67n13faz4TzyNkmwExiFJYl0YiPRR8yMCKnS1DfzJRscH9zWkicWawMI0YEA
	+8lAROO9lw1tjiuq5Mt9v4mCe0v5SHBFMUkGMbgH4tPNVs7u873X3+WGilVzjlgaN/RFHDqyZvF1t
	7JEMEMVVmHS2cDpThg4PFctQC4RWovBgTgWDdMAQvif+c8rk7q1QBwe23HXcciS0TlAKrb5kyre5p
	aFBtxrFKeGGNFQ7m1WAKsA38zSzrVscAg8uMKDJCFg1/swYeVMoc6Z4W/imgrht/DAlctddZHSGGX
	nmFaHawoDgRQKsgLMXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sslKf-0000000HY5j-13SV;
	Mon, 23 Sep 2024 15:50:37 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sslKc-0000000HY5O-1V4q
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 15:50:35 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5365928acd0so462604e87.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 08:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727106633; x=1727711433; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=65WtYbgYhyGH8ZKmVPSvbniCCXdPVGnCxU6Ou+o5RyU=;
        b=OTjc23/XSjYBHXNK7fTbmsnrqr3/wgTp2buyVyhOhysqL934NGB6OOQ+tm8M+l7fHQ
         dUT6e+b4B5BM7aYjfoO326dTlb3b+TanfPfBPC/Z3sdr+YZTT+nwwpU/K4lVrtUyws3j
         kH022YtWxpIiBay1nauVWb/aCcCTt//cCoUk8bKKFZB+Q/Zgyz/+Eha2/bHltEgjsJlV
         sksRdr/qF5oVB7EAkUsgzOdF+/BJyClvEPz5KjeZ19s6wO93drL+jKiOCL6+IjirVVqd
         Cnl+vD/qsJfWY8SXNDRbwrK6lnJeP0XOSEnW+ssQsskEXRdvbomp400WUWg4VAySG8J9
         OmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727106633; x=1727711433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65WtYbgYhyGH8ZKmVPSvbniCCXdPVGnCxU6Ou+o5RyU=;
        b=u0Bfx+vO6dSkLiVYr49uZWd6lNU09qJS1fxj+yQfXwnoe5nUxN1JFsuf0nbzj63s/f
         vIQQAgqS4Kl+VPrjyhgkvOG9jDK7fA/0RBJ7TOtGlm87yekApjlzTQpauBXwwU/YcKU1
         rCRwxxuXxqMzae3JXBQeGUwn6Oe3GgV5MwfjLiROIokhM2mtAm1PC3XEVZKxRR5ljJih
         vCt2l86nRfr/wHJpRr5ctTBwSEeNfNron2laWZP/6lKIJlqxsfPXugD7P6bO+LWN0X7u
         F9pblmoUTNMdlLuJ+nqtUUAsflwsm1pVoAFz16kgo3PKGXNKvSppS4O93ymXlwXKQWRe
         sZAA==
X-Forwarded-Encrypted: i=1; AJvYcCVM4LtSaubEW6iVXkCdRri2ZVck3FV6pCS7EY0/Gs42LneiqnmQaQlPpypMX0t6Gd2FrVAwVIkOFa4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCxtJh+8ijUGDPYZOGw2g/IyemeW0IgH2qNRtH1JbrmvAZBEWT
	d6fAJEoagfkyPPHLsZdEndT4DBpuhuGUHdmSSdSEuuVvc9uBDG1v56BQ9Leji6hPXwmEJmV3F2D
	As+bChDDwRbJiNTcg9AN/WQa8dExqoVOQ6A==
X-Google-Smtp-Source: AGHT+IG0zwu7WHEUC6jQ/fiEGqK1rZqKLAsj3mVWqXEiVlvU34yosGTRz+FQ+v8otKgr5mlGF58jB8qeD7PmkQx5YO0=
X-Received: by 2002:a05:6512:3095:b0:533:7ce:20e0 with SMTP id
 2adb3069b0e04-536acf6b2b5mr5285760e87.8.1727106632289; Mon, 23 Sep 2024
 08:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-4-erezgeva@nwtime.org>
 <2fo7pndjqieq6lfydmq2pnwb374oqoqnrcsezycgougmr7mtl5@2wm6fe3inf5u>
 <CANeKEMPjLYbBi0AXkEdNum=kqtVe_mfTcVf4zUvJsszVhnh+pw@mail.gmail.com> <bcb4fcf5-b49b-4e1c-a5c4-e417d04097f0@kernel.org>
In-Reply-To: <bcb4fcf5-b49b-4e1c-a5c4-e417d04097f0@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 17:49:54 +0200
Message-ID: <CANeKEMPSfGNLs+dwd0LWQUGpkGkShu5zOJhDbtMWyg-8SQaJKA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240923_085034_421642_CB7A110B 
X-CRM114-Status: GOOD (  39.50  )
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

On Mon, 23 Sept 2024 at 17:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 23/09/2024 11:21, Erez wrote:
> > On Sun, 22 Sept 2024 at 22:40, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Fri, Sep 20, 2024 at 08:12:29PM +0200, Erez Geva wrote:
> >>> From: Erez Geva <ErezGeva2@gmail.com>
> >>>
> >>> Some flash devices need OTP parameters in device tree.
> >>> As we can not deduce the parameters based on JEDEC ID or SFDP.
> >>>
> >>> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> >>> ---
> >>>  .../bindings/mtd/jedec,spi-nor.yaml           | 39 +++++++++++++++++++
> >>>  1 file changed, 39 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>> index 6e3afb42926e..4f7bb3f41cb1 100644
> >>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>> @@ -90,6 +90,43 @@ properties:
> >>>        the SRWD bit while writing the status register. WP# signal hard strapped to GND
> >>>        can be a valid use case.
> >>>
> >>> +  otp-n-regions:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description:
> >>> +      Some flash devices need OTP parameters in the device tree.
> >>> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> >>> +      This parameter indicates the number of OTP regions.
> >>
> >> OTP regions where? In DTS? On flash itself?
> >
> > Where can OTP regions be?
> > Can you please be serious?
> > If you have any suggestions, I am happy to hear.
> > I did ask before.
>
> Yes, I am serious, imagine that we do not know what you wanted to say.
> At first this just sounded like you mix nvmem-cells here.
>
> Out of blue this binding starts mentioning OTP and you add bunch of
> generic properties not really matching anything so far. Instead of being
> sarcastic about reviewers confusion, rather improve your description

Sorry, no disrespect.
I just prefer to be explicit, same as you ask me to be.

The patch seria is under review in the MTD-SPI-NOR.
This patch is under hold at the moment.

Thanks for the feedback and your time
Erez
.
>
> Otherwise, good luck.
>
>
>
> >
> >>
> >>> +      The value must be larger or equal to 1 and mandatory for OTP.
> >>
> >> Don't repeat constraints in free form text. Add proper minimum and
> >
> > Sure, I will add a minimum.
> >
> >> default, although it is confusing - property is not required but it is
> >> mandatory for OTP?
> >
> > You are welcome to suggest a better rephrase.
> > Using OTP settings is optional.
> > If you set OTP then the number of regions and region length are mandatory.
> > While offset and base are optional for OTP settings.
>
> So properties should be required?
>
> >
> >
> >>
> >>
> >>
> >>> +
> >>> +  otp-len:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description:
> >>> +      Some flash devices need OTP parameters in the device tree.
> >>> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> >>
> >> Don't repeat the same.
> >
> > Is there a grouping description?
> >
> >>
> >>> +      This parameter indicates the size (length) in bytes of an OTP region.
> >>
> >> What if each region has different length? Is it possible?
> >
> > Yes, there are. Old Mactronix have chips with the first region bigger
> > than the second region.
> > As these are old chips, we may skip the support of them.
>
> Other devices can come later re-introducing this approach.
>
>
>
> Best regards,
> Krzysztof
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
