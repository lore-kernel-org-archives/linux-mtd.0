Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69ABDC433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 05:32:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C7C52086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 05:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i0d6Xdbj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s7jfRsy9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KQCe62tX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C7C52086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTeX/r2pnp6veHAVjb+XJaTJ0IQqJXM+lfJDw9cUhDA=; b=i0d6XdbjAU1YON
	nocQuE1dFewSyku8ndg/kAfaVK7NF9dzx46npChF29LdtBxrUPLFGxSTnPlVdZHOLvVaA+gm8R9I1
	iw4ZvfrGO9JhFZqUtzXOUvF3Yffb9N6dB/l2g4DXob0Ahp7iiV3lMON4wBiVW42T11gNYUl4kbdS/
	SJjIciU4n4Xt8IevRWZkjzq2Cnsio4a/QxyqvPgKAOnSqD0g7AxpO0pid+RZdsrqBhKQtUvObeEwv
	Bj7bGKJ2E/vt98CkZv2zBaMvOvCtctfbZMgRMG4STZEhUFlDzZj7EQhBoJTRtAJmgarhHYb7Dy8AV
	1KjH1bUU/4fQkr8OzgUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huVbH-0004t7-Mu; Mon, 05 Aug 2019 05:32:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huVb5-0004az-4o
 for linux-mtd@bombadil.infradead.org; Mon, 05 Aug 2019 05:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewdIibSSQijgwi+dlHIsVHF2PIynzZcDv3GyCZ5qoao=; b=s7jfRsy9iORF2bHPG5kW6Mal0O
 Qglxau5+DA95Jty7IDINc7Ap7LNOFhmEMjXhSr41axLGcDVILw7m0ulErT6SpRH8sLQUh4x9/bpGq
 NncUmhIW6pSpsHJ31WbSSDE3jQpz3Z9927dPzsa7XfRBjmC0AieFFDteCDH/jAM0rWYc0GpLb7wgk
 D9iJ1J3Hyi3lBpVgNdag1ZdCelavDrpHqDI+I2RngH63LgW0bF+p4yw9jjJQVo0DHPTz2XoROjxkk
 1ca6TBstYQraQ7r+B4Ruy3De9NRFViU3WXXHbAZ+xVT2bbV6jrhnvVOgngOOhMvd4Bzzf/zTLZ3jZ
 Ytq4ftVA==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huVJl-0004wx-Nq
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 05:13:59 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x755DX7t000360;
 Mon, 5 Aug 2019 00:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564982013;
 bh=ewdIibSSQijgwi+dlHIsVHF2PIynzZcDv3GyCZ5qoao=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KQCe62tXWVeGrSrKB9tF8y+nwKb2Sh5uurchqHfP8F1fhvgx+d8cxZ3C/x1g2gzah
 kWUoh9JEucHPLlqgW/DWzGz7rGPZgbSlup4Q/HHYAMBF3fnKJDVCxndejSz8FioivS
 XC6GeUq/5BAR/0Pk7Dxj1fIG2oFeVjvzZxFidgX8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x755DXbQ036738
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Aug 2019 00:13:33 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 5 Aug
 2019 00:13:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 5 Aug 2019 00:13:32 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x755DT5L104396;
 Mon, 5 Aug 2019 00:13:30 -0500
Subject: Re: [PATCH 6/6] mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>
References: <20190731091145.27374-1-tudor.ambarus@microchip.com>
 <20190731091145.27374-7-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <93dc5a5d-3a72-c80e-0b0d-7fd758a1ea5e@ti.com>
Date: Mon, 5 Aug 2019 10:44:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731091145.27374-7-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_061358_029558_D2201B42 
X-CRM114-Status: GOOD (  25.67  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 31/07/19 2:42 PM, Tudor.Ambarus@microchip.com wrote:
> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> S3AN flashes use a specific opcode to read the status register.
> We currently use the SPI_S3AN flag to decide whether this specific
> SR read opcode should be used, but SPI_S3AN is about to disappear, so
> let's add a new flag.
> 

I think you can drop SPI_S3AN right away either as separate patch in
this series or as part of this patch itself.

Regards
Vignesh

> Note that we use the same bit as SPI_S3AN implies SPI_NOR_XSR_RDY and
> vice versa.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5fea5d7ce2cb..01be6d49ce3b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -213,6 +213,14 @@ struct flash_info {
>  					 * bit. Must be used with
>  					 * SPI_NOR_HAS_LOCK.
>  					 */
> +#define SPI_NOR_XSR_RDY		BIT(10)	/*
> +					 * S3AN flashes have specific opcode to
> +					 * read the status register.
> +					 * Flags SPI_NOR_XSR_RDY and SPI_S3AN
> +					 * use the same bit as one implies the
> +					 * other, but we will get rid of
> +					 * SPI_S3AN soon.
> +					 */
>  #define	SPI_S3AN		BIT(10)	/*
>  					 * Xilinx Spartan 3AN In-System Flash
>  					 * (MFR cannot be used for probing
> @@ -4818,7 +4826,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
>  	 * with Atmel spi-nor
>  	 */
> -	if (info->flags & SPI_S3AN)
> +	if (info->flags & SPI_NOR_XSR_RDY)
>  		nor->flags |=  SNOR_F_READY_XSR_RDY;
>  
>  	/* Kept only for backward compatibility purpose. */
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
