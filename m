Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FA9C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 09:26:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF0DB601FC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 09:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF0DB601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sGDXFYsTUf6O9j6+PxjfmIDyfM2694uPSz1X90XSyjY=; b=HhzzfPo9HAVQghIqhCsuBOdrd
	fRjwXBuj48VY+/gc2ev53B7tX6dIg8PdOMy3BnL32rg7Ptmds67gPWNuAVGRQoosuO/j00Gzfv74W
	0XIkL2fhoUCzvsrcC01r7h9l8ZGsH50lb6dcZ5KsnxoGO4iczljHq9WY+nH8FEuybnDG8cBeIgqxn
	NNGXit6iAGFRD+red+idjjvWolmeo3ldUI0XBue1c7HGMzCdSYZ4N5ygmFpAVGMvGnwIyIC2NIR66
	ivX/k/Et9MCUVO7oC5WjbOsNjgAmECtXpoQ0+wNBLDLKuhiUYWktkGn441TTWNauvxVUPgZivq4Iw
	613SEcJXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liZVX-00EOpx-IF; Mon, 17 May 2021 09:25:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liZUM-00EOVL-3k; Mon, 17 May 2021 09:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=WdwIYz9n3q739UyFGFQQ8DkrMAYz9kYQ1+zwMXuZRIw=; b=IT7JZPq8+XOe+Y+2g2ctcpkhzB
 txOEBCW1tQcdXPp44E9z4UyF0yAwDGFHAI6oYEHTx1/xPk8XsnX8at2pJxYeE1BA0ltHoIKh0ZcB7
 gKlIDG2dNam3s2LjV7j9JuCCiGAnERMJi8rjJww2lR4amh49jX2M8gLufmOxOveo945Noi7fYdPOO
 G3zfCwm0akNQXUfYcjmlfdZPvGYgLreem1n90juIcdVAoJaaeubJPTvb/KJdr917yfAGcJVZit0PR
 HDoz8j7VElicZHhadRQ82UK7LJx4GtBKWLMICUrNBpYoHbSiEmc7+sS5n+cA5oGpFrA0Si2Srh3aX
 Oy+4gsFA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liZUI-00DdNW-IX; Mon, 17 May 2021 09:24:36 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14H9MVPX006903; Mon, 17 May 2021 11:24:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WdwIYz9n3q739UyFGFQQ8DkrMAYz9kYQ1+zwMXuZRIw=;
 b=Zl+fOtSTT2eODREyYEydwBwD54dsZLEwbQGFuEKtwdHagmycLkJ6orZnxLqCRJrf3W8W
 pXbPaAWBxZ1uPgNLg7vKFCeDFd0fDvgDGFi16t7vCX4gEMN4B9cMD1ZEj0YZnnX7Xmwo
 DuTTkIG4B68gUdFLbxMSxGl8v6I/N4sI2lpsk5Xo/b3UKuIrvf8dlD0y1GYViih3GOPb
 xnv0b0lXZCL6+7TiyLMQ7LeVC5r86+1rq/4zxSUt6M3HdFdALO/gZ/roG48f6FUM/lnL
 HYS+fLEWiu16ptqXYJaNn91aMBw1xSIJd34Y6aC2Eggnr4SJEuCt0kyw9l2Q9eevFxw9 iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38km7pgm91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 11:24:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27C2D10002A;
 Mon, 17 May 2021 11:24:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12D9A221060;
 Mon, 17 May 2021 11:24:27 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 11:24:26 +0200
Subject: Re: [PATCH v2 1/3] spi: spi-mem: add automatic poll status functions
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210517094140.53cb643a@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e70b13ba-7f65-7ff1-0517-94b39615dcdb@foss.st.com>
Date: Mon, 17 May 2021 11:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210517094140.53cb643a@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_03:2021-05-12,
 2021-05-17 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_022434_994695_936BB10C 
X-CRM114-Status: GOOD (  28.03  )
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

Hi Boris

On 5/17/21 9:41 AM, Boris Brezillon wrote:
> On Fri, 7 May 2021 15:17:54 +0200
> <patrice.chotard@foss.st.com> wrote:
> 
>> +/**
>> + * spi_mem_poll_status() - Poll memory device status
>> + * @mem: SPI memory device
>> + * @op: the memory operation to execute
>> + * @mask: status bitmask to ckeck
>> + * @match: (status & mask) expected value
>> + * @timeout_ms: timeout in milliseconds
>> + *
>> + * This function send a polling status request to the controller driver
>> + *
>> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
>> + *         -EOPNOTSUPP if not supported.
>> + */
>> +int spi_mem_poll_status(struct spi_mem *mem,
>> +			const struct spi_mem_op *op,
>> +			u16 mask, u16 match, u16 timeout_ms)
> 
> Maybe you should pass a delay_us too, to poll the status at the right
> rate in the SW-based case (can also be used by drivers if they need to

Ok, i will add a polling_rate_us parameter to poll_status() callback,
even if in STM32 driver case we will not use it, i agree it should be useful 
depending of driver's implementation.

> configure the polling rate). You could also add an initial_delay_us to
> avoid polling the status too early: an erase operation will take longer
> than a write which will take longer than a read. No need to check the
> status just after issuing the command, especially if the polling is
> done in SW. Those 2 arguments should also be passed to the driver.

Regarding the addition of an initial_delay_us. We got two solution:
  - use the same polling rate already used by read_poll_timeout() and 
    set read_poll_timeout()'s sleep_before_read parameter to true (in our case 20 us
    will be used as initial delay and as polling rate).

  - add an udelay(initial_delay_us) or even better usleep_range(initial_delay_us,
    initial_delay_us + delta) before calling read_poll_timeout().

I imagine you prefer the second solution ?

By adding polling_rate_us and initial_delay_us parameters to 
spi_mem_poll_status(), it implies to update all spinand_wait() calls for 
different operations (reset, read page, write page, erase) with respective  
initial_delay_us/polling_rate_us values for spi_mem_poll_status()'s parameters.

Can you provide adequate initial_delay_us and polling rate_us for each operation type ?.

Thanks
Patrice
> 
>> +{
>> +	struct spi_controller *ctlr = mem->spi->controller;
>> +	unsigned long ms;
>> +	int ret = -EOPNOTSUPP;
>> +	int exec_op_ret;
>> +	u16 *status;
>> +
>> +	if (!spi_mem_supports_op(mem, op))
>> +		return ret;
>> +
>> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
>> +		ret = spi_mem_access_start(mem);
>> +		if (ret)
>> +			return ret;
>> +
>> +		reinit_completion(&ctlr->xfer_completion);
>> +
>> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
>> +						 timeout_ms);
>> +
>> +		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
>> +						 msecs_to_jiffies(timeout_ms));
>> +
>> +		spi_mem_access_end(mem);
>> +		if (!ms)
>> +			return -ETIMEDOUT;
>> +	} else {
>> +		status = (u16 *)op->data.buf.in;
>> +		ret = read_poll_timeout(spi_mem_exec_op, exec_op_ret,
>> +					((*status) & mask) == match, 20,
>> +					timeout_ms * 1000, false, mem, op);
>> +		if (exec_op_ret)
>> +			return exec_op_ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
>> +

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
