Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D10C35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 15:33:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F23B20702
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 15:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YgcZ3xl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F23B20702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qye/q5deM0Bgg/mBp2L+f17Y8DPjroyuFOKm/0qtEf0=; b=YgcZ3xl/B8c+FCMb67cV5CWQl
	aaw9I+ionTCRCOwUjHaBrUFjzvo4O+ZSgx2TK7d+litGKOgA08M8f787fPJUWuxp6zimamscMSaeT
	7o3FSyRdanJ2SP74qQrWFb+vinkFRF8BaLcEQWX6VoAF4LCms0lzbjqS2jOm3e/TVbmJyDLA20AFb
	G6zvKG7FIlCQDiJNmB0h15ftnpwiS/tQ51DmwCc8Z0M5osC8eOOSfUQUAqSYkzFWh6W7Vr5E0YJum
	75QGx9oZIvXZfH0o+S4QFjnlLswnO/QhGZVTb3AHaXtrVPiY/fIMGS+vL9PN4IZmK4imVN6tAhi0C
	75aamJ24w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izMfn-00077g-7J; Wed, 05 Feb 2020 15:33:03 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izMfk-00076D-Aw
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 15:33:02 +0000
Received: from LHREML711-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 56F9ABB8073670B4BB93;
 Wed,  5 Feb 2020 15:32:35 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML711-CAH.china.huawei.com (10.201.108.34) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 5 Feb 2020 15:32:35 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 5 Feb 2020
 15:32:34 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size for S25FS-S
To: Alexander X Sverdlin <alexander.sverdlin@nokia.com>,
 <linux-mtd@lists.infradead.org>
References: <20200114134704.4708-1-alexander.sverdlin@nokia.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <2759888e-0a88-cf76-d2c0-3f0f5141f8cd@huawei.com>
Date: Wed, 5 Feb 2020 15:32:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200114134704.4708-1-alexander.sverdlin@nokia.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml720-chm.china.huawei.com (10.201.108.71) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_073300_526649_1E4E7DA0 
X-CRM114-Status: GOOD (  21.51  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 14/01/2020 13:47, Alexander X Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Spansion S25FS-S family has an issue in Basic Flash Parameter Table:
> DWORD-11 bits 7-4 specify write page size 512 bytes. In reality this
> is configurable in the non-volatile CR3NV register and even factory
> default configuration is "wrap at 256 bytes". So blind relying on BFPT
> breaks write operation on these Flashes.
> 
> All this story is vendor-specific, so add the corresponding fixup hook
> which first restores the safe page size of 256 bytes from
> struct flash_info but checks is more performant 512 bytes configuration
> is active and adjusts the page_size accordingly.
> 

Hi Alexander,

One of my dev boards has part s25fl129p1, so I would like to try this 
patch. However it does not apply. Any chance you could resend?

Thanks
John

> Cc: stable@vger.kernel.org
> Fixes: f384b352c ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>   drivers/mtd/spi-nor/spi-nor.c | 39 +++++++++++++++++++++++++++++++++++++--
>   include/linux/mtd/spi-nor.h   |  5 +++++
>   2 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 73172d7..18f8705 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1711,6 +1711,39 @@ static struct spi_nor_fixups mx25l25635_fixups = {
>   	.post_bfpt = mx25l25635_post_bfpt_fixups,
>   };
>   
> +/* Spansion S25FS-S SFDP workarounds */
> +static int s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
> +	const struct sfdp_parameter_header *bfpt_header,
> +	const struct sfdp_bfpt *bfpt,
> +	struct spi_nor_flash_parameter *params)
> +{
> +	const struct flash_info *info = nor->info;
> +	u8 read_opcode, buf;
> +	int ret;
> +
> +	/* Default is safe */
> +	params->page_size = info->page_size;
> +
> +	/*
> +	 * But is the chip configured for more performant 512 bytes write page
> +	 * size?
> +	 */
> +	read_opcode = nor->read_opcode;
> +
> +	nor->read_opcode = SPINOR_OP_RDAR;
> +	ret = nor->read(nor, SPINOR_REG_CR3V, 1, &buf);

struct spi_nor has no member .read AFAICS.

> +	if (!ret && (buf & CR3V_02H_V))
> +		params->page_size = 512;
> +
> +	nor->read_opcode = read_opcode;
> +
> +	return ret;
> +}
> +
> +static const struct spi_nor_fixups s25fs_s_fixups = {
> +	.post_bfpt = s25fs_s_post_bfpt_fixups,
> +};
> +
>   /* NOTE: double check command sets and memory organization when you add
>    * more nor chips.  This current list focusses on newer chips, which
>    * have been converging on command sets which including JEDEC ID.
> @@ -1903,7 +1936,8 @@ static const struct flash_info spi_nor_ids[] = {
>   			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>   	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
>   			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
> +	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR)
> +			.fixups = &s25fs_s_fixups, },
>   	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>   	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
>   			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> @@ -1913,7 +1947,8 @@ static const struct flash_info spi_nor_ids[] = {
>   	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>   	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
>   	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +			.fixups = &s25fs_s_fixups, },
>   	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
>   	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
>   	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3d360b..222eee9 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -114,6 +114,7 @@
>   /* Used for Spansion flashes only. */
>   #define SPINOR_OP_BRWR		0x17	/* Bank register write */
>   #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
> +#define SPINOR_OP_RDAR		0x65	/* Read Any Register */
>   
>   /* Used for Micron flashes only. */
>   #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> @@ -149,6 +150,10 @@
>   /* Status Register 2 bits. */
>   #define SR2_QUAD_EN_BIT7	BIT(7)
>   
> +/* Used for Spansion flashes RDAR command only. */
> +#define SPINOR_REG_CR3V		0x800004
> +#define CR3V_02H_V		BIT(4)	/* Page Buffer Wrap */
> +
>   /* Supported SPI protocols */
>   #define SNOR_PROTO_INST_MASK	GENMASK(23, 16)
>   #define SNOR_PROTO_INST_SHIFT	16
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
