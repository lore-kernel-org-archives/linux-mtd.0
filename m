Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD724E7C4DA
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpVik5YvPGPJMzemYJ/vVdhnFig2xQl8CiWTB5+Lf+M=; b=keEqH5EOlchDeq
	fNMeHFbXoD8mjsINZGt31+tvV9izE+9yBdJa55QsxVXpP9T8YPbxtfQQ9Rb4W1cleVaf03bGe+f0l
	60GZ+VaSBii5bKNio6KhgdKNzfxJYygcjIrZ581pOQGkmXz0+EYX/jIu1Ec2+45fd6pXbOBXjv2VB
	Sa1VKnmLssDwMiC2UYKiqbGNHg4NTUPKie40Ag9Ye6as9O2hjCirbOSt016zEE5Z9b/VNC8biBC5F
	+LS5g5jlnVl13t7r85c04rBE//VRvAtWf0RCME2d1KikS8qx/0b/37Uspj5TeAb5vDkT1ALyy9bMJ
	mxiXh1XETENKQ2CNcvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4O7-000QzC-0m;
	Wed, 04 Oct 2023 16:06:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4O3-000Qwu-3B
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 16:06:14 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9b9ad5760b9so6774166b.3
        for <linux-mtd@lists.infradead.org>; Wed, 04 Oct 2023 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696435562; x=1697040362; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXMY0UlzCXXysobfPTUw3MvymyulfDMm4djV4xjuSLo=;
        b=QYK2GNd2oR/MOJHkrtj4NQ6pjMgVy4lLujhEzuYqC59duntxa/EWwz8AsXc3R77L8u
         dnBpO3Uv9BuZd+390QMLahhrwbJzFpmcpFe8Yjx+tQ/0i0hzR3KaZcTZ7xDavGQOGODQ
         mvmnYon7L11bddfdtLOi59dkyvD6C9Cqy3YHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696435562; x=1697040362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXMY0UlzCXXysobfPTUw3MvymyulfDMm4djV4xjuSLo=;
        b=H7e48tk+5q6TwoBULUqzRBCLnpcOF88j9AEnnBU9XHhEaRAFCZ/8stDzjlmKUnZ68K
         Zh60ja2OftVZZ2kjk3D3Ir4OnmOpJxoKRcEq0Tb/QwybGkrNJdqTrIubl7eRCTGqvFYP
         Av6ujfLz6ChOmnV5q2mKc0xF5Smn+Qio7TdPHa4VGZSGpVIjtGVmFx7s1H7wBuItuYnM
         8DmGl6CeOVo5aLtG2ECZaqFfOvtTJCRt0lM06WQZaV7W0kOozJJtoLwgbtCeKj6Lvh/J
         7SUwu6ZnExmS7z9Tr68UaNcS0KwpYm+M2YDFeRbPhoWyvdhEED+Ju+6pNq7rd7x5PbEU
         7UDA==
X-Gm-Message-State: AOJu0YwX2FSPazmbNLJ3AvO9cESAWC7S2irV1I9w76ZUYhX+bSFyUuB4
	SZG9RgFQjVu0gO50zg/45EwG+orF8Afsn/DjiN6Xgw==
X-Google-Smtp-Source: AGHT+IGqVaYwYjDX7LnINduPH2/9kJQhL4we82kv8wvcqWvPtz+C2ElHBSAuMC4vIAj9ICBYHQriteVS30W2xb61XAI=
X-Received: by 2002:a17:906:23e9:b0:9b2:c583:cd71 with SMTP id
 j9-20020a17090623e900b009b2c583cd71mr2451474ejg.50.1696435562091; Wed, 04 Oct
 2023 09:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231002174948.1015223-1-sjg@chromium.org> <20231004093620.2b1d6917@xps-13>
In-Reply-To: <20231004093620.2b1d6917@xps-13>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Oct 2023 10:05:43 -0600
Message-ID: <CAPnjgZ3bsNvCO_DkUG+99Ep_RPtQR42+AvxbLoZGBq+G8cWtPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_090612_025722_19187625 
X-CRM114-Status: GOOD (  23.88  )
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

Hi Miquel,

On Wed, 4 Oct 2023 at 01:36, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Simon,
>
> sjg@chromium.org wrote on Mon,  2 Oct 2023 11:49:40 -0600:
>
> > Add a compatible string for binman, so we can extend fixed-partitions
> > in various ways.
>
> I've been thinking at the proper way to describe the binman partitions.
> I am wondering if we should really extend the fixed-partitions
> schema. This description is really basic and kind of supposed to remain
> like that. Instead, I wonder if we should not just keep the binman
> compatible alone, like many others already. This way it would be very clear
> what is expected and allowed in both cases. I am thinking about
> something like that:
>
>         Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml
>
> this file is also referenced there (but this patch does the same, which
> is what I'd expect):
>
>         Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
>
> I'll let the binding maintainers judge whether they think it's
> relevant, it's not a strong opposition.

OK, yes I can do that. I suppose they would still remain backwards
compatible, due to the use of '$ref: partition.yaml#'

>
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
>
> [...]
>
> > +properties:
> > +  compatible:
> > +    const: binman
>
> Right now this does not fit (I believe) the example. But if we no
> longer extend fixed-partitions but just create binman.yaml, this will
> probably be enough.

OK

>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    partitions {
> > +        compatible = "binman", "fixed-partitions";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        partition@100000 {
> > +            label = "u-boot";
> > +            reg = <0x100000 0xf00000>;
> > +        };
> > +    };

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
