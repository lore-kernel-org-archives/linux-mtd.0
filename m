Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CE4C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 11:27:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C6B161029
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 11:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C6B161029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vm23hlki3MIhxJ7xjPgdYnGkzgCibbeDWUFGPeuhNBw=; b=G4uLDIL3Kla8uU7eKZ/7/kxva
	MVzUeAbKCeAgcYFWsyXIim0hI2j+9/XSCkM1xiLy6kti462rFLrIIU7TrjxbKyyzdGG4e87dGmZyt
	878D5+Bw9f+LuCGQ+ZMqBHF3XvzoSHRmFt01DRkZGTwYXimEdY7kJxGREdRZ+zbABxNa1n8m308lq
	1dzOY8P/AsVxfOL5+9FXjhnuTU2AA9uZa4n1qpUzUJPCS0CyoyvlvOAZ5zFl94pLLK2kNXGob1LUF
	fbPZDNVHcncsCVvH82geHlr0KTmoAkgBubv/D5OW6l3AvpQCQogvPMk6iFq2juHfEEie4pEStszcs
	tORO84sbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1libOP-00Eiog-6e; Mon, 17 May 2021 11:26:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1libNr-00EijI-F6; Mon, 17 May 2021 11:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=npIMb7QB/bZ3/mZsjazILaGDYJhrkfjeWguGiE8VKN0=; b=tk/ug4DvTbnDBvHgZzlOvI5iyj
 fDGpter+JnPz5G2T3U3cST3LojYX79nZeVKQ0+lNWspLrMKf/kCPMlVtHwmut+gA6n36yXHMBveFq
 +PJbrhk7Xc6LFyoYVe8YU7QyN+dSBrr0J4ogG/ARcBPvxVM1MPOuliOEtU85mzij4CKWuvs9xlVrR
 ptxOUprou4IuJiCKDmN/eRbQu4FDlCVgHeGU/+6j3OI5qNc0GxBLdXf9hdsPugZMmcbrZ2LjnQJb2
 +1nvrIAXZGfqgCy0k8k+4nftJ5HxWuER2u+o6dqaSxXxE/KQ/EPmAmV1bndXd+a9MDU0r22ssBk2H
 IRTcv0wg==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1libNo-00DiOP-FO; Mon, 17 May 2021 11:26:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A102B1F41EB7;
 Mon, 17 May 2021 12:25:56 +0100 (BST)
Date: Mon, 17 May 2021 13:25:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v2 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210517132551.7dd56a5e@collabora.com>
In-Reply-To: <e70b13ba-7f65-7ff1-0517-94b39615dcdb@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210517094140.53cb643a@collabora.com>
 <e70b13ba-7f65-7ff1-0517-94b39615dcdb@foss.st.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_042600_677702_10E95D6A 
X-CRM114-Status: GOOD (  31.83  )
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

On Mon, 17 May 2021 11:24:25 +0200
Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:

> Hi Boris
> 
> On 5/17/21 9:41 AM, Boris Brezillon wrote:
> > On Fri, 7 May 2021 15:17:54 +0200
> > <patrice.chotard@foss.st.com> wrote:
> >   
> >> +/**
> >> + * spi_mem_poll_status() - Poll memory device status
> >> + * @mem: SPI memory device
> >> + * @op: the memory operation to execute
> >> + * @mask: status bitmask to ckeck
> >> + * @match: (status & mask) expected value
> >> + * @timeout_ms: timeout in milliseconds
> >> + *
> >> + * This function send a polling status request to the controller driver
> >> + *
> >> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> >> + *         -EOPNOTSUPP if not supported.
> >> + */
> >> +int spi_mem_poll_status(struct spi_mem *mem,
> >> +			const struct spi_mem_op *op,
> >> +			u16 mask, u16 match, u16 timeout_ms)  
> > 
> > Maybe you should pass a delay_us too, to poll the status at the right
> > rate in the SW-based case (can also be used by drivers if they need to  
> 
> Ok, i will add a polling_rate_us parameter to poll_status() callback,
> even if in STM32 driver case we will not use it, i agree it should be useful 
> depending of driver's implementation.
> 
> > configure the polling rate). You could also add an initial_delay_us to
> > avoid polling the status too early: an erase operation will take longer
> > than a write which will take longer than a read. No need to check the
> > status just after issuing the command, especially if the polling is
> > done in SW. Those 2 arguments should also be passed to the driver.  
> 
> Regarding the addition of an initial_delay_us. We got two solution:
>   - use the same polling rate already used by read_poll_timeout() and 
>     set read_poll_timeout()'s sleep_before_read parameter to true (in our case 20 us
>     will be used as initial delay and as polling rate).
> 
>   - add an udelay(initial_delay_us) or even better usleep_range(initial_delay_us,
>     initial_delay_us + delta) before calling read_poll_timeout().
> 
> I imagine you prefer the second solution ?

Yep, you might want to use udelay() when the delay is small and
usleep_range() otherwise.

> 
> By adding polling_rate_us and initial_delay_us parameters to 
> spi_mem_poll_status(), it implies to update all spinand_wait() calls for 
> different operations (reset, read page, write page, erase) with respective  
> initial_delay_us/polling_rate_us values for spi_mem_poll_status()'s parameters.
> 
> Can you provide adequate initial_delay_us and polling rate_us for each operation type ?.

If I refer to the datasheets I have,

tBERS (erase) 1ms to 4ms
tPROG 300us to 400us
tREAD 25us to 100us

Let's assume we want to minimize the latency, I'd recommend dividing
the min value by 4 for the initial delay, and dividing it by 20 for the
poll delay, which gives:

ERASE -> initial_delay = 250us, poll_delay = 50us
PROG -> initial_delay = 100us, poll_delay = 20us
READ -> initial_delay = 6us, poll_delay = 5us

Of course, that'd be even better if we were able to extract this
information from the NAND ID (or ONFI table), but I guess we can live
with those optimistic values in the meantime.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
