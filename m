Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196A9C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 11:32:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B26B611AD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 11:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B26B611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iJvJexDQz9HNJfWC7k5AIE92fqwEzMQpE7nhWD8r0GE=; b=YWkfLuooCxZ6yewhdIGW6AWos
	5Sl/i1RUcYXSGAc+wStQHdMxAmynZj9ivTkAobk6tcgBaT9ZkKduxiVcnEVK/bYJNe9Uy2IZfMOGN
	IPr5EU6D1Jovkg3Z1Fw2UTpqUbSVZ135klRdhKhBeCs8HCCDUHRr0rG3laq4wFwakH70C1sa2eCWd
	TtoLa7+nL93fKxPiv1DuUuhSLQl6l9mjio/45SvEdqmvGiI8sGTUPFVFtzbhiF3B/dAtZSetamVed
	vLfay3l80ACwjw5N6iXMLUg1GFpzIkHzkVdybvDnIfnvzZ+T90/ssWUTJ7TucpWdGSrs0VHMVmtyW
	tzYp3nlyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lixwZ-000Z6y-Fy; Tue, 18 May 2021 11:31:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixwF-000Z2N-G8; Tue, 18 May 2021 11:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=4z2GQ8Uhbue9AwXkXZc8YGpXoj9+NYG8K9TCYN7QWO4=; b=V26mIOCvpd7gl3xcUhOz69ZjH1
 3sHLv1Lv/IXHYZOFgTOdeNbLH43VtZoD07IXFYVOMmWX27Klbn64lMm/slxN6LoFYq8Xa1SVKc0b+
 X4vxEIl4r+2oNeHcVJzUW4RxaqmNuPLUcYU/CDYVV8D48aF/DdC6RdFU4xLg4LRY8hsxZkqXYpU/n
 7wtbWUwI3obrYpa4uH8k1rJbWM8feN6luPJV8R9Kvgm9Z3KpEjGjyobnjZ0hvpxBllQS63oqiwwjB
 IRPfam2HXS7csAehHsytJGVFXF5VUrlJ+2NECILiCCN/5ymOjY2RWBK3Y+YiiX6SBZKsOM5it3w/F
 sbyJVlVg==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixwC-00EbVv-CP; Tue, 18 May 2021 11:31:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CB6D61F42F40;
 Tue, 18 May 2021 12:30:58 +0100 (BST)
Date: Tue, 18 May 2021 13:30:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v3 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210518133054.3240b088@collabora.com>
In-Reply-To: <20210518093951.23136-2-patrice.chotard@foss.st.com>
References: <20210518093951.23136-1-patrice.chotard@foss.st.com>
 <20210518093951.23136-2-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_043100_722189_89CC79BD 
X-CRM114-Status: GOOD (  37.72  )
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

On Tue, 18 May 2021 11:39:49 +0200
<patrice.chotard@foss.st.com> wrote:

> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> With STM32 QSPI, it is possible to poll the status register of the device.
> This could be done to offload the CPU during an operation (erase or
> program a SPI NAND for example).
> 
> spi_mem_poll_status API has been added to handle this feature.
> This new function take care of the offload/non-offload cases.
> 
> For the non-offload case, use read_poll_timeout() to poll the status in
> order to release CPU during this phase.
> For example, previously, when erasing large area, in non-offload case,
> CPU load can reach ~50%, now it decrease to ~35%.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> Changes in v3:
>   - Add spi_mem_read_status() which allows to read 8 or 16 bits status.
>   - Add initial_delay_us and polling_delay_us parameters to spi_mem_poll_status()
>     and also to poll_status() callback.
>   - Move spi_mem_supports_op() in SW-based polling case.
>   - Add delay before invoking read_poll_timeout().
>   - Remove the reinit/wait_for_completion() added in v2.
> 
> Changes in v2:
>   - Indicates the spi_mem_poll_status() timeout unit
>   - Use 2-byte wide status register
>   - Add spi_mem_supports_op() call in spi_mem_poll_status()
>   - Add completion management in spi_mem_poll_status()
>   - Add offload/non-offload case management in spi_mem_poll_status()
>   - Optimize the non-offload case by using read_poll_timeout()
> 
>  drivers/spi/spi-mem.c       | 85 +++++++++++++++++++++++++++++++++++++
>  include/linux/spi/spi-mem.h | 14 ++++++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 1513553e4080..257dc501d5df 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -6,6 +6,7 @@
>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
>   */
>  #include <linux/dmaengine.h>
> +#include <linux/iopoll.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/spi-mem.h>
> @@ -743,6 +744,89 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
>  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
>  }
>  
> +int spi_mem_read_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u16 *status)
> +{
> +	const u8 *bytes = (u8 *)op->data.buf.in;
> +	int ret;
> +
> +	ret = spi_mem_exec_op(mem, op);
> +	if (ret)
> +		return ret;
> +
> +	if (op->data.nbytes > 1)
> +		*status = ((u16)bytes[0] << 8) | bytes[1];
> +	else
> +		*status = bytes[0];
> +
> +	return 0;
> +}
> +
> +/**
> + * spi_mem_poll_status() - Poll memory device status
> + * @mem: SPI memory device
> + * @op: the memory operation to execute
> + * @mask: status bitmask to ckeck
> + * @match: (status & mask) expected value
> + * @initial_delay_us: delay in us before starting to poll
> + * @polling_delay_us: time to sleep between reads in us
> + * @timeout_ms: timeout in milliseconds
> + *
> + * This function send a polling status request to the controller driver
> + *
> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> + *         -EOPNOTSUPP if not supported.
> + */
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u16 mask, u16 match,
> +			unsigned long initial_delay_us,
> +			unsigned long polling_delay_us,
> +			u16 timeout_ms)
> +{
> +	struct spi_controller *ctlr = mem->spi->controller;
> +	int ret = -EOPNOTSUPP;
> +	int read_status_ret;
> +	u16 status;
> +
> +	if (op->data.nbytes < 1 || op->data.nbytes > 2)
> +		return -EINVAL;
> +
> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> +		ret = spi_mem_access_start(mem);
> +		if (ret)
> +			return ret;
> +
> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
> +						 initial_delay_us, polling_delay_us,
> +						 timeout_ms);
> +
> +		spi_mem_access_end(mem);
> +	}
> +
> +	if (ret == -EOPNOTSUPP) {
> +		if (!spi_mem_supports_op(mem, op))
> +			return ret;
> +
> +		if (initial_delay_us < 10)
> +			udelay(initial_delay_us);
> +		else
> +			usleep_range((initial_delay_us >> 2) + 1,
> +				     initial_delay_us);
> +
> +		ret = read_poll_timeout(spi_mem_read_status, read_status_ret,
> +					(read_status_ret || ((status) & mask) == match),
> +					polling_delay_us, timeout_ms * 1000, false, mem,
> +					op, &status);
> +		if (read_status_ret)
> +			return read_status_ret;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
> +
>  static int spi_mem_probe(struct spi_device *spi)
>  {
>  	struct spi_mem_driver *memdrv = to_spi_mem_drv(spi->dev.driver);
> @@ -763,6 +847,7 @@ static int spi_mem_probe(struct spi_device *spi)
>  	if (IS_ERR_OR_NULL(mem->name))
>  		return PTR_ERR_OR_ZERO(mem->name);
>  
> +	init_completion(&ctlr->xfer_completion);

Is this still needed?

>  	spi_set_drvdata(spi, mem);
>  
>  	return memdrv->probe(mem);
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 2b65c9edc34e..10375d9ad747 100644
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
> @@ -274,6 +275,12 @@ struct spi_controller_mem_ops {
>  			       u64 offs, size_t len, void *buf);
>  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
>  				u64 offs, size_t len, const void *buf);
> +	int (*poll_status)(struct spi_mem *mem,
> +			   const struct spi_mem_op *op,
> +			   u16 mask, u16 match,
> +			   unsigned long initial_delay_us,
> +			   unsigned long polling_rate_us,
> +			   unsigned long timeout_ms);
>  };
>  
>  /**
> @@ -369,6 +376,13 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
>  void devm_spi_mem_dirmap_destroy(struct device *dev,
>  				 struct spi_mem_dirmap_desc *desc);
>  
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u16 mask, u16 match,
> +			unsigned long initial_delay_us,
> +			unsigned long polling_delay_us,
> +			u16 timeout);
> +
>  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
>  				       struct module *owner);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
