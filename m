Return-Path: <SRS0=Etow=WF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF07AC31E40
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2019 11:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D5F208C3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2019 11:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLM5RgiN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I+V78RVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D5F208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6aNK8FA4hRYCNmiyKKwV1OZhAlBx6FtgOgsAjZxZbc=; b=tLM5RgiN76Klq2
	9CuWq82HgvaNsyA2y4Frq1o5UIMqXJexnEHbt2ua8jbR8jGvqO7sjXF7Y2j+RsnERYK/es+4Qs9m2
	3CBoZElNIGWqJrH7i2zzEMLhI04X5Rqs+WQtu+7EKmJgs/o32ZumpxrwZSrbMb2WzYtYykPuY9YwE
	AtoNzYgdNZVLz+XmBm5p9uuEHrHEHhLrvybwkKPwzAZPiMTU5gd5wvM9X0xWgcs4OyG+mUzegYtyi
	fhBvXnXK7ewKKBu6YZ7ngTfFGhTYYMhLzUkQDEmwP18VFYO8QJK7gnrF0yB8IcSqCJ6B4bCJBiIxq
	8pdMC19/s1k3fZccdSaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw33M-0006UN-7q; Fri, 09 Aug 2019 11:27:24 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw33J-0006TS-CI; Fri, 09 Aug 2019 11:27:23 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79BR8Ww066638;
 Fri, 9 Aug 2019 06:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565350028;
 bh=Ppi3TU5ZQgR8D+tREXONR6IGdx55ybqquqWRoMb0in8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=I+V78RVowMEWKyKlao3EaFh/8b0N3c9FSUSInWuzQaZXBcEqks1GBOnom6rD47Kw6
 0qsN83gMomykiMPWWhUlelwnF4dhLvzAODQ9tYn/l0EwFi969uja9458x4vJzy/SjC
 cxCQ6Jqyx/8BCCEoGAIp68IwezEE1oRsmdltLeP4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79BR8gR036947
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Aug 2019 06:27:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 06:27:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 06:27:07 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79BR3xf051395;
 Fri, 9 Aug 2019 06:27:04 -0500
Subject: Re: [PATCH v7 4/4] mtd: spi-nor: add locking support for is25wp256
 device
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>, <marek.vasut@gmail.com>,
 <tudor.ambarus@microchip.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>
References: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
 <1562092745-11541-5-git-send-email-sagar.kadam@sifive.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <f3a1617e-0478-63ea-ab76-feaab7ac1e9b@ti.com>
Date: Fri, 9 Aug 2019 16:57:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1562092745-11541-5-git-send-email-sagar.kadam@sifive.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_042721_548391_66FBD9D6 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sagar,

On 03/07/19 12:09 AM, Sagar Shrikant Kadam wrote:
[...]> +static int issi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +	int status_old, status_new, blk_prot;
> +	u8 mask;
> +	u8 shift;
> +	u8 pow, ret, func_reg;
> +	bool use_top;
> +	loff_t lock_len;
> +
> +	if (nor->flags & SNOR_F_HAS_BP3)
> +		mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
> +	else
> +		mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +	shift = ffs(mask) - 1;
> +
> +	status_old = read_sr(nor);
> +
> +	/* if status reg is Write protected don't update bit protection */
> +	if (status_old & SR_SRWD) {
> +		dev_err(nor->dev,
> +			"SR is write protected, can't update BP bits...\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = spi_nor_select_zone(nor, ofs, len, status_old, &use_top, 1);
> +	if (!ret)
> +		/* Older protected blocks include the new requested block's */
> +		return 0;
> +	else if (ret < 0)
> +		return ret;
> +
> +	func_reg = spi_nor_read_fr(nor);

Sorry, I don't understand where func_reg is used? Since TBS OTP, how
does issi_lock() code comprehend that TBS bit value in OTP register and
use_top returned by spi_nor_select_zone() are matching before we go
ahead and program status register.

We should reject locking request if top-bottom calculation does not
match OTP bit. Where is that done?

Regards
Vignesh

> +	/* lock_len: length of region that should end up locked */
> +	if (use_top)
> +		lock_len = nor->mtd.size - ofs;
> +	else
> +		lock_len = ofs + len;
> +
> +	pow = order_base_2(lock_len);
> +	blk_prot = mask & (((pow + 1) & 0xf) << shift);
> +	if (lock_len <= 0) {
> +		dev_err(nor->dev, "invalid Length to protect");
> +		return -EINVAL;
> +	}
> +
> +	status_new = status_old | blk_prot;
> +	if (status_old == status_new)
> +		return 0;
> +
> +	return write_sr_and_check(nor, status_new, mask);
> +}
> +
> +/**
>   * issi_unlock() - clear BP[0123] write-protection.
>   * @nor: pointer to a 'struct spi_nor'.
>   * @ofs: offset from which to unlock memory.
> @@ -4171,6 +4338,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (JEDEC_MFR(info) == SNOR_MFR_ISSI &&
>  	    info->flags & SPI_NOR_HAS_LOCK &&
>  	    info->flags & SPI_NOR_HAS_BP3) {
> +		nor->flash_lock = issi_lock;
>  		nor->flash_unlock = issi_unlock;
>  	}
>  
> @@ -4194,6 +4362,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>  	if (info->flags & USE_CLSR)
>  		nor->flags |= SNOR_F_USE_CLSR;
> +	if (info->flags & SPI_NOR_HAS_BP3)
> +		nor->flags |= SNOR_F_HAS_BP3;
>  
>  	if (info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index f6fa70f..26dbf48 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -40,6 +40,8 @@
>  #define SPINOR_OP_RDSR		0x05	/* Read status register */
>  #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
>  #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
> +#define SPINOR_OP_RDFR		0x48	/* Read Function register */
> +#define SPINOR_OP_WRFR		0x42	/* Write Function register 1 byte */
>  #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
>  #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
>  #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
> @@ -139,6 +141,9 @@
>  /* Enhanced Volatile Configuration Register bits */
>  #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
>  
> +/*Function register bit */
> +#define FR_TB			BIT(1)	/*ISSI: Top/Bottom protect */
> +
>  /* Flag Status Register bits */
>  #define FSR_READY		BIT(7)	/* Device status, 0 = Busy, 1 = Ready */
>  #define FSR_E_ERR		BIT(5)	/* Erase operation status */
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
