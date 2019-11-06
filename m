Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A842EC5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 09:19:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B652173E
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 09:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lh0+Bcwj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U5qB+MFr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B652173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndbEFpAfMPzMqvuga8mF78NCIh3GAUTI0KOaBC2jgTs=; b=Lh0+BcwjSfW8B0
	9WAbjlDk0YCO0wmLI6xb14vz/fXY7c7eH0lxYxEz14nALnzh8j1pWks1+qfq98CMGYLjJI839W76l
	bCgm5aRpinuJuw4hdOrkKipQ1eJsruom7HDR/glBHqNa0+E2ZquKIE2Hyx57xFoO5YlcYwha3kCrC
	GThWPpH/Va86huq6SZKcnZqEQZICyNQeZ6S5jcQhe0aZsJFHd7FxMz6OeLiz9NEw+qGqZrFlZOXPJ
	ZAQ35NAmwP5SBmILGqAj8l5BSHW7GtQvRbRS1hqtrj2f71Bq9Mnue0Pdxy4q3KCUTFBwj7DMjrErH
	/noF01zT95OjnSsSBP5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSHSj-00038e-C6; Wed, 06 Nov 2019 09:18:49 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSHSf-000387-QL
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 09:18:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA69IcxD067545;
 Wed, 6 Nov 2019 03:18:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573031918;
 bh=eldzo8YWe5MamJNiigJfyEJUufaORNMZTQ1Z2CgzULc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=U5qB+MFrnN88rFoGyyYQkKCueJVXXaxryE8U0eoUby4U5nJbeHbmVzBrxURQ1GD2p
 gETubghjWq98LjZE040mYFK5DkzPnL9HOE0tfc1zgGzX3lG/g3kLqM6B7MPHpz5T7+
 4QSlYCTeXy2njOgSj9S7btAwLKCJViL1nxN/yRWw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA69IcxR087453
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Nov 2019 03:18:38 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 03:18:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 03:18:38 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA69IYtN114855;
 Wed, 6 Nov 2019 03:18:36 -0600
Subject: Re: [PATCH v4 03/20] mtd: spi-nor: Check for errors after each
 Register Operation
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-4-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <f25eab6d-4ccd-09c2-6ce1-fa6f00ca9367@ti.com>
Date: Wed, 6 Nov 2019 14:49:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191102112316.20715-4-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_011845_982094_BD632C44 
X-CRM114-Status: GOOD (  20.40  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/11/19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Check for the return vales of each Register Operation.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---


Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

>  drivers/mtd/spi-nor/spi-nor.c | 81 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 60 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0cb3122e74ad..5debb0f7ca13 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -595,11 +595,15 @@ static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
>  {
>  	int ret;
>  
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
>  	ret = macronix_set_4byte(nor, enable);
> -	spi_nor_write_disable(nor);
> +	if (ret)
> +		return ret;
>  
> -	return ret;
> +	return spi_nor_write_disable(nor);
>  }
>  
>  static int spansion_set_4byte(struct spi_nor *nor, bool enable)
> @@ -665,11 +669,15 @@ static int winbond_set_4byte(struct spi_nor *nor, bool enable)
>  	 * Register to be set to 1, so all 3-byte-address reads come from the
>  	 * second 16M. We must clear the register to enable normal behavior.
>  	 */
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
>  	ret = spi_nor_write_ear(nor, 0);
> -	spi_nor_write_disable(nor);
> +	if (ret)
> +		return ret;
>  
> -	return ret;
> +	return spi_nor_write_disable(nor);
>  }
>  
>  static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> @@ -859,7 +867,9 @@ static int spi_nor_write_sr_cr(struct spi_nor *nor, const u8 *sr_cr)
>  {
>  	int ret;
>  
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
>  
>  	if (nor->spimem) {
>  		struct spi_mem_op op =
> @@ -889,7 +899,10 @@ static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 status_new,
>  {
>  	int ret;
>  
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
>  	ret = spi_nor_write_sr(nor, status_new);
>  	if (ret)
>  		return ret;
> @@ -1397,7 +1410,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>  	list_for_each_entry_safe(cmd, next, &erase_list, list) {
>  		nor->erase_opcode = cmd->opcode;
>  		while (cmd->count) {
> -			spi_nor_write_enable(nor);
> +			ret = spi_nor_write_enable(nor);
> +			if (ret)
> +				goto destroy_erase_cmd_list;
>  
>  			ret = spi_nor_erase_sector(nor, addr);
>  			if (ret)
> @@ -1452,7 +1467,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
>  		unsigned long timeout;
>  
> -		spi_nor_write_enable(nor);
> +		ret = spi_nor_write_enable(nor);
> +		if (ret)
> +			goto erase_err;
>  
>  		ret = spi_nor_erase_chip(nor);
>  		if (ret)
> @@ -1479,7 +1496,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	/* "sector"-at-a-time erase */
>  	} else if (spi_nor_has_uniform_erase(nor)) {
>  		while (len) {
> -			spi_nor_write_enable(nor);
> +			ret = spi_nor_write_enable(nor);
> +			if (ret)
> +				goto erase_err;
>  
>  			ret = spi_nor_erase_sector(nor, addr);
>  			if (ret)
> @@ -1500,7 +1519,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  			goto erase_err;
>  	}
>  
> -	spi_nor_write_disable(nor);
> +	ret = spi_nor_write_disable(nor);
>  
>  erase_err:
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_ERASE);
> @@ -1849,9 +1868,13 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	if (nor->bouncebuf[0] & SR_QUAD_EN_MX)
>  		return 0;
>  
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
>  
> -	spi_nor_write_sr(nor, nor->bouncebuf[0] | SR_QUAD_EN_MX);
> +	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] | SR_QUAD_EN_MX);
> +	if (ret)
> +		return ret;
>  
>  	ret = spi_nor_wait_till_ready(nor);
>  	if (ret)
> @@ -2022,7 +2045,9 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  	/* Update the Quad Enable bit. */
>  	*sr2 |= SR2_QUAD_EN_BIT7;
>  
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
>  
>  	ret = spi_nor_write_sr2(nor, sr2);
>  	if (ret)
> @@ -2063,7 +2088,9 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
>  	if (ret)
>  		return ret;
>  
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
>  
>  	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] & ~mask);
>  	if (ret)
> @@ -2680,7 +2707,9 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	if (ret)
>  		return ret;
>  
> -	spi_nor_write_enable(nor);
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		goto sst_write_err;
>  
>  	nor->sst_write_second = false;
>  
> @@ -2718,14 +2747,19 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	}
>  	nor->sst_write_second = false;
>  
> -	spi_nor_write_disable(nor);
> +	ret = spi_nor_write_disable(nor);
> +	if (ret)
> +		goto sst_write_err;
> +
>  	ret = spi_nor_wait_till_ready(nor);
>  	if (ret)
>  		goto sst_write_err;
>  
>  	/* Write out trailing byte if it exists. */
>  	if (actual != len) {
> -		spi_nor_write_enable(nor);
> +		ret = spi_nor_write_enable(nor);
> +		if (ret)
> +			goto sst_write_err;
>  
>  		nor->program_opcode = SPINOR_OP_BP;
>  		ret = spi_nor_write_data(nor, to, 1, buf + actual);
> @@ -2735,8 +2769,10 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		ret = spi_nor_wait_till_ready(nor);
>  		if (ret)
>  			goto sst_write_err;
> -		spi_nor_write_disable(nor);
> +
>  		actual += 1;
> +
> +		ret = spi_nor_write_disable(nor);
>  	}
>  sst_write_err:
>  	*retlen += actual;
> @@ -2787,7 +2823,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>  		addr = spi_nor_convert_addr(nor, addr);
>  
> -		spi_nor_write_enable(nor);
> +		ret = spi_nor_write_enable(nor);
> +		if (ret)
> +			goto write_err;
> +
>  		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
>  		if (ret < 0)
>  			goto write_err;
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
