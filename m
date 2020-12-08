Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CBCC4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 01:24:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99F892343F
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 01:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99F892343F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SZC7/Kof+ILVa2STN0Y4a1Og5HJ2OxxGSxfaFYXnOc=; b=aP2qCOBYq2Kg96WqgYU2EZcjE
	P7Xs19yp+YA1XoWe+MmarE+q40y8lXQzEoPCWtvj2+C5mBWztHqhFYYasEyGg5n6qDw8Lh/3MYTHA
	kmAmNOuGPVLdu8EnfwfHSx7hMbFMeyGrynb8fHbR3zF6xAoqTbkfh7CeKVJTOmPqSSl778bcRnsqs
	fJ9uhxU1ibKmVl8Rg2X+hpAZn8THCaXPnOZVwmRu982XKWu5tsbHLDiALxbJozEmwskuzy9qBJrIK
	0qB8conGUENBSQYxfcRL3SpPoWCGYsIRNFaSeoGDvnFybcwBBgGFesRH6/QClUok+bxAaZs2+kwA+
	LOYmCErnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmRio-0003fd-8l; Tue, 08 Dec 2020 01:23:18 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmRil-0003ej-6O
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 01:23:16 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cqj8s4LCmz15Xkq;
 Tue,  8 Dec 2020 09:22:37 +0800 (CST)
Received: from [10.67.102.197] (10.67.102.197) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 09:23:00 +0800
Subject: Re: ping // [PATCH] mtd:cfi_cmdset_0002: fix atomic sleep bug when
 CONFIG_MTD_XIP=y
To: Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
References: <20201127130731.99270-1-nixiaoming@huawei.com>
 <a02e1364-3b82-039a-4b65-e2a216663dd4@huawei.com>
 <20201207115228.0a6de398@xps13> <73b539eb-616e-64d8-07d8-4606da2ea2ea@ti.com>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <b5c52547-b3cc-4217-cc69-067cee7d536f@huawei.com>
Date: Tue, 8 Dec 2020 09:23:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <73b539eb-616e-64d8-07d8-4606da2ea2ea@ti.com>
X-Originating-IP: [10.67.102.197]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_202315_716444_BAA8EE09 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: wangle6@huawei.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/12/8 2:59, Vignesh Raghavendra wrote:
> Hi Xiaoming,
> 
> On 12/7/20 4:23 PM, Miquel Raynal wrote:
>> Hi Xiaoming,
>>
>> Xiaoming Ni <nixiaoming@huawei.com> wrote on Mon, 7 Dec 2020 18:48:33
>> +0800:
>>
>>> ping
>>>
>>> On 2020/11/27 21:07, Xiaoming Ni wrote:
>>>> When CONFIG_MTD_XIP=y, local_irq_disable() is called in xip_disable().
>>>> To avoid sleep in interrupt context, we need to call local_irq_enable()
>>>> before schedule().
>>>>
>>>> The problem call stack is as follows:
>>>> bug1:
>>>> 	do_write_oneword_retry()
>>>> 		xip_disable()
>>>> 			local_irq_disable()
>>>> 		do_write_oneword_once()
>>>> 			schedule()
>>>> bug2:
>>>> 	do_write_buffer()
>>>> 		xip_disable()
>>>> 			local_irq_disable()
>>>> 		do_write_buffer_wait()
>>>> 			schedule()
>>>> bug3:
>>>> 	do_erase_chip()
>>>> 		xip_disable()
>>>> 			local_irq_disable()
>>>> 		schedule()
>>>> bug4:
>>>> 	do_erase_oneblock()
>>>> 		xip_disable()
>>>> 			local_irq_disable()
>>>> 		schedule()
>>>>
>>>> Fixes: 02b15e343aee ("[MTD] XIP for AMD CFI flash.")
>>>> Cc: stable@vger.kernel.org # v2.6.13
>>>> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
>>>> ---
>>>>    drivers/mtd/chips/cfi_cmdset_0002.c | 16 ++++++++++++++++
>>>>    1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
>>>> index a1f3e1031c3d..12c3776f093a 100644
>>>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>>>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>>>> @@ -1682,7 +1682,11 @@ static int __xipram do_write_oneword_once(struct map_info *map,
>>>>    			set_current_state(TASK_UNINTERRUPTIBLE);
>>>>    			add_wait_queue(&chip->wq, &wait);
>>>>    			mutex_unlock(&chip->mutex);
>>>> +			if (IS_ENABLED(CONFIG_MTD_XIP))
>>>> +				local_irq_enable();
>>>>    			schedule();
>>>> +			if (IS_ENABLED(CONFIG_MTD_XIP))
>>>> +				local_irq_disable();
>>
>> The fix really seems strange to me. I will let Vignesh decide but I
>> think we should consider updating/fixing xip_disable instead.
> 
> Agree with Miquel. Have you done any testing
> or is this purely based on code inspection?
> 
I don't have the corresponding device test environment.
I found the problem through code review.


> What about comment before xip_disable() function:
> 
> /*
>   * No interrupt what so ever can be serviced while the flash isn't in array
>   * mode.  This is ensured by the xip_disable() and xip_enable() functions
>   * enclosing any code path where the flash is known not to be in array mode.
>   * And within a XIP disabled code path, only functions marked with __xipram
>   * may be called and nothing else (it's a good thing to inspect generated
>   * assembly to make sure inline functions were actually inlined and that gcc
>   * didn't emit calls to its own support functions). Also configuring MTD CFI
>   * support to a single buswidth and a single interleave is also recommended.
>   */
> 
> So, I don't think the fix is as simple as this patch.
>
+xip_enable();
  schedule();
+xip_disable();

Do I need to change it to this?



> Regards
> Vignesh
> .
> 

Thanks
Xiaoming Ni


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
