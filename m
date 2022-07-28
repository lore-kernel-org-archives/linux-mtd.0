Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D840C19F21
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/Ar9JGZQvn0wCgw4aPwoi9BkTVcSxqeYc6y61K3z7o=; b=3eLBSII3JuzEP1
	beJHY1REvix29GoaySy+KjRA55ugCoIRhrO0i90VuDLL9VfEcy55YAKNuJx5yLNs9BhFIFP+Dijkj
	99tlan3TM2RZQj4v4+Pj8o28p9SsE6KXiQSXZ0X3xPDeUlM8hEqv5tGopEkqeZ3fNYMI8EPCOdZb/
	oKwj4k31zQYJ220FDuLwyM1Nel5mHnahuwM26vTh64U4/whoNTLH+OXDWj9MS1LbRTb1/qzonRuts
	WyGhLOtZiTCqHNfzsgUY2J9BdHeYSS1AfeYfcVev+Ojd9WHgpAZ9D0cgNun5f3vMVsmUzLN0zulav
	VeCttZzQZodMC9hci7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2Hf-009484-9J; Thu, 28 Jul 2022 12:06:31 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH2Hc-00944m-Ft
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 12:06:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26SC6HOo078667;
	Thu, 28 Jul 2022 07:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659009977;
	bh=Gwkp9YWs1+s9Izg/ikYhApxD2YMgNM47uy+a9g1A4gY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mC4KL/EoxXrM8uuXGtMRaQCCBseMuPJv24aw8qh1ynl0FT0UhQbUKjugthGAiwS7n
	 Mih/H1/NwbxcAZpJ7BTZVTkvxmlUECK+jWDtwpj9Ez+TfnPDbtWrxtTdDs2DzVrzVu
	 kHp6qPG6W7USSZfJH+zPk4YCG92fXTc20RTSI5Gw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26SC6G5g027812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Jul 2022 07:06:16 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Jul 2022 07:06:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Jul 2022 07:06:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26SC6FPJ016079;
	Thu, 28 Jul 2022 07:06:16 -0500
Date: Thu, 28 Jul 2022 17:36:15 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: core: Add an error message when failing to
 exit the 4-byte address mode
Message-ID: <20220728120615.3422ojtdsfgmwy5p@ti.com>
References: <20220728030159.68680-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728030159.68680-1-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_050628_688472_58E87C5C 
X-CRM114-Status: GOOD (  16.36  )
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

On 28/07/22 06:01AM, Tudor Ambarus wrote:
> Add an error message when failing to exit the 4-byte address mode. Do not
> stop the execution and go through the spi_nor_soft_reset() method if used,
> in the hope that the flash will default to 3-byte address mode after the
> reset.
> 
> Suggested-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..1cdbdad97136 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2841,7 +2841,8 @@ void spi_nor_restore(struct spi_nor *nor)
>  	/* restore the addressing mode */
>  	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
>  	    nor->flags & SNOR_F_BROKEN_RESET)
> -		nor->params->set_4byte_addr_mode(nor, false);
> +		if (nor->params->set_4byte_addr_mode(nor, false))
> +			dev_err(nor->dev, "Failed to exit 4-byte address mode\n");
>  
>  	if (nor->flags & SNOR_F_SOFT_RESET)
>  		spi_nor_soft_reset(nor);
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
