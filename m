Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AA4C19F32
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TFBAUn44eJKM0hIuXaA7OPhENDLJpKd/x+2s2TwBcaQ=; b=I6RXxMYvS1dF61rrZASCHOAsp4
	ZQLZisZfLexmiPNcWXif7mV/4eKrtdZWJ8Q1onxz+TQnS2jAONGkDsjqcZgZ9rXoKE7b6uY+owUjU
	nSiVHEAj8PttLR048md5W7x6p2UpaQlpizW74xh+kCXkLtCh4iuruGhCw1NkkoT2MwiJviT7FoEK+
	2i3I7p2zlaQu+ZYzfW7/AtwV/5F/DwkOp8Nu/UP43uzuzlpm7JH6JJZk4EEQ2KOFuKM6YwJIjeeD5
	A0tstwlmzPF8z4Hyg2/pRisjcuNUVOGAiYuv5VcIKGrchQr/MvmpvSYVQKFtqnNexSw1bOwVZwfsD
	bKSZ29bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprSF-00000008dUL-1eOU;
	Wed, 05 Mar 2025 16:18:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqNh-00000008UDj-0sSZ;
	Wed, 05 Mar 2025 15:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55E6CA458C6;
	Wed,  5 Mar 2025 15:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918C9C4CED1;
	Wed,  5 Mar 2025 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741187395;
	bh=KJ2n6qqivS8cfT5p3ck5BACWcFxyQHKwuyUCKJ1adwc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Foc64VcCsjkJX2XPNYKFjY/rY2tvFkBx0fPMjxxPmRCBlO0CPbiBAO2sQTT9/PPsp
	 3q0uYHmklJDSBvLK+//XKlnRBks0W0Q2t9WQ7gwiTXdZxHNluVSRsaGCnf2FgXgsI7
	 KmMy5XTgk+Xqqn1tplWiJW7P2JQ5Dvrv92EXS4XbP6Mh8JUXLP811GLMafGBWP2Kqw
	 fbunbDryDW70o3KzLjVJFgQzmWIAv70+qjGluGgBh+eubjHQTttDA5P0PtVlF8ZCHq
	 2KnArDxFlTKOjQhlUnjQBJ3R832yX+LEKuBZF1GYvifbdnnxLsNAY1GRLlCWg83uUP
	 pzWEOXoz5oNjQ==
Date: Wed, 05 Mar 2025 09:09:53 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: nicolas.ferre@microchip.com, mwalle@kernel.org, richard@nod.at, 
 vigneshr@ti.com, tudor.ambarus@linaro.org, alexandre.belloni@bootlin.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com, 
 Varshini Rajendran <varshini.rajendran@microchip.com>, 
 claudiu.beznea@tuxon.dev, pratyush@kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Manikandan Muralidharan <manikandan.m@microchip.com>
In-Reply-To: <20250305100134.1171124-1-manikandan.m@microchip.com>
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
Message-Id: <174118733199.1974433.9410395684855092118.robh@kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_070957_313052_41034BBE 
X-CRM114-Status: GOOD (  13.56  )
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


On Wed, 05 Mar 2025 15:31:33 +0530, Manikandan Muralidharan wrote:
> From: Varshini Rajendran <varshini.rajendran@microchip.com>
> 
> EUI identifier and the MAC Address of the Ethernet Interface is stored
> after the SFDP table of contents starting at address 0x260 in the
> QSPI memory.
> Register the entire SFDP region read by the spi-nor (nor->sfdp) into the
> NVMEM framework and read the MAC Address when requested using the nvmem
> properties in the DT by the net drivers.
> 
> In kernel the Ethernet MAC address relied on U-Boot env variables or
> generated a random address, which posed challenges for boards without
> on-board EEPROMs or with multiple Ethernet ports.
> This change ensures consistent and reliable MAC address retrieval from QSPI,
> benefiting boards like the sama5d29 curiosity and sam9x75 curiosity.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> [manikandan.m@microchip.com: Integrate the nvmem->read callback framework]
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/mtd/spi-nor/sst.c | 62 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250305100134.1171124-1-manikandan.m@microchip.com:

arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: flash@0: Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
