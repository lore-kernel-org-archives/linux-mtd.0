Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FA6C4360C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 08:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F019921835
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 08:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BSGYB0iT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zVRRtR+U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F019921835
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2cuj9RROM5eFXgdw/uToAKbaLi7f3duSF28L35+QgY=; b=BSGYB0iTkTgOqK
	le/AX7wkC1+wFKmdxAebHWEBt+JWrXZRJHNZF8/r+uWNA9Xoe4hHMOO+M5uqL9GHGbB4OHk7o3brd
	pcP/rCTgK/xGmjhrCNb0TMniLTVppE5gBCx2LMgAzfY6lCy2cTYBTL4PTt+Z1ij/caJ4GG2+H91qK
	zWM0x/Oo5Tg6JwzBVibYvhPvqSaNgRx8YwBtr+VYUtST66SFeD8s6lKVljXDLS20roHo4uTB45FFB
	t7e3cV8m2KpXf/1bGS0oK45J55bmPX3JLiihPlMQkFQsGczIpEgrqM98COhfkwqSY/JdgADUNt+++
	/GJ5pPcsPmcUQXnNTiKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKer4-0007qr-Pg; Wed, 16 Oct 2019 08:40:26 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKer2-0007pg-7P
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 08:40:25 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9G8e7Dh061401;
 Wed, 16 Oct 2019 03:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1571215207;
 bh=FzydHRoxz6F3DddJ3LSZU2cJWwW/1+9y2x9SP14HWoc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zVRRtR+UOjB0rQk11SdMmU1yNPLFd0Yw6hDA+wOfxU9pHoxKROtwcxaK46DvD2E2p
 b2cHXcxU5uQZNENkM7smTZTWg/A8LMNIY54UXJ8TM1kY+/PRXWKW0q63HWPOPHSAsw
 lo1VwDVUdhmZHpLMZo2VjYuIystAlju/gwy98jKI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9G8e7Ux122410
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Oct 2019 03:40:07 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 03:40:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 03:40:00 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9G8e1vE114960;
 Wed, 16 Oct 2019 03:40:02 -0500
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: cadence-quadspi: disable the
 auto-poll for Intel LGM
To: "Ramuthevar,Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>,
 <linux-mtd@lists.infradead.org>
References: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190909104733.14273-4-vadivel.muruganx.ramuthevar@linux.intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a4d45efe-907f-6c87-c650-5ad19942f0e4@ti.com>
Date: Wed, 16 Oct 2019 14:10:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909104733.14273-4-vadivel.muruganx.ramuthevar@linux.intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_014024_352336_BC641EC7 
X-CRM114-Status: GOOD (  19.48  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, andriy.shevchenko@intel.com,
 boris.brezillon@free-electrons.com, richard@nod.at, qi-ming.wu@intel.com,
 linux-kernel@vger.kernel.org, david.oberhollenzer@sigma-star.at,
 miquel.raynal@bootlin.com, jwboyer@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 09/09/19 4:17 PM, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> On Intel's Lightning Mountain(LGM) SoC QSPI controller do not auto-poll.
> This patch introduces to properly disable the auto-polling feature to

This patch disables auto polling when direct access mode is disabled
which should be noted in the commit message.

> improve the performance of cadence-quadspi.

How does this improve performance of cadence-quadspi? I would expect HW
auto-polling to be faster than SW polling.

> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 73b9fbd1508a..60998eaad1cc 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -135,6 +135,8 @@ struct cqspi_driver_platdata {
>  #define CQSPI_REG_RD_INSTR_TYPE_DATA_MASK	0x3
>  #define CQSPI_REG_RD_INSTR_DUMMY_MASK		0x1F
>  
> +#define CQSPI_REG_WR_COMPLETION_CTRL		0x38
> +#define CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL	BIT(14)
>  #define CQSPI_REG_WR_INSTR			0x08
>  #define CQSPI_REG_WR_INSTR_OPCODE_LSB		0
>  #define CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB	12
> @@ -471,6 +473,18 @@ static int cqspi_command_write_addr(struct spi_nor *nor,
>  	return cqspi_exec_flash_cmd(cqspi, reg);
>  }
>  
> +static int cqspi_disable_auto_poll(struct cqspi_st *cqspi)
> +{
> +	void __iomem *reg_base = cqspi->iobase;
> +	unsigned int reg;
> +
> +	reg = readl(reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
> +	reg |= CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL;
> +	writel(reg, reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
> +
> +	return 0;
> +}
> +
>  static int cqspi_read_setup(struct spi_nor *nor)
>  {
>  	struct cqspi_flash_pdata *f_pdata = nor->priv;
> @@ -508,6 +522,11 @@ static int cqspi_read_setup(struct spi_nor *nor)
>  	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
>  	reg |= (nor->addr_width - 1);
>  	writel(reg, reg_base + CQSPI_REG_SIZE);
> +
> +	/* Disable auto-polling */
> +	if (!f_pdata->use_direct_mode)
> +		cqspi_disable_auto_poll(cqspi);
> +
>  	return 0;
>  }
>  

Hmmm.. There is no need to disable polling for every read/write
operation. It should be enough to do it once in cqspi_controller_init()



> @@ -627,6 +646,11 @@ static int cqspi_write_setup(struct spi_nor *nor)
>  	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
>  	reg |= (nor->addr_width - 1);
>  	writel(reg, reg_base + CQSPI_REG_SIZE);
> +
> +	/* Disable auto-polling */
> +	if (!f_pdata->use_direct_mode)
> +		cqspi_disable_auto_poll(cqspi);
> +
>  	return 0;
>  }
>  
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
