Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01598C54E58
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Mar 2024 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQytDb59QeNFqSLrLAcEadBep/dDW502jNIMJ96C9Z4=; b=NVwGivYe5OogVx
	YqYAcZK1ALA5ksL6mw55CnLnV7xFF2Zgp3qNxCnPf36ZrP+W2mQ7vrLqm+mrzTQFwGgqfDbXUupvf
	xrAcuA728iBY1cvHNtbe1vxJKKOPy+Gh6NWM0gAF/QBBkzSQUyh1sxBR43SOOhS3IBBS8B8b9EOAa
	Pf/MLSHuHRlfxZWUOWIXNHzYgy867bbfAgXgzHPZr6zhOJeBb58vxhdJ7SHAqkC5h7Xb3dWOsz8WR
	suW3swraHcFZs6g6z92x/40hc3Zd3MSnZcTN2dY0QY6dMGNYBVRN9GxpFjqpv5C+lZeqZIcQkgQtR
	dfqrbPg8CbIFes6vC8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro8fJ-0000000BBvc-1wy7;
	Sat, 23 Mar 2024 21:12:33 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro8fF-0000000BBtc-3z0Z
	for linux-mtd@lists.infradead.org;
	Sat, 23 Mar 2024 21:12:31 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-611248b4805so16284647b3.0
        for <linux-mtd@lists.infradead.org>; Sat, 23 Mar 2024 14:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711228343; x=1711833143; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y3ciYm0VxZfrPijrgMTJyMdjg8ZrAzLnw8EK162/0c=;
        b=DACDRrGYK1F/0AKUjsTfHHQz18Vr/6qtoOMR2NQmmS0Z4utX5E3H8PfJWXXuxqqRhI
         jpkJs13/bJxJ+aTaGhiJBrrgQhIzIIRaDKJBAchnke4cCa6/JEzU/LZajRv7tbiXR0xx
         TaYnPFmU9KAi/Oqy5+KppR1DoQFcq5DMM67GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711228343; x=1711833143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y3ciYm0VxZfrPijrgMTJyMdjg8ZrAzLnw8EK162/0c=;
        b=G7u+jLkO2JOzRGBjZWMIXb5Nh7bCvTLoYGRpUDWx5HyNYrEq1FBFojhVIi3s8fx9h3
         GUdkU4CYdf2iFY6sl3aPM8ZzwPlwaXUSL+iMZqtUTZaP/dBS9eRUc47Yh166aZbCpK10
         T7qZ1GwQ7plItvYg23fUGORlmnLsBgFpDvem3dge8BevU2sPPZ04uD2hgHSD0gqH66pv
         VOJ2HT7us7BQ/BtlpNqbYYVln3GTsN06eGGPQsR/eJmRHPx3Rzujh4rAetgRzmlOWRWz
         pNNdt1Y5KrhtBjpdc7JV1aJ6U/gzN0pO7yEh+TCTF9fnX1h3PsnypEqrmNBgzCnJZ1nd
         wiNg==
X-Forwarded-Encrypted: i=1; AJvYcCWvkb5pPdudbad7hLrJQNSFX4oYi1FSkdF/Pdj90p74eZuM1rFJw8jXfV5XnPDXIhREqQ+L/U3/KvMt9F8CtbLp2XcjmIbR2KQheXOODg==
X-Gm-Message-State: AOJu0YwkpLeB91uTJqRuhbxZjtmj2ssKm+3Mz5g5ibduuYd4JNmY02An
	WNmSF+Bt7pKuWNqWOjqfmdDe0YaNCGt7Illpmtlwexr8cDjwOILV2zwtNRXZ7TvTuy7NfnPyG+m
	uS8rx8buVKsUOrMJvS2ptWVvPw89bPuxKCWaE
X-Google-Smtp-Source: AGHT+IEDJszqpW1tP+cv5jXC4Oabaq1P2MqF2oGnuJi80CpG95eHJKzJDW7qqZ8SP+4LnF8HV/fDKJZxwXd9lg8KfQI=
X-Received: by 2002:a81:8404:0:b0:609:f898:9832 with SMTP id
 u4-20020a818404000000b00609f8989832mr2972227ywf.23.1711228343188; Sat, 23 Mar
 2024 14:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240320052449.175786-1-sjg@chromium.org> <20240321133905.GA1622174-robh@kernel.org>
In-Reply-To: <20240321133905.GA1622174-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 24 Mar 2024 10:12:12 +1300
Message-ID: <CAFLszTg4UUhcs_oG=vq6ZuiyGfAGn015Usn58gYtGqKqLvNWUg@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_141230_125193_6D91F49C 
X-CRM114-Status: GOOD (  25.28  )
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

Hi Rob,

On Fri, 22 Mar 2024 at 02:39, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 20, 2024 at 06:24:48PM +1300, Simon Glass wrote:
> > Add three properties for controlling alignment of partitions, aka
> > 'entries' in fixed-partition.
> >
> > For now there is no explicit mention of hierarchy, so a 'section' is
> > just the 'fixed-partitions' node.
> >
> > These new properties are inputs to the Binman packaging process, but are
> > also needed if the firmware is repacked, to ensure that alignment
> > constraints are not violated. Therefore they are provided as part of
> > the schema.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v9:
> > - Move binding example to next batch to avoid build error
> >
> > Changes in v7:
> > - Drop patch 'Add binman compatible'
> > - Put the alignment properties into the fixed-partition binding
> >
> > Changes in v6:
> > - Correct schema-validation errors missed due to older dt-schema
> >   (enum fix and reg addition)
> >
> > Changes in v5:
> > - Add value ranges
> > - Consistently mention alignment must be power-of-2
> > - Mention that alignment refers to bytes
> >
> > Changes in v2:
> > - Fix 'a' typo in commit message
> >
> >  .../bindings/mtd/partitions/partition.yaml    | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> > index 1ebe9e2347ea..39c7d7672783 100644
> > --- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> > @@ -57,6 +57,57 @@ properties:
> >        user space from
> >      type: boolean
> >
> > +  align:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
>
> Shouldn't this and the others be 2?

It could be, but 1 means that there is no alignment and is a valid
value. I don't mind changing it if you like.

>
> Otherwise,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
