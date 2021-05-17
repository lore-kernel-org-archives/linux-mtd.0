Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E131C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 12:06:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBF361059
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 12:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBF361059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZQkFw18aedXvmav/UFWKSrR/QtiO5gp2CE5yhsJdWyc=; b=g/qaQROysV3DN2iL9PLsvbQWH
	knOFGiAIxQAEpl0LkPAVy5l5DRLssf7AP/yZxH+i/GDE/LJWFx2vhmSBRe1fKCEOVBJ53dnvUPKV3
	vDXy1q38zYA1C87fTUGSr//E/TEOEgZaET6Q/z2SOoRnaXi2q6kx/b+qQhp1N7+1ZnRrF7/SV2rq5
	KhJmCkP0Em9dR5weXUB4iNQk4zU8MVgsmLYz+gHcAlNa7Wh/FW6+PtOJ/tVFLMOV3XT7m6ahjWhH+
	64Py/q7rgaIqlfgDJwonfMvg57PvtQYa9dxV2H6hJwaDEM5rCbyh+aD4SvZbIdtmOAIuRhup5PJIK
	LJ/CXMZYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1libzn-00EpeH-Dl; Mon, 17 May 2021 12:05:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1libzi-00EpdM-St; Mon, 17 May 2021 12:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=2KwkkuHfRJE0R9CP+OHANEZfxy/RymkNrjObI5KIHhQ=; b=qJYA/vYAqp2hbtO/Sip21evAMZ
 ESb5A4CWVoTXJh/G0WQeZuZjSTSPs8n5HhqGO2MMIDgHgK908uHfGDRAFAvDSTjQWCVA973/MrYbi
 uf+GUn7H8BPJaEaaQ1iLszvCh8wknZ3Wy4SPgb+Fofc7ZmJ5nFIHdgeg77d4EY0cZY37YWdaHxUmS
 LomJlIOZcADon4HeLb3FrDxHHaswIS5G0eg0WjjxV5S89RkX9qNkplQ8lzKCmSsAQIsduYkMzHII0
 xCZFanIKjxoHRrRMONjJCe1EsJHT4kGSlitFkojU3eE+t40RKHWINYeIizTW57idU8CqikvyG4Dr9
 Kc8MCFoA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1libzc-00DjzW-Uo; Mon, 17 May 2021 12:05:09 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HBup8e021853; Mon, 17 May 2021 14:05:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2KwkkuHfRJE0R9CP+OHANEZfxy/RymkNrjObI5KIHhQ=;
 b=gZJB3FgoPvoon//iQ+hgH13FcffMIydpr0sUF6PJpS4lHi458zGK5ciqye1a6xNEAq44
 FQj3Hx/g6I6Gg4cus9TN5TieSvvu66lPfaIPjnlzvDEDMbGmOGZF8b8qja2uue9GDhRZ
 D9guc+TvZz3gYklc/nHqMVibunhWsOgDwnY3lRDMSlBrrQwTv1CM+bWrI0deCsbL2257
 sNaeYmbZxUrxGAITluHI0QBUfteLm8JZ5hcuny28NniA72yqrmBd36T8wYbAH8Gdc/Y8
 xusY7byum1cc87K+N50C1lu6N0t+Y6FL6Nv8TLJpHyvEyMN9t2wtixefzGOr7/Qs77Nr +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38kmb2seew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 14:05:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB7D210002A;
 Mon, 17 May 2021 14:04:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B78B722D625;
 Mon, 17 May 2021 14:04:59 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 14:04:58 +0200
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
 <e70b13ba-7f65-7ff1-0517-94b39615dcdb@foss.st.com>
 <20210517132551.7dd56a5e@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <45ee6378-271d-aeb5-90ea-ed2e0673f3fb@foss.st.com>
Date: Mon, 17 May 2021 14:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210517132551.7dd56a5e@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_04:2021-05-17,
 2021-05-17 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_050505_327731_9C502F62 
X-CRM114-Status: GOOD (  31.85  )
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



On 5/17/21 1:25 PM, Boris Brezillon wrote:
> On Mon, 17 May 2021 11:24:25 +0200
> Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
> 
>> Hi Boris
>>
>> On 5/17/21 9:41 AM, Boris Brezillon wrote:
>>> On Fri, 7 May 2021 15:17:54 +0200
>>> <patrice.chotard@foss.st.com> wrote:
>>>   
>>>> +/**
>>>> + * spi_mem_poll_status() - Poll memory device status
>>>> + * @mem: SPI memory device
>>>> + * @op: the memory operation to execute
>>>> + * @mask: status bitmask to ckeck
>>>> + * @match: (status & mask) expected value
>>>> + * @timeout_ms: timeout in milliseconds
>>>> + *
>>>> + * This function send a polling status request to the controller driver
>>>> + *
>>>> + * Return: 0 in case of success, -ETIMEDOUT in case of error,
>>>> + *         -EOPNOTSUPP if not supported.
>>>> + */
>>>> +int spi_mem_poll_status(struct spi_mem *mem,
>>>> +			const struct spi_mem_op *op,
>>>> +			u16 mask, u16 match, u16 timeout_ms)  
>>>
>>> Maybe you should pass a delay_us too, to poll the status at the right
>>> rate in the SW-based case (can also be used by drivers if they need to  
>>
>> Ok, i will add a polling_rate_us parameter to poll_status() callback,
>> even if in STM32 driver case we will not use it, i agree it should be useful 
>> depending of driver's implementation.
>>
>>> configure the polling rate). You could also add an initial_delay_us to
>>> avoid polling the status too early: an erase operation will take longer
>>> than a write which will take longer than a read. No need to check the
>>> status just after issuing the command, especially if the polling is
>>> done in SW. Those 2 arguments should also be passed to the driver.  
>>
>> Regarding the addition of an initial_delay_us. We got two solution:
>>   - use the same polling rate already used by read_poll_timeout() and 
>>     set read_poll_timeout()'s sleep_before_read parameter to true (in our case 20 us
>>     will be used as initial delay and as polling rate).
>>
>>   - add an udelay(initial_delay_us) or even better usleep_range(initial_delay_us,
>>     initial_delay_us + delta) before calling read_poll_timeout().
>>
>> I imagine you prefer the second solution ?
> 
> Yep, you might want to use udelay() when the delay is small and
> usleep_range() otherwise.
> 
>>
>> By adding polling_rate_us and initial_delay_us parameters to 
>> spi_mem_poll_status(), it implies to update all spinand_wait() calls for 
>> different operations (reset, read page, write page, erase) with respective  
>> initial_delay_us/polling_rate_us values for spi_mem_poll_status()'s parameters.
>>
>> Can you provide adequate initial_delay_us and polling rate_us for each operation type ?.
> 
> If I refer to the datasheets I have,
> 
> tBERS (erase) 1ms to 4ms
> tPROG 300us to 400us
> tREAD 25us to 100us
> 
> Let's assume we want to minimize the latency, I'd recommend dividing
> the min value by 4 for the initial delay, and dividing it by 20 for the
> poll delay, which gives:
> 
> ERASE -> initial_delay = 250us, poll_delay = 50us
> PROG -> initial_delay = 100us, poll_delay = 20us

another remark, it should be:  PROG -> initial_delay = 75 us (300 / 4) , poll_delay = 15us ( 300 / 20)

Patrice

> READ -> initial_delay = 6us, poll_delay = 5us
> 
> Of course, that'd be even better if we were able to extract this
> information from the NAND ID (or ONFI table), but I guess we can live
> with those optimistic values in the meantime.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
