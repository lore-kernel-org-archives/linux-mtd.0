Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E481C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5431660F41
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5431660F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bj4VRqpY5EwOrANI02laVAIPrnvaz02KgXjib1ngSOw=; b=4ToRjHL4SMuUSZ
	vZb1JU5aY018tPoV4gcP/Bhm1JiuYbxNjccWYxjPXTy5VTs9g1e5HIGG++HBdYR+d673wXhbL7uv/
	yvv0rx03+B+82mnyR7mVrDxDquNdaKf3Lw1yLIH9C4bE6AjTXIyUnJ8XzbKh3n7Qhe9TCmrWFf/gC
	Qm9A05feDsP4yxVcmAarEFsVzzD76kA+ZvAactvtM19stWIpU3oGxRxQyFerpsZXKQDBFuZvei6xA
	QxvmKr2R/ZalhhvZyXKgoV3o4SgJoI+B4gWHrP4XMvQvvwkPU47S6fQt+TChOHiZkE6uCMK27ZxIt
	Z/V9qtbJZXa0rq6IQBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiPU-000BkQ-Ru; Mon, 16 Aug 2021 19:36:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiPP-000Biq-F4; Mon, 16 Aug 2021 19:36:35 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GJa7HD112110;
 Mon, 16 Aug 2021 14:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629142567;
 bh=HmPjOey3i9hk+2hAptecDsOpF9qIyy5F0AtL07LyiFQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=IuKBjnnHv8KxVUgXv0DsieSxP7fDV80UBLagq4ImMJ7mV4GpEIHdzXu0OTFUlJleP
 3UNVzoEUPYanI8bssC3QSjhJY3BQNdZxwX38o2UspqESCZQGYMK7wLeIrKXdldSRE3
 I2RDphUhkBYBbCw9PVGcj9bMZYzUnZ4JXbLOhm6s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GJa652035914
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 14:36:07 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 14:36:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 14:36:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GJa58W034073;
 Mon, 16 Aug 2021 14:36:06 -0500
Date: Tue, 17 Aug 2021 01:06:04 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 16/35] mtd: spi-nor: core: Mark default_init() as
 deprecated
Message-ID: <20210816193602.ze2w6qczvtgpwwdi@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-17-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-17-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_123631_648431_C4A7302D 
X-CRM114-Status: GOOD (  21.89  )
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
> The goal is to remove the spagetti init of params. The flash should
> be initialized by the SFDP data, and when SFDP tables are not defined,
> by the flash_info flags. SFDP data can be corrected by the
> post_{bfpt, sfdp} when wrong, and in case of flash_info flags init,
> we'll use the late_init() hook, where checking for the
> SPI_NOR_SKIP_SFDP flag.

Why depreciate it? It is not like we have external callers that we need 
to notify. We know and control all the users of this function. Just move 
all users to late_init() and delete this. You have already done a large 
part of that work in the previous patches. Why not convert all other 
callers as well? Is there some complicated piece of code that stops you 
from touching it for now?

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 13d5c5edfd27..625f4eed75f1 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -289,9 +289,8 @@ struct spi_nor_flash_parameter {
>  
>  /**
>   * struct spi_nor_fixups - SPI NOR fixup hooks
> - * @default_init: called after default flash parameters init. Used to tweak
> - *                flash parameters when information provided by the flash_info
> - *                table is incomplete or wrong.
> + * @default_init: Deprecated. Use the post_{bfpt, sfdp}, or the late_init()
> + *                hooks instead.
>   * @post_bfpt: called after the BFPT table has been parsed
>   * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
>   *             that do not support RDSFDP). Typically used to tweak various
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
