Return-Path: <SRS0=qq/S=5G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707E7C4332B
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 20:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2BB20753
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 20:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Di2+iaG1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="VAGSiM1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2BB20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CRWRk5x3nBLqyeZjUFcSzwNmFKyiikShgQdCBN42Nyo=; b=Di2+iaG1TABRViHV7sxWkvvSy
	XamUJqR6hmeXUm/S70ep0KTDq1CNzNTnOAAyuaXBrwsBeSi+0o5R8xaKcdnxB/jMvxyBY4nceCbWy
	W41wlK7XvK4vIJe6HYOHjE1bIUBkwdYCNsMjZNiIgcyMFX9ZglzOg9MvjzaJ9x5kuDLDMTHOe9WJA
	Mud97GoJVrBNsAadRlLk6B4mDdcW5h+FlmKr3poAbizUqYVy6kNXteYibitUWyMTDJzzyEfA8vd4J
	pb33cBEQ/mY2EG1Fpc2/e8bU8jRq01AO/vpsUMPYtZ/WIVR6HjEixcXlKWrIUPKVTShSuSAf3Mr2J
	PKsTI/Z/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFl27-0000Yv-Pa; Sat, 21 Mar 2020 20:47:51 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFl24-0000Xz-IA
 for linux-mtd@lists.infradead.org; Sat, 21 Mar 2020 20:47:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3397023E25;
 Sat, 21 Mar 2020 21:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1584823660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/PWTZQMtNiptGDBeuUtgiuQ3O7UI7SKKEEFaUc8YSY=;
 b=VAGSiM1WOxcOMwo4Zj33vjYWxt+2Ei5RLPkmF83xRyi6XMxI8QT3cAuYrq6TR6jD5hVDee
 Fhox7Zt+c3KHJqV7QJWiKHgLmUWX/FEcV8s+AnEU0W0Fx5rFIT1ezFDkt239Obd8DhXYop
 E6VBWGJYSsFtHbEldujq8KRViQ0P58Q=
MIME-Version: 1.0
Date: Sat, 21 Mar 2020 21:47:33 +0100
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <20200318120615.4639-2-js07.lee@samsung.com>
References: <y> <20200318120615.4639-1-js07.lee@samsung.com>
 <CGME20200318120803epcas1p34570b795db84b2fd429b299a9ab317bd@epcas1p3.samsung.com>
 <20200318120615.4639-2-js07.lee@samsung.com>
Message-ID: <268fed929cc4c5d9b1c3711f9f19d559@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 3397023E25
X-Spamd-Result: default: False [1.40 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; NEURAL_HAM(-0.00)[-0.759];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[microchip.com,ti.com,lists.infradead.org,gmail.com,hisilicon.com,huawei.com];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_134748_950436_E3945466 
X-CRM114-Status: GOOD (  27.45  )
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

Hi Jungseung,

Am 2020-03-18 13:06, schrieb Jungseung Lee:
> Currently, we are supporting block protection only for flash chips with
> 3 block protection bits in the SR register.
> 
> This patch enables block protection support for flashes with 4 block
> protection bits(bp0-3).
> 
> Added a flag to inform that this flash has 4 block protection bit,
> and added another flag for some flashes in which bp3 bit is not 
> adjacent
> to other bp bits.
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>

Please add a changelog if you're doing a new patch version. This will
greatly ease the review.


> ---
>  drivers/mtd/spi-nor/core.c  | 62 ++++++++++++++++++++++++++++++++++---
>  drivers/mtd/spi-nor/core.h  | 10 ++++++
>  include/linux/mtd/spi-nor.h |  2 ++
>  3 files changed, 69 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e4ed8553aae8..842e2fabdb20 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1516,7 +1516,15 @@ static int spi_nor_erase(struct mtd_info *mtd,
> struct erase_info *instr)
> 
>  static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
>  {
> -	return SR_BP2 | SR_BP1 | SR_BP0;
> +	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
> +		return mask | SR_BP3_BIT6;
> +
> +	if (nor->flags & SNOR_F_HAS_4BIT_BP)
> +		return mask | SR_BP3;
> +
> +	return mask;
>  }
> 
>  static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
> @@ -1532,7 +1540,8 @@ static int spi_nor_get_min_prot_length(struct
> spi_nor *nor)
>  	int bp_slots, bp_slots_needed;
>  	u8 mask = spi_nor_get_bp_mask(nor);
> 
> -	bp_slots = (mask >> SR_BP_SHIFT) + 1;
> +	/* 2 ^ number_of_bp_bit slots available */
> +	bp_slots = 1 << hweight8(mask);
> 
>  	/* Reserved one for "protect none" and one for "protect all". */
>  	bp_slots = bp_slots - 2;
> @@ -1553,7 +1562,12 @@ static void spi_nor_get_locked_range_sr(struct
> spi_nor *nor, u8 sr, loff_t *ofs,
>  	int min_prot_len;
>  	u8 mask = spi_nor_get_bp_mask(nor);
>  	u8 tb_mask = spi_nor_get_tb_mask(nor);
> -	u8 bp = (sr & mask) >> SR_BP_SHIFT;
> +	u8 bp, val = sr & mask;
> +


you could add a comment here. It is not obvious why one don't need
to check nor->flags & SNOR_F_HAS_SR_BP3_BIT6. Ie. it is already
masked with mask retrieved from spi_nor_get_bp_mask() which makes
sure the SR_BP3_BIT6 may only be set if nor->flags contains that
specific flag. Or just be explicit and do

if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)

I'd prefer the latter because
  (1) its the same as you've done it below
  (2) its easier to understand in the future

That being said. Nice work! So if you do a respin with that you
can add:
Reviewed-by: Michael Walle <michael@walle.cc>

Tested with a MX25U3232F (no upstream support yet).

Tested-by: Michael Walle <michael@walle.cc>

> +	if (val & SR_BP3_BIT6)
> +		val = (val & ~SR_BP3_BIT6) | SR_BP3;
> +
> +	bp = val >> SR_BP_SHIFT;
> 
>  	if (!bp) {
>  		/* No protection */
> @@ -1611,7 +1625,7 @@ static int spi_nor_is_unlocked_sr(struct spi_nor
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
> @@ -1619,7 +1633,7 @@ static int spi_nor_is_unlocked_sr(struct spi_nor
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
> @@ -1639,6 +1653,32 @@ static int spi_nor_is_unlocked_sr(struct
> spi_nor *nor, loff_t ofs, uint64_t len,
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
>  static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t 
> len)
> @@ -1690,6 +1730,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
>  		min_prot_len = spi_nor_get_min_prot_length(nor);
>  		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
>  		val = pow << SR_BP_SHIFT;
> +
> +		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
> +			val = (val & ~SR_BP3) | SR_BP3_BIT6;
>  	}
> 
>  	if (val & ~mask)
> @@ -1772,6 +1815,9 @@ static int spi_nor_sr_unlock(struct spi_nor
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
> @@ -3131,6 +3177,12 @@ int spi_nor_scan(struct spi_nor *nor, const char 
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
