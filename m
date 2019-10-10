Return-Path: <SRS0=RcjP=YD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C43C4360C
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 06:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE5B9218AC
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 06:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTVrcDAH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE5B9218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fzboc7B52F6rRoe7SYgTDPqi7p8avi4MxnT+hP6VrqM=; b=tTVrcDAHU6Uxtw
	K+o1rkc/53leiwJi4kp5fWtuGJ67BnHQgK+nR9sF8z5WzIbhYi52QwOVVgKXndYv1uris1VrDbBme
	VlLqyULRRk/uPhhJm5Gc6V6Qf03wqxrfp2uNX8FPebMz7hEGJkbMD/lYzFB4eL6X1qR14CAUva6BR
	GQp0Bu7dcXEHPtJCE2GG76ygWd57B1418recrFM7hMZfgBfkVtu6HTyRzbu89oRvxGQenaTaPRoDs
	x0TAt5La0GG2O1dOK0A7TjPJl5Q70AB0+cTudgL6GKSUywKNIFFEKNPp0WxJubTee+vdACEMe5lry
	zN+Cq8v2+3XcA1ORRz0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iISLg-0002WQ-3G; Thu, 10 Oct 2019 06:54:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iISLP-0002Ib-Vm; Thu, 10 Oct 2019 06:54:41 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 111722905BC;
 Thu, 10 Oct 2019 07:54:38 +0100 (BST)
Date: Thu, 10 Oct 2019 08:54:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 03/22] mtd: spi-nor: cadence-quadspi: Fix
 cqspi_command_read() definition
Message-ID: <20191010085435.67b08ab5@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20190924074533.6618-4-tudor.ambarus@microchip.com>
References: <20190924074533.6618-1-tudor.ambarus@microchip.com>
 <20190924074533.6618-4-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_235440_296153_E83D24EB 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: linux-arm-kernel@lists.infradead.org, vigneshr@ti.com,
 geert+renesas@glider.be, andrew@aj.id.au, richard@nod.at,
 linux-kernel@vger.kernel.org, vz@mleia.com, marek.vasut@gmail.com,
 jonas@norrbonn.se, linux-mtd@lists.infradead.org, joel@jms.id.au,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 24 Sep 2019 07:45:58 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> n_tx was never used, drop it. Replace 'const u8 *txbuf' with 'u8 opcode',
> to comply with the SPI NOR int (*read_reg)() method. The 'const'
> qualifier has no meaning for parameters passed by value, drop it.
> Going furher, the opcode was passed to cqspi_calc_rdreg() and never used,
> drop it.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index ebda612641a4..22008fecd326 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -285,7 +285,7 @@ static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> -static unsigned int cqspi_calc_rdreg(struct spi_nor *nor, const u8 opcode)
> +static unsigned int cqspi_calc_rdreg(struct spi_nor *nor)
>  {
>  	struct cqspi_flash_pdata *f_pdata = nor->priv;
>  	u32 rdreg = 0;
> @@ -354,8 +354,7 @@ static int cqspi_exec_flash_cmd(struct cqspi_st *cqspi, unsigned int reg)
>  	return cqspi_wait_idle(cqspi);
>  }
>  
> -static int cqspi_command_read(struct spi_nor *nor,
> -			      const u8 *txbuf, const unsigned n_tx,
> +static int cqspi_command_read(struct spi_nor *nor, u8 opcode,
>  			      u8 *rxbuf, size_t n_rx)
>  {
>  	struct cqspi_flash_pdata *f_pdata = nor->priv;
> @@ -373,9 +372,9 @@ static int cqspi_command_read(struct spi_nor *nor,
>  		return -EINVAL;
>  	}
>  
> -	reg = txbuf[0] << CQSPI_REG_CMDCTRL_OPCODE_LSB;
> +	reg = opcode << CQSPI_REG_CMDCTRL_OPCODE_LSB;
>  
> -	rdreg = cqspi_calc_rdreg(nor, txbuf[0]);
> +	rdreg = cqspi_calc_rdreg(nor);
>  	writel(rdreg, reg_base + CQSPI_REG_RD_INSTR);
>  
>  	reg |= (0x1 << CQSPI_REG_CMDCTRL_RD_EN_LSB);
> @@ -471,7 +470,7 @@ static int cqspi_read_setup(struct spi_nor *nor)
>  	unsigned int reg;
>  
>  	reg = nor->read_opcode << CQSPI_REG_RD_INSTR_OPCODE_LSB;
> -	reg |= cqspi_calc_rdreg(nor, nor->read_opcode);
> +	reg |= cqspi_calc_rdreg(nor);
>  
>  	/* Setup dummy clock cycles */
>  	dummy_clk = nor->read_dummy;
> @@ -604,7 +603,7 @@ static int cqspi_write_setup(struct spi_nor *nor)
>  	/* Set opcode. */
>  	reg = nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
>  	writel(reg, reg_base + CQSPI_REG_WR_INSTR);
> -	reg = cqspi_calc_rdreg(nor, nor->program_opcode);
> +	reg = cqspi_calc_rdreg(nor);
>  	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
>  
>  	reg = readl(reg_base + CQSPI_REG_SIZE);
> @@ -1087,7 +1086,7 @@ static int cqspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, size_t len)
>  
>  	ret = cqspi_set_protocol(nor, 0);
>  	if (!ret)
> -		ret = cqspi_command_read(nor, &opcode, 1, buf, len);
> +		ret = cqspi_command_read(nor, opcode, buf, len);
>  
>  	return ret;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
