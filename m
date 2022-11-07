Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A6FC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3js3PMNKCggz1usFG83BvsV7VONb0OSuE4w/5EEKWU=; b=wCi+0gErlvxrXp
	8SbqJwWcB0F8oKx4wPpZeCVuRC6G9dMlAK9vsuqzmyhKu37keP4+f0ZIrHL8ZLzYtt2YhrqTYJNFf
	kyBgCYmFB0ohU1UAh10P7cw8+AeeKOiQQu1LDdo6xYub4Uan2wWt7G4MG0tz4dIgv4jnuRxb0hZdh
	7kAW1hC87P4BISZ66+o9MP5IoCa8i9fcuDfC/W7OGK82CwL0BEkt5yvZ7HtT4rheiu4Jy3OIscZxs
	bW5ZXjALZwBPjOP7ZCTRT1AmpwY1udTUyBHV+RPWtchis5jIvfZQxjVOtZ0o2qPqKGGCuM13RNd8N
	ofRjO0p1g9f+RIloXZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryJQ-00DDKU-DE; Mon, 07 Nov 2022 09:21:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryHY-00DC91-3L
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 09:19:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E6F860F6E;
	Mon,  7 Nov 2022 09:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCFCC433C1;
	Mon,  7 Nov 2022 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667812742;
	bh=8r25nnibsdc3RDPgthhVh3turSFna9yd2wbYKCt5cLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ug+LL3GusENNx0gWQU4+vqNIi3xm1RCBLayMbowK0F8hmADjpnHyzFeJJHXnTQHhE
	 Xlf92xDfaCImGzZr7oOF/5VgG0PxCS4xlwCrF18w2HP/82iWyF2tHbHg9lMM2yjROy
	 JrSi2a9wGw1cmrGT3iX2ab51NWMItpyBT6FNzKau5tIBJFPIrRZucTu6T0tNmZ9V5G
	 LBYGjQJbZnSmsxNgCNJSafUlTJw/5ULTZp2FzGxoTjP7tG2R37G3V6YocQLyJRg8Nk
	 CnykwccDs8E9ExmL7nPV2YV5FLQ1XlFC+IxSpa4nQFAd3pP2T4mR6zxE2jnBcuvIyR
	 lDyG58fSxFStQ==
Message-ID: <3d1ec690-78ef-19e9-3bb6-6daae1504878@kernel.org>
Date: Mon, 7 Nov 2022 11:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] mtd: onenand: omap2: add dependency on GPMC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20221107091520.127053-1-krzysztof.kozlowski@linaro.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20221107091520.127053-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_011904_240166_F2FB6777 
X-CRM114-Status: GOOD (  18.84  )
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



On 07/11/2022 11:15, Krzysztof Kozlowski wrote:
> OMAP2 OneNAND driver uses gpmc_omap_onenand_set_timings() provided by
> OMAP_GPMC driver, so the latter cannot be module if OneNAND driver is
> built-in:
> 
>   /usr/bin/arm-linux-gnueabi-ld: drivers/mtd/nand/onenand/onenand_omap2.o: in function `omap2_onenand_probe':
>   onenand_omap2.c:(.text+0x520): undefined reference to `gpmc_omap_onenand_set_timings'
> 
> The OMAP_GPMC is also a runtime dependency.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 854fd9209b20 ("memory: omap-gpmc: Allow building as a module")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

> 
> ---
> 
> Changes since v1:
> 1. Always require OMAP_GPMC (drop !OMAP_GPMC).
> 2. Adjust commit msg.
> ---
>  drivers/mtd/nand/onenand/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
> index 34d9a7a82ad4..c94bf483541e 100644
> --- a/drivers/mtd/nand/onenand/Kconfig
> +++ b/drivers/mtd/nand/onenand/Kconfig
> @@ -26,6 +26,7 @@ config MTD_ONENAND_OMAP2
>  	tristate "OneNAND on OMAP2/OMAP3 support"
>  	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
>  	depends on OF || COMPILE_TEST
> +	depends on OMAP_GPMC
>  	help
>  	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 SoC
>  	  via the GPMC memory controller.

--
cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
