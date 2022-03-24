Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA7CC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Mar 2022 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBco/PPIMQWAtYPeqAyFr33sCEYBrRZ026sK/an/0vg=; b=gtuohJBY+5fY+G
	10HfchWsrC48zZdplbFA/YmcavQ7PvojGighGhz9QsKfMpQWFskydJyZFACaHRSEJO2Jjv+U0eYe3
	CJd424NnttI7AH7qNNXgxV0GoySplloKksYBRpJcZJgoLVeXzyHpUme56rzr9mmGjX0CcaDDAEuz9
	qC6rILw+EnbVK5xhN6Zc/bcSHlpBjD3znq7xzfgyaKDd1mNAB8GpzI0i0fJFUYoyxahFb9gE1VvhA
	y9SVIbh5cLyKht/i7CIXpvwIhHiE11TgAav64BF+svWSgvhpYb4j6hfIMHCNE1q51wLNfFwskx6s0
	uS5TQLsKG4qA8Y836ePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXSAd-00HXKe-LX; Thu, 24 Mar 2022 18:26:51 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXSAb-00HXJy-36
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2022 18:26:50 +0000
Received: by mail-wr1-f44.google.com with SMTP id t11so7832947wrm.5
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2022 11:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ll8lTEzX7b6jQhE2gytfK7yWoO7uXMFriD9yXNvHFxA=;
 b=VKKeBayDIxc+1uMqUwWCCIL5j87VioyM29itbd2Olckf9lIdbMNyjnMgPL00JplwWY
 YYctR+dkozGXNq5sMtJU5WNQfjtU5NA/LdNu35JK0SVmKQKag/5eWMK0xn9UDxprpM1P
 SpevVMQ49kW5GY87XqqVTb6gGPAlDi9VVCzjM+2SOUIwPhR2o48/jqDU0Xd7bd6o+gnT
 Mqq9y7n/M9ZYdZNVc3RWVoRM0lmMR9orXiKvVYlDEHqWn8RkcgIxXgEQWC9ur/ZoB6nv
 AnA8GEM70hUKspb+9r0t5XGlmxpK4g+KgSlVOcutIg0tUpT2/PP/pc3/zVwOEmBtVbbC
 ol0g==
X-Gm-Message-State: AOAM533l85Gok7XasuzaMG0cfRCVVBY+rd/tVq8pYpXqwAL9OfgmdPEW
 Q3ttcXz8C0Gb6zFVlACk28A=
X-Google-Smtp-Source: ABdhPJyk9Ii8AQjHwYY3xi67+Wyfe9bye7WPGut9xFho/54di6GA0bmhFtFrG3MCqfnv4Bylbidwcg==
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr5430360wrc.513.1648146407177; 
 Thu, 24 Mar 2022 11:26:47 -0700 (PDT)
Received: from [192.168.0.158] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 a4-20020a05600c348400b0038cd743830esm1459999wmq.29.2022.03.24.11.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 11:26:46 -0700 (PDT)
Message-ID: <a222efb1-4f95-d65d-919b-ed55c5448c9a@kernel.org>
Date: Thu, 24 Mar 2022 19:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] dt-bindings: mtd: ti,elm: Add support for AM64 ELM
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220323111851.4699-1-rogerq@kernel.org>
 <20220323111851.4699-3-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220323111851.4699-3-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_112649_167458_664ACBD9 
X-CRM114-Status: GOOD (  15.91  )
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

On 23/03/2022 12:18, Roger Quadros wrote:
> TI's AM64 SoC has the Error Locator Module. Add compatible and
> related properties to support ELM on AM64 SoC.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/ti,elm.yaml       | 27 ++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> index 24ed0fb84204..bc01d35ce605 100644
> --- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> @@ -17,7 +17,9 @@ description:
>  properties:
>    compatible:
>      items:
> -      - const: ti,am3352-elm
> +      - enum:
> +          - ti,am3352-elm
> +          - ti,am64-elm
>  
>    reg:
>      maxItems: 1
> @@ -25,6 +27,17 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +    description: Functional clock.
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +
> +  power-domains:
> +    maxItems: 1
> +
>    ti,hwmods:
>      description:
>        Name of the HWMOD associated with ELM. This is for legacy
> @@ -37,6 +50,18 @@ required:
>    - reg
>    - interrupts
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am64-elm
> +    then:
> +      required:
> +        - clocks
> +        - clock-names
> +        - power-domains

Are these new properties also valid for am3352?

> +
>  additionalProperties: false
>  
>  examples:


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
