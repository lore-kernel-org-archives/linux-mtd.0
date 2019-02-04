Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2617CC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 14:17:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E89002082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 14:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Or/SMVP6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJv0ESeq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E89002082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pl2TqEJU5/rXKLtKWNUin+cJVrdaIPgNB43QYTN7NC0=; b=Or/SMVP6U4+YQG
	W398zZrZmFkIsFupg2LjJMTj8XafCaUiieuvXmGcnjPQhvzr+Siy294tILhGq4iU8Diq/ul5vor6V
	YIowb8UF8AevLgyQ9DJw/v5d4IhaToRFCxV/O3yKl/Hf4O2vDGIVqWq+I4jcZ/w5zH2ewFxBTCM7I
	HQhcfseNbczaZ/4EbWdc4vFAkIy7ZVjw6RH9qWh2p6PEgs7bqWdUKwmn0urG0ZXOks1n7xPTSC1AT
	nBFUm2FHYbZ1ZcfT5uBINsbLwp+Nmc5lJueC0dq/ay2T/N2YmHv+/n41B3tBfoHShPGExVKRYHHyI
	tjgILZEJ2yLMf3bhdd1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqf3X-0006Xr-MJ; Mon, 04 Feb 2019 14:17:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqf3L-0006MN-Ap; Mon, 04 Feb 2019 14:16:52 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B3F62082E;
 Mon,  4 Feb 2019 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549289810;
 bh=59B7Fg/2o4Q9e4KH7S+tznSA4OHF6+depqmX3mzbg+A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JJv0ESeqQZgbulbEEIH2pFrDz2c0tp5Vy69CrMIymAhDgJ6KL7yzjw73LlOjEUnrK
 cVQdYZxqXQZTvQZym/CZh+7JVXi9u1tuclD8H4hRE+PlrZPrBDkTqikpyEl9BfABI6
 3rwR6+WuACsbarZP3DmXdBVSvBW5OHhf9YkKcWjw=
Date: Mon, 4 Feb 2019 15:16:43 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v4 13/13] spi: atmel-quadspi: add support for sam9x60
 qspi controller
Message-ID: <20190204151643.0354180d@bbrezillon>
In-Reply-To: <20190204100910.26701-14-tudor.ambarus@microchip.com>
References: <20190204100910.26701-1-tudor.ambarus@microchip.com>
 <20190204100910.26701-14-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_061651_384523_921D177F 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 Cyrille.Pitchen@microchip.com, Nicolas.Ferre@microchip.com, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, bugalski.piotr@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 4 Feb 2019 10:10:21 +0000
<Tudor.Ambarus@microchip.com> wrote:

> +
> +static void atmel_qspi_sam9x60_write_regs(const struct atmel_qspi *aq,
> +					  const struct spi_mem_op *op,
> +					  const struct atmel_qspi_cfg *cfg)
> +{
> +	/* Clear pending interrupts */
> +	(void)readl_relaxed(aq->regs + QSPI_SR);
> +
> +	/* Set QSPI Instruction Frame registers */
> +	writel_relaxed(cfg->iar, aq->regs + QSPI_IAR);
> +	if (op->data.dir == SPI_MEM_DATA_IN)
> +		writel_relaxed(cfg->icr, aq->regs + QSPI_RICR);
> +	else
> +		writel_relaxed(cfg->icr, aq->regs + QSPI_ICR);

Can you use WICR here (even if ICR == WICR)?

> +	writel_relaxed(cfg->ifr, aq->regs + QSPI_IFR);
> +}

Hm, so the only difference we have is the RICR vs ICR reg and the
APBTFRTYP_READ vs SAMA5D2_WRITE_TRSFR bit. Not sure it deserves
creating 2 hooks for that. Can we have something like ->has_ricr in
the caps and then have an if/else block directly in
atmel_qspi_set_cfg()?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
