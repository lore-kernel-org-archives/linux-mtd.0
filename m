Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB58EC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeoprVSzPSPAknxlgY1jS3eDkETq+74flM51zcwz0w0=; b=23FjDCgdC76TMq
	3A5YJKO3uH22xjUoM0HqJG5XVoEVR/0d4Oe0Mwdzmnzx+nDTOw4Q/ZCpA1tN+Qpnwt+MC/k9t7udj
	ATQEgMEpso4D9kWy4bnM+564GcLp9DaiVd3toe6gvtV7hEkdTrxw8A8EGnP5a7+9G6nduB4RYAWpU
	hHHOxRGlYMDbrKsOVdKRsQ+x2T8mR3d/uYlQuYk/31zJsqm3sPXQzcjibz/koa0O6qsKGI+XTN0qA
	08cUW/83jeWjTe9xTuVXUolHGuRByE/M0MNdFQGMVZ1+VskQ/QXhma7v/f0hQs5c025GluqlO2hMP
	ISpeBJltX9AZW3TEfY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKL9H-006aCM-0I;
	Fri, 14 Jul 2023 15:56:03 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKL9E-006aA6-1M;
	Fri, 14 Jul 2023 15:56:02 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-78625caa702so81240039f.1;
        Fri, 14 Jul 2023 08:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689350156; x=1691942156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNZFP4mW99DwtXznitHmmJIt+x4d+svOUE0Ehy3Kg9c=;
        b=LPOrIg0ce+mffMpGjn/0DdpYdqLCdV7dbtQOiUVKqyHU5LBkiNQ49OskzB3ISq6fDI
         wMhfaJw1MTHjnKEWrcxnPzZ/SMeaIIvhTZWByH9YlwI1aRh5ENHLkLhbZYzIMR38R8T8
         YXApKeHR5NFVzVIhEianqNxv8k0pwJmg734eFRh9xO3+3vJsF8TOBiV6Xx5s17455PNS
         d5iv9zen5Ov+KNfGfFpK0EOiPHSdc/mDVOr2yaapXpGogDkVUumjB0vihWNaJWJ7ct1m
         kgUxaiNcezoQhUMt57GI1Sb/xuYdVdt+P5tD8jewAV36lPGxlacmRZDT97Iyvth1aVIR
         5Lyw==
X-Gm-Message-State: ABy/qLbESIOty8KKNJsciOIIRprqsRBZwuiUBiy1beQ8jFm9Dl7CWvPn
	vFKpfUoANm3Ft9ZCohrjJg==
X-Google-Smtp-Source: APBJJlE4L549pt9iOdB31Vv+jb4GGXjOF7BIKHFlzpjgKeW0XdyUUPL86H99oVrbGwrQ07NryN3fzQ==
X-Received: by 2002:a5d:9b0d:0:b0:785:d4f5:2225 with SMTP id y13-20020a5d9b0d000000b00785d4f52225mr5028184ion.19.1689350156613;
        Fri, 14 Jul 2023 08:55:56 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h17-20020a02c4d1000000b0042b8566a982sm2648207jaj.41.2023.07.14.08.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 08:55:55 -0700 (PDT)
Received: (nullmailer pid 3916353 invoked by uid 1000);
	Fri, 14 Jul 2023 15:55:53 -0000
Date: Fri, 14 Jul 2023 09:55:53 -0600
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] dt-bindings: nand: meson: make ECC properties
 dependent
Message-ID: <20230714155553.GA3913802-robh@kernel.org>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
 <20230711122129.2635558-3-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711122129.2635558-3-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_085600_459133_2844A313 
X-CRM114-Status: GOOD (  16.18  )
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

On Tue, Jul 11, 2023 at 03:21:28PM +0300, Arseniy Krasnov wrote:
> ECC properties 'nand-ecc-strength' and 'nand-ecc-step-size' depends on
> each other, so they must be both either set or not set. 

Is that true for all drivers or just meson?

> In first case
> ECC core will try to use these values if possible (by checking ECC caps
> provided by driver), in second case ECC core will select most optimal
> values for both properties.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> index e81757c9e0ed..4f6e56542a7e 100644
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -58,6 +58,10 @@ patternProperties:
>              meson-gxl-nfc 8, 16, 24, 30, 40, 50, 60
>              meson-axg-nfc 8
>  
> +    dependencies:
> +      nand-ecc-strength: ['nand-ecc-step-size']
> +      nand-ecc-step-size: ['nand-ecc-strength']
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.35.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
