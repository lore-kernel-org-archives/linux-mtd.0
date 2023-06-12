Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDB4C7EE25
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuOm6It2ci5dwXC0ipMWuT3DKBpPmvUAUUBxqqIsu/Y=; b=TXLVdN7HWbLDYm
	F17TbtnKJQYd/HDRcaVFE8ZbPL+53X/89HPZWH9Yv/Lr71vDOcRN9/+WUMPZwpn6xo8yMD6RHaxWN
	IvXxAhJvIpM+PNEZzwgZicaOoFvIIwYTpwRh0EOw+5C/j40/nvcC+9ti+Hf7OGV0ycjjJSpFJr3Ob
	vf1K98wN1JRBoa2UhI7DXb/sQPqTEMaQmhaOgqm66vO0JLcsUXpmXD2A+m0D+4LRO3Emg/UU6Q1r8
	JcKZjpHndHHG3upgfaaKl/DBlKiEzrwcK562iUFsDrTOkx1rGVxWJp0B1SNRs4h1wtgm4CndDOTvO
	Ww9tN4yI8wL3li5Wzjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eLM-003P5X-2M;
	Mon, 12 Jun 2023 10:00:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eLK-003P4t-0B
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:00:11 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9745c5fed21so613986266b.3
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686564005; x=1689156005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cd7PhI4uncnTBCRMKgoa7sypXa7kqhSnYna6vDQQeow=;
        b=F+7Yu/f1+j3+vRBhYgWtieqt0qms3jcRwDPwXt+L6e6GgznULpKxyB5ci9Hy554hcW
         j48aqd98950HMcSdU3FA501Igb508c98RN/+i62T/n4TT+4SNah8RVTxGQVwfVHoDKgA
         S7DFNUGEo3jeSiOArBu1S6Ou0RxmqEJyH7+lgGLDMY0NquFvI9/5Cciys8ErvCJXYOSu
         3/V1BSi0cVMe3CLPBS3jr06DdXJi0uyFZM0V/ikzIxaDuoccoUJqsU1YHQ/71VwJh1sh
         YOk4dDW+VjqJ4pFtJam3NIzoU+gkpdb7pp65CGas96lb57OIxfDnYVcd7D4a6WfkET4G
         mBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564005; x=1689156005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd7PhI4uncnTBCRMKgoa7sypXa7kqhSnYna6vDQQeow=;
        b=e1jyugkK0OhwjERBfvUosQzW/04mRk5GXLKHHNKBXDdQQxgt4jbgHXEH3XQTM0V+Qx
         uogFWf2q9p9gxTnjeQK99mLP+dokgHguc7oSqLrc72gkShFoVL96mo83MVDyZ/kgZx4Q
         JK7TB/qEAup3nxbvxeuFQEau4DsiwHW51syfXLdYyGEPAp+PRQfuZaCXvyYw8t8teP2Y
         gptvTZLHrZu33gesB9Ny1gyg88obebS9/Dv2i/HGOXOjJ/Mp4CseacodltVuB2bBNhj/
         BpBE609R0X6DxpOlHaBRnQgoGv4KzMfdeWhCeubyTAKxueMH2TnVWD8lguPtpor29OB6
         7RKg==
X-Gm-Message-State: AC+VfDyUbRli0sLcjfe6RhtunQLHBR/vF0JkYqShYd48/XQD1blo8xzJ
	LIUGGc3uCOg8smImRzGdgEWubw==
X-Google-Smtp-Source: ACHHUZ4Y0HfTQsMP/LWxD0BzuVSdyG9mh0VPmXlcP3jMPRUZkYIbvXzz/r2xBtIm3lJM4PEpSXNM6Q==
X-Received: by 2002:a17:906:7303:b0:96f:893:7f5 with SMTP id di3-20020a170906730300b0096f089307f5mr9512875ejc.26.1686564005582;
        Mon, 12 Jun 2023 03:00:05 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id dk17-20020a170906f0d100b0097886843f75sm5035070ejb.177.2023.06.12.03.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:00:04 -0700 (PDT)
Message-ID: <d816499e-baab-6200-0780-17a8205b252e@linaro.org>
Date: Mon, 12 Jun 2023 11:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Document sst26vf0xxb flash
 series
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
 <20230609144324.850617-2-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230609144324.850617-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030010_123819_581221E9 
X-CRM114-Status: GOOD (  15.74  )
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



On 6/9/23 15:43, Miquel Raynal wrote:
> Add compatibles for the sst26vf0{40,80,16,32,64}b flash devices.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 7149784a36ac..5a788a429b0d 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -25,7 +25,7 @@ properties:
>                (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
>                (mxicy|macronix),mx25u(4033|4035)|\
>                (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
> -              (sst|microchip),sst25vf(016b|032b|040b)|\
> +              (sst|microchip),sst(25|26)vf(008|016|032|040|064)b|\

We don't add new compatibles to this list, one should instead use the
generic jedec,spi-nor compatible. Please drop this patch.

>                (sst,)?sst26wf016b|\
>                (sst,)?sst25wf(040b|080)|\
>                winbond,w25x(80|32)|\

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
