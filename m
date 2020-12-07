Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EB6C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 19:01:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E16238D6
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 19:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E16238D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VqibMMiJywh52l85xggxNdYy9twWHs2Zy1aSBNVaoXY=; b=srxQhzJF3pd6H9jYtMdO+7J3j
	krcDchL4OI0D74sPoQv2O35Xx8uZuFiwBBm9da1V9DouKpGJebCAEv9Yq4voqmRdMN8l+0bn0Q869
	5tY3/Bw9KeE7LLSD4sz63EK63RumxcFnwjYsLkuyuJ457YO5jtYVe2ZvkO2ofa3FdqxMq5eTvDe41
	TllR7U3I+or3qnPPEZtgsigcmtelKWidQhVVI0dL41JTN+v4hVhG3tCGj9REX96LPkFbeWz4kPWKS
	jnEd0eRgY2kH/rkfysg/ZJJhewIZXVItlrB0IQYNdqmrxA7yxVASe+ytfdUrCgMjiE+10UcqjA2OW
	SxXzsQ3Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmLjl-0004Q0-Ob; Mon, 07 Dec 2020 18:59:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmLji-0004PV-Vc
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 18:59:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7IxPUC093171;
 Mon, 7 Dec 2020 12:59:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607367565;
 bh=l8AmyJmC8gTSyUoOze7WxgteJNUwxEVxb9g16VApPdw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uf3lKJX3Y7M0KMBKT9zU1izumbaHH2Db6t1lq3zwqAvdV1wzNSPmjQncDfG0tN/xr
 Q+DwVpd/lP6v/7hRySH3XNULenJWlKsfSEtOyNI0KFP3/jAjJuS6X4LEJ1yhH6X66n
 cqVT78yK+TdsyXpenbRQ6kEU3VJ4ziMXKN7Ddgks=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7IxPMB031013
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Dec 2020 12:59:25 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 12:59:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 12:59:24 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7IxLb3066531;
 Mon, 7 Dec 2020 12:59:22 -0600
Subject: Re: ping // [PATCH] mtd:cfi_cmdset_0002: fix atomic sleep bug when
 CONFIG_MTD_XIP=y
To: Miquel Raynal <miquel.raynal@bootlin.com>, Xiaoming Ni
 <nixiaoming@huawei.com>
References: <20201127130731.99270-1-nixiaoming@huawei.com>
 <a02e1364-3b82-039a-4b65-e2a216663dd4@huawei.com>
 <20201207115228.0a6de398@xps13>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <73b539eb-616e-64d8-07d8-4606da2ea2ea@ti.com>
Date: Tue, 8 Dec 2020 00:29:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207115228.0a6de398@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_135951_152838_0B17AEFE 
X-CRM114-Status: GOOD (  16.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Xiaoming,

On 12/7/20 4:23 PM, Miquel Raynal wrote:
> Hi Xiaoming,
> 
> Xiaoming Ni <nixiaoming@huawei.com> wrote on Mon, 7 Dec 2020 18:48:33
> +0800:
> 
>> ping
>>
>> On 2020/11/27 21:07, Xiaoming Ni wrote:
>>> When CONFIG_MTD_XIP=y, local_irq_disable() is called in xip_disable().
>>> To avoid sleep in interrupt context, we need to call local_irq_enable()
>>> before schedule().
>>>
>>> The problem call stack is as follows:
>>> bug1:
>>> 	do_write_oneword_retry()
>>> 		xip_disable()
>>> 			local_irq_disable()
>>> 		do_write_oneword_once()
>>> 			schedule()
>>> bug2:
>>> 	do_write_buffer()
>>> 		xip_disable()
>>> 			local_irq_disable()
>>> 		do_write_buffer_wait()
>>> 			schedule()
>>> bug3:
>>> 	do_erase_chip()
>>> 		xip_disable()
>>> 			local_irq_disable()
>>> 		schedule()
>>> bug4:
>>> 	do_erase_oneblock()
>>> 		xip_disable()
>>> 			local_irq_disable()
>>> 		schedule()
>>>
>>> Fixes: 02b15e343aee ("[MTD] XIP for AMD CFI flash.")
>>> Cc: stable@vger.kernel.org # v2.6.13
>>> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
>>> ---
>>>   drivers/mtd/chips/cfi_cmdset_0002.c | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
>>> index a1f3e1031c3d..12c3776f093a 100644
>>> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>>> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>>> @@ -1682,7 +1682,11 @@ static int __xipram do_write_oneword_once(struct map_info *map,
>>>   			set_current_state(TASK_UNINTERRUPTIBLE);
>>>   			add_wait_queue(&chip->wq, &wait);
>>>   			mutex_unlock(&chip->mutex);
>>> +			if (IS_ENABLED(CONFIG_MTD_XIP))
>>> +				local_irq_enable();
>>>   			schedule();
>>> +			if (IS_ENABLED(CONFIG_MTD_XIP))
>>> +				local_irq_disable();
> 
> The fix really seems strange to me. I will let Vignesh decide but I
> think we should consider updating/fixing xip_disable instead.

Agree with Miquel. Have you done any testing 
or is this purely based on code inspection?

What about comment before xip_disable() function:

/*
 * No interrupt what so ever can be serviced while the flash isn't in array
 * mode.  This is ensured by the xip_disable() and xip_enable() functions
 * enclosing any code path where the flash is known not to be in array mode.
 * And within a XIP disabled code path, only functions marked with __xipram
 * may be called and nothing else (it's a good thing to inspect generated
 * assembly to make sure inline functions were actually inlined and that gcc
 * didn't emit calls to its own support functions). Also configuring MTD CFI
 * support to a single buswidth and a single interleave is also recommended.
 */

So, I don't think the fix is as simple as this patch.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
