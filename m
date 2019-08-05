Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB4EC0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 06:40:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5E02086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 06:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flN3jAot";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FkgWU285"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5E02086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6WMvgnhRgUCBYRxXIaLwWxisfbMC++LEwuzvgKCGUc=; b=flN3jAotHD+zJz
	jRw5pbK7nWFcn3o7+H/dGGglvKYkDEe0KSLDF7zTlnB/Pp30K8yBgmRzuvla8QZ1TJj6e3qwUz4O3
	1fc7R0+poKzf7oh+g3yRHLT71oze0hCQjZLWNUTq+/1s0ykyFHHApz3tHayUWY3tayFG8ooMDd5KD
	p0k2kuiO18vRF3DSns23fSWVkhIs9jGx5uyWM/g6qAoVqeygi8y0IuXw57BEBAUUqTJgHioZ9GCYP
	Bs1Z38QpvX17gPs2M+Hhk8U3tLWEJYESQOxiZ6rfAizsyjYF//iZTr4jidhjBBYmPn4o6IoPcRuL7
	pVYKs+NUKsI/ksGPtOmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huWf4-0000vV-9n; Mon, 05 Aug 2019 06:40:02 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huWf1-0000lH-HC
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 06:40:01 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x756dp7a081488;
 Mon, 5 Aug 2019 01:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564987191;
 bh=LBLhEib+Vvdjx8rBTm6w8IrgBBnJI0LAgsA5wofhZmw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FkgWU285I+wxRxwscDIfw35p6Tl6i64L4waJGO9TCBJ7MOhn7nvqbQ9jy4fHjB4yb
 PwHDHrZ2RWVBEl0YXIrQ28o55BFVd3nHLC+pooUUHTWPap60LmGFyaHRENHaU6ccsD
 Dvu8jqQVtBK91jAYow/Gq6bXRbkoE51xq+u49TEo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x756dphx013620
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Aug 2019 01:39:51 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 5 Aug
 2019 01:39:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 5 Aug 2019 01:39:51 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x756dma4058972;
 Mon, 5 Aug 2019 01:39:49 -0500
Subject: Re: [PATCH] mtd: spi-nor: Fix the disabling of write protection at
 init
To: <Tudor.Ambarus@microchip.com>, <marek.vasut@gmail.com>
References: <20190731084606.26289-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6bc1b181-a439-77c3-5162-a032a5f21b08@ti.com>
Date: Mon, 5 Aug 2019 12:10:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731084606.26289-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_233959_717797_E98C64BE 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 31/07/19 2:16 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> spi_nor_spansion_clear_sr_bp() depends on spansion_quad_enable().
> While spansion_quad_enable() is selected as default when
> initializing the flash parameters, the nor->quad_enable() method
> can be overwritten later on when parsing BFPT.
> 
> Select the write protection disable mechanism at spi_nor_init() time,
> when the nor->quad_enable() method is already known.
> 
> Fixes: 191f5c2ed4b6faba ("mtd: spi-nor: use 16-bit WRR command when QE is set on spansion flashes")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 924dbaf3fa49..28a64dbdaea9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4357,8 +4357,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
>  		default:
>  			/* Kept only for backward compatibility purpose. */
>  			params->quad_enable = spansion_quad_enable;
> -			if (nor->clear_sr_bp)
> -				nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
>  			break;
>  		}
>  
> @@ -4621,6 +4619,9 @@ static int spi_nor_init(struct spi_nor *nor)
>  	int err;
>  
>  	if (nor->clear_sr_bp) {
> +		if (nor->quad_enable == spansion_quad_enable)
> +			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
> +
>  		err = nor->clear_sr_bp(nor);
>  		if (err) {
>  			dev_err(nor->dev,
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
