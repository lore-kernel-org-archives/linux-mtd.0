Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A269C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 19:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbXBPxp4vZjY1wYOK1R+Wd67rAyYLJjfikqLghthBQA=; b=TMmfoq2LXhNwSE
	pGt4bOWXXJGjogMzmBvuxsgiume3GdNemLtt7ZDm6uQ0oryvG6+MT+h8lND05pD8PH+LqvjFkzeOm
	oPcydk4tSnVH+6qCDiM8Mlh/naENEBbKoJbVIRTqstZmx7vdbwec/uE+Ti5fgIKhf6XLUcHZIRxYd
	Nhkza8ocK94j94BHlWw4mCnGwLzsueB/M9VPS1qd0EPed968ZWSQs10GfqviT7qnxvP36s7o+drvs
	IFtAEZ+HtqUXcE8PEfX+xMhwykJyIxAeII8sR5QNswcyP+ht1yVo43hWNvmsE6hc7Dda9z4BX/q9B
	/SNpzOZuKRigHOEAOevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKGF-002Efm-B6; Thu, 24 Feb 2022 19:58:47 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKGC-002Ee6-7J
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 19:58:45 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21OJwcvx024918;
 Thu, 24 Feb 2022 13:58:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645732718;
 bh=ZNPT3KDGGGlgDokrtKMNX2qbmogt9Zs1Cm8cMAf6eQQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uAaBUxLBJyo/Gn/orxEFejTCDXAGaSlEFsSi4KBWpUzsAKqjWshlm4Sg2oeUCjZIz
 rL2IeQgz3IKlHgCpTYdjZfTH9skE3aT5cBz3cf+qV2FSmGBZ5QIr+cLDopgMtTSCV0
 Hpc6bHfQEtapd0wc1HNkMCt5hnsIk46nN8i4UB2Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21OJwcVs030289
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Feb 2022 13:58:38 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Feb 2022 13:58:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Feb 2022 13:58:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21OJwbet059330;
 Thu, 24 Feb 2022 13:58:37 -0600
Date: Fri, 25 Feb 2022 01:28:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v8 1/3] mtd: spi-nor: spansion: Add support for Read Any
 Register
Message-ID: <20220224195836.zmuev2ikvrti76qs@ti.com>
References: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
 <68be63ddb8300438d2d73d63791c0fbd61ce61c9.1645426789.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68be63ddb8300438d2d73d63791c0fbd61ce61c9.1645426789.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_115844_392381_BBE47B18 
X-CRM114-Status: GOOD (  18.45  )
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

On 21/02/22 04:14PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The Read Any Register instruction (65h) is followed by register address
> and dummy cycles, then the selected register byte is returned. This patch
> adds a spi_mem_op template for that. The spi_mem_op is passed to
> spi_nor_read_reg() introduced by:
> https://lore.kernel.org/linux-mtd/20220210023334.408926-1-tudor.ambarus@microchip.com/T/#m05d56c77f8d55eb6f3dee4cb138bde4ff390d6c1

Hmm, I don't think you should put patch links in the commit message. 
Better to put them below the "---" line.

> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v8:
>   - Remove controller_ops
>   - Remove spansion_read/write_any_reg()
>   - Add spi_mem_op macro for Read Any Register
>   
> Changes in v7:
>   - No change
> 
> Changes in v6:
>   - Add helper functions for controller_ops
>   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
>   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
>     function header comment
> 
> Changes in v5:
>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
> 
> Changes in v4:
>   - Fix dummy cycle calculation in spansion_read_any_reg()
>   - Modify comment for spansion_write_any_reg()
>   
> Changes in v3:
>   - Cleanup implementation
> 
>  drivers/mtd/spi-nor/spansion.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 9bb239f1e142..9040edf7359f 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -20,6 +20,11 @@
>  #define SPINOR_OP_CYPRESS_RD_FAST		0xee
>  
>  /* Spansion/Cypress SPI NOR flash operations. */
> +#define SPI_NOR_SPANSION_RD_ANY_REG_OP(naddr, addr, ndummy, ndata, buf)	\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
> +		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
> +		   SPI_MEM_OP_DATA_IN(ndata, buf, 0))

With the commit message fixed,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

>  #define SPI_NOR_SPANSION_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),		\
>  		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
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
