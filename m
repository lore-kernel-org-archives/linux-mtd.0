Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BD7C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 14:23:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7966128C
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 14:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A7966128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N7okcv3KThbKQJmDtIq6UyDju4T1yVW88xbTU/GB4/k=; b=BwCvELojCf0amD18I2M2hWMPf
	qoEWoAa7ZcgKzOkTCwkLGU2W2CvF4Pl/Vnl6WfGTOUCOzJ/Hq8cn/mkT+S+KmaR8upbEtoRZxhiee
	b0swyT4IEGy8gqA0CSlRxmmaOWbTBncljxr3dPsKVbgsuBROnKA7xSLe36tHKJRlNv5m8Je06N70P
	wA5SasR0A9MWNltYdbH5Qduny9pPjDIV1EDvuj8gtIvidoNExHiQPUsxrAhesZsEqSfdGq0daezLg
	ohzx+cxHee5ZBBZ1zMwnCkDd4hkG46wL5YHnTof6Wxps1JxM2nStpNS89hxTolO9CIkFy/oF/gn+y
	TdfLRBKaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcU2g-007yMY-R1; Fri, 30 Apr 2021 14:22:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcU2d-007yMH-MW; Fri, 30 Apr 2021 14:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:CC:To:
 Subject:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=J4APUBnnwkt4C4FWB9LU9doGK2aOwOIh3hIas7b7Xrc=; b=q5amWi/eOjtd8aznv+O4RKK1Hw
 UwYCSf7P+d0N9s1TcUVC922gYSTJaGxTr+vLT8W1CdAkMK/8PNofGg5Zvnuvci5smOgko53r6z3+9
 k5M/rPWDz/5LvCSdM294AOpYfCc3qqtEm8vCOtL+TgAjYdf8/tgOCcfyJgXogmXjOQXQNcv0kSZTb
 +5qBswpOmp26PdOKTynU+yBjQkis/yqE34TH6z+VGqN/iCvbbPTDF4znVGuk9fY2nOEp1ryv2HFCy
 kdA5biBGFXQzf5yeFQwdbAj2YlYAovLpmuBZ8TP8NWWHGpkJGpIj8zhAnHWiGBzFI6yyRhuW5oUrG
 JxDBlzoA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcU2a-001R5y-8p; Fri, 30 Apr 2021 14:22:49 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UEBMcd003318; Fri, 30 Apr 2021 16:22:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=J4APUBnnwkt4C4FWB9LU9doGK2aOwOIh3hIas7b7Xrc=;
 b=JB0YRl6+Q+CFdExdWWPYFQ/dwxPqRJPGfOT4HIBG1ynFWVYAb2rDWvzJ5ftT2G6zSsZd
 YWEzLNWPSX9ANwzMCcZPuA/2mFLPzZWZjJyaZJXxIFqJvc6cIfYaA/CP2YCnAdHaJj6C
 ZTqC0dlCpPo0r9q1uauC9O4GRHTxcyXSQpSofuYyoVNOr58TGPy7lVw3V0Dp8Z7aaSuv
 Ho0F8CUzE2qENrlbHc8diStjMEWxrsN8w+j90hKdB8FOJQf1BmPWTbO7sm7pmmwGK75d
 RmCQXwp2peMaw7mBe3TPnNRvBy6iFYu+dwI/XaDh0Y2Y+cfNIDoLHol6X1t7pwEkOXkV Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 388emrsvt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:22:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7539810002A;
 Fri, 30 Apr 2021 16:22:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BBCC24185E;
 Fri, 30 Apr 2021 16:22:42 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Apr
 2021 16:22:35 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
To: Mark Brown <broonie@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210426162610.erpt5ubeddx7paeq@ti.com>
 <20210426165118.GH4590@sirena.org.uk>
Message-ID: <28acedfd-6cd5-a8ad-0182-e61c3c30c27d@foss.st.com>
Date: Fri, 30 Apr 2021 16:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210426165118.GH4590@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_08:2021-04-30,
 2021-04-30 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_072248_641075_38A57E45 
X-CRM114-Status: GOOD (  32.96  )
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

Hi Mark, Pratyush

On 4/26/21 6:51 PM, Mark Brown wrote:
> On Mon, Apr 26, 2021 at 09:56:12PM +0530, Pratyush Yadav wrote:
>> On 26/04/21 04:39PM, patrice.chotard@foss.st.com wrote:
> 
>>> + * spi_mem_poll_status() - Poll memory device status
>>> + * @mem: SPI memory device
>>> + * @op: the memory operation to execute
>>> + * @mask: status bitmask to ckeck
>>> + * @match: status expected value
> 
>> Technically, (status & mask) expected value. Dunno if that is obvious 
>> enough to not spell out explicitly.
> 
> Is it possible there's some situation where you're waiting for some bits
> to clear as well?
> 
Yes, we are waiting STATUS_BUSY bit to be cleared, see patch 2 which is making 
usage of this API.

>>> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);
> 
> I'm not sure I like this name since it makes me think the driver is
> going to poll when really it's offloaded to the hardware, but I can't
> think of any better ideas either and it *is* what the hardware is going
> to be doing so meh.
> 
>> I wonder if it is better to let spi-mem core take care of the timeout 
>> part. On one hand it reduces code duplication on the driver side a 
>> little bit. Plus it makes sure drivers don't mess anything up with bad 
>> (or no) handling of the timeout. But on the other hand the interface 
>> becomes a bit awkward since you'd have to pass a struct completion 
>> around, and it isn't something particularly hard to get right either. 
>> What do you think?
> 
> We already have the core handling other timeouts.  We don't pass around
> completions but rather have an API function that the driver has to call
> when the operation completes, a similar pattern might work here.  Part

So, if i correctly understood, you make allusion to what is already done
in SPI core framework with spi_finalize_current_transfer() right ?

> of the thing with those APIs which I'm missing here is that this will
> just return -EOPNOTSUPP if the driver can't do the delay in hardware, I
> think it would be cleaner if this API were similar and the core dealt
> with doing the delay/poll on the CPU.  That way the users don't need to
> repeat the handling for the offload/non-offload cases.

Sorry, i didn't catch what you mean here. In PATCH 2, that's the case,
if spi_mem_poll_status() is not supported, the core is dealing with 
the delay/poll on the CPU in spinand_wait().

Patrice
Thanks


> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
