Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C93EC001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kn+rmpQDsYIkM9fWkmGwoqo2cAms3eSAk1wFkfN5V0E=; b=kb2lU02FotMA3D
	wnHT04L2yCYqLI546mZFR2tNhRelK7fKoUR3YViSjQjDCneZCYWtZPUifplExJ3OjHo/BW6oCCHjY
	YiuacQdZzdYuSQkKcHan8EAxyZsafWr+E2zlQRbizfqi+c6GOXStKnAz/EWHyX1A46vZZtxZo9ad+
	ZIEj3/wwj+uuWHzXT25D1M56XMNn+mNz+/cyTzYyswK06dmKjPkJ3u1B1EhsZ0M8TyzgHs8DeoCwQ
	rSJjGcdHlthGBDI865e/SR8nz1ZnnWJF0HKW50FaoabIItk+gPdZayWhKrFM3TEeuzyKmWAMxjBkO
	5zK8N0em0NZMeAlx1EPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLJ0-0036ue-1p;
	Fri, 28 Jul 2023 11:06:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLIw-0036t5-02
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 11:06:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so21895985e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jul 2023 04:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690542398; x=1691147198;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CU70Eh2OqmXn/mXGJvsy6fLIYE8In/MkQR/tQEWkQOM=;
        b=qc+LVsKsC9fZ7c+Rtm+B2SsFYCOiBYG5PWTpso7gwBhW+WfgE5FpsPvkjpvfFHSgFP
         StwtdmRslvH+8jrCQN8cxve8M3slE8/gQzVRrvDpdDe6+Opb1KHGXSeyCqVcK6BRsDcr
         l7X586fVfKFo2JKJeIGJIiiWduAhFhfe5vIY2ubTBAKrjg9BxrtNe7T5sxSfYWHg/UrV
         kgEmRQB3wj5p66rxdWRvFmSMk0KrbHQyK7QPSSAamjhP6m1Snkh6Hi2upAHmaGuOZ5gq
         /XhqobN4OCxcEPbfQSWZkLnmkGrMq01Ov+1q9i2Yl+zYniaL/2EjPgfP+2LUe+2J8IcY
         +qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542398; x=1691147198;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CU70Eh2OqmXn/mXGJvsy6fLIYE8In/MkQR/tQEWkQOM=;
        b=F72p25rjOJc3Ox++HrrMqE02qbxGwm+hWoYtZ4Aazz+VdOficvr9TMen06vsNLQ8c9
         RX9oUoZ7Ixig06mpuVyM+GMtRMhvtLfA5Ly+KqS7QH0nVytDIY3hXIYYq9uVuA5y8NJx
         Me22xOV/RiEyrD1/dKwb9k4q+IVBcuKzR9uO9ah/YgODQE6bShYNDLQSfoy+4T2nhbaM
         pGJFR36fB9VI2yD0A3LI5tL9E63X+JgHqz7UPkLWi3ka1j235BwZCj9zd/rn3XbaXRZF
         gALDOsHWtBhD4ZF4Ul0HBuvVkyu2ZjNWwiSZmGOP9FQVlbKhgVU0uRptJlfEWUOveSCL
         G4qQ==
X-Gm-Message-State: ABy/qLax+8KvBucLV3HilwUKlgBZ9r87GSCEFmyccEC1rWhirRuWLON5
	T1W4y5JPnKyjcaOfBwgZS4mQuA==
X-Google-Smtp-Source: APBJJlHjVByBvBfppyeBdQWe2dS7fGbuNTvvMqTHXVJ0Cu9SAu5uwxXYOY65e950xrmaJkwlvIO39A==
X-Received: by 2002:a05:600c:20c4:b0:3fb:e643:1225 with SMTP id y4-20020a05600c20c400b003fbe6431225mr1636663wmm.13.1690542397797;
        Fri, 28 Jul 2023 04:06:37 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id n5-20020a7bc5c5000000b003fbe4cecc3bsm6831870wmk.16.2023.07.28.04.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:06:37 -0700 (PDT)
Message-ID: <b5c44fc5-005d-6268-af68-85eda9c330ba@linaro.org>
Date: Fri, 28 Jul 2023 12:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 20/50] dt-bindings: atmel-nand: add
 microchip,sam9x7-pmecc
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230728102636.266309-1-varshini.rajendran@microchip.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230728102636.266309-1-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_040642_366649_E64756BD 
X-CRM114-Status: GOOD (  13.96  )
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



On 7/28/23 11:26, Varshini Rajendran wrote:
> Add microchip,sam9x7-pmecc to DT bindings documentation.
> 

Why? What's the underlying problem that motivated you do this patch?

> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 50645828ac20..4598930851d9 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -56,6 +56,7 @@ Required properties:
>  	"atmel,sama5d4-pmecc"
>  	"atmel,sama5d2-pmecc"
>  	"microchip,sam9x60-pmecc"
> +	"microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc"
>  - reg: should contain 2 register ranges. The first one is pointing to the PMECC
>         block, and the second one to the PMECC_ERRLOC block.
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
