Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED77C0502C
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uCwSOKAls9lPpSCL7XPIjkTaYpsKUTuk/Rr/arNCaU=; b=e7jcWYTJrBTBTb
	Y/LlweCcTGulWflva5yqoI+liuPbyV54FfFSV7hJEp2rM8J5J8QHHfuvxu3ZP115cPaAnuEbPTlqV
	/QnboiYooWLd7KqtcBXM4cqDPOeK9zJHKVKrJsu1QEvLUdsaZoNSIvbnx2QK6t+01v/Z3e9YpOk2f
	kaBq4io2diLp58mJd9xIzFM3uHGiAbM9CeoCXx6/uaq93Vh7qI5OzIqjGvEXTTjWwJ2mdSCx8FBrI
	lYXS57zMd/TIFZa464m/dJHSNqYt7FT4oBwhm553p8XB5U/9QnKa/StaRmq9T2eeOb4mMc3CWMGmD
	T3DS4f2bJ1mpQy7TpUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIIn-004dG6-6s; Wed, 31 Aug 2022 07:38:21 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIIP-004d87-O8
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 07:38:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g7so1789454lfe.11
        for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2022 00:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yV0Q/B0XwshgejdYWiZZL4lEpfYH4+n29m2VXh7RRNk=;
        b=Mpb/fFsJGrIPxVaNtfFLx695Ajlwkj/6pjPubbDa2vX34HXKOSRtX3pH/roJ8thsWJ
         7ki51ZrQSa6VVJ9k5Gy6PJtbf5WaVlRNIT2ewDJEh3THVRNGSsRA3j4hGh0fnh/z60lG
         xYl00kkiMj+a2JvQxVKmmKJnfDEa9IR+ooAC1W8YKqQdR2CyEEti0xXZESkMhGoNy0Nk
         RFfjs0TvU9V5pCPHUMlukGeR4Zknvb5dc5dlPJgSAJ4XJmxtoJbbMmSqAna14kt88YMi
         RtFtKN1m9JjpvH9+Lm8cwO+PZgifUid5rXz3oK9cbOWI7ZslDU7EPO86NNbJ+YTeTA0v
         gBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=yV0Q/B0XwshgejdYWiZZL4lEpfYH4+n29m2VXh7RRNk=;
        b=M+NSY9RJN3ac+EPmlvSSkrB5SvsUojZXFsWNaJMigxnyu2WJQivphDFRl9y7F+VB17
         LhCo9kn8FjpHmztoRrpr/7857ucag8SzxcZKzC6S03FGww0O4scQgHtQ4Xwqmcn7l0OK
         6+fm/UsouGmeJbJmxRldui8V5Nof/IiChg1EXCxcDMufZ9UmzFMJgr/DJpLmoxzW92GU
         N3VkABNIVx/3hkfEJv3ne8BytHFdzGaDceP7LC1Cu/8GzTp3oJLBo5B3rVUeS4mBAag8
         BkoRnLgJq+U+9Pzrg10ccxxzTIjBXbUAAtEZpwaE+V+KYZ1yK+8rLj1+rhZv1DdCklQT
         Df5A==
X-Gm-Message-State: ACgBeo0gxmKV0glFZqWS+Y+BPtce2zrid0qBlJsHDxXZnQpvo4Iq3sU+
	kq5ufK8urCVIyfO8utmdbL37Fg==
X-Google-Smtp-Source: AA6agR5boSacIQqXB/d2C7VV98i93eO6195dqw6oNKs9ez+yXfxtG4ZM3h9pwXz9k+QFVj5F3myy2w==
X-Received: by 2002:a05:6512:92f:b0:494:7095:135f with SMTP id f15-20020a056512092f00b004947095135fmr3223951lft.242.1661931473787;
        Wed, 31 Aug 2022 00:37:53 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id a3-20020ac25e63000000b004947fbc5d28sm434943lfr.303.2022.08.31.00.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 00:37:53 -0700 (PDT)
Message-ID: <e0afa0fc-4718-2aa1-2555-4ebb2274850b@linaro.org>
Date: Wed, 31 Aug 2022 10:37:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 08/14] dt-bindings: mtd: relax the nvmem compatible
 string
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-9-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825214423.903672-9-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_003757_856428_391A655B 
X-CRM114-Status: GOOD (  17.42  )
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

On 26/08/2022 00:44, Michael Walle wrote:
> The "user-otp" and "factory-otp" compatible string just depicts a
> generic NVMEM device. But an actual device tree node might as well
> contain a more specific compatible string. Make it possible to add
> more specific binding elsewere and just match part of the compatibles

typo: elsewhere

> here.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 376b679cfc70..0291e439b6a6 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -33,9 +33,10 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        enum:
> -          - user-otp
> -          - factory-otp
> +        contains:
> +          enum:
> +            - user-otp
> +            - factory-otp

This does not work in the "elsewhere" place. You need to use similar
approach as we do for syscon or primecell.

>  
>      required:
>        - compatible


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
