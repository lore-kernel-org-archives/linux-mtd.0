Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34772C5DF60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FD02084D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJe40bZ0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CwNa4exm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FD02084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FlbhuNZ3c9zG6tY1wu0uClgZ4CIsxzgDSEei8Et0ag=; b=gJe40bZ00uyZji
	O5bZdqCYfQJNRU5zVKnlw4xtHjFy4FqpM7GInlJSNVmmy3YpkhcuazmAKG60JgmObflLjBddJpEAL
	yI8BEaFZrMJcITf37p7vVeRYTlPn/YQnxuH4+SyajNjdeFaS4YlHTBD0m0fc/T8vc07tFxQTUUYbo
	GEx7YE653gYSvZS+3VhGCPap5FmhuWH9/kR994JHiF1gXM6L7Fx70g0DsnnQFCUZyrF2nxgE1AfXq
	bOpYF/WFpae2umFVQBIKU5OcCfUCMbBfnZgyTD7tqEuJrJrpcpOuLYZxKexe+q9DBsbW6EUfUgzb1
	cqtCvchapk5/rvLdWjLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdgl-0002vM-0t; Thu, 07 Nov 2019 09:02:47 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdgh-0002um-UN
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 09:02:45 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA792gcr061472;
 Thu, 7 Nov 2019 03:02:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573117362;
 bh=dRpfDeYFF/caDoW1tvTnyzvL5+5EG6lsFm+i5T2gTCA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CwNa4exmznINRRT35yHqztCqQta2J0Z3hRi+bjtealtiRvE5hMyS8/fm6fzZef1QO
 6G8WthGnCC5umeZZvVL4xe/NDY6HBCU5XrcAQpllCUzNhmdoK+UASUE6wj8aGiS3ab
 VmWiVDicKsxbRj6rUSk5/pYhftE0bx7NreDtkDO0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA792g3J099888;
 Thu, 7 Nov 2019 03:02:42 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 7 Nov
 2019 03:02:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 7 Nov 2019 03:02:27 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA792dYP079222;
 Thu, 7 Nov 2019 03:02:40 -0600
Subject: Re: [PATCH v10 1/2] mtd: spi-nor: Add support for is25wp256
To: <Tudor.Ambarus@microchip.com>, <sagar.kadam@sifive.com>
References: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
 <20191022172210.19865-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d6f88c1b-96c1-c99f-a4d8-6e57ca908add@ti.com>
Date: Thu, 7 Nov 2019 14:33:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022172210.19865-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_010244_106426_29A8ADAB 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 22/10/19 10:52 PM, Tudor.Ambarus@microchip.com wrote:
> From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> 
> Update the spi_nor_id table for is25wp256 (32MB) device from ISSI,
> present on HiFive Unleashed dev board (Rev: A00).
> 
> Use the post bfpt fixup hook for the is25wp256 device, as done for
> the is25lp256 device to overwrite the wrong address width advertised
> by BFPT.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> [tudor.ambarus@microchip.com: rebase, split and adapt for v5.4-rc4]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

> ---
> Sagar, I set the fixups hook in this patch, to avoid adding support for a flash that doesn't work from day one.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 7acf4a93b592..3fc1eb20dca5 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2267,6 +2267,10 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512,
> +			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +			    SPI_NOR_4B_OPCODES)
> +		       .fixups = &is25lp256_fixups },
>  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
