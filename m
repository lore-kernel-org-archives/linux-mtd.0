Return-Path: <SRS0=EOAK=WA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B555EC19759
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2019 14:36:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F1D2064A
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2019 14:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pdl3H4mM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oD5jehUM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F1D2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiIHda0zdNDpIdPo/CDMpYjAIlyueL1kSslnWk5025I=; b=Pdl3H4mMkNVhrT
	q7NKGrjyJxPDZ/qwpsjrZHhNROAZdfiZLAsq3llZEywoDByk8QtP4DFRXvcKEV63a260i9Lq7WyeF
	n3JC6dhRPSyXd1yaISh/Xuwc+FlezMbBp9PPqO1cyHzkd7I54g/i6by4ZoTH0LeEFE4Km+yGEQb33
	wQ7bwa4ROzeTPWKi0Igzpad6/HRWkt6fq1cByOcPYSWLOBDIgGTpEToN1BqHn7TSvVtUhoq4zGqYm
	yvejajhi/OzOAtchpigVguwy4MzKOKRdJKGqwbZcTonhKceEKAuveqcK2n95S8kg1JCcm0XPtGu1i
	TF1oGqAelOBZTBEZ2rOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huHcd-0005Pb-5K; Sun, 04 Aug 2019 14:36:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huHcY-0005PH-RG
 for linux-mtd@lists.infradead.org; Sun, 04 Aug 2019 14:36:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x74Ea95C075291;
 Sun, 4 Aug 2019 09:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564929369;
 bh=8BzlrKnj/hLUiH+Pk7bowEUPEEAYuQSat8sKNXt0UCU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oD5jehUM3TY4WdrKiVlJ7cza1+WFPLQvez4n6S+gKwPS3XVrUQI9RGOq8P4Vtgen4
 xhvvvLb3PItlHbFm7KULgbqSlGFLqF0aa9qiR7F27ZFe+WCI0lgYNd78IJfBaZdshB
 pXxRwWAwsMxueG1vH4xC9y/buffwlRf/DbCHDTWc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x74Ea9KF058453
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 4 Aug 2019 09:36:09 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 4 Aug
 2019 09:36:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 4 Aug 2019 09:36:09 -0500
Received: from [10.250.133.238] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x74Ea6R8120595;
 Sun, 4 Aug 2019 09:36:06 -0500
Subject: Re: [PATCH 6/7] mtd: spi-nor: Rework the SPI NOR lock/unlock logic
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>
References: <20190731090315.26798-1-tudor.ambarus@microchip.com>
 <20190731090315.26798-7-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <21112f0c-abf0-2b86-5847-2ad7676a29be@ti.com>
Date: Sun, 4 Aug 2019 20:06:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731090315.26798-7-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_073626_992968_5C492E84 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 31-Jul-19 2:33 PM, Tudor.Ambarus@microchip.com wrote:
> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> Move the locking hooks in a separate struct so that we have just
> one field to update when we change the locking implementation.
> 
> stm_locking_ops, the legacy locking operations, can be overwritten
> later on by implementing manufacturer specific default_init() hooks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> [tudor.ambarus@microchip.com: use ->default_init() hook]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

[...]

> @@ -1782,7 +1788,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	if (ret)
>  		return ret;
>  
> -	ret = nor->flash_is_locked(nor, ofs, len);
> +	ret = nor->locking_ops->is_locked(nor, ofs, len);
>  
>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
>  	return ret;
> @@ -4805,6 +4811,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	nor->quad_enable = spansion_quad_enable;
>  	nor->set_4byte = spansion_set_4byte;
>  
> +	/* Default locking operations. */
> +	if (info->flags & SPI_NOR_HAS_LOCK)
> +		nor->locking_ops = &stm_locking_ops;
> +

This condition is different than how lock/unlock ops are populated
today. We would need to add SPI_NOR_HAS_LOCK to all SNOR_MFR_ST and
SNOR_MFR_MICRON entries to be backward compatible or keep the condition
as is.

>  	/* Init flash parameters based on flash_info struct and SFDP */
>  	spi_nor_init_params(nor, &params);
>  
> @@ -4819,21 +4829,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	mtd->_read = spi_nor_read;
>  	mtd->_resume = spi_nor_resume;
>  
> -	/* NOR protection support for STmicro/Micron chips and similar */
> -	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
> -	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
> -	    info->flags & SPI_NOR_HAS_LOCK) {
> -		nor->flash_lock = stm_lock;
> -		nor->flash_unlock = stm_unlock;
> -		nor->flash_is_locked = stm_is_locked;
> -	}
> -

[...]

> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index a434ab7a53e6..bd68ec5a10e7 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -425,9 +425,23 @@ struct spi_nor {
>  	int (*set_4byte)(struct spi_nor *nor, bool enable);
>  	int (*clear_sr_bp)(struct spi_nor *nor);
>  
> +	const struct spi_nor_locking_ops *locking_ops;
> +

Also, to be consistent, document this new member.


>  	void *priv;
>  };
>  
> +/**
> + * struct spi_nor_locking_ops - SPI NOR locking methods
> + * @lock: lock a region of the SPI NOR
> + * @unlock: unlock a region of the SPI NOR
> + * @is_locked: check if a region of the SPI NOR is completely locked
> + */
> +struct spi_nor_locking_ops {
> +	int (*lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> +	int (*unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> +	int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);

checkpatch does not like uint64_t. Please changes these to size_t

Regards
Vignesh


> +};
> +
>  static u64 __maybe_unused
>  spi_nor_region_is_last(const struct spi_nor_erase_region *region)
>  {
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
