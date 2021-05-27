Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59139C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128E16101B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128E16101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U45Pjo9Nf/+DZXIQEQ44sImti8VshoymITZNteorDD8=; b=H518s4DAq2rVg6
	ITYDDXx4Uz6FLH/b9gsYFbKRhnDiJjoaSkYhokq/L2NIMJq3ZMfRUL7jUQgoTrevUtrmCUTo2rD9m
	JkKRKSRQiblX72DhLjD8oBKgtah1jlAxVa/m8vF5InWoo7MWasB+B0cVAChx9Rs+MmA8fGsvBeS3s
	maTjW0XcUidRaaJm7yT1eMtG9HoJMbCKQUg8hjDtkCS914OLVnpTtKIPGh/cb6GIEIYDpw2ESc9cy
	ISmlOhWq/7E81flNqAxaI0BdM/DVO0O48kxhrrQOZ9k0CYG/wlmV9Dc67OfIoD9cKbGum1sWeEMyr
	r5yC4z6kgVl/2TYZsY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCom-004Zm9-B1; Thu, 27 May 2021 10:00:44 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCoW-004Zf5-E1; Thu, 27 May 2021 10:00:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RA0I9q048827;
 Thu, 27 May 2021 05:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622109618;
 bh=yllhb6T/ZjUJw0h6DWNoAvUmFdqdIc4o5sqdU2Agvb8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=D7x35cR0S6rAw+r1IFeXtz1lsSReYmfPybhUHdM57cMUdHgNy2KoLNog7GyRFIWN9
 aA4yiLxSuKH1TTvUspzOkrnpfaDPd9dtoes4ecor6TDs7UUj3W3AgIdXDnaTWkeoeU
 46yTrDJeWGpU6ZbC+3RCfVZq4ClGtWS5HM/t7vUA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RA0IEB057541
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 05:00:18 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 05:00:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 05:00:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RA0HXm042965;
 Thu, 27 May 2021 05:00:18 -0500
Date: Thu, 27 May 2021 15:30:17 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <patrice.chotard@foss.st.com>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: mtd: spinand: add spi nand mtd resume handler
Message-ID: <20210527100015.abxcroi23zyvcyzk@ti.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526153016.32653-1-patrice.chotard@foss.st.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_030028_590136_CD1D7CCA 
X-CRM114-Status: GOOD (  27.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 26/05/21 05:30PM, patrice.chotard@foss.st.com wrote:
> From: Christophe Kerello <christophe.kerello@foss.st.com>
> 
> After power up, all SPI NAND's blocks are locked. Only read operations
> are allowed, write and erase operations are forbidden.
> The SPI NAND framework unlocks all the blocks during its initialization.
> 
> During a standby low power, the memory is powered down, losing its
> configuration.
> During the resume, the QSPI driver state is restored but the SPI NAND
> framework does not reconfigured the memory.
> 
> This patch adds spi nand mtd PM handlers for resume ops.
> SPI NAND resume op re-initializes SPI NAND flash to its probed state.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/mtd/nand/spi/core.c | 56 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 17f63f95f4a2..6abaf874eb3f 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1074,6 +1074,61 @@ static int spinand_detect(struct spinand_device *spinand)
>  	return 0;
>  }
>  
> +static void spinand_mtd_resume(struct mtd_info *mtd)
> +{
> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
> +	struct device *dev = &spinand->spimem->spi->dev;
> +	int ret, i;
> +
> +	ret = spinand_reset_op(spinand);
> +	if (ret)
> +		return;
> +
> +	ret = spinand_init_quad_enable(spinand);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to initialize the quad part (err = %d)\n",
> +			ret);
> +		return;
> +	}
> +
> +	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to updtae the OTP (err = %d)\n",
> +			ret);
> +		return;
> +	}

Since you have reset the flash, this cache is invalid. You should reset 
the cache and re-populate it before using it in any way.

> +
> +	ret = spinand_manufacturer_init(spinand);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to initialize the SPI NAND chip (err = %d)\n",
> +			ret);
> +		return;
> +	}
> +
> +	/* After power up, all blocks are locked, so unlock them here. */
> +	for (i = 0; i < nand->memorg.ntargets; i++) {
> +		ret = spinand_select_target(spinand, i);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to select the target (err = %d)\n",
> +				ret);
> +			return;
> +		}
> +
> +		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to unlock block (err = %d)\n",
> +				ret);
> +			return;
> +		}
> +	}
> +}
> +

Most of these seem to be copied from spinand_init(). I think it is 
better to create a common function that can be called from both 
spinand_init() and spinand_mtd_resume(). This way when someone adds 
something new to the init procedure, like support for some other modes, 
they won't have to remember to update it in two places.

>  static int spinand_init(struct spinand_device *spinand)
>  {
>  	struct device *dev = &spinand->spimem->spi->dev;
> @@ -1167,6 +1222,7 @@ static int spinand_init(struct spinand_device *spinand)
>  	mtd->_block_isreserved = spinand_mtd_block_isreserved;
>  	mtd->_erase = spinand_mtd_erase;
>  	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
> +	mtd->_resume = spinand_mtd_resume;

Is it possible that the userspace can use this mtd device before the 
resume is finished? Is there a way to temporarily "pause" or unregister 
an mtd device?

>  
>  	if (nand->ecc.engine) {
>  		ret = mtd_ooblayout_count_freebytes(mtd);

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
