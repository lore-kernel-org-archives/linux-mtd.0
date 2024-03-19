Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A7FC54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdGyiuQkZxYicHqsAkpWQBq6LKEzMotFj7pIH/asbXU=; b=HB1fRRIZIyq2xm
	ONeXEIOiKuxKHL/9ftmqSXKFo6c9chu2OOegyKpKBnSvZ1vCqRXiCr+sLnCmlRElta8Yw3whRGFXC
	sDb4skI4F3ikW65fk6EFab1r8zRLP2ErudmX5Vrr5+ieFD26k684FTMWuVP8xu/yWlH/SsASYdnN+
	izcHMg/txTbwnLcs9xx81SROsh6i28rJlk9jky4yzPjRRKHH27m3M0gxlAKmNjcLV+4C7rt72kj1T
	rthUeFlZMunPXSCj/9oanEYZuko0GQ6CdKGNMBHoylL8juOrvTEVspd//4/qlIIcderGKYFcpO8vZ
	2OtC7WEkFzTdNiv+oBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmW6l-0000000CA23-3DhY;
	Tue, 19 Mar 2024 09:50:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmW6i-0000000C9zy-29xy
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 09:50:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a450bedffdfso645072466b.3
        for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2024 02:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710841805; x=1711446605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/3djFcV85FlUlQbj3yunmUo0E6cySmtvMQYg/G6jYmk=;
        b=BQhDr3uvoYZH1Ax4mc+OptqInsATDWGtFof7HLuTcTHi6772TfzOcA8YJmHR9rwSEH
         3CuR4d8lrz53HY8UNWe7h6jnJS3dquxs7Esr3xaoedIo6XRlC/oL8zYeU4DK0B82bzbG
         EyGQ7T850ugKVGeG4JFLi3NhcV2brdZtRmDqDDP25q0fJJ4tmSoJH/oJ0dgzMESd29Gr
         H+VS1F0xd8bKbCowS36xUL/MR+K5Svrqz8vZxcxKRxgIW5AZstk9DPhndCLNJUtHaz8r
         xougtr8bQmlSa6fv3y+YxgAZXoUIpaXjmlyLtvzsdoBXJK9OZenyYhwdbEoaBuGY0GaN
         xOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710841805; x=1711446605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3djFcV85FlUlQbj3yunmUo0E6cySmtvMQYg/G6jYmk=;
        b=XsgZv6KUnvbptVUTc4ats+tlYsMGH/NHyVH5JufEqtnIBJwKD3LjUcSFsKFJGK3lDS
         LctaHskIb+o2QaEnBC4wT6RtjBgcQn/TerBWqDv48LVR2c/NVYbhM6QIkmnbQOhFl6a0
         bSJwsM03FkcOEJYgC9iW4/VSOg22cC7KGOjBc1LyxP+AnBq69QUWJkBaVW1BwEmBGo3d
         uiaoajd07bhrq7WNKR2aYu6LtvBx8QfbVyRdU2Jw78Qz/t9E6XO0nZk58oFx3OGuaDVd
         D5nt9cfKf+mzxA4471eCBMlbc+2w5n9JwzHeHMuSAorZWuHaRj22Y4pN1BHsOnD1ykEa
         28rw==
X-Forwarded-Encrypted: i=1; AJvYcCXUGmxSfMB+dpaCkTayvX3Y8MUeG0hCwQ1kEKUoRcfKspQFTGJtvPfxf/zUTk0AeMqFHq5Eu2lj5AvpBmKeNWPuRAyB7YX516m33BkfLQ==
X-Gm-Message-State: AOJu0Yxxuw3bwOnM+Eq0IIZQYBGr5jD/oqIWQVVDfiqOMK5nuSHcR9lD
	2uplo/a5yQj5fkotGknJ8BGQ5/Y9faU3QZcoEF/Z1pRtWRixqejaivHHqBdhRcw=
X-Google-Smtp-Source: AGHT+IHub3GerXpEi0+h2eEzC/rsUiII/Qbh7o0i096OhIsOQOgoPcmYiKDyB+SU92D5RtOm8jHkvA==
X-Received: by 2002:a17:906:5913:b0:a46:9cc5:c3b4 with SMTP id h19-20020a170906591300b00a469cc5c3b4mr5464869ejq.76.1710841805472;
        Tue, 19 Mar 2024 02:50:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id v15-20020a1709061dcf00b00a46cf83216csm1345710ejh.120.2024.03.19.02.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 02:50:05 -0700 (PDT)
Message-ID: <b238d70e-0361-4f3c-ae6a-4e6497b95d75@linaro.org>
Date: Tue, 19 Mar 2024 10:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ARM: dts: aspeed: Add eSPI node
To: Manojkiran Eda <manojkiran.eda@gmail.com>, patrick.rudolph@9elements.com,
 chiawei_wang@aspeedtech.com, ryan_chen@aspeedtech.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 jk@codeconstruct.com.au, openbmc@lists.ozlabs.org
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
 <20240319093405.39833-4-manojkiran.eda@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240319093405.39833-4-manojkiran.eda@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_025008_624769_A38BCB3A 
X-CRM114-Status: GOOD (  14.11  )
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

On 19/03/2024 10:34, Manojkiran Eda wrote:
> This commit adds eSPI to the device tree for aspeed 5/6th
> generation SoCs.
> 
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 19 +++++++++++++++++++
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 20 ++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> index 04f98d1dbb97..eaf7d82b6f46 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
> @@ -343,6 +343,25 @@ sdhci1: sdhci@200 {
>  					status = "disabled";
>  				};
>  			};
> +			espi: espi@1e6ee000 {

spi or syscon

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +				compatible = "aspeed,ast2500-espi", "simple-mfd", "syscon";
> +				reg = <0x1e6ee000 0x1000>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0x0 0x1e6ee000 0x1000>;
> +
> +				espi_ctrl: espi-ctrl@0 {

What is this device? If parent is espi, then what is this?

Where is the binding?


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
