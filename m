Return-Path: <SRS0=afOO=Z3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950E9C43603
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2019 11:22:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E3620707
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2019 11:22:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HHufe3CT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E3620707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mTdT0YCe+lEpD43EKgUBlKJVlDOXFHRZfPFHCnj6W3Q=; b=HHufe3CTVHDaXEBvkDu1B0Rvv
	xzyZUeXYvHiF9L2TvWTJry9btwgWPMU66nh3zId0Pb1BLGkjCH9DvOY++BamEtSnDDR3sx7IwlVYy
	T21NIfuwAOlbZ/2eHna2xJ4CX9tI8A/m17K3gYtwh6A9Wwum+r957eUlhK0vdIOuL5rVbmbeVmUT5
	zFBv0SbLVDmEqBZi/18EcwxgsJWBu78NeGorQTq3taLOWDrIif4eZVUbGbIS/vgngtyILckO6MV7O
	hoNHA7U6HukgcWY/9VZ0xWwZsIRMlLl1kEkaaR2VASBXqTNOALdDTJuVkFfypy55L+yrxy5ZWk/Wc
	2DRRUUHag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icpCd-0008CW-GA; Thu, 05 Dec 2019 11:21:47 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icpCZ-0008BG-HU
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2019 11:21:45 +0000
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 7FD9DD56C9737AD06B31;
 Thu,  5 Dec 2019 11:21:22 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml707-cah.china.huawei.com (10.201.108.48) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 5 Dec 2019 11:21:22 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 11:21:21 +0000
Subject: Re: [PATCH 3/3] mtd: spi-nor: Add USE_FSR flag for n25q* entries
To: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
References: <20191205065935.5727-1-vigneshr@ti.com>
 <20191205065935.5727-4-vigneshr@ti.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <36213198-a09c-a969-1f57-092e0fb7cd68@huawei.com>
Date: Thu, 5 Dec 2019 11:21:20 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191205065935.5727-4-vigneshr@ti.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_032143_725774_25EDFF02 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: chenxiang <chenxiang66@hisilicon.com>, Richard Weinberger <richard@nod.at>,
 Ashish Kumar <Ashish.Kumar@nxp.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/12/2019 06:59, Vignesh Raghavendra wrote:
> Add USE_FSR flag to all variants of n25q entries that support Flag Status
> Register.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>

Tested-by: John Garry <john.garry@huawei.com> #for n25q128a13

> ---
>   drivers/mtd/spi-nor/spi-nor.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index a5cb647378f0..1082b6bb1393 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2454,16 +2454,21 @@ static const struct flash_info spi_nor_ids[] = {
>   	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
>   	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>   	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
> -	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
> -	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
> +	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K |
> +			      USE_FSR | SPI_NOR_QUAD_READ) },
> +	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K |
> +			      USE_FSR | SPI_NOR_QUAD_READ) },
>   	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
>   			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>   			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
> +			      USE_FSR | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },
>   	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
>   			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>   			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> -	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> +	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K |
> +			      USE_FSR | SPI_NOR_QUAD_READ) },
>   	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
>   			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>   			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> @@ -2472,7 +2477,7 @@ static const struct flash_info spi_nor_ids[] = {
>   			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>   			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>   	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
> -			      SPI_NOR_QUAD_READ) },
> +			      USE_FSR | SPI_NOR_QUAD_READ) },
>   	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>   	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>   	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
