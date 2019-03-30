Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382BBC43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 14:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E832183F
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 14:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GdTXJvm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E832183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkZ5yrDCug9cHeD+iMge6xpJBc28nrqAjJYMOOkJm7o=; b=GdTXJvm8zBCwsu
	Y2YTWsn+VTFS0DF1fwwMForc08nuvrcO71dhNUxz38IEpW3/hSnNwuKv0Neni3/QrfE/UFOAopL0P
	z7w8cE5EAkiAdWScxknO3PKmw7AyaqWZileuh7x0FNT2HzMruFJJeBxs7lr3NKGmFiQJ/6S2JsoNA
	8cMCkgy9tA0D92ovzWmBYroLl+Fm75vdS1aYNWmppKWljXmwtQT2MskxaPDhQlcqooGlJbD1Dwvtl
	xnmeUV2QsIukyKdvjf7jvyAK9z+5R9qYAZu4rP4J/wIdwsXk7kQWwM7raEFayPMVpZe8RLKWK/gII
	q4T8bqDce+eKiMxQHHZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAEtQ-0001uy-Du; Sat, 30 Mar 2019 14:23:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAEtM-0001ua-45
 for linux-mtd@lists.infradead.org; Sat, 30 Mar 2019 14:23:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2BB302811DC;
 Sat, 30 Mar 2019 14:23:26 +0000 (GMT)
Date: Sat, 30 Mar 2019 15:23:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v4 1/9] mtd: rawnand: denali: use nand_chip pointer more
 for internal functions
Message-ID: <20190330152323.71734cb8@collabora.com>
In-Reply-To: <1553844501-7119-2-git-send-email-yamada.masahiro@socionext.com>
References: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
 <1553844501-7119-2-git-send-email-yamada.masahiro@socionext.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_072328_817857_4F4BD613 
X-CRM114-Status: GOOD (  22.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 Mar 2019 16:28:13 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> With the recent refactoring, the NAND driver hooks now take a pointer
> to nand_chip. Add to_denali() in order to convert (struct nand_chip *)
> to (struct denali_nand_info *) directly. It is more useful than the
> current mtd_to_denali().
> 
> I changed some helper functions to take (struct nand_chip *). This will
> avoid pointer conversion back and forth, and ease further development.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/mtd/nand/raw/denali.c | 57 ++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 24aeafc..4ac1314 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -47,6 +47,11 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
>  	return container_of(mtd_to_nand(mtd), struct denali_nand_info, nand);
>  }
>  
> +static struct denali_nand_info *to_denali(struct nand_chip *chip)
> +{
> +	return container_of(chip, struct denali_nand_info, nand);
> +}
> +
>  /*
>   * Direct Addressing - the slave address forms the control information (command
>   * type, bank, block, and page address).  The slave data is the actual data to
> @@ -282,12 +287,12 @@ static void denali_cmd_ctrl(struct nand_chip *chip, int dat, unsigned int ctrl)
>  	denali->host_write(denali, DENALI_BANK(denali) | type, dat);
>  }
>  
> -static int denali_check_erased_page(struct mtd_info *mtd,
> -				    struct nand_chip *chip, uint8_t *buf,
> +static int denali_check_erased_page(struct nand_chip *chip,
> +				    struct denali_nand_info *denali, u8 *buf,

You don't need to pass both chip and denali, as one can be extracted
from the other.

>  				    unsigned long uncor_ecc_flags,
>  				    unsigned int max_bitflips)
>  {
> -	struct denali_nand_info *denali = mtd_to_denali(mtd);
> +	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
>  	uint8_t *ecc_code = chip->oob_poi + denali->oob_skip_bytes;
>  	int ecc_steps = chip->ecc.steps;
>  	int ecc_size = chip->ecc.size;
> @@ -303,9 +308,9 @@ static int denali_check_erased_page(struct mtd_info *mtd,
>  						  NULL, 0,
>  						  chip->ecc.strength);
>  		if (stat < 0) {
> -			mtd->ecc_stats.failed++;
> +			ecc_stats->failed++;
>  		} else {
> -			mtd->ecc_stats.corrected += stat;
> +			ecc_stats->corrected += stat;
>  			max_bitflips = max_t(unsigned int, max_bitflips, stat);
>  		}
>  
> @@ -316,11 +321,11 @@ static int denali_check_erased_page(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> -static int denali_hw_ecc_fixup(struct mtd_info *mtd,
> +static int denali_hw_ecc_fixup(struct nand_chip *chip,
>  			       struct denali_nand_info *denali,

Ditto.

>  			       unsigned long *uncor_ecc_flags)
>  {
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
>  	int bank = denali->active_bank;
>  	uint32_t ecc_cor;
>  	unsigned int max_bitflips;
> @@ -346,16 +351,17 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
>  	 * Unfortunately, we can not know the total number of corrected bits in
>  	 * the page.  Increase the stats by max_bitflips. (compromised solution)
>  	 */
> -	mtd->ecc_stats.corrected += max_bitflips;
> +	ecc_stats->corrected += max_bitflips;
>  
>  	return max_bitflips;
>  }
>  
> -static int denali_sw_ecc_fixup(struct mtd_info *mtd,
> +static int denali_sw_ecc_fixup(struct nand_chip *chip,
>  			       struct denali_nand_info *denali,
>  			       unsigned long *uncor_ecc_flags, uint8_t *buf)
>  {
> -	unsigned int ecc_size = denali->nand.ecc.size;
> +	struct mtd_ecc_stats *ecc_stats = &nand_to_mtd(chip)->ecc_stats;
> +	unsigned int ecc_size = chip->ecc.size;
>  	unsigned int bitflips = 0;
>  	unsigned int max_bitflips = 0;
>  	uint32_t err_addr, err_cor_info;
> @@ -404,7 +410,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>  			/* correct the ECC error */
>  			flips_in_byte = hweight8(buf[offset] ^ err_cor_value);
>  			buf[offset] ^= err_cor_value;
> -			mtd->ecc_stats.corrected += flips_in_byte;
> +			ecc_stats->corrected += flips_in_byte;
>  			bitflips += flips_in_byte;
>  
>  			max_bitflips = max(max_bitflips, bitflips);
> @@ -587,9 +593,11 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
>  	return ret;
>  }
>  
> -static int denali_data_xfer(struct denali_nand_info *denali, void *buf,
> -			    size_t size, int page, int raw, int write)
> +static int denali_data_xfer(struct nand_chip *chip, void *buf, size_t size,
> +			    int page, int raw, int write)
>  {
> +	struct denali_nand_info *denali = to_denali(chip);
> +
>  	iowrite32(raw ? 0 : ECC_ENABLE__FLAG, denali->reg + ECC_ENABLE);
>  	iowrite32(raw ? TRANSFER_SPARE_REG__FLAG : 0,
>  		  denali->reg + TRANSFER_SPARE_REG);
> @@ -678,7 +686,7 @@ static int denali_read_page_raw(struct nand_chip *chip, uint8_t *buf,
>  	size_t size = writesize + oobsize;
>  	int ret, i, pos, len;
>  
> -	ret = denali_data_xfer(denali, tmp_buf, size, page, 1, 0);
> +	ret = denali_data_xfer(chip, tmp_buf, size, page, 1, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -766,14 +774,14 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
>  	int stat = 0;
>  	int ret;
>  
> -	ret = denali_data_xfer(denali, buf, mtd->writesize, page, 0, 0);
> +	ret = denali_data_xfer(chip, buf, mtd->writesize, page, 0, 0);
>  	if (ret && ret != -EBADMSG)
>  		return ret;
>  
>  	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
> -		stat = denali_hw_ecc_fixup(mtd, denali, &uncor_ecc_flags);
> +		stat = denali_hw_ecc_fixup(chip, denali, &uncor_ecc_flags);
>  	else if (ret == -EBADMSG)
> -		stat = denali_sw_ecc_fixup(mtd, denali, &uncor_ecc_flags, buf);
> +		stat = denali_sw_ecc_fixup(chip, denali, &uncor_ecc_flags, buf);
>  
>  	if (stat < 0)
>  		return stat;
> @@ -783,7 +791,7 @@ static int denali_read_page(struct nand_chip *chip, uint8_t *buf,
>  		if (ret)
>  			return ret;
>  
> -		stat = denali_check_erased_page(mtd, chip, buf,
> +		stat = denali_check_erased_page(chip, denali, buf,
>  						uncor_ecc_flags, stat);
>  	}
>  
> @@ -866,17 +874,16 @@ static int denali_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
>  		memcpy(tmp_buf + size - len, oob, len);
>  	}
>  
> -	return denali_data_xfer(denali, tmp_buf, size, page, 1, 1);
> +	return denali_data_xfer(chip, tmp_buf, size, page, 1, 1);
>  }
>  
>  static int denali_write_page(struct nand_chip *chip, const uint8_t *buf,
>  			     int oob_required, int page)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct denali_nand_info *denali = mtd_to_denali(mtd);
>  
> -	return denali_data_xfer(denali, (void *)buf, mtd->writesize,
> -				page, 0, 1);
> +	return denali_data_xfer(chip, (void *)buf, mtd->writesize, page,
> +				0, 1);
>  }
>  
>  static void denali_select_chip(struct nand_chip *chip, int cs)
> @@ -1092,9 +1099,9 @@ static const struct mtd_ooblayout_ops denali_ooblayout_ops = {
>  	.free = denali_ooblayout_free,
>  };
>  
> -static int denali_multidev_fixup(struct denali_nand_info *denali)
> +static int denali_multidev_fixup(struct nand_chip *chip)
>  {
> -	struct nand_chip *chip = &denali->nand;
> +	struct denali_nand_info *denali = to_denali(chip);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  
>  	/*
> @@ -1222,7 +1229,7 @@ static int denali_attach_chip(struct nand_chip *chip)
>  	chip->ecc.read_oob = denali_read_oob;
>  	chip->ecc.write_oob = denali_write_oob;
>  
> -	ret = denali_multidev_fixup(denali);
> +	ret = denali_multidev_fixup(chip);
>  	if (ret)
>  		return ret;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
