Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B07C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:16:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15AAA6108F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15AAA6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:Cc:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTiRBXhctWNvXXv9nxA2Iws5b4FcUfAVQFYKR0TGCWY=; b=Rlh0fvxK9yVzjp
	PPetu53iYOftHbqFRPb5YnGidGAZXhe3ZjZ6Ahbc36gRenJYFCFDS3yOA6XRXab4/9FmWZnWT/TYC
	XbwIfxAXNkKuKQ35c8jwpUmylqdx4Lzt0d/yI7dVBVNTbEmlFtVePSyh4vu8rPwhKZgdhAA7Jn/T2
	0srUHcHz7QyLQzkgyUD6UydVNqNHfaKmDsaw4dfFfAJQanAHEn6AfF0bZR0v/o6Jh6b/s4sgxlInZ
	7somjxu6hR/RKcFjP3rIx8B+7nckV1Om5SWpkyXQheYul78n/AyydNixSpzyE+fkPH+lfRJ8Flfho
	dDGy0T56nHjKmJB7BGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maC0N-00BkLj-Vn; Tue, 12 Oct 2021 07:15:20 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maC0J-00BkKc-Na
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 07:15:17 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 19C7EtiC006656;
 Tue, 12 Oct 2021 15:14:55 +0800 (GMT-8)
 (envelope-from jaimeliao@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 81E3EB0D9F6F97778B8D;
 Tue, 12 Oct 2021 15:14:56 +0800 (CST)
In-Reply-To: <20211008162228.1753083-10-miquel.raynal@bootlin.com>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-10-miquel.raynal@bootlin.com>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "Boris Brezillon" <bbrezillon@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, devicetree@vger.kernel.org,
 juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Rob Herring"<robh+dt@kernel.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Tudor Ambarus" <Tudor.Ambarus@microchip.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Xiangsheng Hou" <Xiangsheng.Hou@mediatek.com>
Subject: =?Big5?B?pl6rSDogW1JGQyBQQVRDSCAwOS8xMF0gc3BpOiBteGljOiBBZGQgc3VwcG9ydA==?=
 =?Big5?B?IGZvciBkaXJlY3QgbWFwcGluZw==?=
MIME-Version: 1.0
X-KeepSent: 032BE161:2014BA23-4825876C:0027CC4D;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF032BE161.2014BA23-ON4825876C.0027CC4D-4825876C.0027D1E7@mxic.com.tw>
From: jaimeliao@mxic.com.tw
Date: Tue, 12 Oct 2021 15:14:56 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/10/12 PM 03:14:56,
 Serialize complete at 2021/10/12 PM 03:14:56
X-MAIL: TWHMLLG3.macronix.com 19C7EtiC006656
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_001516_090256_AAA9C7F7 
X-CRM114-Status: GOOD (  21.59  )
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


Hi Miquel

ZhengxunLi have patch new mxic spi host controller before.
The patch name as below
spi: mxic: patch for octal DTR mode support
Please patch mxic ECC engine base on latest version.

Thanks
Jaime

> [RFC PATCH 09/10] spi: mxic: Add support for direct mapping
> 
> Implement the ->dirmap_create() and ->dirmap_read/write() hooks to
> provide a fast path for read and write accesses.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mxic.c | 171 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 144 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 4fb19e6f94b0..e10c55ee4d06 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -172,6 +172,11 @@ struct mxic_spi {
>     struct clk *send_dly_clk;
>     void __iomem *regs;
>     u32 cur_speed_hz;
> +   struct {
> +      void __iomem *map;
> +      dma_addr_t dma;
> +      size_t size;
> +   } linear;
>  };
> 
>  static int mxic_spi_clk_enable(struct mxic_spi *mxic)
> @@ -280,6 +285,42 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
>            mxic->regs + HC_CFG);
>  }
> 
> +static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op)
> +{
> +   u32 cfg = OP_CMD_BYTES(1) | OP_CMD_BUSW(fls(op->cmd.buswidth) - 1);
> +
> +   if (op->addr.nbytes)
> +      cfg |= OP_ADDR_BYTES(op->addr.nbytes) |
> +             OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
> +
> +   if (op->dummy.nbytes)
> +      cfg |= OP_DUMMY_CYC(op->dummy.nbytes);
> +
> +   if (op->data.dir != SPI_MEM_NO_DATA) {
> +      cfg |= OP_DATA_BUSW(fls(op->data.buswidth) - 1);
> +      if (op->data.dir == SPI_MEM_DATA_IN)
> +         cfg |= OP_READ;
> +   }
> +
> +   return cfg;
> +}
> +
> +static void mxic_spi_set_hc_cfg(struct spi_device *spi, u32 flags)
> +{
> +   struct mxic_spi *mxic = spi_master_get_devdata(spi->master);
> +   int nio = 1;
> +
> +   if (spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
> +      nio = 4;
> +   else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
> +      nio = 2;
> +
> +   writel(flags | HC_CFG_NIO(nio) |
> +          HC_CFG_TYPE(spi->chip_select, HC_CFG_TYPE_SPI_NOR) |
> +          HC_CFG_SLV_ACT(spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1),
> +          mxic->regs + HC_CFG);
> +}
> +
>  static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
>                 void *rxbuf, unsigned int len)
>  {
> @@ -328,6 +369,77 @@ static int mxic_spi_data_xfer(struct mxic_spi 
> *mxic, const void *txbuf,
>     return 0;
>  }
> 
> +static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc 
*desc,
> +               u64 offs, size_t len, void *buf)
> +{
> +   struct mxic_spi *mxic = 
spi_master_get_devdata(desc->mem->spi->master);
> +   int ret;
> +   u32 sts;
> +
> +   if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
> +      return -EINVAL;
> +
> +   mxic_spi_set_hc_cfg(desc->mem->spi, 0);
> +
> +   writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
> +          LMODE_SLV_ACT(desc->mem->spi->chip_select) |
> +          LMODE_EN,
> +          mxic->regs + LRD_CTRL);
> +   writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl),
> +          mxic->regs + LRD_CFG);
> +   writel(desc->info.offset + offs, mxic->regs + LRD_ADDR);
> +   len = min_t(size_t, len, mxic->linear.size);
> +   writel(len, mxic->regs + LRD_RANGE);
> +
> +   memcpy_fromio(buf, mxic->linear.map, len);
> +
> +   writel(INT_LRD_DIS, mxic->regs + INT_STS);
> +   writel(0, mxic->regs + LRD_CTRL);
> +
> +   ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
> +             sts & INT_LRD_DIS, 0, USEC_PER_SEC);
> +   if (ret)
> +      return ret;
> +
> +   return len;
> +}
> +
> +static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc 
*desc,
> +                u64 offs, size_t len,
> +                const void *buf)
> +{
> +   struct mxic_spi *mxic = 
spi_master_get_devdata(desc->mem->spi->master);
> +   u32 sts;
> +   int ret;
> +
> +   if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
> +      return -EINVAL;
> +
> +   mxic_spi_set_hc_cfg(desc->mem->spi, 0);
> +
> +   writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
> +          LMODE_SLV_ACT(desc->mem->spi->chip_select) |
> +          LMODE_EN,
> +          mxic->regs + LWR_CTRL);
> +   writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl),
> +          mxic->regs + LWR_CFG);
> +   writel(desc->info.offset + offs, mxic->regs + LWR_ADDR);
> +   len = min_t(size_t, len, mxic->linear.size);
> +   writel(len, mxic->regs + LWR_RANGE);
> +
> +   memcpy_toio(mxic->linear.map, buf, len);
> +
> +   writel(INT_LWR_DIS, mxic->regs + INT_STS);
> +   writel(0, mxic->regs + LWR_CTRL);
> +
> +   ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
> +             sts & INT_LWR_DIS, 0, USEC_PER_SEC);
> +   if (ret)
> +      return ret;
> +
> +   return len;
> +}
> +
>  static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
>                   const struct spi_mem_op *op)
>  {
> @@ -345,12 +457,27 @@ static bool mxic_spi_mem_supports_op(struct 
> spi_mem *mem,
>     return spi_mem_default_supports_op(mem, op);
>  }
> 
> +static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)
> +{
> +   struct mxic_spi *mxic = 
spi_master_get_devdata(desc->mem->spi->master);
> +
> +   if (!mxic->linear.map)
> +      return -ENOTSUPP;
> +
> +   if (desc->info.offset + desc->info.length > U32_MAX)
> +      return -ENOTSUPP;
> +
> +   if (!mxic_spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
> +      return -ENOTSUPP;
> +
> +   return 0;
> +}
> +
>  static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>              const struct spi_mem_op *op)
>  {
>     struct mxic_spi *mxic = spi_master_get_devdata(mem->spi->master);
> -   int nio = 1, i, ret;
> -   u32 ss_ctrl;
> +   int i, ret;
>     u8 addr[8];
>     u8 opcode = op->cmd.opcode;
> 
> @@ -358,34 +485,12 @@ static int mxic_spi_mem_exec_op(struct spi_mem 
*mem,
>     if (ret)
>        return ret;
> 
> -   if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
> -      nio = 4;
> -   else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
> -      nio = 2;
> +   mxic_spi_set_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN);
> 
> -   writel(HC_CFG_NIO(nio) |
> -          HC_CFG_TYPE(mem->spi->chip_select, HC_CFG_TYPE_SPI_NOR) |
> -          HC_CFG_SLV_ACT(mem->spi->chip_select) | 
HC_CFG_IDLE_SIO_LVL(1) |
> -          HC_CFG_MAN_CS_EN,
> -          mxic->regs + HC_CFG);
>     writel(HC_EN_BIT, mxic->regs + HC_EN);
> 
> -   ss_ctrl = OP_CMD_BYTES(1) | OP_CMD_BUSW(fls(op->cmd.buswidth) - 1);
> -
> -   if (op->addr.nbytes)
> -      ss_ctrl |= OP_ADDR_BYTES(op->addr.nbytes) |
> -            OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
> -
> -   if (op->dummy.nbytes)
> -      ss_ctrl |= OP_DUMMY_CYC(op->dummy.nbytes);
> -
> -   if (op->data.nbytes) {
> -      ss_ctrl |= OP_DATA_BUSW(fls(op->data.buswidth) - 1);
> -      if (op->data.dir == SPI_MEM_DATA_IN)
> -         ss_ctrl |= OP_READ;
> -   }
> -
> -   writel(ss_ctrl, mxic->regs + SS_CTRL(mem->spi->chip_select));
> +   writel(mxic_spi_mem_prep_op_cfg(op),
> +          mxic->regs + SS_CTRL(mem->spi->chip_select));
> 
>     writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
>            mxic->regs + HC_CFG);
> @@ -423,6 +528,9 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>  static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
>     .supports_op = mxic_spi_mem_supports_op,
>     .exec_op = mxic_spi_mem_exec_op,
> +   .dirmap_create = mxic_spi_mem_dirmap_create,
> +   .dirmap_read = mxic_spi_mem_dirmap_read,
> +   .dirmap_write = mxic_spi_mem_dirmap_write,
>  };
> 
>  static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
> @@ -552,6 +660,15 @@ static int mxic_spi_probe(struct platform_device 
*pdev)
>     if (IS_ERR(mxic->regs))
>        return PTR_ERR(mxic->regs);
> 
> +   res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
> +   mxic->linear.map = devm_ioremap_resource(&pdev->dev, res);
> +   if (!IS_ERR(mxic->linear.map)) {
> +      mxic->linear.dma = res->start;
> +      mxic->linear.size = resource_size(res);
> +   } else {
> +      mxic->linear.map = NULL;
> +   }
> +
>     pm_runtime_enable(&pdev->dev);
>     master->auto_runtime_pm = true;
> 
> -- 
> 2.27.0
> 


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
