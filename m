Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685ADC5DF61
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 06:06:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39CB321882
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 06:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PVC0vEhO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JyLxr2bS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39CB321882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi+T2FR669YGqxfJ6vtRzb0Mmn4kydTwuRlB+s4PcEQ=; b=PVC0vEhOGH5eaU
	FKMI20sb3S1t+F95kfNuva5WXp6YgjlF6hh4VcmMUHrphaVcrOsjHcsjCo5vqOzzRZI2RdjJg5lvT
	E3MHk+MY3iGf/ohMgzhcWykOJd+y5XLT37hV6xcSHbptXsi+obvMBjlVjyjTbASqmbAnyBLmAF9+g
	4QnjaojN4W9Z2O2Uj2oFwGcoTbCW4DMfi8ghvfUe2ui28VIFSXPQ6w+0QdRMScZCJ4/R7ReU5hKhU
	fmzvxqG541EtW9e+vSyw5LeSwk8ne14XqaiGVC24PB7/l95Dcp12AXGYM+liB5nr8sZaCjI/XFNTH
	pIMs6rFBnBTV+8yq6pXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSavV-0000xh-0N; Thu, 07 Nov 2019 06:05:49 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSavR-0000x4-Vf; Thu, 07 Nov 2019 06:05:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA765W3J009455;
 Thu, 7 Nov 2019 00:05:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573106732;
 bh=YkH6IrLLDyFL1c+gPK30RscWok8biguT1gLAoAK04AQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JyLxr2bSWrMfVthmAEKDODjrRZchD+nNQJMItKW8Ks3I7yHaZWFw/NTIXH9LXMMTV
 AWIDb9F9kpT/SN5TyhUkE9A3n9+YvhAFnqXIVAhig0y+YtQuKiXYnB8pXVCcFtPIRZ
 hkM+tcR7Sy5I+tIxRrSnbGDOEawmANuil8TnT33M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA765W5w098483;
 Thu, 7 Nov 2019 00:05:32 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 7 Nov
 2019 00:05:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 7 Nov 2019 00:05:16 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA765RSj099257;
 Thu, 7 Nov 2019 00:05:28 -0600
Subject: Re: [PATCH 1/2] mtd: mtk-quadspi: add support for memory-mapped flash
 reading
To: Chuanhong Guo <gch981213@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20191106140748.13100-1-gch981213@gmail.com>
 <20191106140748.13100-2-gch981213@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <bc917a56-e688-d701-2279-87df460d6055@ti.com>
Date: Thu, 7 Nov 2019 11:36:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106140748.13100-2-gch981213@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_220546_101632_AAF6564B 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 06/11/19 7:37 PM, Chuanhong Guo wrote:
> PIO reading mode on this controller is ridiculously inefficient
> (one cmd+addr+dummy sequence reads only one byte)
> This patch adds support for reading from memory-mapped flash area
> which increases reading speed from 1MB/s to 5.6MB/s
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  drivers/mtd/spi-nor/mtk-quadspi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
> index 34db01ab6cab..ba8b3be39896 100644
> --- a/drivers/mtd/spi-nor/mtk-quadspi.c
> +++ b/drivers/mtd/spi-nor/mtk-quadspi.c
> @@ -106,6 +106,7 @@ struct mtk_nor {
>  	struct spi_nor nor;
>  	struct device *dev;
>  	void __iomem *base;	/* nor flash base address */
> +	void __iomem *flash_base;
>  	struct clk *spi_clk;
>  	struct clk *nor_clk;
>  };
> @@ -272,6 +273,11 @@ static ssize_t mtk_nor_read(struct spi_nor *nor, loff_t from, size_t length,
>  	mtk_nor_set_read_mode(mtk_nor);
>  	mtk_nor_set_addr(mtk_nor, addr);
>  
> +	if (mtk_nor->flash_base) {
> +		memcpy_fromio(buffer, mtk_nor->flash_base + from, length);
> +		return length;
> +	}
> +

Don't you need to check if access is still within valid memory mapped
window?

>  	for (i = 0; i < length; i++) {
>  		ret = mtk_nor_execute_cmd(mtk_nor, MTK_NOR_PIO_READ_CMD);
>  		if (ret < 0)
> @@ -475,6 +481,11 @@ static int mtk_nor_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_nor->base))
>  		return PTR_ERR(mtk_nor->base);
>  
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	mtk_nor->flash_base = devm_ioremap_resource(&pdev->dev, res);

There is a single API now: devm_platform_ioremap_resource().

> +	if (IS_ERR(mtk_nor->flash_base))
> +		mtk_nor->flash_base = NULL;
> +
>  	mtk_nor->spi_clk = devm_clk_get(&pdev->dev, "spi");
>  	if (IS_ERR(mtk_nor->spi_clk))
>  		return PTR_ERR(mtk_nor->spi_clk);
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
