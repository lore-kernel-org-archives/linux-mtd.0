Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8138EC5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lSf8kJmAitq1YmZmLJzZdq2p0ADCRpZS2zlwLwKIOs=; b=VuKftZhWvnArei
	OKEKXRUBUtK/r50ZfNk9BhJNs0Mnn5YR+CEn3E70Yok4YtJc4AVqzDVMfGBrBewS5C/YBc6IT2AD0
	dpWyQp6GAbnIywPeQH9gAOmEg9MotjSBhsq1ywQwexoF7BgPwmHo/Qo9WGIY1Cdb6+wZRNXWbask1
	CIg6OgbJi0jtIbs2AsoxJGPY69NjUefr1uvgVSZXoL62NjQ/ebPeag/xRtEZBoAgx8IzRwyR7L9ne
	0SObpV/8Es3L4+UBEdtX/ZrMxh7E7aDzLWEuKnAjk3yiLt5MfUCZ90YE8nIxXXSfnXDxIM49mB6qi
	h6/YPgJ0uwIXWUM7b92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXhb-00000003eQE-0ES9;
	Mon, 09 Jun 2025 08:17:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXhZ-00000003eOu-1LsC
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 08:17:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-addfe17ec0bso939802366b.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749457072; x=1750061872; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diVPl0lQKW0yQkA4YVUek0ZBF2jN3vlUnkn9DLqfm9E=;
        b=hJBk/01NNi9SurpY18jk5GxI4AX/ZDLyAH4TV7sHbTLtQF67b7o0INEup9xurXUX8D
         XwHzk/B5EgNPJK1d7DDNYNvQGCzoq/HYNC19C88o2A5OM4AOqqIjN8GWYGu00wcT/PNX
         Ob5tYmM5flqkQs0pSB8zwsD23mkhZDhYsbrNLcrGHz7l9doMpYIUb2y6yQl0rgY1mMrZ
         TitDRbKlJ5ZjW5KKJWcAchcUzjSD9p4XbB1Tw7dFczlGiX3v4zD7KZTuJAAZ4xTPne6C
         NZya40S46incexijsal+F7lHDgxU7FIAmp+YGuKLE7xG1v5V0BrhKa6dxdAIHvluiKqg
         KA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749457072; x=1750061872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diVPl0lQKW0yQkA4YVUek0ZBF2jN3vlUnkn9DLqfm9E=;
        b=YyfJFQmK4CrwrqC1v3uOPuw63u89By9GUNFYHJpb2ZgfeADRBHsuf+dmk0W2UqKw6o
         LG+1SnO8LmYcVIAF5P06l5bpn7mCgByVs/5m+cmU437TPigzOtPyHIy1QOABAbi4LNcJ
         7jdKWn5VeX8TWjxbelhciO7ETUBZOipWYWPJ+wD3NwUVm+4s8IMPe2/epxYPcIH62t5e
         QMV0RH5GquyDkMxF6DPCa0c+yu/U3Pp9YQvbR5G3fSv+SHGviG3R49ftwkqeFXVMsU9g
         596fNbjHaFDafoVBHp90/+B1p7D7HydGrQFSiaDzl1vIgOnu3qXcoVDsN9UAnOnnaJW3
         VHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCgUcIRryeWSulMyuOwryCI1aIpWvhAMg65jDC/ExMmv6/N878vSD6i7fSI9jMu6+STxwrEx/wQws=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjEF0TfvU/irt3HolypXs+fOOBWiPI189+EaWskpWXRLILV2ZF
	iF8GJLgTq6O1pqvH6dJ9EpBnOR9XOdX1lh0by37S2unA5GGWpCVqvv7REjdmJfbOSlY=
X-Gm-Gg: ASbGncttn/5X9uEloZKGz14PWQtWyMQjltqdPn1R8PAXdZirkWTCe5lrf9cRRMcURoY
	3JirPvtAmtqARFYct3mnxJgLoB71L1z84ljSpoBGLHbxEsaepAxBtwE5ghTfjSjTKF23VVZp/ZA
	3YxNsmNFt9LaIIV+SxMhECbm9oIwjEcCv/7UrrFpmlV7e9SsIkDeelpt/driI7MsAsjMXPTj8Y2
	nrcoyFChASHkaVOzwyF1828HCQvzv8VVNzO4+8mtsHpOK6nypqwbcE6kgMZ9ZRDOf6YoBTfYlh1
	thTMoEBNdMmNZ/14mCQtM31whYyRvnn6aDAUHgpH+0W9zJZBio+NWcIBZv1qiqdCvZphmiBS
X-Google-Smtp-Source: AGHT+IHlo5foO57lawT0iBE8NHWy/Wh5VTZ1hRUSX/LNop16FvKZAplu9cVdl/qMvDgzI+koFNCPcw==
X-Received: by 2002:a17:907:cd0d:b0:add:ee2c:7307 with SMTP id a640c23a62f3a-ade075bedd1mr1646702666b.6.1749457071737;
        Mon, 09 Jun 2025 01:17:51 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc78f47sm511997066b.153.2025.06.09.01.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:17:51 -0700 (PDT)
Message-ID: <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
Date: Mon, 9 Jun 2025 09:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250521070336.402202-4-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_011753_372535_505DE18D 
X-CRM114-Status: GOOD (  19.95  )
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



On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> net drivers using the nvmem property.The offset is set to 0x0
> since the factory programmed address is available in the
> resource managed space and the size determine if the requested
> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> This is useful for cases where U-Boot is skipped and the Ethernet
> MAC address is needed to be configured by the kernel
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index b34c5072425a..be06df1b7d66 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -210,6 +210,9 @@ &macb0 {
>  	#size-cells = <0>;
>  	phy-mode = "rmii";
>  
> +	nvmem-cells = <&mac_address_eui48>;
> +	nvmem-cell-names = "mac-address";
> +
>  	ethernet-phy@0 {
>  		reg = <0x0>;
>  		interrupt-parent = <&pioA>;
> @@ -238,6 +241,16 @@ qspi1_flash: flash@0 {
>  		m25p,fast-read;
>  		status = "disabled";
>  
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_address_eui48: mac-address@0 {
> +				reg = <0x0 0x6>;
> +			};

How would this work if in the future the mchp vendor table adds some
other info that needs to be referenced as nvmem? How do you distinguish
the info from the table?
Would it be possible to have some kind of address and size to reference
the SFDP?

> +		};
> +
>  		partitions {
>  			compatible = "fixed-partitions";
>  			#address-cells = <1>;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
