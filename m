Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C3C36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hsuSgmwi9VbI1up9wggn7p1arVnCatpab1b1zSnotJw=; b=sSGoOD3ihzgcs8pq+hV7zGA/eN
	1S+YhHd48M0AMY7nlGENCtx7SyfEPTuQYKQIx2kYxLpqwsJOBPQWdpCsxxe6ixBXkXQnmBTkR3Et0
	DB8WRbksA2GWBECLgAQZOKzcXepKXGkHtOSnYBLYfbONZgJZGGqNny3c4qfRHy94UsqN0nQfHMaGk
	oG30XjXiY2oTBGUKnmMcO80ccTzF3k40YNL3o4V/oLfyHBxcWlRJfWXIplNzY8UK4MjyFBaAE6tB6
	/GpXWz03Gks3urcz5xBL1Uvx3MPmq089nroc1pdO+Fm8XVCF3+wrb0AxEv7hx+VqCqvL4m+4SUwO9
	V7ArHl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWBr-00000009QIk-3QsT;
	Wed, 26 Mar 2025 19:13:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWA7-00000009PyW-12J2;
	Wed, 26 Mar 2025 19:11:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90A3143E53;
	Wed, 26 Mar 2025 19:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947E8C4CEE9;
	Wed, 26 Mar 2025 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743016298;
	bh=oj4iqbWhD0oo3JhqKuqXzaFTz8r7J0/qC5cNn4vk8g8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A+KA4WHPnnFpcUz0ATPC4d60HcbELnz44S+WeX4zpyZfeOaLWVVpBxtKJ12uunQfB
	 lUGYFxlzu4cimHNfwFkWjFSLJP+s3rFWjc3Jo9e6nUrKOr6TVDcSg5vAEsTltv7DK5
	 NpYNeOtd2GPlC6x3D8S6SW1CjUIrZ2+B4XlNdyWSurlhb1GgTSwr5Bdk2AwnfuArKw
	 3X+ueTqE5WanZVd1SJCP8/b9porWEgZt5q2l2a4ijntWNGFgYdokC1E9ToZpBQYgDz
	 bLt0ORALN17vkJrI2hVr9t0KPheF4ijo9hqUSeQTtN5o3vWkN9yHR8NZuScSL+6blg
	 o682l1JJdWTCw==
Date: Wed, 26 Mar 2025 14:11:37 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mwalle@kernel.org, linux-mtd@lists.infradead.org, 
 claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, linux-arm-kernel@lists.infradead.org, 
 pratyush@kernel.org, alexandre.belloni@bootlin.com, krzk+dt@kernel.org, 
 conor+dt@kernel.org
To: Manikandan Muralidharan <manikandan.m@microchip.com>
In-Reply-To: <20250326072140.172244-1-manikandan.m@microchip.com>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
Message-Id: <174301523860.2716379.13830528080465448868.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Read MAC Address from SST vendor specific SFDP
 region
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_121139_329882_AA1AA4B0 
X-CRM114-Status: GOOD (  17.45  )
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


On Wed, 26 Mar 2025 12:51:37 +0530, Manikandan Muralidharan wrote:
> This patch series adds support to parse the SFDP SST vendor map, read and
> store the EUI-48 and EUI-64 Address (if its programmed) using the
> resource-managed devm_kcalloc which will be freed on driver detach.
> Register EUI addresses into NVMEM framework for the net drivers to access
> them using nvmem properties.
> This change ensures consistent and reliable MAC address retrieval
> from QSPI benefiting boards like the sama5d29 curiosity and
> sam9x75 curiosity.
> 
> --------
> changes in v2:
> 
> - 1/3 - parse the SST vendor table, read and store the addresses
> 	into a resource - managed space. Register the addresses
> 	into NVMEM framework
> - 2/3 - add support to update the QSPI partition into 'fixed-partition'
> 	binding
> --------
> 
> Manikandan Muralidharan (3):
>   mtd: spi-nor: sfdp: parse SFDP SST vendor map and register EUI
>     addresses into NVMEM framework
>   ARM: dts: microchip: sama5d29_curiosity: update the QSPI partitions
>     using "fixed-partition" binding
>   ARM: dts: microchip: sama5d29_curiosity: Add nvmem-layout in QSPI for
>     EUI48 MAC Address
> 
>  .../dts/microchip/at91-sama5d29_curiosity.dts |  62 ++++---
>  drivers/mtd/spi-nor/sfdp.c                    | 161 ++++++++++++++++++
>  include/linux/mtd/spi-nor.h                   |   7 +
>  3 files changed, 206 insertions(+), 24 deletions(-)
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250326 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250326072140.172244-1-manikandan.m@microchip.com:

arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: flash@0: Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
