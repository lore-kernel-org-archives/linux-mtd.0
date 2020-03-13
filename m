Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5588C10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 16:24:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747AA206FA
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 16:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RYgFnBC4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="k++tEO1X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747AA206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+CXbL92fW44owZ/8C5/mADfFRuuJ5VIt9JTLg3/we8c=; b=RYgFnBC4uQ6/IkZGW854kTA8A
	5sYZKezGEj/4h4l6uy72uwNKrZ+jFTbvQID1pg53mt2Z+bQzFeRq95TLutGRpA3FpBijV6IrZjzmo
	f+wCwdzfBLXiyERVXKucCVohGRHRvmCrdHo4/6vUj9v8gYozerFI63AkMPJc5s+pc3WOXGIP2kInH
	+U6nMeMDriSwQQCe2TYmebPeK8cWFzZHfMfN/a6VHq7KwxpRgVdTwQpftZL67ikd5/TTWyeHBrtNJ
	F8Hb8fL2fbWNoeSIcADaf4hCgV8FdicOBoBqlIQsqQvonyRStCVDyKaU6+I86pzk7xkC6U4OX9V8R
	AiCLLm2vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCn7B-0002GG-9I; Fri, 13 Mar 2020 16:24:49 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCn77-0002Fn-OK
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2020 16:24:47 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CA21823EC2;
 Fri, 13 Mar 2020 17:24:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1584116682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLZX7VFeTvnxjwOMcHaO4HaxBpfSGJ2TXxPV1TbLL+w=;
 b=k++tEO1XlBgrayWdHt9yF0aJO062IC2b+qE+LSFDDGW99s6nmW2umD9VLqis1pZH5XmdEL
 DJ1Rgqk0ikgikf8rbqFO4YVLMUiM7zJ5fk/h/AY2vhTIA+Bf4POMBWr6/rMnAR7AECuTqP
 QVnw5NRXL2FnkmGMfvwGMmZgL9cDq2s=
MIME-Version: 1.0
Date: Fri, 13 Mar 2020 17:24:41 +0100
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <20200304110800.20658-2-js07.lee@samsung.com>
References: <20200304110800.20658-1-js07.lee@samsung.com>
 <CGME20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8@epcas1p4.samsung.com>
 <20200304110800.20658-2-js07.lee@samsung.com>
Message-ID: <ab18ece8973dbf89448d2070a78ff50b@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: CA21823EC2
X-Spamd-Result: default: False [1.40 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[microchip.com,ti.com,lists.infradead.org,gmail.com,hisilicon.com];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_092446_105742_F22D12A9 
X-CRM114-Status: GOOD (  25.94  )
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
Cc: chenxiang <chenxiang66@hisilicon.com>, js07.lee@gmail.com,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jungseung,

sorry for the late review.

Am 2020-03-04 12:07, schrieb Jungseung Lee:
> Currently, we are supporting block protection only for
> flash chips with 3 block protection bits in the SR register.
> This patch enables block protection support for flashes with
> 4 block protection bits(bp0-3).
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 82 ++++++++++++++++++++++++++++++++---
>  include/linux/mtd/spi-nor.h   |  4 ++
>  2 files changed, 79 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c 
> b/drivers/mtd/spi-nor/spi-nor.c
> index c58c27552a74..31a2106e529a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -238,6 +238,14 @@ struct flash_info {
>  					 * status register. Must be used with
>  					 * SPI_NOR_HAS_TB.
>  					 */
> +#define SPI_NOR_4BIT_BP		BIT(17)	/*
> +					 * Flash SR has 4 bit fields (BP0-3)
> +					 * for block protection.
> +					 */
> +#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
> +					 * BP3 is bit 6 of status register.
> +					 * Must be used with SPI_NOR_4BIT_BP.
> +					 */
> 
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> @@ -1786,7 +1794,16 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
> 
>  static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
>  {
> -	return SR_BP2 | SR_BP1 | SR_BP0;
> +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +

can we just use the SR_BP3 eg:

	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
	if (nor->flags & SNOR_F_HAS_4BIT_BP)
		mask |= SR_BP3;
	return mask;


> +	if (nor->flags & SNOR_F_HAS_4BIT_BP) {
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> +			mask = mask | SR_BP3_BIT6;
> +		else
> +			mask = mask | SR_BP3_BIT5;
> +	}
> +
> +	return mask;
>  }
> 
>  static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
> @@ -1797,12 +1814,26 @@ static u8 spi_nor_get_tb_mask(struct spi_nor 
> *nor)
>  		return SR_TB_BIT5;
>  }
> 
> +static u8 stm_get_bpval_from_sr(struct spi_nor *nor, u8 sr) {
> +	u8 mask = spi_nor_get_bp_mask(nor);
> +	u8 bp = sr & mask;
> +
> +	if (bp & SR_BP3_BIT6)
> +		bp = (bp & ~BIT(6)) | BIT(5);
> +
> +	bp = bp >> SR_BP_SHIFT;
> +
> +	return bp;
> +}

Don't convert this. It makes the code really hard to read. See below.

> +
>  static int stm_get_min_prot_length(struct spi_nor *nor)
>  {
>  	int bp_slots, bp_slots_needed;
> -	u8 mask = spi_nor_get_bp_mask(nor);
> 
> -	bp_slots = (mask >> SR_BP_SHIFT) + 1;

Then just keep this.

> +	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> +		bp_slots = 1 << 4;
> +	else
> +		bp_slots = 1 << 3;
> 
>  	/* Reserved one for "protect none" and one for "protect all". */
>  	bp_slots = bp_slots - 2;
> @@ -1821,9 +1852,8 @@ static void stm_get_locked_range(struct spi_nor
> *nor, u8 sr, loff_t *ofs,
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  	int min_prot_len;
> -	u8 mask = spi_nor_get_bp_mask(nor);
>  	u8 tb_mask = spi_nor_get_tb_mask(nor);
> -	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> +	u8 bp = stm_get_bpval_from_sr(nor, sr);

also this.

> 
>  	if (!bp) {
>  		/* No protection */
> @@ -1881,7 +1911,7 @@ static int stm_is_unlocked_sr(struct spi_nor
> *nor, loff_t ofs, uint64_t len,
> 
>  /*
>   * Lock a region of the flash. Compatible with ST Micro and similar 
> flash.
> - * Supports the block protection bits BP{0,1,2} in the status register
> + * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the
> status register
>   * (SR). Does not support these features found in newer SR bitfields:
>   *   - SEC: sector/block protect - only handle SEC=0 (block protect)
>   *   - CMP: complement protect - only support CMP=0 (range is not 
> complemented)
> @@ -1889,7 +1919,7 @@ static int stm_is_unlocked_sr(struct spi_nor
> *nor, loff_t ofs, uint64_t len,
>   * Support for the following is provided conditionally for some flash:
>   *   - TB: top/bottom protect
>   *
> - * Sample table portion for 8MB flash (Winbond w25q64fw):
> + * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-2):
>   *
>   *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected 
> Portion
>   *  
> --------------------------------------------------------------------------
> @@ -1909,6 +1939,32 @@ static int stm_is_unlocked_sr(struct spi_nor
> *nor, loff_t ofs, uint64_t len,
>   *    0   |   1   |   1   |   0   |   1   |  2 MB         | Lower 1/4
>   *    0   |   1   |   1   |   1   |   0   |  4 MB         | Lower 1/2
>   *
> + * Sample table portion for 64MB flash (Micron n25q512ax3 / BP0-3):
> + *
> + *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected 
> Portion
> + *  
> --------------------------------------------------------------------------
> + *    0   |   0   |   0   |   0   |   0   |  NONE         | NONE
> + *    0   |   0   |   0   |   0   |   1   |   64 KB       | Upper 
> 1/1024
> + *    0   |   0   |   0   |   1   |   0   |  128 KB       | Upper 
> 1/512
> + *    0   |   0   |   0   |   1   |   1   |  256 KB       | Upper 
> 1/256
> + *   ...
> + *    0   |   1   |   0   |   0   |   1   |  16 MB        | Upper 1/4
> + *    0   |   1   |   0   |   1   |   0   |  32 MB        | Upper 1/2
> + *    0   |   1   |   0   |   1   |   1   |  64 MB        | ALL
> + *    0   |   1   |   1   |   0   |   0   |  64 MB        | ALL
> + *   ...
> + *  
> ------|-------|-------|-------|-------|---------------|-------------------
> + *    1   |   0   |   0   |   0   |   0   |   NONE        | NONE
> + *    1   |   0   |   0   |   0   |   1   |   64 KB       | Lower 
> 1/1024
> + *    1   |   0   |   0   |   1   |   0   |  128 KB       | Lower 
> 1/512
> + *    1   |   0   |   0   |   1   |   1   |  256 KB       | Lower 
> 1/256
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
> @@ -1960,6 +2016,9 @@ static int stm_lock(struct spi_nor *nor, loff_t
> ofs, uint64_t len)
>  		min_prot_len = stm_get_min_prot_length(nor);
>  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
>  		val = pow << SR_BP_SHIFT;
> +
> +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> +			val = (val & ~BIT(5)) | BIT(6);

.. and the use just the following here:

if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
	val = (val & ~SR_BP3) | SR_BP3_BIT6;

Ie. just use the "normal case" where all BP bits are next to each other
and then fixup the resulting value and shift the SR3 bit if necessary.
This will be much easier to read.

>  	}
> 
>  	if (val & ~mask)
> @@ -2042,6 +2101,9 @@ static int stm_unlock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
>  		val = pow << SR_BP_SHIFT;
> 
> +		if (val & BIT(5) && mask & SR_BP3_BIT6)
> +			val = (val & ~BIT(5)) | BIT(6);
> +

here would be the other way around:

if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
	val = (val & ~SR_BP3_BIT6) | SR_BP3;


>  		/* Some power-of-two sizes are not supported */
>  		if (val & ~mask)
>  			return -EINVAL;
> @@ -5244,6 +5306,12 @@ int spi_nor_scan(struct spi_nor *nor, const char 
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
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index de90724f62f1..0190ed21576a 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -129,7 +129,9 @@
>  #define SR_BP1			BIT(3)	/* Block protect 1 */
>  #define SR_BP2			BIT(4)	/* Block protect 2 */
>  #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
> +#define SR_BP3_BIT5		BIT(5)	/* Block protect 3 */

IMHO just SR_BP3. but that is a matter of taste. But it is easier on
the eye in the mask = SR_BP3 | SR_BP2 etc case.

-michael

>  #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
> +#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
>  #define SR_SRWD			BIT(7)	/* SR write protect */
>  /* Spansion/Cypress specific status bits */
>  #define SR_E_ERR		BIT(5)
> @@ -240,6 +242,8 @@ enum spi_nor_option_flags {
>  	SNOR_F_HAS_16BIT_SR	= BIT(9),
>  	SNOR_F_NO_READ_CR	= BIT(10),
>  	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
> +	SNOR_F_HAS_4BIT_BP	= BIT(12),
> +	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
> 
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
