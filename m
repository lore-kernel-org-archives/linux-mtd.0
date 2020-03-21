Return-Path: <SRS0=qq/S=5G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BF8C4332B
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 20:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F59E20753
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 20:48:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o+t4ANll";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="c5VeRndB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F59E20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6pZ8Un8ExkNs3qnzLmGWCw1XOXJKezdFl8r/hrc7h5o=; b=o+t4ANllIXzdVUrSYFo8osdP5
	k+OVH3jUh4W7brst2wN+F3tw99XNJSDn+ymbXykTV4srQm28ehWDGNwVlSJJ/Bq103SqkaiI/mnel
	a5A1A7nDs4pq3ozoxg4vyRNPjgPaO0MoSb5VpBU/iCDPKMy/IKyGgy9eadJ5CrZTu8WVL2WEfxkV7
	SZC1oH4CbE1OAphdvDR6p1ZSFZ4QBq/ZdSczd3YqkjmfKBzbAe2z+UkwFdR6n4mnyVDPzHehTVDzL
	XDk6dQh4sGVvzk7ripbHVe6pagkv3tVW6HQSLJ12ADR4QkhxONHNgJRrAeOqjpgtjhbANcKRec4xJ
	KA1CyMETw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFl35-0000rH-Ol; Sat, 21 Mar 2020 20:48:51 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFl31-0000p6-Az
 for linux-mtd@lists.infradead.org; Sat, 21 Mar 2020 20:48:49 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CBB0823E25;
 Sat, 21 Mar 2020 21:48:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1584823724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOzv+y0IiA4TuPX1I5u2Olo5HuFVAH05mhOKV3bXrbM=;
 b=c5VeRndBil/GBFkUrPpw3YK0oEJvTiLdadaiaFlW10p0x/PBqZEN3ztGjgGYwU2uNDnjg9
 QZi3RrkeJw8cF/aWK85WNVOvDYtIT79XGqDV1pmiHkMyZE093PfOT4cSFNFgtwSdyauNsV
 7MNUypDwChGq6eAp/FgEM9udb7u+FgQ=
MIME-Version: 1.0
Date: Sat, 21 Mar 2020 21:48:44 +0100
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: reimplement block protection handling
In-Reply-To: <20200318120615.4639-1-js07.lee@samsung.com>
References: <y>
 <CGME20200318120801epcas1p3845986eadf5f4aea47233f71e4e60508@epcas1p3.samsung.com>
 <20200318120615.4639-1-js07.lee@samsung.com>
Message-ID: <bfd2272bcf9ebb5971abfe34b3cc7f59@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: CBB0823E25
X-Spamd-Result: default: False [1.40 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; NEURAL_HAM(-0.00)[-0.678];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[microchip.com,ti.com,lists.infradead.org,gmail.com,hisilicon.com,huawei.com];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_134847_694133_795CA0D2 
X-CRM114-Status: GOOD (  20.45  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 chenxiang <chenxiang66@hisilicon.com>, John Garry <john.garry@huawei.com>,
 linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 js07.lee@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-03-18 13:06, schrieb Jungseung Lee:
> The current mainline locking was restricted and could only be applied
> to flashes that has 3 block protection bit and fixed locking ratio.
> 
> A new method of normalization was reached at the end of the discussion 
> [1].
> 
>     (1) - if bp slot is insufficient.
>     (2) - if bp slot is sufficient.
> 
>     if (bp_slots_needed > bp_slots)    // (1)
>         min_prot_length = sector_size << (bp_slots_needed - bp_slots);
>     else                               // (2)
>         min_prot_length = sector_size;
> 
> This patch changes logic to handle block protection based on 
> min_prot_length.
> It is suitable for the overall flashes with exception of some corner 
> case
> and easy to extend and apply for the case of 2bit or 4bit block 
> protection.
> 
> [1] 
> http://lists.infradead.org/pipermail/linux-mtd/2020-February/093934.html
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>

Reviewed-by: Michael Walle <michael@walle.cc>

Tested with a W25Q32JW-IM.

Tested-by: Michael Walle <michael@walle.cc>

> ---
>  drivers/mtd/spi-nor/core.c | 110 ++++++++++++++++++++++---------------
>  1 file changed, 66 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 877557dbda7f..e4ed8553aae8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1514,29 +1514,64 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>  	return ret;
>  }
> 
> +static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
> +{
> +	return SR_BP2 | SR_BP1 | SR_BP0;
> +}
> +
> +static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
> +{
> +	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> +		return SR_TB_BIT6;
> +	else
> +		return SR_TB_BIT5;
> +}
> +
> +static int spi_nor_get_min_prot_length(struct spi_nor *nor)
> +{
> +	int bp_slots, bp_slots_needed;
> +	u8 mask = spi_nor_get_bp_mask(nor);
> +
> +	bp_slots = (mask >> SR_BP_SHIFT) + 1;
> +
> +	/* Reserved one for "protect none" and one for "protect all". */
> +	bp_slots = bp_slots - 2;
> +
> +	bp_slots_needed = ilog2(nor->info->n_sectors);
> +
> +	if (bp_slots_needed > bp_slots)
> +		return nor->info->sector_size <<
> +			(bp_slots_needed - bp_slots);
> +	else
> +		return nor->info->sector_size;
> +}
> +
>  static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr,
> loff_t *ofs,
>  					uint64_t *len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> -	int pow;
> -
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> +	int min_prot_len;
> +	u8 mask = spi_nor_get_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_tb_mask(nor);
> +	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> 
> -	if (!(sr & mask)) {
> +	if (!bp) {
>  		/* No protection */
>  		*ofs = 0;
>  		*len = 0;
> -	} else {
> -		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
> -		*len = mtd->size >> pow;
> -		if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> -			*ofs = 0;
> -		else
> -			*ofs = mtd->size - *len;
> +		return;
>  	}
> +
> +	min_prot_len = spi_nor_get_min_prot_length(nor);
> +	*len = min_prot_len << (bp - 1);
> +
> +	if (*len > mtd->size)
> +		*len = mtd->size;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
> +		*ofs = 0;
> +	else
> +		*ofs = mtd->size - *len;
>  }
> 
>  /*
> @@ -1610,8 +1645,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	int ret, status_old, status_new;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> +	int min_prot_len;
> +	u8 mask = spi_nor_get_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_tb_mask(nor);
>  	u8 pow, val;
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags & 
> SNOR_F_HAS_SR_TB;
> @@ -1648,20 +1684,14 @@ static int spi_nor_sr_lock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	else
>  		lock_len = ofs + len;
> 
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> +	if (lock_len == mtd->size) {
> +		val = mask; /* fully locked */
> +	} else {
> +		min_prot_len = spi_nor_get_min_prot_length(nor);
> +		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> +		val = pow << SR_BP_SHIFT;
> +	}
> 
> -	/*
> -	 * Need smallest pow such that:
> -	 *
> -	 *   1 / (2^pow) <= (len / size)
> -	 *
> -	 * so (assuming power-of-2 size) we do:
> -	 *
> -	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
> -	 */
> -	pow = ilog2(mtd->size) - ilog2(lock_len);
> -	val = mask - (pow << SR_BP_SHIFT);
>  	if (val & ~mask)
>  		return -EINVAL;
>  	/* Don't "lock" with no region! */
> @@ -1696,8 +1726,9 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	int ret, status_old, status_new;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> +	int min_prot_len;
> +	u8 mask = spi_nor_get_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_tb_mask(nor);
>  	u8 pow, val;
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags & 
> SNOR_F_HAS_SR_TB;
> @@ -1734,22 +1765,13 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	else
>  		lock_len = ofs;
> 
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> -	/*
> -	 * Need largest pow such that:
> -	 *
> -	 *   1 / (2^pow) >= (len / size)
> -	 *
> -	 * so (assuming power-of-2 size) we do:
> -	 *
> -	 *   pow = floor(log2(size / len)) = log2(size) - ceil(log2(len))
> -	 */
> -	pow = ilog2(mtd->size) - order_base_2(lock_len);
>  	if (lock_len == 0) {
>  		val = 0; /* fully unlocked */
>  	} else {
> -		val = mask - (pow << SR_BP_SHIFT);
> +		min_prot_len = spi_nor_get_min_prot_length(nor);
> +		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
> +		val = pow << SR_BP_SHIFT;
> +
>  		/* Some power-of-two sizes are not supported */
>  		if (val & ~mask)
>  			return -EINVAL;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
