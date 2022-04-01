Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D86C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Apr 2022 20:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5zVZzRy7KP2SH6KE9GFnCLIe1ki+dim/M/KWNpB4qU=; b=ZxsVoeATaINCdj
	9ofvJWkVHFLfCyaXarC+J3kuZt0SiplELyFPPzfoW0kdtvlmCIC/4Yx9xFjG3+ryAHrGILX4J8a1W
	uUOEoi8z1mxkfFzSiUd/mbtCuSyrOOMI03ZsvUxnFvoabcuecaMeEYCw9WPkaAgBj0EyN8Ze+sF82
	6DsN5i4R8mtpYomDWVxTpgi12jhmGZ9jEQmqHTTj0d7zWKCoaf76XNVMwaEN/68fTRyK3pGza0NR9
	b3fRjpc29e/QsgkbLPPWmO+nxQYO99MGlYNGD+1uu3pM2qNjDWPKMloikRIZhcYgjD2X8FJNbZkLk
	3SmcoefhRHfvwCJAgwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naNX4-0072hI-MJ; Fri, 01 Apr 2022 20:06:06 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naNX1-0072gA-Ur
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2022 20:06:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 231K5wGL060226;
 Fri, 1 Apr 2022 15:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648843558;
 bh=/Fa41M7WpEnzzkUG/Dcr3RaYCMlEH4p6C+CVR6sjCcw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=VZNgr+tMOy10A9z0lsvbaF5WM/Yiemppa3ydri0lXiu0jRzEWkijc9JkXqQylqu1t
 8XncyDuG0Bidp2aWGYTPiwgW9Y6hc1o9uRSF18+GCAhlPEk8uaZXplElKYsKCZv85p
 PDYcyUEGLhGlwGIkTc2aYy2tqF1Zcl+Dk71DhTEA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 231K5wSj050036
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Apr 2022 15:05:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Apr 2022 15:05:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Apr 2022 15:05:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 231K5uiQ001449;
 Fri, 1 Apr 2022 15:05:57 -0500
Date: Sat, 2 Apr 2022 01:35:56 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Skip setting erase types when
 SPI_NOR_NO_ERASE is set
Message-ID: <20220401200556.d6amfxdvyf66npyj@ti.com>
References: <20220308091135.88615-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308091135.88615-1-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_130604_117351_D3374E37 
X-CRM114-Status: GOOD (  17.55  )
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

On 08/03/22 11:11AM, Tudor Ambarus wrote:
> Even if SPI_NOR_NO_ERASE was specified at flash declaration, the erase
> type of size nor->info->sector_size was incorrectly set as supported.
> Don't set erase types when SPI_NOR_NO_ERASE is set.

Does this have any practical implications? Since we set MTD_NO_ERASE, 
erase should never be called for this flash anyway, right?

> 
> Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: stable@vger.kernel.org
> ---
> v2:
> - add comment, update commit message, split change in individual commit
> - add fixes tag and cc to stable.
> 
>  drivers/mtd/spi-nor/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b4f141ad9c9c..64cf7b9df621 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2392,6 +2392,10 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
>  					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
>  	}
>  
> +	/* Skip setting erase types when SPI_NOR_NO_ERASE is set. */
> +	if (nor->info->flags & SPI_NOR_NO_ERASE)
> +		return;
> +
>  	/*
>  	 * Sector Erase settings. Sort Erase Types in ascending order, with the
>  	 * smallest erase size starting at BIT(0).
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
