Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF6BC0015E
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLdjRonR/P5EEoMNmA0gjuN7piFX1zDE+/0J8r4gM2g=; b=ZISrJXe9zKA+Fs
	LPRLmxfBGgonzXTeajvRYl511vdwmqXmiGZaO86fANF6e/9ieSPJDT7fl9b+OtRqBEQADjz9o4ROa
	wMrnEyhc6CdQ97zBuObuZCj1i/vAlY903L412fhG2/iDAI35uDA4QG5r5KbJX/69PmJltYlp+owZD
	3BuVX1qYrLT5lpoZPvaIZSOKA+vWqFBWMqcK9YiWEmGjUwodpxRJVkHa1Qg7NV1LUR733fXckNz1d
	nXmk+hGpHPKXyvVnlkMa63yBpMakiF6WWnKX8Z4ysOykDwuaMMCAPF/EFNTgyt8DRQP9rrx8Ol2TQ
	P/R5ouaJP9izQkIbKwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4yK-00GR24-1R;
	Wed, 05 Jul 2023 16:03:16 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4yH-00GR0I-1c;
	Wed, 05 Jul 2023 16:03:14 +0000
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7836272f36eso262134839f.1;
        Wed, 05 Jul 2023 09:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572985; x=1691164985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KBpOFJZyS5xM9abNo2nJ57ufwQERCZ3x55i0T0eDUY=;
        b=lzOcFfZhH+1xwHyK0c/ZODQupBUr4hLBl9gO6+1X5y9TDKvMRMANjBU51+t8yIzix/
         J6hU9OC7zBH6AVWHoXVXX76kdKZ5OeXHtXGHz3WN+WYMa8ddckOCaG/+vuaToa64RQC9
         6PCRYOAaf0ueQiNUt03D3po0fiFU3EFYQ2P5bnoB3A+Rd1R7UMoSOzW05G3OYMQaTCsO
         tSvpQvOfXVckS80vma2JCCTsTbQYNB1rtuMO7r3vul3zbOhuDSWZpXiblAtBr8AGi9yr
         yx0d2bZ2qmqVgEriZViJKT9jrn4RQITjzhnCxjz/AXpa/gAh8dBIColiD5ffnK4HmAAf
         fIsA==
X-Gm-Message-State: AC+VfDzRWgwW7cu7ljcOt9fmV/p2Nuj7qnOMgkBqYpuyi5VQoD0Nmhfx
	fV5QeV2ENR9B+8/cnuAYpg==
X-Google-Smtp-Source: ACHHUZ5Z8VqWZ/v/LomwEhPw2FxxUKwe6Z2nAX7VtpW4YDpUCLHgztTIHZAFe8baQtOy8AZBd0mglg==
X-Received: by 2002:a5e:c910:0:b0:783:58f4:2e2e with SMTP id z16-20020a5ec910000000b0078358f42e2emr16821097iol.0.1688572984946;
        Wed, 05 Jul 2023 09:03:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k9-20020a02c769000000b0042b449ac66dsm2108515jao.56.2023.07.05.09.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 09:03:04 -0700 (PDT)
Received: (nullmailer pid 712513 invoked by uid 1000);
	Wed, 05 Jul 2023 16:03:01 -0000
Date: Wed, 5 Jul 2023 10:03:01 -0600
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Vignesh Raghavendra <vigneshr@ti.com>, kernel@sberdevices.ru, Richard Weinberger <richard@nod.at>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, Liang Yang <liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, oxffffaa@gmail.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: nand: meson: support for 512B
 ECC step size
Message-ID: <168857288612.706374.4421201197090184183.robh@kernel.org>
References: <20230705065434.297040-1-AVKrasnov@sberdevices.ru>
 <20230705065434.297040-2-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705065434.297040-2-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_090313_544638_9FAD2F48 
X-CRM114-Status: GOOD (  12.58  )
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


On Wed, 05 Jul 2023 09:54:33 +0300, Arseniy Krasnov wrote:
> Meson NAND supports both 512B and 1024B ECC step size, so replace
> 'const' for only 1024B step size with enum for both sizes.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
