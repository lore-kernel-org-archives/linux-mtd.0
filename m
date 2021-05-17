Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D5CC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 07:42:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 992A7611C2
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 07:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 992A7611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3+7qEburzTwYuXrY8G2bcPORQzREwbwRDPlHYwrmqY8=; b=fomuydw0XcM1bwl6Ddv5/BPcG
	XxzSBmFwTrfILYsHmNKplM27vwrJ0moAnmgFNAVOI3k2I4UoiEEPlyT/IJgB00SIpZsvweh6ii4Ty
	MdcGG0MfixlBSMiScOtgwVuL3ILF2ncIaoF6d5aTGFUBOiNC69pK2ptEW9I3mGVnU0/6fCZLGUF0i
	jtx6XmhsQ+/PiVMZfzQDsB/HaHCYV7EUcF0VxoHjwHI6uzjDroFDJCR3rhUDa7bxO6vUH27cKG7sw
	OIsWpoYylvTS5fFn8Gqy1KhyXDIkVAsY+zaXOa+YyjPBNz5MuAAlNBPQSmyjO9Om10yZqiZl5lvh9
	ndNDNB+0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liXtE-00E4Ze-Vo; Mon, 17 May 2021 07:42:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXsu-00E4W3-7W; Mon, 17 May 2021 07:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=IdM5bsFJzRNMd6Pwkk6AFmac7qH4au1buiXs1KBu8cU=; b=PoF4jshaiJBTFMwtWoJ6BV+kBZ
 1DiNyISpw7B6r6Bw/qiLR67nD2ofyfyAALt8XzvGqcHUGH7rvAk3DXybdGOB07lmLNkuS4B3peBic
 4LShbr12ipTK0RVhCvcYibqegI8qMq5VDtwQ4wKA2KsTl1DBeyMms5Q6aoE3Nn9DAODli/0AMj0/E
 VpHcPurf1pfkcrGyV1UNpHJh0qUtVeAOuyRhn9SwYpTRspeTVnRDCX2KlmSXZoOzcOSSMZDZTXq/+
 oovuszQgCtfaYDnJVsuUUViwJ/gJXS1ivNm6j/AwufBatsrarqFXC0xcZRC2DxEb2UVvk2ZExrba8
 RgKz7msw==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXsr-00DYOF-Ag; Mon, 17 May 2021 07:41:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A2C521F41C79;
 Mon, 17 May 2021 08:41:44 +0100 (BST)
Date: Mon, 17 May 2021 09:41:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v2 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210517094140.53cb643a@collabora.com>
In-Reply-To: <20210507131756.17028-2-patrice.chotard@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_004149_531123_294D04C7 
X-CRM114-Status: GOOD (  18.88  )
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

On Fri, 7 May 2021 15:17:54 +0200
<patrice.chotard@foss.st.com> wrote:

> +/**
> + * spi_mem_poll_status() - Poll memory device status
> + * @mem: SPI memory device
> + * @op: the memory operation to execute
> + * @mask: status bitmask to ckeck
> + * @match: (status & mask) expected value
> + * @timeout_ms: timeout in milliseconds
> + *
> + * This function send a polling status request to the controller driver
> + *
> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> + *         -EOPNOTSUPP if not supported.
> + */
> +int spi_mem_poll_status(struct spi_mem *mem,
> +			const struct spi_mem_op *op,
> +			u16 mask, u16 match, u16 timeout_ms)

Maybe you should pass a delay_us too, to poll the status at the right
rate in the SW-based case (can also be used by drivers if they need to
configure the polling rate). You could also add an initial_delay_us to
avoid polling the status too early: an erase operation will take longer
than a write which will take longer than a read. No need to check the
status just after issuing the command, especially if the polling is
done in SW. Those 2 arguments should also be passed to the driver.

> +{
> +	struct spi_controller *ctlr = mem->spi->controller;
> +	unsigned long ms;
> +	int ret = -EOPNOTSUPP;
> +	int exec_op_ret;
> +	u16 *status;
> +
> +	if (!spi_mem_supports_op(mem, op))
> +		return ret;
> +
> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> +		ret = spi_mem_access_start(mem);
> +		if (ret)
> +			return ret;
> +
> +		reinit_completion(&ctlr->xfer_completion);
> +
> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
> +						 timeout_ms);
> +
> +		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
> +						 msecs_to_jiffies(timeout_ms));
> +
> +		spi_mem_access_end(mem);
> +		if (!ms)
> +			return -ETIMEDOUT;
> +	} else {
> +		status = (u16 *)op->data.buf.in;
> +		ret = read_poll_timeout(spi_mem_exec_op, exec_op_ret,
> +					((*status) & mask) == match, 20,
> +					timeout_ms * 1000, false, mem, op);
> +		if (exec_op_ret)
> +			return exec_op_ret;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
> +

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
