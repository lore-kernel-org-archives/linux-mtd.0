Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAD6C433E6
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 15:11:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 947F264E76
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 15:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 947F264E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J/b+Jp2rIgmOo+tIZ3UcNW27FU7c4RIn6Lk00D0FB0g=; b=w+PXnNPR9g3TR6X/u1NUh5yIH
	PfafQUsNquJ7iCIduH6Hl4MIW0oXL0Tdhmv8vQ6cS0BSEko3PvEx4EaXyAWieSN+0ltY7gq1MKZy7
	vagxqjstQtbfnovXSefLAuEzSaUdLTRV/2U5oi3pxn510YLQ7Gw9rPrvcW98e+C/lD4LkdASQFYRa
	WnX9MhtmIv2WQo7gTIxojX6jpsM/X7LPjUyXRpVKdyL3T+hVqSLJBWl3u9qzeFvot8omyitfx+SnW
	vpfMjZtD2U+LcfeVRnS49rEeDRjpUE4pu+y6AWHnr2fxSp6UK4pCn5bVZxYtivvN2RRC1bQd41fTP
	DDKnXzb2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC1zd-000524-3h; Tue, 16 Feb 2021 15:10:25 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC1zX-00051I-7Q
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 15:10:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613488222; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fpUjfJvr9mWbJbQxI8Nr8zNyIuM86yM2wV+L4Sf4oWU=;
 b=ceqVBPo9IdkXpjTHiHcaPQdDh0OU6gbckYzlXLFJYn9/Eej2FZf7Ijp9Za5fKKj6s2Sc1Jfh
 RCPfHvYd4TKMqYyTJMz2CNV+0v8+3i7GBRtLwT51AqbvM4Bujpitbqh6UMO0BaH3/+MHugI7
 /gQ+Ix5qSRDBqJ6ZYtaD/ewEMn8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 602be04db50d5f2cb48ef923 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 15:10:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2C195C43461; Tue, 16 Feb 2021 15:10:05 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 75BDEC433C6;
 Tue, 16 Feb 2021 15:10:04 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 16 Feb 2021 20:40:04 +0530
From: mdalam@codeaurora.org
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lb256e
In-Reply-To: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
References: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
Message-ID: <2df4218ba5ad2a039833bab8c401fa07@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_101022_265562_A89C62DA 
X-CRM114-Status: GOOD (  16.77  )
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
Cc: sricharan@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2021-02-09 16:41, Md Sadre Alam wrote:
> Add support for gd25lb256e. This device tested on IPQ5018
> platform with dd from/to the flash for read/write respectly,
> and mtd erase for erasing the flash.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c 
> b/drivers/mtd/spi-nor/gigadevice.c
> index 447d84b..8f1e7ec 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -50,6 +50,9 @@ static const struct flash_info gigadevice_parts[] = {
>  			   SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
>  			   SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>  		.fixups = &gd25q256_fixups },
> +	{ "gd25lb256e", INFO(0xc86719, 0, 64 * 1024, 512,
> +			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			  SPI_NOR_4B_OPCODES) },
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_gigadevice = {

ping! Is there any additional info needed for this ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
