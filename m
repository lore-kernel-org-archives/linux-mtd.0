Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEB0C2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 19:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E453224655
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 19:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DVFGCaAZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="MVrIyWGF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E453224655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQxfEAejx6AoRG6ajZCa+SSCo9a7ewyVmfXOHU9GesY=; b=DVFGCaAZy8QkI/
	GoiLOUUUhCA7Zn8zCALCKMGBV5E88RPKHDrJ58eE6e/f+mnP66O/fDgAB9Ega42wovnfrX5rBSXah
	DW84AmiySBQsS7aZ8h6uOF7pN5YbUcA9NWKn4p9YwcEG35U3X3q4KIDozXUxFVG2XDmBRyP+nY4yd
	QGCJXUPd9XWzqc5jnFK+uqVrfKY0Hr/PzQXJCjK1I3AhOY2sbxYV3W2/Ic54iY91lKpa8KuZ/Aq87
	Q8Nvs69tEGjxTlw2zgRZZBw6wRXp09EGCi6vzEkIvuBx3dXz9W/tTFbwehXTyNAiUc+pKqrMzJ+u6
	bRqFcU1nNySu6Q9tvMFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuLnw-0004vE-NA; Wed, 22 Jan 2020 19:36:44 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuLnq-0004ui-9r
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 19:36:40 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 089AA23061;
 Wed, 22 Jan 2020 20:36:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1579721795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/SSszZGKppCJ9+q8XPFWdBCWBaQXR1n3Mv/WeCSt7Y=;
 b=MVrIyWGFoL7i3KGPHYZ0BjAKEIc7Ivgnn+Ob6Q+GKEMft21CEOjWw5ijDqhZAcCfyaUSQl
 GCQo0WdwHmmOPvhj5SCxXZNaqN4ff+Ge59WdZx1UwtiphH6VNxB/uqGSspFQdd4xmYA6mK
 7uuKjzPdCWtk88vCxhXzWi6FCmrlYgI=
From: Michael Walle <michael@walle.cc>
To: js07.lee@samsung.com
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Date: Wed, 22 Jan 2020 20:36:08 +0100
Message-Id: <20200122193608.3859-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113055907.9029-2-js07.lee@samsung.com>
References: <20200113055907.9029-2-js07.lee@samsung.com>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 089AA23061
X-Spamd-Result: default: False [6.40 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TAGGED_RCPT(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM(-0.00)[-0.801]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:31334, ipnet:2a02:810c::/31, country:DE];
 FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,microchip.com,ti.com,walle.cc];
 SUSPICIOUS_RECIPS(1.50)[]
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_113638_657953_EC564208 
X-CRM114-Status: GOOD (  29.25  )
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
Cc: Michael Walle <michael@walle.cc>, tudor.ambarus@microchip.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Currently, we are supporting block protection only for
> flash chips with 3 block protection bits in the SR register.
> This patch enables block protection support for some flash with
> 4 block protection bits(bp0-3).
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---
> v3 :
>   Fix wrong ofs calculation on v2 patch
> v2 :
>   Add sample table portion about 4bit block protection on the comment
>   Trivial coding style change
> 
>  drivers/mtd/spi-nor/spi-nor.c | 127 +++++++++++++++++++++++++++++-----
>  include/linux/mtd/spi-nor.h   |   8 +++
>  2 files changed, 119 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e3da6a8654a8..7e8af6c4fdfa 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -238,6 +238,14 @@ struct flash_info {
>  					 * status register. Must be used with
>  					 * SPI_NOR_HAS_TB.
>  					 */
> +#define SPI_NOR_HAS_BP3		BIT(17)	/*
> +					 * Flash SR has 4 bit fields (BP0-3)
> +					 * for block protection.
> +					 */
> +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> +					 * BP3 is bit 6 of status register.
> +					 * Must be used with SPI_NOR_HAS_BP3.
> +					 */
>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> @@ -1767,23 +1775,47 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
>  	struct mtd_info *mtd = &nor->mtd;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 tb_mask = SR_TB_BIT5;
> -	int pow;
> +	u8 bp;
> +	int pow = 0;
>  
>  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>  		tb_mask = SR_TB_BIT6;
>  
> -	if (!(sr & mask)) {
> -		/* No protection */
> -		*ofs = 0;
> -		*len = 0;
> +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> +		u8 tmp;
> +
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> +			tmp = sr & (mask | SR_BP3_BIT6);
> +		else
> +			tmp = sr & (mask | SR_BP3_BIT5);
> +
> +		if (tmp & SR_BP3_BIT6)
> +			tmp = (tmp & ~BIT(6)) | BIT(5);
> +
> +		bp = tmp >> SR_BP_SHIFT;
> +		if (!bp) {
> +			*ofs = 0;
> +			*len = 0;
> +			return;
> +		}
> +		if (bp <= ilog2(nor->n_sectors))
> +			pow = ilog2(nor->n_sectors) + 1 - bp;
>  	} else {
> -		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
> -		*len = mtd->size >> pow;
> -		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> +		bp = (sr & mask) >> SR_BP_SHIFT;
> +		if (!bp) {
>  			*ofs = 0;
> -		else
> -			*ofs = mtd->size - *len;
> +			*len = 0;
> +			return;
> +		}
> +		pow = bp ^ (mask >> SR_BP_SHIFT);
>  	}
> +
> +	*len = mtd->size >> pow;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> +		*ofs = 0;
> +	else
> +		*ofs = mtd->size - *len;
>  }
>  
>  /*
> @@ -1823,7 +1855,7 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
>  
>  /*
>   * Lock a region of the flash. Compatible with ST Micro and similar flash.
> - * Supports the block protection bits BP{0,1,2} in the status register
> + * Supports the block protection bits BP{0,1,2,3} in the status register
>   * (SR). Does not support these features found in newer SR bitfields:
>   *   - SEC: sector/block protect - only handle SEC=0 (block protect)
>   *   - CMP: complement protect - only support CMP=0 (range is not complemented)
> @@ -1831,7 +1863,7 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
>   * Support for the following is provided conditionally for some flash:
>   *   - TB: top/bottom protect
>   *
> - * Sample table portion for 8MB flash (Winbond w25q64fw):
> + * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-2):
>   *
>   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
>   *  --------------------------------------------------------------------------
> @@ -1851,6 +1883,32 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
>   *    0   |   1   |   1   |   0   |   1   |  2 MB         | Lower 1/4
>   *    0   |   1   |   1   |   1   |   0   |  4 MB         | Lower 1/2
>   *
> + * Sample table portion for 64MB flash (Micron n25q512ax3 / BP0-3):
> + *
> + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
> + *  --------------------------------------------------------------------------
> + *    0   |   0   |   0   |   0   |   0   |  NONE         | NONE
> + *    0   |   0   |   0   |   0   |   1   |   64 KB       | Upper 1/1024
> + *    0   |   0   |   0   |   1   |   0   |  128 KB       | Upper 1/512
> + *    0   |   0   |   0   |   1   |   1   |  256 KB       | Upper 1/256
> + *   ...
> + *    0   |   1   |   0   |   0   |   1   |  16 MB        | Upper 1/4
> + *    0   |   1   |   0   |   1   |   0   |  32 MB        | Upper 1/2
> + *    0   |   1   |   0   |   1   |   1   |  64 MB        | ALL
> + *    0   |   1   |   1   |   0   |   0   |  64 MB        | ALL
> + *   ...
> + *  ------|-------|-------|-------|-------|---------------|-------------------
> + *    1   |   0   |   0   |   0   |   0   |   NONE        | NONE
> + *    1   |   0   |   0   |   0   |   1   |   64 KB       | Lower 1/1024
> + *    1   |   0   |   0   |   1   |   0   |  128 KB       | Lower 1/512
> + *    1   |   0   |   0   |   1   |   1   |  256 KB       | Lower 1/256
> + *   ...
> + *    1   |   1   |   0   |   0   |   1   |  16 MB        | Lower 1/4
> + *    1   |   1   |   0   |   1   |   0   |  32 MB        | Lower 1/2
> + *    1   |   1   |   0   |   1   |   1   |  64 MB        | ALL
> + *    1   |   1   |   1   |   0   |   0   |  64 MB        | ALL
> + *   ...
> + *
>   * Returns negative on errors, 0 on success.
>   */
>  static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> @@ -1898,6 +1956,12 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>  		tb_mask = SR_TB_BIT6;
>  
> +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> +			mask = mask | SR_BP3_BIT6;
> +		else
> +			mask = mask | SR_BP3_BIT5;
> +	}
>  	/*
>  	 * Need smallest pow such that:
>  	 *
> @@ -1908,7 +1972,17 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
>  	 */
>  	pow = ilog2(mtd->size) - ilog2(lock_len);
> -	val = mask - (pow << SR_BP_SHIFT);
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> +		val = ilog2(nor->n_sectors) + 1 - pow;

Why do you use a new calculation here? As far as I can see, the method is
the same except that is has one bit more. That also raises the question why
n_sectors is now needed?

Can't we just initialize the mask with

mask = SR_BP2 | SR_BP1 | SR_BP0;
if (nor->flags & SNOR_F_HAS_SR_BP3)
    mask |= SR_BP3_BIT5;

do the calculation and checks and then move the SR_BP3_BIT5 to SR_BP3_BIT6
if SNOR_F_HAS_SR_BP3_BIT6 is set.

> +		val = val << SR_BP_SHIFT;
> +
> +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> +			val = (val & ~BIT(5)) | BIT(6);
> +	} else {
> +		val = mask - (pow << SR_BP_SHIFT);
> +	}
> +
>  	if (val & ~mask)
>  		return -EINVAL;
>  	/* Don't "lock" with no region! */
> @@ -1983,6 +2057,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  
>  	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
>  		tb_mask = SR_TB_BIT6;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3) {
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> +			mask = mask | SR_BP3_BIT6;
> +		else
> +			mask = mask | SR_BP3_BIT5;
> +	}
>  	/*
>  	 * Need largest pow such that:
>  	 *
> @@ -1995,13 +2076,20 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	pow = ilog2(mtd->size) - order_base_2(lock_len);
>  	if (lock_len == 0) {
>  		val = 0; /* fully unlocked */
> +	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
> +		val = ilog2(nor->n_sectors) + 1 - pow;
> +		val = val << SR_BP_SHIFT;
> +
> +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> +			val = (val & ~BIT(5)) | BIT(6);
>  	} else {
>  		val = mask - (pow << SR_BP_SHIFT);
> -		/* Some power-of-two sizes are not supported */
> -		if (val & ~mask)
> -			return -EINVAL;
>  	}
>  
> +	/* Some power-of-two sizes are not supported */
> +	if (val & ~mask)
> +		return -EINVAL;
> +
>  	status_new = (status_old & ~mask & ~tb_mask) | val;
>  
>  	/* Don't protect status register if we're fully unlocked */
> @@ -4736,6 +4824,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	/* Set SPI NOR sizes. */
>  	params->size = (u64)info->sector_size * info->n_sectors;
>  	params->page_size = info->page_size;
> +	params->n_sectors = info->n_sectors;
>  
>  	if (!(info->flags & SPI_NOR_NO_FR)) {
>  		/* Default to Fast Read for DT and non-DT platform devices. */
> @@ -5192,6 +5281,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>  	if (info->flags & USE_CLSR)
>  		nor->flags |= SNOR_F_USE_CLSR;
> +	if (info->flags & SPI_NOR_HAS_BP3) {
> +		nor->flags |= SNOR_F_HAS_SR_BP3;
> +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> +	}
>  
>  	if (info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
> @@ -5199,6 +5293,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	mtd->dev.parent = dev;
>  	nor->page_size = params->page_size;
>  	mtd->writebufsize = nor->page_size;
> +	nor->n_sectors = params->n_sectors;
>  
>  	if (of_property_read_bool(np, "broken-flash-reset"))
>  		nor->flags |= SNOR_F_BROKEN_RESET;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 541c06d042e8..92d550501daf 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -129,7 +129,9 @@
>  #define SR_BP1			BIT(3)	/* Block protect 1 */
>  #define SR_BP2			BIT(4)	/* Block protect 2 */
>  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
> +#define SR_BP3_BIT5		BIT(5)	/* Block protect 3 */

maybe just name it SR_BP3? would also be more consistent with the proposal
above.

>  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
> +#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
>  #define SR_SRWD			BIT(7)	/* SR write protect */
>  /* Spansion/Cypress specific status bits */
>  #define SR_E_ERR		BIT(5)
> @@ -248,6 +250,8 @@ enum spi_nor_option_flags {
>  	SNOR_F_HAS_16BIT_SR	= BIT(9),
>  	SNOR_F_NO_READ_CR	= BIT(10),
>  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> +	SNOR_F_HAS_SR_BP3	= BIT(12),
> +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
>  
>  };
>  
> @@ -519,6 +523,7 @@ struct spi_nor_locking_ops {
>   *
>   * @size:		the flash memory density in bytes.
>   * @page_size:		the page size of the SPI NOR flash memory.
> + * @n_sectors:		number of sectors
>   * @hwcaps:		describes the read and page program hardware
>   *			capabilities.
>   * @reads:		read capabilities ordered by priority: the higher index
> @@ -541,6 +546,7 @@ struct spi_nor_locking_ops {
>  struct spi_nor_flash_parameter {
>  	u64				size;
>  	u32				page_size;
> +	u16				n_sectors;
>  
>  	struct spi_nor_hwcaps		hwcaps;
>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
> @@ -573,6 +579,7 @@ struct flash_info;
>   * @bouncebuf_size:	size of the bounce buffer
>   * @info:		spi-nor part JDEC MFR id and other info
>   * @page_size:		the page size of the SPI NOR
> + * @n_sector:		number of sectors
>   * @addr_width:		number of address bytes
>   * @erase_opcode:	the opcode for erasing a sector
>   * @read_opcode:	the read opcode
> @@ -599,6 +606,7 @@ struct spi_nor {
>  	size_t			bouncebuf_size;
>  	const struct flash_info	*info;
>  	u32			page_size;
> +	u16			n_sectors;
>  	u8			addr_width;
>  	u8			erase_opcode;
>  	u8			read_opcode;
> -- 
> 2.17.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
