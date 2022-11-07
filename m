Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B5CC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/5Fpaw/P3KPLHcQu9lP1ehW2l5oWF3poKTF1tzZjCQ=; b=Vh19YTC/rM//Cu
	DZBj+lQgUryHZHxOlKcdO4Omw02wajV18hTdO+YskFGpFOGGJLXqG2qIIgldn3S8MZ+tw/+H7/jLN
	Hnr+Apk9N5t0TNtX5ug4vteo16nDiI6+5PQsb7Yy/gzb84nGOgu2kNRWsRIIW3hHIzRrvrMOOQn0i
	lyjFCbp8LI+7MMF0xR3JsKr8mvgGu74+L7YVjVHaSGQX97hfkFVov2FiR/B6B6cLgrHTLJKD4GUj8
	mhTUJjnXZ49d/YoYFaYuni6XthopKV7crqVaZjeGr2HS8pcDXJxZH6TWBS7SbrRe4UPNZzKmkex6B
	mnWvrzvDG7LVBmVl0tvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orxkg-00Cuv9-UQ; Mon, 07 Nov 2022 08:45:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orxke-00CutS-C4
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 08:45:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A945CB80E2D;
	Mon,  7 Nov 2022 08:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71230C433B5;
	Mon,  7 Nov 2022 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667810700;
	bh=5bhUp/7RhhEmhXQkR8+nWueOvcoq5Jl/02Kb6lv1QMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F2dOkFdLo01D1SyGxCwRrxxvk7mi3A9T8CuC8scJ59HG/zbsSW6TPZFinFqfFuiax
	 /F0dTfX8yAcxENPtgSDYrjXbP2bAlq7O6KQ3SBUykZD1iIee1U0Rhb9Og7IHQE5Apy
	 XEUX0gWrfhLREJH9tlEHrkg5/HPF0ofe53RJWn415OMz2Opohlf0znuDkkHJZZuRG7
	 pXCTs7NcEnfZKQHGXlJZQtNhEC7a9iA+iZP1g6DLz+KFZRYXqcNPDP28GZwcnKLtns
	 rmDU0q9/SNi0iz//YQS+eJbUdKxzIzWUwyAjSf1u8cI9hpC+4/Gf/RX138zEm6eggT
	 ii3FrMRIsTLbA==
Message-ID: <eef60a26-ef23-1b79-22f7-adaee3be9360@kernel.org>
Date: Mon, 7 Nov 2022 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] mtd: onenand: omap2: add dependency on GPMC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20221104194934.384371-1-krzysztof.kozlowski@linaro.org>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20221104194934.384371-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_004504_599528_53825889 
X-CRM114-Status: GOOD (  18.95  )
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

Hello Krzysztof,

On 04/11/2022 21:49, Krzysztof Kozlowski wrote:
> OMAP2 OneNAND driver uses gpmc_omap_onenand_set_timings() provided by
> OMAP GPMC driver, so the latter cannot be module if OneNAND driver is
> built-in:
> 
>   /usr/bin/arm-linux-gnueabi-ld: drivers/mtd/nand/onenand/onenand_omap2.o: in function `omap2_onenand_probe':
>   onenand_omap2.c:(.text+0x520): undefined reference to `gpmc_omap_onenand_set_timings'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 854fd9209b20 ("memory: omap-gpmc: Allow building as a module")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/mtd/nand/onenand/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
> index 34d9a7a82ad4..fa94c514626d 100644
> --- a/drivers/mtd/nand/onenand/Kconfig
> +++ b/drivers/mtd/nand/onenand/Kconfig
> @@ -26,6 +26,7 @@ config MTD_ONENAND_OMAP2
>  	tristate "OneNAND on OMAP2/OMAP3 support"
>  	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
>  	depends on OF || COMPILE_TEST
> +	depends on OMAP_GPMC || !OMAP_GPMC

Why did you add !OMAP_GPMC?

If OMAP_GPMC is not set we don't want to be able to build this driver correct?

>  	help
>  	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 SoC
>  	  via the GPMC memory controller.

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
