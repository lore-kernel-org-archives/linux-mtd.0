Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD808C77B73
	for <linux-mtd@archiver.kernel.org>; Thu, 18 May 2023 23:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykeOQyp1yHGNjKj7sFhc68uL45NNg84VDEBPm0Ig93o=; b=EcuxrUkDvXPqu3
	CePfkTC6A/0N2aKICQbmUUfWw1lsm4PXuhCNItUu5icY/ciX1S/UZT3U1aKbY0WQ/KLFSE1LcAi23
	2MQ+de1t+jTzt0B1jt1SM1SWjJNCDv/arxl9yh0kQKoHwmefyLiidAcqc9FNvCIUXAO7FBf5SXWva
	UxKWV/5Yr3CioUhYhfOpgbdvw93rPcNun5CvfuDp7ivIf7+3+8rJE7yH9NbTZHJXWYYSQ7XAim2Wo
	YhtUcMJTWXn1QSlfYTT+y4tFR05q0Cd6SMYfO9apxLITHpY70EYX2MDyyIjg19f8/CJwEgBW4uDnz
	4fvhO0+dtiG2xMFN2xmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pznQU-00EVaM-0a;
	Thu, 18 May 2023 23:52:54 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pznQP-00EVZR-2B
	for linux-mtd@lists.infradead.org;
	Thu, 18 May 2023 23:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684453969; x=1715989969;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IXmHbAMvAuGDv6jp5wg/LI21QGk/kwHV6av1y5qzHhI=;
  b=ndGfhfiDMhSEhHrAasU3PAcM3Qn17E2UMYmavi6wryYNY/R5Lo4q1XzE
   glQnzwu/IyQ0bdVuukCPfQhs5E8vd233qZF1mnxAcHuTBP1aO9tqX8TiR
   sZQ8SGKcg6FCvA2bbAWxkimnXApY2m4L5Im8rYN2vKu2uzq4zcmqEAGn4
   KpKQjBYMrzM/3rNcKG+wQklxR0WrsW1jGxO+BbKJV8eamYhPYrfHHdGlo
   VkrwKGMJ5M9/GXUUFZoykxtfIEBF5sH5h8Pid3njYDCZgjTsexA/q0o+d
   SCg0qdDNmvje9/E07JcyoDjRMq5akJc3ZFtrlQXkCWjcrGrs+5ZEbfymD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="438578306"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="438578306"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 16:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705365734"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="705365734"
Received: from wopr.jf.intel.com ([10.54.75.136])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 16:52:27 -0700
Message-ID: <07caefbe35cab20ed881c9364c3d26204aea1653.camel@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic
 flashes
From: Todd Brandt <todd.e.brandt@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, miquel.raynal@bootlin.com, 
	richard@nod.at, todd.e.brandt@intel.com
Cc: vigneshr@ti.com, pratyush@kernel.org, michael@walle.cc, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 regressions@leemhuis.info, bagasdotme@gmail.com,
 regressions@lists.linux.dev,  joneslee@google.com
Date: Thu, 18 May 2023 16:52:27 -0700
In-Reply-To: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
References: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_165249_727521_2D8AE92B 
X-CRM114-Status: GOOD (  21.92  )
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
Reply-To: todd.e.brandt@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good, tested and confirmed

Tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>

On Thu, 2023-05-18 at 08:54 +0000, Tudor Ambarus wrote:
> We failed to initialize n_banks for spi-nor-generic flashes, which
> caused a devide by zero when computing the bank_size.
> 
> By default we consider that all chips have a single bank. Initialize
> the default number of banks for spi-nor-generic flashes. Even if the
> bug is fixed with this simple initialization, check the n_banks value
> before dividing so that we make sure this kind of bug won't occur
> again
> if some other struct instance is created uninitialized.
> 
> Suggested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Reported-by: Todd Brandt <todd.e.brandt@linux.intel.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
> Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
> Link: 
> https://lore.kernel.org/all/20230516225108.29194-1-todd.e.brandt@intel.com/
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0bb0ad14a2fc..5f29fac8669a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2018,6 +2018,7 @@ static const struct spi_nor_manufacturer
> *manufacturers[] = {
>  
>  static const struct flash_info spi_nor_generic_flash = {
>  	.name = "spi-nor-generic",
> +	.n_banks = 1,
>  	/*
>  	 * JESD216 rev A doesn't specify the page size, therefore we
> need a
>  	 * sane default.
> @@ -2921,7 +2922,8 @@ static void spi_nor_late_init_params(struct
> spi_nor *nor)
>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>  		spi_nor_init_default_locking_ops(nor);
>  
> -	nor->params->bank_size = div64_u64(nor->params->size, nor-
> >info->n_banks);
> +	if (nor->info->n_banks > 1)
> +		params->bank_size = div64_u64(params->size, nor->info-
> >n_banks);
>  }
>  
>  /**
> @@ -2987,6 +2989,7 @@ static void spi_nor_init_default_params(struct
> spi_nor *nor)
>  	/* Set SPI NOR sizes. */
>  	params->writesize = 1;
>  	params->size = (u64)info->sector_size * info->n_sectors;
> +	params->bank_size = params->size;
>  	params->page_size = info->page_size;
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
