Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A564C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hjb58jatqFgG9FoCodmdLrDxnulj9lb+UbkmrdPQRRA=; b=2UrO6Lmcwu3mtz
	pCPQwmhhCLiScHUCx3qh4WqEz31PU5BoVgqJ00iOR3XJX9D+2GdZaXxP2nSj9M12HG8vJwQUA0Fuv
	7cxe8rL6TtxN5HCHKQyJceFB9BD6i5/fuilGGg5JSJ0MSd+/7C2BePFpCI5J3IW6jQPhm5d5OZdT3
	fnnC1dIS++fwzRpmIpkd98g7dWMLaDg8McDVsuJpaejuWnQfGnXI5QoYZCOF/mDEP1O6ylK+0ZVnj
	YOKiJv8503ViscOdHKObKBaq1dJYZsAbPysTPJjnI6+dnOR3FuxN0RC3Du735Km91+91RhB52cOla
	RRjg17DjGLLiTD9vLRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMtD-00A6pf-No; Thu, 07 Apr 2022 07:49:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMsv-00A6ev-80
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 07:48:54 +0000
Received: by mail-ed1-x534.google.com with SMTP id b15so5418079edn.4
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7eOOLrAKkfSspaBOmVeWY/1P1p3w24BPhUI3ADFJBCI=;
 b=sogAdtsAFC5HCuOZDlP9hCKRUcFarSAAFtArxcpakHbjtI+H6rlxyAdZEWFLiv3Ew0
 ZiX/ecvjddUhTtCRabR7BgUoqBDDKxzxu5kKlGDuxPv1RYCalrkCJ7aDGWwQ0oKQG+H+
 wWrk8gsx7JZHJSziIF4YYk+huAMheAeS92FXTkdOAdHYrU1ZfJCa41bjAIpJY8/gBI5x
 Z13miNyaXnegSrvQi6qzse8DCg5Q1LotTJtkFOgzarqJI5gapKutHVVGlw2tnrrBMbrE
 rQnYTR14EEKGq61ygs7BSzBZejgH0+DC+46oXgFRHZQWkpr53Q08n05BcMKaE7MQPMb6
 HtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7eOOLrAKkfSspaBOmVeWY/1P1p3w24BPhUI3ADFJBCI=;
 b=NA1fpeKufdC2LgGF/7Bz3DOIUzwYAazlGm0VAx54yc+aZ7k43BV2P8n5TmYaJMcIcO
 RA79FUx/tZf7zmP1vxaJYFz2rtgePgR5VbAtrUrXwMShVzxT8w7Y7H41KYRB9scjEoOB
 4Hj2kI9G2b6SXPvGuZVWnrRN7KOWFwZk5IK8pWlOYhUifno/GexktnnA6+NxKHf/V/cL
 HUDIz4gFQ6c77XgwrEGIANkyL64pJVMcygHHiJd5QWa5eBfUiYs8KzCvnfwdDZxy9VYH
 Yii+wLEtTbs78UE/zoU1JM/4DPssitYbhrPij6vrvADLlbUp3h/r46sXb0XFhEaa7Aix
 X1gw==
X-Gm-Message-State: AOAM5320pFtUGPx8/xbUzee6+IF7mJ7Ya7HS7HYEU/aQpLN29p0Qwaak
 yhr8Y9Jq1dLajy5c+EJyi9XhjA==
X-Google-Smtp-Source: ABdhPJzKpXrgUntAlAYZkvnH4zfUSRM5PQ4E+Cc2yBNkZba/USPxqi82SB3TMQkqjHPHvGE7GCEhtg==
X-Received: by 2002:a05:6402:26d0:b0:419:75eb:b3a with SMTP id
 x16-20020a05640226d000b0041975eb0b3amr13084176edd.0.1649317731392; 
 Thu, 07 Apr 2022 00:48:51 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 n25-20020aa7db59000000b00415965e9727sm8747258edt.18.2022.04.07.00.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 00:48:50 -0700 (PDT)
Message-ID: <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
Date: Thu, 7 Apr 2022 09:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406195946.2019-1-csharper2005@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_004853_356879_D4B4D4AB 
X-CRM114-Status: GOOD (  11.44  )
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

On 06/04/2022 21:59, Mikhail Zhilkin wrote:
> Add YAML binding for Sercomm partition parser.
> 
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
> ---
>  .../mtd/partitions/sercomm,sc-partitions.yaml | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.yaml
> 

(...)


> +
> +properties:
> +  compatible:
> +    const: sercomm,sc-partitions
> +
> +  scpart-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Partition id in Sercomm partition map

Do you really need it? The reg should define the order, unless you
expect some incomplete partition list?

In any case this requires vendor prefix.

> +
> +required:
> +  - compatible

Missing reg.

> +  - scpart-id
> +
> +additionalProperties: false

Are you sure that you tested your bindings? You miss here address/size
cells and children, so you should have big fat warning.

Plus your DTS example has error and does not compile...

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
