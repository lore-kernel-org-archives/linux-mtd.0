Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C4BC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D1A60FE6
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6D1A60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dz5NeBPl5XYxSM1ndz98ZXcxsfmVotSjjBZ3xz2EXV0=; b=shcdS8g0EnrbOy
	4qYZKHHKGjJzlBuDlhZU7RXP732g96UkDuRiZ+GfhBatwMUJlF2R0HIBEAIEWewaxC/0ymUPz9itr
	QNiJU656LUmVeBVqaFGFpPB6kMaIxNXLcrrWM37XJkFGvGv/Noz8zoH/aOsp13xp0opjxW0Txa1ro
	GJAsE8naWuHSc/dEz99TIrjPRXU5fHlCOMKX4NzuCKEyB3jTez/8i8nWk1sZ59xTrKpvjY6Sv6zvG
	2rE0AvVdhLTTGbrpRizBobVNLnfNtFO9Buk/hfMBkr0D0j7ER/9cxhVwzpFqsrdDiorSQxa6DClSy
	KGE7e7uNZJDtek6jYXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG1v7-002xAg-Aj; Tue, 17 Aug 2021 16:26:33 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG1v1-002x9D-6F; Tue, 17 Aug 2021 16:26:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HGQ4sD019057;
 Tue, 17 Aug 2021 11:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629217564;
 bh=Hn+rrxFLVXiA4pM+BRyrecB91l27YJFFD4cDWF+kn48=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=NT+JI/CQ6VWTSYOWKNnE1LUYMrnaciDRm25H+8/hyLe/2VWDwp5FLUOd7zpNuq9hL
 DqvcL301qLP4/cH5Br+uxcPkrbiByJGgehA/Uk2ACGa4sZj+aQAWHascMwXw2zJX0o
 PBlrO+p6XFdgSlR1wGmQnNCRIrjxADuxye1wIwI8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HGQ4WY083189
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Aug 2021 11:26:04 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 11:26:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 11:26:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HGQ3tJ018900;
 Tue, 17 Aug 2021 11:26:03 -0500
Date: Tue, 17 Aug 2021 21:56:02 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme
 for setting mtd_info fields
Message-ID: <20210817162600.zzkfs3nv7iwucljq@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-23-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-23-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_092627_362098_BD5EDF08 
X-CRM114-Status: GOOD (  19.38  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 07:52AM, Tudor Ambarus wrote:
> The functions names are self explanatory, get rid of the comment
> for the OTP function.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/core.c | 6 ++----
>  drivers/mtd/spi-nor/core.h | 4 ++--
>  drivers/mtd/spi-nor/otp.c  | 2 +-
>  drivers/mtd/spi-nor/swp.c  | 2 +-
>  4 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 26acfc9901db..72dfe6274041 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3129,10 +3129,8 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
>  	struct mtd_info *mtd = &nor->mtd;
>  	struct device *dev = nor->dev;
>  
> -	spi_nor_register_locking_ops(nor);
> -
> -	/* Configure OTP parameters and ops */
> -	spi_nor_otp_init(nor);
> +	spi_nor_set_mtd_locking_ops(nor);
> +	spi_nor_set_mtd_otp_ops(nor);
>  
>  	mtd->dev.parent = dev;
>  	if (!mtd->name)
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 8fddc685d2d3..7fb0cfabe85a 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -552,8 +552,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  
>  void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>  void spi_nor_try_unlock_all(struct spi_nor *nor);
> -void spi_nor_register_locking_ops(struct spi_nor *nor);
> -void spi_nor_otp_init(struct spi_nor *nor);
> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
>  
>  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 983e40b19134..fa63d8571218 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -480,7 +480,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
>  	return ret;
>  }
>  
> -void spi_nor_otp_init(struct spi_nor *nor)
> +void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 8594bcbb7dbe..1f178313ba8f 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -414,7 +414,7 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
>  		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
>  }
>  
> -void spi_nor_register_locking_ops(struct spi_nor *nor)
> +void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
