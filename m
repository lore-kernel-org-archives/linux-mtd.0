Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B29CD6E73
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Nov 2025 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtTMTsVExKWk8Ld834s0W5VmYAdJWFbne7Y8fcn6mnk=; b=jTB8Yr7YxArsHB
	wV2hXwYED4WeLf0Zdvn6VL4L2YaIGAzTCfMg3e2wJUjKEy5vkPVKItABKdOEPR1cRird+n6Po2oh4
	8k2uTLzkSq9I2u4XHsBOkgHIBU73t6vQv1ocKUAz4GM4dRknnjH5zY2fhLYdnjvXmmsWQBKrbd7oK
	Y86Ktw2cLdPRmKGe0AlWAwqi7mDeYi4ygRPiQ4jUI6pRN/Zqr9/72NINrTc5JcJYLYVnhdyjW7tsS
	x+9fXaIyC76X6sJzxKtE4vptzjPkP8s19OcATW1Me8Ovj14h9LE53DJif+YeR9qIdndqlkBbSa7mV
	t6SIwPZYtksFJmeDk7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYbT-0000000Adgj-2hka;
	Thu, 13 Nov 2025 14:47:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYbR-0000000Adgc-3k9V
	for linux-mtd@lists.infradead.org;
	Thu, 13 Nov 2025 14:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F0F560273;
	Thu, 13 Nov 2025 14:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3EBC4CEF8;
	Thu, 13 Nov 2025 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763045232;
	bh=TCbkId1rthq/rBe3fuZKHCEYKZLoEFVLkV3ScozLW+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fm8aVoA7pxSX7/RLgq4DBx3II2EEz/eVo8/vsaJRykNL2VHG97A5qFG9fiqzU9Hq3
	 OCKduCgQp0YgRhWrYYr00jczK5puFJ59yeo5CkQ22PobGN4JebFOVbj2ROmfZRjViP
	 xoqbWbidvYED6kqvuQkvp46Rx/ZkDSZ/o3ByjMqVpfjD13JXjAuMtq5SJwphwnVBKB
	 iLDq4hCEEoA2c2AmBAkVa9DloK/JHAHSOeX3gkVlDEBAhL2ER+nGvX6Hd4FHNgGm9X
	 VpPZKnrsl+rYTbUuarZWwGL/uE2/zh3jIJeg4/khQ4JvF+Ftuz3PcDLKUVmcGnrnJi
	 9e7E7J5zIs9/Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev
Subject: Re: [PATCH v4 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
In-Reply-To: <20251112-nor-v4-5-e4637be82a0a@nxp.com> (Haibo Chen's message of
	"Wed, 12 Nov 2025 19:05:13 +0800")
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
	<20251112-nor-v4-5-e4637be82a0a@nxp.com>
Date: Thu, 13 Nov 2025 15:47:09 +0100
Message-ID: <mafs08qga9ehe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Wed, Nov 12 2025, Haibo Chen wrote:

> The MT35XU02GCBA flash device does not support chip erase,
> according to its datasheet. It supports die erase, which
> means the current driver implementation will likely need
> to be converted to use die erase.
>
> Furthermore, similar to the MT35XU01GBBA, the
> SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs to be enabled.
>
> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index c89c06b1fc61a581fea2e18732be2501a15715f9..f94e9d2d17bf4aa7c36ba3aa37d34f767a9f93ac 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -204,6 +204,16 @@ static const struct flash_info micron_nor_parts[] = {
>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>  		.fixups = &mt35xu01gbba_fixups,
>  	}, {
> +		/*
> +		 * The MT35XU02GCBA flash device does not support
> +		 * chip erase, according to its datasheet.
> +		 * It supports die erase, which means the current
> +		 * driver implementation will likely need to be
> +		 * converted to use die erase.
> +		 * Furthermore, similar to the MT35XU01GBBA, the
> +		 * SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
> +		 * to be enabled.
> +		 */

Maybe I am missing some context from previous patches, but why are we
adding this comment here instead of fixing the support for this flash?
What does "the driver will likely need to be converted to use die erase"
mean? If it doesn't support chip erase, then it _does_ need to be fixed
by using die erase.

Also, why does the flash "probably" need SPI_NOR_IO_MODE_EN_VOLATILE?
Are you guessing based on datasheet and do not have the hardware at
hand?

The changelog should also explain _why_ this comment is added here, and
not just repeat the text.

>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name = "mt35xu02g",
>  		.sector_size = SZ_128K,

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
