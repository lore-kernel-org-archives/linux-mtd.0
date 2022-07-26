Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9532C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEcVUW1h8ZNuTsD0qBuBxmEVQhCKeAaGNhL7DVY/cLo=; b=FHhOJJCO+CpaEO
	6/0Hv1U0aO2MOQ5eEWAonTO3E5Fmrc+op+Yvmzocaikb/UKGUV/YgpIbWdiWVfewGQeIcEV6rRR5V
	ofs7Ry/kzDBSKfjOCYkyVdfJfDRyPIjQQLTd3h7RCOAuBncg+aF53pBWvKxVU0mHHAr/lw/9PMwBw
	WLl5yWwQC2FXuSayKYrVVC7AvXPz+y9rdZVOGDRrgxp4WpPGe9wLEFmseMmu26m5LJrz4CHdmYgIp
	S3cJ2x6gMYqrisCfMJvo5cp/8hnx1r+lhcqy3iJiVdVWakKCMTWIQSVYFxJgaCamC5lEqD0+HRMXH
	HVdCPbiflEscjiO9+Mrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGq5-00BMoZ-CP; Tue, 26 Jul 2022 09:26:53 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGq1-00BMhr-An
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 09:26:50 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26Q9QexZ055362;
	Tue, 26 Jul 2022 04:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658827600;
	bh=pKjY1BYS2BzqZ00a+QDwyc4O5ASObfuh4yllHPdGmuM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yIXd6nWvbcPRKJ1+l4U+hQX6DFCkk7wPOSPk8nHCn/AHh0YbKG+upu6oV4//nCVkS
	 wAS4QXsGP990DDWDLFUHK4HTCYcrjlaOtJCgqI+LJOprN3weLeFXPC+m69U7rLJpkA
	 sgsF7skDVAZ7Da+4sBa10YNoUONi3j/a0kU653Dc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26Q9QeE0041161
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 04:26:40 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 04:26:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 04:26:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26Q9QcKI114636;
	Tue, 26 Jul 2022 04:26:39 -0500
Date: Tue, 26 Jul 2022 14:56:38 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <tkuw584924@gmail.com>, <Takahiro.Kuwano@infineon.com>,
        <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v17 4/7] mtd: spi-nor: core: Return error code from
 set_4byte_addr_mode()
Message-ID: <20220726092638.brcaq6zztircl5cf@ti.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-5-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220725092505.446315-5-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_022649_502844_B195810F 
X-CRM114-Status: GOOD (  17.33  )
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

On 25/07/22 12:25PM, Tudor Ambarus wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The prams->set_4byte_addr_mode returns error code but is not handled
> in spi_nor_init(). Handle the return code from set_4byte_addr_mode().
> 
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

You could also add a print if this returns an error in 
spi_nor_restore(), but that can be a separate patch.

> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9f07f1036151..ec4c368b4ba6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2724,7 +2724,7 @@ static int spi_nor_init(struct spi_nor *nor)
>  		 */
>  		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
>  			  "enabling reset hack; may not recover from unexpected reboots\n");
> -		nor->params->set_4byte_addr_mode(nor, true);
> +		return nor->params->set_4byte_addr_mode(nor, true);
>  	}
>  
>  	return 0;
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
