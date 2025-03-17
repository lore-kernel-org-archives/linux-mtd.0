Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F828C282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 16:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tfpw7QDl8WAQHroYd3XqNdmMPEQQc4Drr1CtToT8JSY=; b=Cv59YfIlXTfIo9
	aN6nMBohSmXFKv1LK6+KrB8r3qEIbpM+XVUt0dhJKqpuaEuFotnQ7THJ16cZH+1BeyGicjo42kiLY
	00PPMXiUO7DXVi0s5KRYyXmMfOS3o35zpFstpe831J4DkhZfLiph8CogBVOfukLEHesSjqQx8A2aX
	LiMm8u89MaDogo1hKotV3UFUxo1lsgSIfq+DmIZU52sjHBl+Aw6k+k9Fa1mvvBeBQhcCYB4/jCcI5
	3azz/0Xre8U/JelIoMXWlLsV0mV8TESvM0aFOTqlKPjNE+7goxyMfCovDGpAgeG0zGYDh1qBEMDvB
	VH5PcG9k2ewclGZfsGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDYc-00000003NXX-2pKg;
	Mon, 17 Mar 2025 16:43:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDWu-00000003N6r-42sS;
	Mon, 17 Mar 2025 16:41:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A696DA45A76;
	Mon, 17 Mar 2025 16:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62C2C4CEE3;
	Mon, 17 Mar 2025 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742229692;
	bh=qqk3y8n83Af/OjpaprlIVmcnrEvTFhBi/Q+EjcKQHEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vqw54D153smXoCgBn4N9/yVqCVOvOtaViIstM5kFKF5lMTTkumCkfpBfNdgTZHVp5
	 6K87d7xCZGX5ysgISRq6/9BJQ6iWaeNUKQyIojq8DgLMdzU8L+dUHbKuo99+Y+Bqj1
	 hnUR3FOmWfLJSqTtUtaL6GyB17qv6i31d3FROmNBq2VpjhyscPpsVHDtTUOrLmy6XY
	 d92I9SCdMZgec+BNbCN9yHIAdqH2567L9WeqMOnpNTqDpP0F3gdqMlk3hcYeFJ1Jpq
	 sTjzsXXljN56fIqUc/atC/IpzRBwckUaZtioedmHm6zhr5vHl/aWxOBiCbwjeQbh5X
	 M5zYZBCHIYigQ==
Date: Mon, 17 Mar 2025 11:41:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH RESEND] dt-bindings: mtd: atmel,dataflash: convert txt to
 yaml
Message-ID: <174222968999.190541.5419012872834930399.robh@kernel.org>
References: <20250317-atmel-dataflash-v1-1-1a3247f40299@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317-atmel-dataflash-v1-1-1a3247f40299@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094133_063220_362342BA 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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


On Mon, 17 Mar 2025 19:01:08 +0530, Nayab Sayed wrote:
> Convert atmel-dataflash.txt into atmel,dataflash.yaml
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> ---
>  .../devicetree/bindings/mtd/atmel,dataflash.yaml   | 55 ++++++++++++++++++++++
>  .../devicetree/bindings/mtd/atmel-dataflash.txt    | 17 -------
>  2 files changed, 55 insertions(+), 17 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
