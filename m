Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EE5C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 14:21:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3698B61209
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 14:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3698B61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9vZ3Qyp9Zcgfg/1HOq9HBlldwTcTLJal6jB3gKXy9Nw=; b=Ylj3SWhvHCKxQdOEIqy3F2/+b
	X7w303z4lkuXPFNqsQ2EIxrHp1xTjEdQNBIF447KtZ+lvRGxatedPSS4Nv46lmgBHZPc4BWRxaBwg
	riyOyEBNrvR+RaBMk20BRyTRr6wR55bWDfxsVBBCL4D3DITmORdWpdr7541Es8nz1i0fQiXfaR1od
	h7sVKkxPCIniIFYSXA3ZDh3ISv8hUjg2KPKGZmMhkQOlQdDTh/2Sk0JObGnPLrNaTsHsBLH5MbBsP
	S97fgmrU5NXjL3u8RUJARNVZl6teVAou2uQY3H3hs7lEMFQ8yCRxH6kyALnWEqsr4utpYrx0eoK7L
	6RiGMU2sA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj0aO-001087-BO; Tue, 18 May 2021 14:20:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0ZG-000zoH-RE; Tue, 18 May 2021 14:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=SMXfLYG6Qf4hKKnI/SEzkpcqiaGM7M+QTnwnG9aje1s=; b=bCDo9MVhcH+6AXDpLpc/jn5ahb
 lyYX52KZ18jLgiQoQCoejhdBneGL4FG8o9I+dgJrKy0Kp/5exxdb5O7rvxhzgO0XNpmmsVNG7Qo4a
 8e/NNqyPxRrsAGA2V6/x74qUnPmtY4pFGWK9aXfuXFLbfvMPqHD9onw6724P3HraGybxbTSZh4Ecx
 sBArj1UozqMUYR04IAh8M3Irqe32wAtj3Zow1ndCNzBvhlS/y39VpXJs2JbMtyiUS+A7wWSbs/Y4/
 HcEmEGGLSzjU7J4TV08U4lpB+HxZQ3uhmKcSh8whizJ9Mfs/R6ueki0R9tVn4WxyKqloUDgv5dZjq
 zaeuFT1A==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0ZD-00Eij6-Qb; Tue, 18 May 2021 14:19:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 57F1B1F42B04;
 Tue, 18 May 2021 15:19:26 +0100 (BST)
Date: Tue, 18 May 2021 16:19:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v4 2/3] mtd: spinand: use the spi-mem poll status APIs
Message-ID: <20210518161923.3bf75a25@collabora.com>
In-Reply-To: <20210518134332.17826-3-patrice.chotard@foss.st.com>
References: <20210518134332.17826-1-patrice.chotard@foss.st.com>
 <20210518134332.17826-3-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_071928_164245_72533ED0 
X-CRM114-Status: GOOD (  29.00  )
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

On Tue, 18 May 2021 15:43:31 +0200
<patrice.chotard@foss.st.com> wrote:

> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Make use of spi-mem poll status APIs to let advanced controllers
> optimize wait operations.
> This should also fix the high CPU usage for system that don't have
> a dedicated STATUS poll block logic.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> Changes in v4:
>   - Update commit message.
>   - Add comment which explains how delays has been calculated.
>   - Rename SPINAND_STATUS_TIMEOUT_MS to SPINAND_WAITRDY_TIMEOUT_MS.
> 
> Changes in v3:
>   - Add initial_delay_us and polling_delay_us parameters to spinand_wait()
>   - Add SPINAND_READ/WRITE/ERASE/RESET_INITIAL_DELAY_US and
>     SPINAND_READ/WRITE/ERASE/RESET_POLL_DELAY_US defines.
> 
> Changes in v2:
>   - non-offload case is now managed by spi_mem_poll_status()
> 
>  drivers/mtd/nand/spi/core.c | 45 ++++++++++++++++++++++++++-----------
>  include/linux/mtd/spinand.h | 22 ++++++++++++++++++
>  2 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 17f63f95f4a2..3131fae0c715 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -473,20 +473,26 @@ static int spinand_erase_op(struct spinand_device *spinand,
>  	return spi_mem_exec_op(spinand->spimem, &op);
>  }
>  
> -static int spinand_wait(struct spinand_device *spinand, u8 *s)
> +static int spinand_wait(struct spinand_device *spinand,
> +			unsigned long initial_delay_us,
> +			unsigned long poll_delay_us,
> +			u8 *s)
>  {
> -	unsigned long timeo =  jiffies + msecs_to_jiffies(400);
> +	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(REG_STATUS,
> +						      spinand->scratchbuf);
>  	u8 status;
>  	int ret;
>  
> -	do {
> -		ret = spinand_read_status(spinand, &status);
> -		if (ret)
> -			return ret;
> +	ret = spi_mem_poll_status(spinand->spimem, &op, STATUS_BUSY, 0,
> +				  initial_delay_us,
> +				  poll_delay_us,
> +				  SPINAND_WAITRDY_TIMEOUT_MS);
> +	if (ret)
> +		return ret;
>  
> -		if (!(status & STATUS_BUSY))
> -			goto out;
> -	} while (time_before(jiffies, timeo));
> +	status = *spinand->scratchbuf;
> +	if (!(status & STATUS_BUSY))
> +		goto out;
>  
>  	/*
>  	 * Extra read, just in case the STATUS_READY bit has changed
> @@ -526,7 +532,10 @@ static int spinand_reset_op(struct spinand_device *spinand)
>  	if (ret)
>  		return ret;
>  
> -	return spinand_wait(spinand, NULL);
> +	return spinand_wait(spinand,
> +			    SPINAND_RESET_INITIAL_DELAY_US,
> +			    SPINAND_RESET_POLL_DELAY_US,
> +			    NULL);
>  }
>  
>  static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
> @@ -549,7 +558,10 @@ static int spinand_read_page(struct spinand_device *spinand,
>  	if (ret)
>  		return ret;
>  
> -	ret = spinand_wait(spinand, &status);
> +	ret = spinand_wait(spinand,
> +			   SPINAND_READ_INITIAL_DELAY_US,
> +			   SPINAND_READ_POLL_DELAY_US,
> +			   &status);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -585,7 +597,10 @@ static int spinand_write_page(struct spinand_device *spinand,
>  	if (ret)
>  		return ret;
>  
> -	ret = spinand_wait(spinand, &status);
> +	ret = spinand_wait(spinand,
> +			   SPINAND_WRITE_INITIAL_DELAY_US,
> +			   SPINAND_WRITE_POLL_DELAY_US,
> +			   &status);
>  	if (!ret && (status & STATUS_PROG_FAILED))
>  		return -EIO;
>  
> @@ -768,7 +783,11 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
>  	if (ret)
>  		return ret;
>  
> -	ret = spinand_wait(spinand, &status);
> +	ret = spinand_wait(spinand,
> +			   SPINAND_ERASE_INITIAL_DELAY_US,
> +			   SPINAND_ERASE_POLL_DELAY_US,
> +			   &status);
> +
>  	if (!ret && (status & STATUS_ERASE_FAILED))
>  		ret = -EIO;
>  
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 6bb92f26833e..6988956b8492 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -170,6 +170,28 @@ struct spinand_op;
>  struct spinand_device;
>  
>  #define SPINAND_MAX_ID_LEN	4
> +/*
> + * For erase, write and read operation, we got the following timings :
> + * tBERS (erase) 1ms to 4ms
> + * tPROG 300us to 400us
> + * tREAD 25us to 100us
> + * In order to minimize latency, the min value is divided by 4 for the
> + * initial delay, and dividing by 20 for the poll delay.
> + * For reset, 5us/10us/500us if the device is respectively
> + * reading/programming/erasing when the RESET occurs. Since we always
> + * issue a RESET when the device is IDLE, 5us is selected for both initial
> + * and poll delay.
> + */
> +#define SPINAND_READ_INITIAL_DELAY_US	6
> +#define SPINAND_READ_POLL_DELAY_US	5
> +#define SPINAND_RESET_INITIAL_DELAY_US	5
> +#define SPINAND_RESET_POLL_DELAY_US	5
> +#define SPINAND_WRITE_INITIAL_DELAY_US	75
> +#define SPINAND_WRITE_POLL_DELAY_US	15
> +#define SPINAND_ERASE_INITIAL_DELAY_US	250
> +#define SPINAND_ERASE_POLL_DELAY_US	50
> +
> +#define SPINAND_WAITRDY_TIMEOUT_MS	400
>  
>  /**
>   * struct spinand_id - SPI NAND id structure


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
