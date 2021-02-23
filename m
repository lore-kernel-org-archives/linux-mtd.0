Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B029AC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 12:08:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A3A64E21
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 12:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A3A64E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sky3ZhnjnXbGCR86NaSOus9ybckTNWRSK+us0MTPAOY=; b=PF6/bG1vzoenwoU017w04yLW0
	G8gSrse5mBgxnmNi8fke988q9lUckFPxfQErlvgI9XVCSIa9/B5dxGgPz70ttkRAyapgywn8JuZr7
	erwek2PIbq7XWawhh8j/DV0BF63IvBXj7BQFeHaRzzrEC1JGhExSZ0d9itLdOvhEnJ4AkMpFDRM3Y
	fA1pIaThv+KdlB3nV+86tDozVBCNTFTyJbdeNWn2+YYmYly1x6K21ZCqPUNksq+JfM5Xxuw2DhnyM
	DztNR61GWWJENTP3bAn9FsVIgv8ecw0JapZoKQ26IfBvutt/VK1jvN+gr5ABShZVsrKa4eZnn06zk
	LV9U5z4oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEWTR-0008VX-S5; Tue, 23 Feb 2021 12:07:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEWTO-0008Ua-LN
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 12:07:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id f8so9696043plg.5
 for <linux-mtd@lists.infradead.org>; Tue, 23 Feb 2021 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HlXCBQP0cwFQGc5gHZbMfWhrTF/P8RNhYwZWXhdbMdA=;
 b=ttsgLENEiZl760i8tLAoU8u141z+IurKBm5zzZMTstwhYeYR39vu0wP0ZYiPfzczQV
 7N8XeE3KFAqqRBxWFrJ424OPvYdB0595aStOhjgXlAaSfRaOz4hXgnF3h0qPFYluzbQY
 nIdFPat80sC2JyzAN1skWWqhnn2aGQroj8MMFvIzecUlYGpfxwdY2WaElbioqdx1Ogs2
 tYyRdM46OxT+uUFciaFY7kEmup3xGii70adZ+RvTlAiON81q4LeLKkCYhU/HkBZtnkrb
 8kM3jV8YbhcApJGBiUrvCuUv7zRcNawR1V25xBoQCLA+SYU8kHD3y6KkXbYNo6VLPzDE
 7MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HlXCBQP0cwFQGc5gHZbMfWhrTF/P8RNhYwZWXhdbMdA=;
 b=LHIdKm47zvZ9sDOrk4lzLIjnd8vbb3CYsBVGQ0Jl0q94MZRj08xcDoMJXGDGJ92W/2
 e/e1fn0R/7fOzjZVRa9nhQcr+sWiFPyP9VmIVxm1TTkhQuQ1nGaODP8Dt6Z3M7Ncb/r6
 5AJ5C70l3iIAzLnz5Vdp5GaCb3/TdielVIGP6vIb9rlJ5fhWn5EPjZz9wAiTm9SOOsv8
 RFMIVG0k/3CDWEJCrmVOA706KEXrQEPvhwTd7V7XwDCFUmXlA1rMGR9n53fX+GklkVhO
 XzK8cv5Jk0BwjVET2ebd6srP5wRN8J6k1iVQ02tRLDhfrIYdITclsgiyGCxa/O/qmMWH
 Ge7g==
X-Gm-Message-State: AOAM530A4W4ijDR+P/cgTAbmgHsTPrSe83DtSOdnrnWBLam61KS0TVKc
 9xng13QVk/eAGKrtQDtabbQ2LpBlTv5h
X-Google-Smtp-Source: ABdhPJyQBYZ4fxaCfMHTyyIzcALjO7AXmoH9J83agXB1keRBr/PJcgGlu2VZK0/epIeh2qyYF7Iz6A==
X-Received: by 2002:a17:90a:a10b:: with SMTP id
 s11mr23667449pjp.3.1614082041783; 
 Tue, 23 Feb 2021 04:07:21 -0800 (PST)
Received: from work ([103.66.79.25])
 by smtp.gmail.com with ESMTPSA id z10sm3147738pjn.11.2021.02.23.04.07.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Feb 2021 04:07:20 -0800 (PST)
Date: Tue, 23 Feb 2021 17:37:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] mtd: parsers: extend Qcom SMEM parser to SPI flash
Message-ID: <20210223120717.GA9724@work>
References: <7f558e888a41c5b1fd4ca0427b3976531c51a876.1614080824.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f558e888a41c5b1fd4ca0427b3976531c51a876.1614080824.git.baruch@tkos.co.il>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_070726_788672_9A94294C 
X-CRM114-Status: GOOD (  19.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 23, 2021 at 01:47:04PM +0200, Baruch Siach wrote:
> The Qcom MIBIB partition might be stored on SPI flash devices, and the
> parser works in this case just as well:
> 

Nice!

> [    1.404229] spi_qup 78b5000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
> [    1.408078] spi-nor spi0.0: found mx25u6435f, expected n25q128a11
> [    1.415016] spi-nor spi0.0: mx25u6435f (8192 Kbytes)
> [    1.420756] 12 qcomsmem partitions found on MTD device spi0.0
> [    1.425739] Creating 12 MTD partitions on "spi0.0":
> [    1.431381] 0x000000000000-0x00000000c000 : "0:sbl1"
> [    1.437058] 0x00000000c000-0x00000000d000 : "0:mibib"
> [    1.442143] 0x00000000d000-0x000000027000 : "0:qsee"
> [    1.447057] 0x000000027000-0x000000028000 : "0:devcfg"
> [    1.452088] 0x000000028000-0x00000002a000 : "0:rpm"
> [    1.457065] 0x00000002a000-0x00000002b000 : "0:cdt"
> [    1.461832] 0x00000002b000-0x00000002c000 : "0:appsblenv"
> [    1.466736] 0x00000002c000-0x000000036000 : "0:appsbl"
> [    1.472248] 0x000000036000-0x00000003a000 : "0:art"
> [    1.477297] 0x00000003a000-0x00000003e000 : "config"
> [    1.482047] 0x00000003e000-0x00000004e000 : "data"
> [    1.487257] 0x00000004e000-0x000000200000 : "0:hlos"
> 
> Remove dependency on MTD_NAND_QCOM. Update the Kconfig prompt and help
> text accordingly.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/mtd/parsers/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> index d90c30229052..96d5716db544 100644
> --- a/drivers/mtd/parsers/Kconfig
> +++ b/drivers/mtd/parsers/Kconfig
> @@ -162,9 +162,8 @@ config MTD_REDBOOT_PARTS_READONLY
>  endif # MTD_REDBOOT_PARTS
>  
>  config MTD_QCOMSMEM_PARTS
> -	tristate "Qualcomm SMEM NAND flash partition parser"
> -	depends on MTD_NAND_QCOM || COMPILE_TEST

Can we keep COMPILE_TEST below? With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +	tristate "Qualcomm SMEM flash partition parser"
>  	depends on QCOM_SMEM
>  	help
>  	  This provides support for parsing partitions from Shared Memory (SMEM)
> -	  for NAND flash on Qualcomm platforms.
> +	  for NAND and SPI flash on Qualcomm platforms.
> -- 
> 2.30.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
