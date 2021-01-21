Return-Path: <SRS0=p/ok=GY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727FAC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 11:23:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA0F239E7
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 11:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA0F239E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=26QVX3vTGOn49wlMOPVk+dT6rdW/xWq9Omc5tOkUswo=; b=eOJooGf4ZjzjcquLsbCD8vtyJ
	tee4XjB+GfqCXwCe4QbdmPRSsqeG6ehFN+6FEcWrkj9UJVKhhaMVeh8Dd2MHxUlHYkAPS7C3OIord
	LnKH94D5tR3tGzERBRKKNGAQ9+4dDopViEoRy2YTLAzAtk6s7Qn3oMilQ38/KpzxmCChHVuD2J+Pq
	9fT3uqdLR9V0wtNU9B8DPzT/wlgqW1nXt3qIIYlCKk9p6SwhmYydOSRMKDpN7H1MfNB1P9dndoMzg
	8STo+ck/PfERyAL9CdzcYWWPhzTvQhIpY1WAAeh8l7/SPVZ4N90aBzQ4ohI6gsocqthgkJyUPh6p2
	OUYxZR7fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Y2n-0006XU-4q; Thu, 21 Jan 2021 11:22:29 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Y0O-0005MO-S6
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2021 11:20:03 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C1A3222F99;
 Thu, 21 Jan 2021 12:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611227995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfA5sDEfOrTJ7lqta+LVdMu5oQBcVVyeiVfk9SLOxew=;
 b=M7zdzinjrRQS05nMuvct0Oh1oddxPXwlSeB9gPl1/LkDxoQri+X70fUyH47L2XWyGmwJbU
 thK8ZJb90l/Yri7H2cGuk8Kt4I/syz3N92XVQSwNadvXQOUte60KnI1Mo1kU1XrF2JmZHU
 /uUuiD9uQ1k+lvX30aUYsm75C2HzoAI=
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 12:19:51 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
In-Reply-To: <20210121110546.382633-2-tudor.ambarus@microchip.com>
References: <20210121110546.382633-1-tudor.ambarus@microchip.com>
 <20210121110546.382633-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <57e8fead974fe6c7ca38609d4129acd4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_062001_205764_50523493 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kavyasree.Kotagiri@microchip.com,
 miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-01-21 12:05, schrieb Tudor Ambarus:
> Even if sst26vf shares the SPINOR_OP_GBULK opcode with
> Macronix (ex. MX25U12835F) and Winbound (ex. W25Q128FV),
> it has its own Individual Block Protection scheme, which
> is also capable to read-lock individual parameter blocks.
> Thus the sst26vf's Individual Block Protection scheme will
> reside in the sst.c manufacturer driver.
> 
> Add support to unlock the entire flash memory. The device
> is write-protected by default after a power-on reset cycle
> (volatile software protection), in order to avoid inadvertent
> writes during power-up. Could do an erase, write, read back,
> and compare when MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

> ---
> v3:
> - s/Winbound/Winbond/
> - read CR.BPNV and check if we can really unlock the entire flash array
> - sst26vf_unlock: return -EINVAL instead of -EOPNOTSUPP when caller
> asks to unlock a range/granularity that we can't unlock
> 
> v2: v2: s/!ofs/ofs == 0/
> 
>  drivers/mtd/spi-nor/core.c |  2 +-
>  drivers/mtd/spi-nor/core.h |  1 +
>  drivers/mtd/spi-nor/sst.c  | 52 ++++++++++++++++++++++++++++++++++++--
>  3 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e82732dd31e1..c50b30fbb912 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -465,7 +465,7 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 
> *fsr)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
> +int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
>  {
>  	int ret;
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index eb26796db026..4a3f7f150b5d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -441,6 +441,7 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor 
> *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
>  int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
> +int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
>  int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
>  int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 00e48da0744a..980f4c09c91d 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -8,6 +8,53 @@
> 
>  #include "core.h"
> 
> +#define SST26VF_CR_BPNV		BIT(3)
> +
> +static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t 
> len)
> +{
> +	int ret;
> +
> +	/* We only support unlocking the entire flash array. */
> +	if (ofs != 0 || len != nor->params->size)
> +		return -EINVAL;
> +
> +	ret = spi_nor_read_cr(nor, nor->bouncebuf);
> +	if (ret)
> +		return ret;
> +
> +	if (!(nor->bouncebuf[0] & SST26VF_CR_BPNV)) {
> +		dev_dbg(nor->dev, "Any block has been permanently locked\n");
> +		return -EINVAL;
> +	}
> +
> +	return spi_nor_global_block_unlock(nor);
> +}
> +
> +static int sst26vf_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t 
> len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct spi_nor_locking_ops sst26vf_locking_ops = {
> +	.lock = sst26vf_lock,
> +	.unlock = sst26vf_unlock,
> +	.is_locked = sst26vf_is_locked,
> +};
> +
> +static void sst26vf_default_init(struct spi_nor *nor)
> +{
> +	nor->params->locking_ops = &sst26vf_locking_ops;
> +}
> +
> +static const struct spi_nor_fixups sst26vf_fixups = {
> +	.default_init = sst26vf_default_init,
> +};
> +
>  static const struct flash_info sst_parts[] = {
>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>  	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> @@ -39,8 +86,9 @@ static const struct flash_info sst_parts[] = {
>  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
>  			      SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
> -			      SECT_4K | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ) },
> +			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		.fixups = &sst26vf_fixups },
>  };
> 
>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
