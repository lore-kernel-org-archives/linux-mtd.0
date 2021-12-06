Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9425C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5/zp3p1pBxVGr/ejD9UI7L6AZPLZiZm3iuwymDRmO8=; b=T8GcO1tiAwN4vO
	a2HVaa0e191zGyfCFdrkjrUi8GyiOVQF/y+H0JAZtyGfbdTIfg2ZdlvXU5SJe75LpOFExMFl2k/rL
	Zfu+aHramaLGEdkfs+5UvZMXsPUpcJjMnmJzpxwyoXbzxOPtOS0om+XeCcVXdABFNQyL2HTes6oTx
	QPg46PTZpDX/5PPNxOEr7M1XvVm2XVrX5fv82sWWVcEryThHi1D3GozLX+rML7+qsM11iOzrbD4a4
	ZN97sREs1uRO2FHYpCErZW5OtpJClYUZOJi3LckS6MBRVm11Ve86xq91jRgoJ2Pt8of8p3cbsB70Q
	njlEstKT35d09ndHpRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muCaV-003deE-3v; Mon, 06 Dec 2021 11:55:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muCaR-003dc7-NU; Mon, 06 Dec 2021 11:55:17 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B6BscFR051301;
 Mon, 6 Dec 2021 05:54:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638791678;
 bh=HOkl+Y9igZtwxZwwo7C/BezruRMSH7lsGLV9Oa1Jzuk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RkgkU/Yyz1ZDfA/Dj6CXOi0kue8MmIpLbpT0kxgBKV2GeqAG4pJzWEVB60uC75pgf
 hGdaWKOOuF+GyKVJhIBeoMdp/o3WPjQ93GrMJKu3S6bLe/SF/Gn8eISCzUlxnwy+Ac
 UyOQb7jec61s7piOq2Pwb+sfrNd6cEtWwPRYL4VM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B6Bsc78128564
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 Dec 2021 05:54:38 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Dec 2021 05:54:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Dec 2021 05:54:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B6Bsatw108933;
 Mon, 6 Dec 2021 05:54:37 -0600
Date: Mon, 6 Dec 2021 17:24:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v5 01/14] mtd: spi-nor: Fix mtd size for s3an flashes
Message-ID: <20211206115434.t5yv53vfiapnribq@ti.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
 <20211203142256.47370-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203142256.47370-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_035515_944332_CCC97893 
X-CRM114-Status: GOOD (  15.50  )
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

On 03/12/21 04:22PM, Tudor Ambarus wrote:
> As it was before the blamed commit, s3an_nor_scan() was called
> after mtd size was set with params->size, and it overwrote the mtd
> size value with '8 * nor->page_size * nor->info->n_sectors' when
> XSR_PAGESIZE was set. With the introduction of
> s3an_post_sfdp_fixups(), we missed to update the mtd size for the
> s3an flashes. Fix the mtd size by updating both nor->params->size,
> (which will update the mtd_info size later on) and nor->mtd.size
> (which is used in spi_nor_set_addr_width()).
> 
> Fixes: 641edddb4f43 ("mtd: spi-nor: Add s3an_post_sfdp_fixups()")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/xilinx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index 7e970ccf7903..03d3b006a039 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -69,7 +69,8 @@ static int xilinx_nor_setup(struct spi_nor *nor,
>  		page_size = (nor->params->page_size == 264) ? 256 : 512;
>  		nor->params->page_size = page_size;
>  		nor->mtd.writebufsize = page_size;
> -		nor->mtd.size = 8 * page_size * nor->info->n_sectors;
> +		nor->params->size = 8 * page_size * nor->info->n_sectors;
> +		nor->mtd.size = nor->params->size;

I supposed you could just have done this in patch 2 directly, but this 
is fine too.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
