Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59ECC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csANQ28O5GyOj0suuZ6jKMhyelr7z4usQ0ZHRvL8Lxk=; b=qvqg8/ZAQ1KRiT
	Kb/bbC4DAguWTKA8I0p1iL9PiX+Tzfk4Ehcz2Z4sxIJRWUbtCaOiAoU6xS0Fg06V+Nsfq8aQCa2Ik
	SWmOMWLCeqxL+0iZjF/rmVVGVAx3yAD7sdxdcHgVduyZ6ChLhU+V5eiAJLsfkUj0wYRWy1XPEncnQ
	sPw2JFZPzfWeaV6fsREWlRrobUGeXf09BPAXQO1gxxU6Xe7bhbn3CwkPRirwVAAMM7NLSSJgoK+ZH
	XCr90i8SGG9qzEy9JdfsllEcw+DFKceiFGmJKbNz6picVECccFb17r5gusRFW5azwjWE1TBI2fuzc
	Zwt7wNxQdGJ6u7MTtI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph538-00De9c-2U;
	Tue, 28 Mar 2023 08:51:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph534-00De8E-2T;
	Tue, 28 Mar 2023 08:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679993482; x=1711529482;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T0f2kgJ9KZyICJJMWIGxZxVKRVW/cJ1iN/Ny6VWy2aE=;
  b=oNDptGlsINkvH+CPjrBPXLo1daRd+Z3l9pV8EaWRKSAfCCBmk3VPlf1/
   r2zM4O8uuBgDI0vt79ak90HLUF4G3meeJ3jXtUQZ5iy2fFL5TtFhLwUGi
   YnJkyEzLIBEZrll9dA5BPLITzSq1qLkKkNsZ+bn/1z3hYUmRIG41k92t3
   MCUi0uosCeNdewlYEu31KJy44N8iMKkMb1OeolRFk5XzLLrUJrQkPu7/E
   wnFlwsdqDET17KRDdnra2rT0qAmDfugAIar+JWXU0sqMq98EGOdqSOZrw
   6iqeyTTqfy30PJuQz0gFFaAj1IONlAVwBm/hghBBOdSxaNeJHW2xDagQT
   w==;
X-IronPort-AV: E=Sophos;i="5.98,296,1673938800"; 
   d="scan'208";a="206642288"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Mar 2023 01:51:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 01:51:13 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 28 Mar 2023 01:51:11 -0700
Message-ID: <a6fe77b6-4ff4-3c91-0c67-a9da5a638e7b@microchip.com>
Date: Tue, 28 Mar 2023 10:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/8] ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI
 NOR flash at its maximum frequency
Content-Language: en-US
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
 <20221117105249.115649-6-tudor.ambarus@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20221117105249.115649-6-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_015122_811045_E6F269DD 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 17/11/2022 at 11:52, Tudor Ambarus wrote:
> sama5d27-wlsom1 populates an sst26vf064b SPI NOR flash. Its maximum
> operating frequency for 2.7-3.6V is 104 MHz. As the flash is operated
> at 3.3V, increase its maximum supported frequency to 104MHz. The
> increasing of the spi-max-frequency value requires the setting of the
> "CE# Not Active Hold Time", thus set the spi-cs-setup-ns to a value of 7.
> 
> The sst26vf064b datasheet specifies just a minimum value for the
> "CE# Not Active Hold Time" and it advertises it to 5 ns. There's no
> maximum time specified. I determined experimentally that 5 ns for the
> spi-cs-setup-ns is not enough when the flash is operated close to its
> maximum frequency and tests showed that 7 ns is just fine, so set the
> spi-cs-setup-ns dt property to 7.
> 
> With the increase of frequency the reads are now faster with ~37%.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>   arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi
> index 83bcf9fe0152..20caf40b4755 100644
> --- a/arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi
> @@ -220,7 +220,8 @@ qspi1_flash: flash@0 {
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
> -		spi-max-frequency = <80000000>;
> +		spi-max-frequency = <104000000>;
> +		spi-cs-setup-ns = /bits/ 16 <7>;

Following the different changes that happened to this property after 
this post, am I right saying that this must now be changed to:

spi-cs-setup-delay-ns = <7>;

?

Thanks for your insight. Best regards,
   Nicolas

>   		spi-rx-bus-width = <4>;
>   		spi-tx-bus-width = <4>;
>   		m25p,fast-read;

-- 
Nicolas Ferre


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
