Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BB4CA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYEK5L2IMeyrv7ludKg0Zugjj7Z/jRZluBJJ8H3kCiM=; b=hSVnti8bp9WCoX
	FLIRqF0f3W45FI4XwpUSAV5bxJ1266LnXDAzXGI9P9FkNbapdiqno2T/iduPoi+uAIVCrnIUmzd3M
	MuksLwZYcXPpMOPEbvnSoI2tZeW0Q1qRjVNzrHaAH1VztgGwKNcmmY4Y+1bvsnnlgnGXp9dljnflN
	cV3uGbbuLsbcNdSIVL6jRw31R6LBhHrfFd+ns5q1dWKNJ5mlg+oAQ9xWqL7lDMAQqKRas6RSFcCHP
	+/YTeonmpaV+xT+qLJZBtLb49xCj+UVm8nhCzlEmaqwfJah9C4Gqg3a9hN1vfJ1ROIVTlJKOBQo1J
	+/6IsDsqN/2RosQygowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYP3-00000008xDI-36ud;
	Mon, 11 Aug 2025 19:41:53 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWy5-00000008iFb-1VFe
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 18:09:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 669D122D9F;
	Mon, 11 Aug 2025 20:09:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLziFljdYo3b; Mon, 11 Aug 2025 20:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754935793; bh=IHfWofOH+O8x7iEleneRbecji0kLTS0PrMQu3tYrRws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XPD/ANhgW9xWWTr4p+xWiPkL5CU9ohz8GwQIi0EKiAQOwkZOxWoZGbq/6ydmL3fYk
	 tRJQ6qyoq9mbBlqh0+sNevKPhCuAS0+D4xc5g+gqt2ol4dv4RuWc4F9GGcytrizENA
	 47wdzaLjJi6/ThRQEKxVUlyWBv/Hxsg5RwUyRT/1rsqDNRbpIcEfY8SBZCCZkIZIK2
	 3Pto6QtDaCXcpdeaSQBqmP3ySp2unP9RcRmelgtT2Ih1AJoQvMODaO7ezwazBrJPFQ
	 gCtlM6g71MbHBbBi8InA+blfhNRg7xrYrVM+1DoCnCD8msEgk5ADA5UKDWBPdZ9UMg
	 9j83PhPZt+EUA==
Date: Mon, 11 Aug 2025 18:09:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 6/8] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
 controller support
Message-ID: <aJox6R9eCZ5vSc7H@pie>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
 <89732d64415077ecd9f74c5853c542e62c0dfe26.1754890670.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89732d64415077ecd9f74c5853c542e62c0dfe26.1754890670.git.zhoubinbin@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_110957_703612_6B3C9534 
X-CRM114-Status: GOOD (  16.16  )
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

On Mon, Aug 11, 2025 at 02:03:13PM +0800, Binbin Zhou wrote:
> The Loongson-2K0500 NAND controller is similar to the Loongson-1C.
> 
> It supports a maximum capacity of 16GB FLASH per chip with a maximum
> page size of 8KB, and it supports up to 4 chip selects and 4 RDY
> signals.
> 
> Its DMA controller is defaulted to APBDMA0.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mtd/nand/raw/Kconfig                  |  2 +-
>  .../mtd/nand/raw/loongson-nand-controller.c   | 55 ++++++++++++++++++-
>  2 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index d9e3f13666ac..7b0c5d06aa95 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -464,7 +464,7 @@ config MTD_NAND_NUVOTON_MA35
>  
>  config MTD_NAND_LOONGSON
>  	tristate "Loongson NAND controller"
> -	depends on LOONGSON1_APB_DMA || COMPILE_TEST
> +	depends on LOONGSON1_APB_DMA || LOONGSON2_APB_DMA || COMPILE_TEST

Why is this dependency necessary? I think the DMA operations are done
through DMAengine API, and thus the consumer decouples with the DMA
provider. If so, I think the depends line should be removed, instead of
extended.

Regards,
Yao Zi

>  	select REGMAP_MMIO
>  	help
>  	  Enables support for NAND controller on Loongson family chips.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
