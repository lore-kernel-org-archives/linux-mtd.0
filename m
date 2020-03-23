Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD42C3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A6620719
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T64x74VC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="uyz+NCL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A6620719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vfKApREcY4mBRixUvCxBOiM/qmLvl3HLufLHvFY/dvg=; b=T64x74VC5F8+4UaSfYdhWItO9
	nvnlIrdb5U1aKN+zfhEoTqF5576cYC9uYxZ/2l2gc24lB8MBN/7MkUOEQQI0QckUipxPdYuA/kX3s
	8RvPXoavYZeu79wclhGc4JIojBXhvcpxPLCH85nZ6Coe+JEauH0N4LxjG+PzMwtblQ9tnJnE69rMN
	Vi9wUjClkXPOCsOK8Gg98AyBY4eVC8PMnE0TQfUoDnpsBI3MdKjQV4UnqI5KXmH2ad2OEZkQ4qG66
	UK/ArnQICj7IyF0QjCPsKC+DxaLGgPWnh4/JcCdxkkKWdtJZvH7q0gtj6PHOSIWQT7xmddq2pZEI2
	cdJzn1hoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGRt9-0001eL-RE; Mon, 23 Mar 2020 18:33:27 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGRt5-0001dx-HD
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 18:33:25 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3FB2A2304C;
 Mon, 23 Mar 2020 19:33:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1584988399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmzSB1W+0645O/aUXnWsJnUD+pSDwz5ZPd0LaIp19s8=;
 b=uyz+NCL1nwlT2KEY4UVrs0ST2C+eN8tw2sWER7jv4t9Ylz7S022e/ryD5WvRgvjvwcVbCM
 +DwiABgDxc+ke1+1LyXK74s1pjMwXzqid44w/7Pkqf591464Pcy/212RoA7ciTVO0vo396
 a2zI6vh1cc7JXeMoKvMW6DKDNJSITGE=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 19:33:19 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
In-Reply-To: <20200323092430.1466234-6-tudor.ambarus@microchip.com>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-6-tudor.ambarus@microchip.com>
Message-ID: <572905d538f5ee36a1c4d19de720b696@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 3FB2A2304C
X-Spamd-Result: default: False [-0.10 / 15.00]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.794];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_113323_877908_3C5A08A2 
X-CRM114-Status: GOOD (  23.74  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> From: Jungseung Lee <js07.lee@samsung.com>
> 
> Currently, we are supporting block protection only for flash chips with
> 3 block protection bits (BP0-2) in the SR register.
> 
> Enable block protection support for flashes with 4 block protection 
> bits
> (BP0-3).
> 
> Add a flash_info flag for flashes that describe 4 block protection 
> bits.
> Add another flash_info flag for flashes in which BP3 bit is not 
> adjacent
> to the BP0-2 bits.
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Tested-by: Michael Walle <michael@walle.cc>
> [ta:
> - introduce spi_nor_get_sr_bp_mask(), spi_nor_get_sr_tb_mask()
> - drop Micron n25q512ax3 / BP0-3) boilerplate description

that was actually a comment on my side some time ago. Because the 
current
example isn't really good and lacks the second case (which is added by
this patch).

-michael


> - be explicit in spi_nor_get_locked_range_sr aboyt SR_BP3 as Michael
> suggested,
> - amend commit description]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 66 +++++++++++++++++++++++++++----------
>  drivers/mtd/spi-nor/core.h  | 10 ++++++
>  include/linux/mtd/spi-nor.h |  2 ++
>  3 files changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index c0d186f417d8..b70c0b2e0958 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1514,13 +1514,34 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>  	return ret;
>  }
> 
> +static u8 spi_nor_get_sr_bp_mask(struct spi_nor *nor)
> +{
> +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> +		return mask | SR_BP3_BIT6;
> +
> +	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> +		return mask | SR_BP3;
> +
> +	return mask;
> +}
> +
> +static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
> +{
> +	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> +		return SR_TB_BIT6;
> +	else
> +		return SR_TB_BIT5;
> +}
> +
>  static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>  {
>  	unsigned int bp_slots, bp_slots_needed;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> 
>  	/* Reserved one for "protect none" and one for "protect all". */
> -	bp_slots = (mask >> SR_BP_SHIFT) + 1 - 2;
> +	bp_slots = (1 << hweight8(mask)) - 2;
>  	bp_slots_needed = ilog2(nor->info->n_sectors);
> 
>  	if (bp_slots_needed > bp_slots)
> @@ -1535,12 +1556,14 @@ static void spi_nor_get_locked_range_sr(struct
> spi_nor *nor, u8 sr, loff_t *ofs,
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	u64 min_prot_len;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> -	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
> +	u8 bp, val = sr & mask;
> 
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
> +		val = (val & ~SR_BP3_BIT6) | SR_BP3;
> +
> +	bp = val >> SR_BP_SHIFT;
> 
>  	if (!bp) {
>  		/* No protection */
> @@ -1598,7 +1621,8 @@ static int spi_nor_is_unlocked_sr(struct spi_nor
> *nor, loff_t ofs, uint64_t len,
> 
>  /*
>   * Lock a region of the flash. Compatible with ST Micro and similar 
> flash.
> - * Supports the block protection bits BP{0,1,2} in the status register
> + * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the 
> status
> + * register
>   * (SR). Does not support these features found in newer SR bitfields:
>   *   - SEC: sector/block protect - only handle SEC=0 (block protect)
>   *   - CMP: complement protect - only support CMP=0 (range is not 
> complemented)
> @@ -1633,8 +1657,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  	struct mtd_info *mtd = &nor->mtd;
>  	u64 min_prot_len;
>  	int ret, status_old, status_new;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
>  	u8 pow, val;
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags & 
> SNOR_F_HAS_SR_TB;
> @@ -1671,9 +1695,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  	else
>  		lock_len = ofs + len;
> 
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> -
>  	if (lock_len == mtd->size) {
>  		val = mask;
>  	} else {
> @@ -1681,6 +1702,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
>  		val = pow << SR_BP_SHIFT;
> 
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> +			val = (val & ~SR_BP3) | SR_BP3_BIT6;
> +
>  		if (val & ~mask)
>  			return -EINVAL;
> 
> @@ -1718,8 +1742,8 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	struct mtd_info *mtd = &nor->mtd;
>  	u64 min_prot_len;
>  	int ret, status_old, status_new;
> -	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> -	u8 tb_mask = SR_TB_BIT5;
> +	u8 mask = spi_nor_get_sr_bp_mask(nor);
> +	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
>  	u8 pow, val;
>  	loff_t lock_len;
>  	bool can_be_top = true, can_be_bottom = nor->flags & 
> SNOR_F_HAS_SR_TB;
> @@ -1756,9 +1780,6 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	else
>  		lock_len = ofs;
> 
> -	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
> -		tb_mask = SR_TB_BIT6;
> -
>  	if (lock_len == 0) {
>  		val = 0; /* fully unlocked */
>  	} else {
> @@ -1766,6 +1787,9 @@ static int spi_nor_sr_unlock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
>  		val = pow << SR_BP_SHIFT;
> 
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> +			val = (val & ~SR_BP3) | SR_BP3_BIT6;
> +
>  		/* Some power-of-two sizes are not supported */
>  		if (val & ~mask)
>  			return -EINVAL;
> @@ -3125,6 +3149,12 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  	if (info->flags & USE_CLSR)
>  		nor->flags |= SNOR_F_USE_CLSR;
> 
> +	if (info->flags & SPI_NOR_4BIT_BP) {
> +		nor->flags |= SNOR_F_HAS_4BIT_BP;
> +		if (info->flags & SPI_NOR_BP3_SR_BIT6)
> +			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
> +	}
> +
>  	if (info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 3ce826b35ad1..6f2f6b27173f 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -24,6 +24,8 @@ enum spi_nor_option_flags {
>  	SNOR_F_HAS_16BIT_SR	= BIT(9),
>  	SNOR_F_NO_READ_CR	= BIT(10),
>  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> +	SNOR_F_HAS_4BIT_BP      = BIT(12),
> +	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
>  };
> 
>  struct spi_nor_read_command {
> @@ -301,6 +303,14 @@ struct flash_info {
>  					 * status register. Must be used with
>  					 * SPI_NOR_HAS_TB.
>  					 */
> +#define SPI_NOR_4BIT_BP		BIT(17) /*
> +					 * Flash SR has 4 bit fields (BP0-3)
> +					 * for block protection.
> +					 */
> +#define SPI_NOR_BP3_SR_BIT6	BIT(18) /*
> +					 * BP3 is bit 6 of status register.
> +					 * Must be used with SPI_NOR_4BIT_BP.
> +					 */
> 
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index e656858b50a5..1e2af0ec1f03 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -111,7 +111,9 @@
>  #define SR_BP0			BIT(2)	/* Block protect 0 */
>  #define SR_BP1			BIT(3)	/* Block protect 1 */
>  #define SR_BP2			BIT(4)	/* Block protect 2 */
> +#define SR_BP3			BIT(5)	/* Block protect 3 */
>  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
> +#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
>  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
>  #define SR_SRWD			BIT(7)	/* SR write protect */
>  /* Spansion/Cypress specific status bits */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
