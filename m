Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C018C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 16:52:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847376145A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 16:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847376145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:From:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LySnKc6pf+l13wgBVuKZNp/HdNDuBLv6xmCaXaJZN4w=; b=K/Jquv9wKbhC/DCP+/Duwops2
	Z5ehWSPZsH1Nk5PWlcHJQcwOPD7B79sAlOPvH2fN0SdL9lFEvhZ8i8s/rbh8EUZnPkP6xKcRTR8g1
	318aKlkWW0heiacCuj2Oa1leT83kEfIFgl78U/fCkq0kGytwtfi6/BTtmn7JdpugenNvIrBe4A3Pa
	0pz+BCKLfI79yLAkFAXRKCs5T2xJ9qfwKRMrrolQBjrk0nIq+FiLEuVCaNQzq35DO0KBixdfnIBJj
	9f3AAV74EoPPgJccFLNxE0LYIi7eOnw6edZEG2QARqy6w3J3W4ZOCG+6A7DUpz2Apd7Nk5ayGN5bv
	Z2jdCBCxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcWMc-008Ea7-GN; Fri, 30 Apr 2021 16:51:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcWMO-008EXy-8t; Fri, 30 Apr 2021 16:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
 Date:Sender:Reply-To:To:Content-ID:Content-Description;
 bh=aqmiX22cwLflROHsnVcqxijJogv57RMpMBONHTHW/VE=; b=w3/Ridb5BVPxISTEOr9K6DCsG9
 nLbyQ7PFLyQbZs3ODzrdNeZ6VSN/QKxL7SgzJb0Rg6vacfx57flwZ2Hl/MXILVOYTb1G3ZCyTpxm+
 eakzL+Te2GIEQ9UFirNBe4LGq+3rvFBbtF+yrOMTmrzRB/7j8wgYMMXf8TsqO9ByRuz1BkkCcWSZZ
 5vTY/Gspr9D1O5usCt9tHz/Tsdogh/6VYnLFnWz6NsGU+xYwv7H+VHObAJLguXkuC9dxIJqStHsrB
 y2DAwBv4umSkHDWjUwEbLakb/0nHANYi3TaUl3AtfhM23hYugiUSI1GbL1hwHwjTnAvlTfxKOpiVD
 v8R6OZKA==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcWML-001XBt-AX; Fri, 30 Apr 2021 16:51:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD3CF1F43BCF;
 Fri, 30 Apr 2021 17:51:17 +0100 (BST)
Date: Fri, 30 Apr 2021 18:51:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Cc: <patrice.chotard@foss.st.com>, Mark Brown <broonie@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210430185104.377d1bc6@collabora.com>
In-Reply-To: <20210426143934.25275-2-patrice.chotard@foss.st.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_095121_549652_226F4369 
X-CRM114-Status: GOOD (  31.53  )
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

On Mon, 26 Apr 2021 16:39:32 +0200
<patrice.chotard@foss.st.com> wrote:

> From: Christophe Kerello <christophe.kerello@foss.st.com>
> 
> With STM32 QSPI, it is possible to poll the status register of the device.
> This could be done to offload the CPU during an operation (erase or
> program a SPI NAND for example).
> 
> spi_mem_poll_status API has been added to handle this feature.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/spi/spi-mem.c       | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/spi/spi-mem.h |  8 ++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 1513553e4080..43dce4b0efa4 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -743,6 +743,40 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
>  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
>  }
>  
> +/**
> + * spi_mem_poll_status() - Poll memory device status
> + * @mem: SPI memory device
> + * @op: the memory operation to execute
> + * @mask: status bitmask to ckeck
> + * @match: status expected value
> + * @timeout: timeout
> + *
> + * This function send a polling status request to the controller driver
> + *
> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> + *         -EOPNOTSUPP if not supported.
> + */
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u8 mask, u8 match, u16 timeout)
> +{
> +	struct spi_controller *ctlr = mem->spi->controller;
> +	int ret = -EOPNOTSUPP;
> +
> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> +		ret = spi_mem_access_start(mem);

You should probably check that op is a single byte read before
accepting the command.

> +		if (ret)
> +			return ret;
> +
> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);

You also need some sort of ->poll_status_is_supported() to validate
that the controller supports the status polling for this specific op (I
can imagine some controllers having a limit on the number of dummy
cycles/address bytes). I guess you could just fall back on SW-based
status polling if ctlr->mem_ops->poll_status() returns -ENOTSUPP.

> +
> +		spi_mem_access_end(mem);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
> +
>  static int spi_mem_probe(struct spi_device *spi)
>  {
>  	struct spi_mem_driver *memdrv = to_spi_mem_drv(spi->dev.driver);
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 2b65c9edc34e..5f78917c0f68 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
>   *		  the currently mapped area), and the caller of
>   *		  spi_mem_dirmap_write() is responsible for calling it again in
>   *		  this case.
> + * @poll_status: poll memory device status
>   *
>   * This interface should be implemented by SPI controllers providing an
>   * high-level interface to execute SPI memory operation, which is usually the
> @@ -274,6 +275,9 @@ struct spi_controller_mem_ops {
>  			       u64 offs, size_t len, void *buf);
>  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
>  				u64 offs, size_t len, const void *buf);
> +	int (*poll_status)(struct spi_mem *mem,
> +			   const struct spi_mem_op *op,
> +			   u8 mask, u8 match, u16 timeout);
>  };
>  
>  /**
> @@ -369,6 +373,10 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
>  void devm_spi_mem_dirmap_destroy(struct device *dev,
>  				 struct spi_mem_dirmap_desc *desc);
>  
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u8 mask, u8 match, u16 timeout);
> +
>  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
>  				       struct module *owner);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
