Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E4FC36008
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wmdhv9EMhzgAfzghHkhrhBnhUsi4VUgDls8pcTJVB54=; b=LU3x/h6F8bcZT9
	6LZEA+W0+pgYGXfrsAmCqII7/zgsTIHZkREHaVp/C9XwzlRau1iXRhFh382E1CxCt+lW8rc3fdapz
	VGZ4+rH22ydzpihNfoLI7i/Ta60/BN8H36/Kfw/UQxAjDeH8dMW4NqVwSHXx3AFbkognvolx8KJba
	mpa9pNlo6yOJk13rEYm7m3Ho0glbYmAI24XN91iQtlzKhHf6i01eQNeDrfgu+rMkBZi0TNYTbbXQh
	pKUvzgakXt3T+1xxWQNQ/yj3j2DAL3/5dz563JFAhms8k1UTs3l73rfPz0esNGj8qnYQLBKJizO73
	pIWhyQ867LTus8iSulIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVI0-00000005vQH-00Y2;
	Tue, 17 Sep 2024 10:18:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqVHy-00000005vPu-02o6
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 10:18:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a8ce5db8668so948367066b.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2024 03:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726568307; x=1727173107; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j3I8RvtrkEGLcn/jjCsGtDX+89c/RzZJGXWndr0k2ts=;
        b=jVAqjUuCF7j24Jv4vokW6/cXtqYmcDvfJIjdPfZQ7fvx1yxbyI5fYLiyo/ftHraF+a
         J8XXCzDH/mNAHi0KGu1V1In97mxxeMegLscI0vfdp/lcExwjSC+nNkgIIbgJ+Vhe+C9P
         ju9482cN3o6H7O/AeYoP4HDfY/zqp1yi4TGHPMpGehIDtZIVyC+5fMHw93eJZuLo+Nqe
         jjLruaBWGZN7QUOYyT3Ec6LZziVxYX6/0Ye09wtBhoXqUxAqXHwZjediOoYtrlSm+QR/
         V9IHhxkxzVobISqandL1p31QW80ELVM06JxL0QjZlmfO6R0N8e1e/pr9l879k6EbOn+w
         1xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726568307; x=1727173107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3I8RvtrkEGLcn/jjCsGtDX+89c/RzZJGXWndr0k2ts=;
        b=Lqif6SrAKrxvoc0hyf6uwJGig9QR2hLndo5vb3b4fCl9CObkbXhdYFQkUIP+vObjHE
         jkTo+gL+fdBYP2m+8Dnbw1/UeawvJByO4HnrnK0jxci9u7QhdUbvJRVZ8yCazMPE5b2F
         kUK9y5iyzAnW5TLJTwqhslboBWma3M3YbackpyaPcURjUILMr5Zsxz5UAj179iKjQIYM
         VQl41Y0wzXpLKIvvrQjEWDUn6tiHSVGtL9QrNc0td3rsLw9oklrsBFV4xR1i19yGVRiP
         ctDIdSC6XgTTdqY0xdI/NFNBWgHLgZ+btaRZoZyxbFkhLO3lxnf8/A2a1v+bwdadtYmJ
         +x1w==
X-Gm-Message-State: AOJu0YxK65kCufATzvWH9fkwDU2MmUZvo1gvFwNzZ6p5ecVUHwVlWIli
	uuFBP0RlOM6RvgXp9lWgdVtCa7SM18kl21FARqYr5XBU1gKG1+Kxvuh8f2kfFS5C7lbVDSHAwwE
	GzpHQvdfKcmtwad1VWJh3gppIUA==
X-Google-Smtp-Source: AGHT+IFPC7DuVhYOkzCC23HgXMsE9KQr7nFypNg6U23LTW2Jqo3RSrdGkptdza7AxI6UwIQn0MGyh39umF9wjGpzJPM=
X-Received: by 2002:a17:907:f72a:b0:a80:7193:bd93 with SMTP id
 a640c23a62f3a-a9029447148mr1934202366b.25.1726568307199; Tue, 17 Sep 2024
 03:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-4-erezgeva@nwtime.org>
In-Reply-To: <20240917094956.437078-4-erezgeva@nwtime.org>
From: Erez <erezgeva2@gmail.com>
Date: Tue, 17 Sep 2024 12:17:50 +0200
Message-ID: <CANeKEMMDj2D9x5jbOEbDDtbN_NG22mJwDPJva+bT-p6RJawMdg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Erez Geva <erezgeva@nwtime.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_031830_070973_178F1203 
X-CRM114-Status: GOOD (  22.28  )
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

On Tue, 17 Sept 2024 at 11:50, Erez Geva <erezgeva@nwtime.org> wrote:
>
> From: Erez Geva <ErezGeva2@gmail.com>
>
> Some flash devices need OTP parameters in device tree.
> As we can not deduce the parameters based on JEDEC ID or SFDP.
>
> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> ---
>  .../bindings/mtd/jedec,spi-nor.yaml           | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 6e3afb42926e..d502b7fab2ce 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -90,6 +90,43 @@ properties:
>        the SRWD bit while writing the status register. WP# signal hard strapped to GND
>        can be a valid use case.
>
> +  opt_n_regions:
> +    type: u32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> +      This parameter indicates the number of OTP regions.
> +      The value must be larger than 1 and mandatory for OTP.

Sorry: "The value must be larger or equal to 1 and mandatory for OTP.
"

> +
> +  otp_len:
> +    type: u32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> +      This parameter indicates the size (length) in bytes of an OTP region.
> +      Currently the driver supports symmetric OTP,
> +       which means all regions must use the same size.
> +      The value must be positive and mandatory for OTP.
> +
> +  otp_offset:
> +    type: u32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> +      This parameter indicates the offset in bytes of
> +       an OTP region relative to its previous.
> +      User can omit it if the offset equals the length.
> +      Or in case we have a single OTP region.
> +
> +  otp_base:
> +    type: u32
> +    description:
> +      Some flash devices need OTP parameters in the device tree.
> +      As we can not deduce the parameters based on JEDEC ID or SFDP.
> +      This parameter indicates the base in bytes of the first OTP region.
> +      User can omit it if the base is zero.
> +      I.e. the address of the first OTP region starts from 0.
> +
>    reset-gpios:
>      description:
>        A GPIO line connected to the RESET (active low) signal of the device.
> --
> 2.39.5
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
