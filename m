Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150B3C61CE7
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jun 2025 11:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1sKvzX4uXJnO/y2V3RI3t4YOvf1k+TNtJTCAEqgEKk=; b=fpNt0SalkZlWhJ
	8XU6WIG/EU6652Fb36ddoMY0p5moGOO9J1p7w1lbUCScL23ZI4FhXRvVkIrj+FjdY/kliMo0aZa/v
	1H12tQ9FphaHCQgAVSWNJBLHa5EhAUXqJn68UYZ3u4nsFRPeXzpntTwGpGSZz8keG1UkcsImq5Q/W
	7RZFGzcmraVzXmqZg32LCFQmnCXbarHOoV23kjUGXSlwYIgDqOqwdNKhq8n9iKLKKvGbpA1mSvA8R
	cIvHvDWKUadA6vSpfr6FSujHnWrue5+boqPE00vf4hUH7Jj4ai74roTGANpsj5W2dIDvIIXjYLhZu
	tDgPLTYVJ+EDtb1OqhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrXF-00000001ai6-0U1L;
	Sat, 07 Jun 2025 11:16:25 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrJS-00000001ZXn-0txx
	for linux-mtd@lists.infradead.org;
	Sat, 07 Jun 2025 11:02:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so707880a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 07 Jun 2025 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294129; x=1749898929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DIhYHISfph8fBpkqWC+1rBrRnlrWo4MclGDCnZfAqlQ=;
        b=LLqkdD72EL0t6YSKqWLgyVo74FkxfdaeZX3sGqm6vjVn09DQsXIDyhhQsZ1h8i8Onc
         3D/oFAJnNwxA5JX0lod9FjdYyGjY3fWFO3JvHLyMP7WrabLDzXLG6LaISurB1vvfnoKQ
         7Ag8HaMyk8hrJ/34q6kzMfe15kO530O8QzOTsA5g+/NAzdyYN9na0RxxSejdth+0ozPH
         LyOkH4UUklxYxNJqUtTkIPgW/9o03Gpd3pQ3IC7u0sw+I4KQDJYXOWKLEyFzOK5fkmaE
         5NXr7hAkkrQBbxaNORdr6F69iKoCf4UlhyMRmJIVLw/3kld5sZvSfZSKcvE/+uLzhJ57
         93Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294129; x=1749898929;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIhYHISfph8fBpkqWC+1rBrRnlrWo4MclGDCnZfAqlQ=;
        b=tNBfh5XIldzEd6p6E5EyoPPENFcBdOfUGx7D0J6+wXyDS3nw9ztbFs7YHp5F4H/ioe
         2sUxl5JJqBip92IEKiS+oY+Y9kQijFO8Gc5xI9gl8QjxoEhLozp1A0lHif18g91wqBED
         0ygGuBtaP8oq6NNW5DAWulpgI2+irRcf6XfV7Ygm7oYSAsxF3q8YKKJCN4Wlu3vL6C30
         WUaIyt03/WvibktE0mA1S6uBuFJwE8/HAQ47XWRUX1pLlvD2eNBmL/n27ADfBhNXdPzw
         oJFxiOdHTMbbh5OCa9h+n13hanHx2LV25PRGajLYaMMT2Q6thCMR759LPI3dooJgIxIq
         SY/g==
X-Forwarded-Encrypted: i=1; AJvYcCX36ZOwdfNwclE0FSsxOc1+6V+a24JWJI4whOjO8bX0CRg1wQs7vzcjXPCaFzCbQAKY5qjH+KSsnA8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMJ+LwD7TU/JVvsY8sv4lunY6xAB0P7FUURnyA9iapB2e29Mpf
	o7jNOA7FHpwFfd2fTNRQ1p8ow+Q9NZiYb4+gOgeIPP+okI8ai5PLy2GX8CJqsmQ7Pt4=
X-Gm-Gg: ASbGncsNjV8SO4P65HXhXfc0KVDhNTKmknrA49c5ZAkmLgHiNA0Rw4ESbc5qB2JBpf7
	tHHjJ3hUuJH7hQ33urqCWZsZA4JReUjNo66ofP0q5oL6Zi+3O837aaIO48rDbJA6Vh8OyRte96s
	lPwCgosIQJd6Bmc4HsuL479i+rUpiHgkOheE6EhS+imdy/5BUTccc80L1z7pzybzvXgPsLulScU
	gzilKcGcoKPpSbKAxqpki5bczuJ5vr17Akr3dHEIK8tFByO8t3a7i8IMI1W6Uxemos4MeD1FmZl
	FSdMpTGLC8gs0NSCpacg/h1Rl4DCr/y5sveht8dIO6NSZ5+FAH8aWsHWXeXj
X-Google-Smtp-Source: AGHT+IH05HBrM68Mw5Ro+IZBmLCRhTkiogLWCD18qGy1T509lYtrYeeNQACDbX4n+DEb/SC/OplcNA==
X-Received: by 2002:a05:6402:4407:b0:601:a431:86cc with SMTP id 4fb4d7f45d1cf-60773be8fafmr5638626a12.5.1749294128562;
        Sat, 07 Jun 2025 04:02:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c053esm2284059a12.48.2025.06.07.04.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:02:07 -0700 (PDT)
Message-ID: <759ec406-d388-498f-b0cc-2440a66ecbcd@tuxon.dev>
Date: Sat, 7 Jun 2025 14:02:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: microchip: sama5d27_wlsom1: update the
 QSPI partitions using "fixed-partition" binding
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-3-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521070336.402202-3-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040210_262749_A23E4F8D 
X-CRM114-Status: GOOD (  12.08  )
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

Hi, Manikandan,

On 21.05.2025 10:03, Manikandan Muralidharan wrote:
> update the QSPI partitions using "fixed-partition" binding

Please use capital letter at the beginning of the sentence  and dot at the
end of it.

Can you please also explain here why you did this update?

Thank you,
Claudiu

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../dts/microchip/at91-sama5d27_wlsom1.dtsi   | 54 ++++++++++---------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index 9543214adc9f..b34c5072425a 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -229,8 +229,6 @@ &qspi1 {
>  	status = "disabled";
>  
>  	qspi1_flash: flash@0 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> @@ -240,34 +238,40 @@ qspi1_flash: flash@0 {
>  		m25p,fast-read;
>  		status = "disabled";
>  
> -		at91bootstrap@0 {
> -			label = "at91bootstrap";
> -			reg = <0x0 0x40000>;
> -		};
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
>  
> -		bootloader@40000 {
> -			label = "bootloader";
> -			reg = <0x40000 0xc0000>;
> -		};
> +			at91bootstrap@0 {
> +				label = "at91bootstrap";
> +				reg = <0x0 0x40000>;
> +			};
>  
> -		bootloaderenvred@100000 {
> -			label = "bootloader env redundant";
> -			reg = <0x100000 0x40000>;
> -		};
> +			bootloader@40000 {
> +				label = "bootloader";
> +				reg = <0x40000 0xc0000>;
> +			};
>  
> -		bootloaderenv@140000 {
> -			label = "bootloader env";
> -			reg = <0x140000 0x40000>;
> -		};
> +			bootloaderenvred@100000 {
> +				label = "bootloader env redundant";
> +				reg = <0x100000 0x40000>;
> +			};
>  
> -		dtb@180000 {
> -			label = "device tree";
> -			reg = <0x180000 0x80000>;
> -		};
> +			bootloaderenv@140000 {
> +				label = "bootloader env";
> +				reg = <0x140000 0x40000>;
> +			};
>  
> -		kernel@200000 {
> -			label = "kernel";
> -			reg = <0x200000 0x600000>;
> +			dtb@180000 {
> +				label = "device tree";
> +				reg = <0x180000 0x80000>;
> +			};
> +
> +			kernel@200000 {
> +				label = "kernel";
> +				reg = <0x200000 0x600000>;
> +			};
>  		};
>  	};
>  };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
