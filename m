Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70798C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 23:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCIaAPJRa6t/wz0ncLXjDrWg51+na2uON1RRbjBWi6c=; b=GRzl9KCbt1pQNn
	7/3xiKPP9P/kCXv/VmngtzcmZjdSLtM5tcGKUWIKC6R4G2bIy/COP8JhefRQcKpWbIKyY48GTUJtk
	4aHMH+ZnVIgQFDn7N8fKc2keB7lExeMhaj7wA4Z8j6tvG8iewpCv3EI/uvBNGpTROzf5ABzfpjJ0U
	h3wyH0uLYp8AprPm8UrUzk4h0DXn54K/MErqfFdd46wnJnkm+8ECEn2a5Tzf7x4LUqkhFfkkEQYDS
	xX8uUMSotdRYjc/3FdHQjZJ/oT21EGlsH5XoIY0DKIikZuejunt7EJ0orsA7mmcoVhOlzVb5bcl5j
	vrL5Uaw91l+pKXZDIWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Tt5-009V2G-2W;
	Wed, 29 Nov 2023 23:22:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Tt2-009UzW-2r
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 23:22:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bc8a9503fso520038e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2023 15:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701300141; x=1701904941; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2/HnZ3tBk4Rv10ctPha3htJ6jB9vSVJNy8j7jeHy+N0=;
        b=A4GCHpxDq8pO4e7skeqAYGQ9k4qTjaUBDCeT0lyjbsjI1eDiI5evP7eYmm+CZz/485
         Jn8bGO000dFk/p1Qo70ICia/FYZY51mDcSbT4I/zd81KMtZQLb42RJhZKkYHdSj7A76a
         ly6j4uIQTQhn21W8kVrecu3CVDt45nh51kKac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701300141; x=1701904941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/HnZ3tBk4Rv10ctPha3htJ6jB9vSVJNy8j7jeHy+N0=;
        b=Bw0FzDQOsWLLCF+IWWZNSGrv+X4YCaUzMjjdXma/FqCFF6MK2hSm+cwNypTbpRfKs4
         u8AY1B6fRQrp7N3jGb00trOqBqjEtaUQnMNMPXlj/MFUE2uD7HhdqBKp4+JxrxfePxvk
         /kTeKoJ6YnfArL8PEd6sZV0+MwZvJmjFbzjckd0NZGW/2KVr9NlDZ11XspvvPZv79HqF
         nPtT8Lr6K8oqd8+8h4mkEjOYhAU8shR05njTTUYGYPnSszF3CDbS0/zQ1tW7SjTLAFwU
         zy61rq0InctrVQACR+HaQeBWWeDdzUcNvJWCaDGQ23Ts+MwK1x6OkZgmybcmpSSuU83h
         3LNw==
X-Gm-Message-State: AOJu0YwycGFmyGuOHDDXgIxFLx9g9ajp1b1lZQ/2ave+tiQ6R4NgxjqD
	L0hmDkxlKJT9rqmZ6tO1g8wanDumzImP+bXs4DhrWuGuNEY446Jkj5k=
X-Google-Smtp-Source: AGHT+IFYwY557f0M/HBVYE3v9Lp8eNTCTg5oXoWdtSW9n3YuCd9BE+gko2nwt0HyJjEkoxBEYx0zOQD+alQIHP6FIu4=
X-Received: by 2002:a05:6512:695:b0:509:8db5:949 with SMTP id
 t21-20020a056512069500b005098db50949mr17477580lfe.6.1701300140674; Wed, 29
 Nov 2023 15:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org>
In-Reply-To: <20231116172859.393744-1-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Nov 2023 16:22:03 -0700
Message-ID: <CAPnjgZ0z_oMy0kDScMjE9jYOvFJ12dxWn2CRoTpTsmw7TfARGw@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, 
	Tom Rini <trini@konsulko.com>, Rob Herring <robh@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_152232_922646_0D3015F9 
X-CRM114-Status: GOOD (  13.32  )
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

Hi,

On Thu, 16 Nov 2023 at 10:29, Simon Glass <sjg@chromium.org> wrote:
>
> Add a compatible string for binman, so we can extend fixed-partitions
> in various ways.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> (no changes since v5)

Is there any movement on this series, please?

>
> Changes in v5:
> - Add #address/size-cells and parternProperties
> - Drop $ref to fixed-partitions.yaml
> - Drop 'select: false'
>
> Changes in v4:
> - Change subject line
>
> Changes in v3:
> - Drop fixed-partition additional compatible string
> - Drop fixed-partitions from the example
> - Mention use of compatible instead of label
>
> Changes in v2:
> - Drop mention of 'enhanced features' in fixed-partitions.yaml
> - Mention Binman input and output properties
> - Use plain partition@xxx for the node name
>

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
