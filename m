Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B4EC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 14:13:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D43A611CC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 14:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D43A611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RFxMXa3arFD9rpmf5QjnRoJqzIbDED7QEDLF1jpnQ2I=; b=jmOd/peWOFJhgGgkzLBPJTlf+
	nI+764y1h9Pqxj+mpeTlhQEyJ5vlwhqyvmVF1QuIkcNu4P2eCdKz/9sfyXLfCpLqD1+XQiCufIz/b
	i8lNXMpEgUfJjMXtTiS+ckjAZ5BQsLvBiF7G49fXvLn1nds0jFo/4zwVhwheccC3v4b1kjeiWuoRm
	mgL28pbPQVQfuvMrFuXfEuAVu0qOEVlmKt4UYspG51akfWYrUlXVQAxdkIh9+WQMyXftkdRw0B/SR
	tJ5T0KsVTawH153qH1LMVRK7Sc6DuBY3YSk2jSowjzBo3IVJoTdfcJ/EvQflmF/XPbfwc9EdLbOgE
	9VcGXCrsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj0TC-000yQR-CA; Tue, 18 May 2021 14:13:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0T0-000yOD-57; Tue, 18 May 2021 14:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=QR3bulwhcNL/4G5zimw0bUV+9IfdAQ9KqpRN6bmNc+Q=; b=u5iIg3WClwFhslGxe9MKlmCval
 V1KizmRLNmZ35wuS5T7R9k5yH0DHZnJKMhF6jB06cfkODbKKJqTpAw8/pgnpTvoyIZXMtf4asHLLa
 Q0xHl/Hnx+f985bwL8rUAx5Ax/gazRdYPWgxGTBd5heHnAZR4a8FV4cvk5MTLmVS9bAQFALLqjacO
 l5nNVM8QTF5etNCMmCkC6AQWpzYbv6SKaOogBD7bctP+sHx5tr+BGIfKRWUzpWXwyJ0SnSTJuKhXl
 28y0NSA2gb3cfZkTvkweZcCHAayOtBcy/l6gH0eQizEUCHU9jQiBxuucu0WZijGnZi0YxNYHH/gj2
 nSU87A0w==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0Sw-00EiRG-Rj; Tue, 18 May 2021 14:13:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 58D541F42A10;
 Tue, 18 May 2021 15:12:56 +0100 (BST)
Date: Tue, 18 May 2021 16:12:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v4 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210518161252.3e4f2999@collabora.com>
In-Reply-To: <20210518134332.17826-2-patrice.chotard@foss.st.com>
References: <20210518134332.17826-1-patrice.chotard@foss.st.com>
 <20210518134332.17826-2-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_071259_203183_CE86D4CB 
X-CRM114-Status: GOOD (  32.37  )
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

On Tue, 18 May 2021 15:43:30 +0200
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
> Changes in v4:
>   - Remove init_completion() from spi_mem_probe() added in v2.
>   - Add missing static for spi_mem_read_status().
>   - Check if operation in spi_mem_poll_status() is a READ.
> 
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
> index 1513553e4080..97c7a83686c7 100644
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
> @@ -743,6 +744,90 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
>  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
>  }
>  
> +static int spi_mem_read_status(struct spi_mem *mem,
> +			       const struct spi_mem_op *op,
> +			       u16 *status)
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

"
This function polls a status register and returns when
(status & mask) == match or when the timeout has expired.
"

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
> +	if (op->data.nbytes < 1 || op->data.nbytes > 2 ||
> +	    op->data.dir != SPI_MEM_DATA_IN)
> +		return (-EINVAL);

s/return (-EINVAL);/return -EINVAL;/


[...]

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

s/timeout/timeout_ms/.

With those minor things fixed

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +
>  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
>  				       struct module *owner);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
