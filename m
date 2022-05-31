Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7319C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 31 May 2022 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dz8VjBO4R63gbmlDhnq1lvm2rB3Rv2tMTZ1QxLuT9Yc=; b=SDot4AShA++2Fs
	rwjJSeXNr9ZahDwfCGGsmpAUjaV0E2VnRfkQQrzn25XvkE9+h5xst13H3du9D44Sp5m7fIskeLuj0
	UV0z/SHB9zaX4CNXUoWqmtU3o+Y4ibWd5GUnye1jf/fIAk+FGpA/VXEUIaT0WqnvbQ4xq23TmboMd
	0icpnMeSGQok1D65JqeI6fzgknjGYCebkm26zbOksVtzi0cmHZr+CQrjnjk0XJavzKad5immJAJ9W
	mI/O6LWPxRF4j1KceyTaL/bjK/ClxAuffdQ8bJXQkcCQwQowuGtxad+tN9NtoMk/bM42LlgFNTB13
	EdjDXvqzu2/s3WaP0gIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvzov-00ALgG-NN; Tue, 31 May 2022 11:13:53 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvzor-00ALff-MP
	for linux-mtd@lists.infradead.org; Tue, 31 May 2022 11:13:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24VBDhUw004550;
	Tue, 31 May 2022 06:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653995623;
	bh=eQ2fPKdCfxHA3rAAkDhzjLXv8P7iqc5Uq9p2BVuR6RQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DdqtpC6R6wQakpPl3uKAj5oCWOoDhhFATWdMZbWCQ3vPYgDN25XuEMOaCs8uiAvW3
	 4Z6XtWeQMZElcpSR88adzuFbyQeb4lPaZUwUzkR27s1mZvS1GatXsFq96BG5odVx0P
	 6s+KsNhVnA5AoJlvJuvynYj3JazXV5U+sB+CIkJQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24VBDhhd019922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 May 2022 06:13:43 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 31
 May 2022 06:13:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 31 May 2022 06:13:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24VBDgGY029573;
	Tue, 31 May 2022 06:13:42 -0500
Date: Tue, 31 May 2022 16:43:41 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <michael@walle.cc>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v15 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
Message-ID: <20220531111341.bprxpiam7327hdhe@ti.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <c56fb52bf191e3ae77572b042c2ff452f4919612.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c56fb52bf191e3ae77572b042c2ff452f4919612.1652063152.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_041349_858504_82A4B0E0 
X-CRM114-Status: GOOD (  22.99  )
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

On 10/05/22 07:10AM, tkuw584924@gmail.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Address width was an unfortunate name, as it means the number of IO lines
> used for the address, whereas in the code it is used as the number of
> address bytes. s/addr_width/addr_nbytes throughout the entire SPI NOR
> framework.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c |  6 +--
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c   |  2 +-
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c  |  8 ++--
>  drivers/mtd/spi-nor/core.c                   | 46 ++++++++++----------
>  drivers/mtd/spi-nor/core.h                   | 12 ++---
>  drivers/mtd/spi-nor/issi.c                   |  2 +-
>  drivers/mtd/spi-nor/otp.c                    | 12 ++---
>  drivers/mtd/spi-nor/sfdp.c                   | 32 +++++++-------
>  drivers/mtd/spi-nor/xilinx.c                 |  2 +-
>  include/linux/mtd/spi-nor.h                  |  4 +-
>  10 files changed, 63 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> index acfe010f9dd7..5ac8c321535b 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -350,10 +350,10 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>  	__be32 temp;
>  	u32 cmdaddr;
>  
> -	switch (nor->addr_width) {
> +	switch (nor->addr_nbytes) {
>  	default:
>  		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",

s/width/nbytes/ here as well.

> -			  nor->addr_width);
> +			  nor->addr_nbytes);
>  		fallthrough;
>  	case 3:
>  		cmdaddr = addr & 0xFFFFFF;
> @@ -709,7 +709,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>  	const struct aspeed_smc_info *info = controller->info;
>  	u32 cmd;
>  
> -	if (chip->nor.addr_width == 4 && info->set_4b)
> +	if (chip->nor.addr_nbytes == 4 && info->set_4b)
>  		info->set_4b(chip);
>  
>  	/* This is for direct AHB access when using Command Mode. */
> diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> index 94a969185ceb..5070d72835ec 100644
> --- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> @@ -237,7 +237,7 @@ static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
>  	reg = readl(host->regbase + FMC_CFG);
>  	reg &= ~(FMC_CFG_OP_MODE_MASK | SPI_NOR_ADDR_MODE_MASK);
>  	reg |= FMC_CFG_OP_MODE_NORMAL;
> -	reg |= (nor->addr_width == 4) ? SPI_NOR_ADDR_MODE_4BYTES
> +	reg |= (nor->addr_nbytes == 4) ? SPI_NOR_ADDR_MODE_4BYTES
>  		: SPI_NOR_ADDR_MODE_3BYTES;
>  	writel(reg, host->regbase + FMC_CFG);
>  
> diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> index 9032b9ab2eaf..ab3990e6ac25 100644
> --- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> +++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> @@ -203,7 +203,7 @@ static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
>  	      SPIFI_CMD_DATALEN(len) |
>  	      SPIFI_CMD_FIELDFORM_ALL_SERIAL |
>  	      SPIFI_CMD_OPCODE(nor->program_opcode) |
> -	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_width + 1);
> +	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_nbytes + 1);
>  	writel(cmd, spifi->io_base + SPIFI_CMD);
>  
>  	for (i = 0; i < len; i++)
> @@ -230,7 +230,7 @@ static int nxp_spifi_erase(struct spi_nor *nor, loff_t offs)
>  
>  	cmd = SPIFI_CMD_FIELDFORM_ALL_SERIAL |
>  	      SPIFI_CMD_OPCODE(nor->erase_opcode) |
> -	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_width + 1);
> +	      SPIFI_CMD_FRAMEFORM(spifi->nor.addr_nbytes + 1);
>  	writel(cmd, spifi->io_base + SPIFI_CMD);
>  
>  	return nxp_spifi_wait_for_cmd(spifi);
> @@ -252,12 +252,12 @@ static int nxp_spifi_setup_memory_cmd(struct nxp_spifi *spifi)
>  	}
>  
>  	/* Memory mode supports address length between 1 and 4 */
> -	if (spifi->nor.addr_width < 1 || spifi->nor.addr_width > 4)
> +	if (spifi->nor.addr_nbytes < 1 || spifi->nor.addr_nbytes > 4)
>  		return -EINVAL;
>  
>  	spifi->mcmd |= SPIFI_CMD_OPCODE(spifi->nor.read_opcode) |
>  		       SPIFI_CMD_INTLEN(spifi->nor.read_dummy / 8) |
> -		       SPIFI_CMD_FRAMEFORM(spifi->nor.addr_width + 1);
> +		       SPIFI_CMD_FRAMEFORM(spifi->nor.addr_nbytes + 1);
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 2bfa84100d38..7db6b41d7c30 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -38,7 +38,7 @@
>   */
>  #define CHIP_ERASE_2MB_READY_WAIT_JIFFIES	(40UL * HZ)
>  
> -#define SPI_NOR_MAX_ADDR_WIDTH	4
> +#define SPI_NOR_MAX_ADDR_NBYTES	4
>  
>  #define SPI_NOR_SRST_SLEEP_MIN 200
>  #define SPI_NOR_SRST_SLEEP_MAX 400
> @@ -198,7 +198,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>  {
>  	struct spi_mem_op op =
>  		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
> -			   SPI_MEM_OP_ADDR(nor->addr_width, from, 0),
> +			   SPI_MEM_OP_ADDR(nor->addr_nbytes, from, 0),

I am guessing this patch no longer applies since c0abb861c5d0 ("mtd: 
spi-nor: Introduce templates for SPI NOR operations"). Patch looks good 
otherwise.

Acked-by: Pratyush Yadav <p.yadav@ti.com>

[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
