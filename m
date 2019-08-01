Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086A9C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 05:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF889206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 05:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bL0+O+Vn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF889206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MklUoPPqAAhA+7aH8uiaD3CePr3Wo0x9zkpy4YP1Mhw=; b=bL0+O+VnaYJCTu
	8kc60lDUvII3xPKGAOZiC2uHMcbX90bSROlxoI3ATeXiedcuHRIBj7JUbxWdf4WE4NWDCT/WdlTn3
	e3I0HweOxN/vzckCUeqJg67riXVKerEo06nEthBow5O++BsaKi/tNzamv6215vXpZ6y5FjQi70hZj
	20WNKIZfUdWXMUqwuJaTIho7pH2esDm+NsPKh0/hmw/JMsdHs/odHEj33MXUY4zzfcU6/Gca6CxnJ
	yAVqwUzjwP/uK/wGJHENXzy8Zs2tUYOdpBsRHUMld63hIUeABUnMmDETnTAxwLMpduS+diVn0psjx
	y0l3Q3ZnVJQdHGLb4HJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht40d-0000H0-DQ; Thu, 01 Aug 2019 05:52:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht40Z-0000GJ-M6
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 05:52:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E827028AC1E;
 Thu,  1 Aug 2019 06:52:08 +0100 (BST)
Date: Thu, 1 Aug 2019 07:52:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: Move m25p80 code in spi-nor.c
Message-ID: <20190801075205.3336693b@collabora.com>
In-Reply-To: <20190801043052.30192-3-vigneshr@ti.com>
References: <20190801043052.30192-1-vigneshr@ti.com>
 <20190801043052.30192-3-vigneshr@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_225211_854441_71F2461A 
X-CRM114-Status: GOOD (  20.67  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 1 Aug 2019 10:00:51 +0530
Vignesh Raghavendra <vigneshr@ti.com> wrote:

> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> The m25p80 driver is actually a generic wrapper around the spi-mem
> layer. Not only the driver name is misleading, but we'd expect such a
> common logic to be directly available in the core. Another reason for
> moving this code is that SPI NOR controller drivers should
> progressively be replaced by SPI controller drivers implementing the
> spi_mem_ops interface, and when the conversion is done, we should have
> a single spi-nor driver directly interfacing with the spi-mem layer.
> 
> While moving the code we also fix a longstanding issue when
> non-DMA-able buffers are passed by the MTD layer.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v3:
> Simplify register read/write by dropping spi_nor_exec_op() and using
> spi_mem_exec_op() directly
> Modify spi_nor_spimem_xfer_data() to drop "enum spi_nor_protocol proto"
> Fix misc coding style comments by Tudor
> 
> v2:
> Add docs for new functions added
> Add spi_nor_ prefix to new functions
> Incorporate Andrey's patches https://lkml.org/lkml/2019/4/1/32
> to avoid looping spi_nor_spimem_* APIs
> 
>  drivers/mtd/devices/Kconfig   |  18 -
>  drivers/mtd/devices/Makefile  |   1 -
>  drivers/mtd/devices/m25p80.c  | 347 -------------------
>  drivers/mtd/spi-nor/Kconfig   |   2 +
>  drivers/mtd/spi-nor/spi-nor.c | 632 ++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |   3 +
>  6 files changed, 604 insertions(+), 399 deletions(-)
>  delete mode 100644 drivers/mtd/devices/m25p80.c
> 

[...]


> @@ -348,6 +530,16 @@ static int read_cr(struct spi_nor *nor)
>   */
>  static int write_sr(struct spi_nor *nor, u8 val)
>  {
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> +
> +		return spi_mem_exec_op(nor->spimem, &op);
> +	}
> +
>  	nor->bouncebuf[0] = val;

The above line should be moved at the beginning of the function if you
want the spimem path to work correctly.

>  	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->bouncebuf, 1);
>  }



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
