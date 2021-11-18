Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65638C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 13:13:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC2F61ABA
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 13:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AC2F61ABA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QE8QD9ka6G55r5rOUWGA+VUrSp1X9did9abXdBjqJBM=; b=zIq/bMnTtPBfcgX15kMran0IM6
	lqNzMTLgFxeMTpPTG/rdt1K0Mx7Fe6obmtV7rd550dVLe8GluLmdh4LcRSB7S0pgP9uiphaa4j+DC
	Ts7N6RP76xvJLUFGRwCbxeecxj7HTWF7LjR3WRPGJaugKGk3zs/9deGFXQrmQ+NrGMfjottANywG6
	fu1sHghd5L5x561B+BJ3V+4SZ/Kw1+p/KGpZbBB+ZH4MWSLfwSzqP2x1bPxhzCriDRPDWY3H2AzNH
	9wGfQ1NkCkjpM6P6Erf8S68MTEVu+kAIbkrmBCsWlg/4/2UWgZCrq4l7HZk5aOq4Qc6686roa4zSa
	WsuChKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnhDV-007qfo-1U; Thu, 18 Nov 2021 13:12:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnhDR-007qdn-Dl
 for linux-mtd@lists.infradead.org; Thu, 18 Nov 2021 13:12:39 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hw0T358yLzbj1K;
 Thu, 18 Nov 2021 21:07:35 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 18 Nov 2021 21:12:31 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 18 Nov 2021 21:12:30 +0800
Subject: Re: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
To: Ming Lei <ming.lei@redhat.com>
CC: <damien.lemoal@wdc.com>, <axboe@kernel.dk>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-block@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yi.zhang@huawei.com>, <yebin10@huawei.com>, 
 <houtao1@huawei.com>
References: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
 <YZS4FYxtxYAXjtFJ@T590> <d9ca8e57-55b8-96f8-e5fd-6103c8b1fa4b@huawei.com>
 <YZTXMZRxvb5Orsdo@T590>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <4187bb7c-ffc5-433e-4b8f-5f40ea99d447@huawei.com>
Date: Thu, 18 Nov 2021 21:12:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YZTXMZRxvb5Orsdo@T590>
Content-Language: en-US
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600019.china.huawei.com (7.193.23.64)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_051237_669881_0E4AC373 
X-CRM114-Status: GOOD (  15.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2021/11/17 18:19, Ming Lei wrote:
> On Wed, Nov 17, 2021 at 05:00:22PM +0800, yangerkun wrote:
>>
>>
>> On 2021/11/17 16:06, Ming Lei wrote:
>>> On Wed, Nov 17, 2021 at 11:37:13AM +0800, yangerkun wrote:
>>>> Nowdays we meet the boot regression while enable lots of mtdblock
>>>
>>> What is your boot regression? Any dmesg log?
>>
>> The result is that when boot with 5.10 kernel compare with 4.4, 5.10
>> will consume about 1.6s more...
> 
> OK, I understand the issue now, and please try the attached patch
> which depends on the following one:

Hi, this patch can help solve the problem!

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=block-5.16&id=2a19b28f7929866e1cec92a3619f4de9f2d20005
> 
> 
> diff --git a/block/elevator.c b/block/elevator.c
> index 1f39f6e8ebb9..19a78d5516ba 100644
> --- a/block/elevator.c
> +++ b/block/elevator.c
> @@ -694,12 +694,18 @@ void elevator_init_mq(struct request_queue *q)
>   	if (!e)
>   		return;
>   
> +	/*
> +	 * We are called before adding disk, when there isn't any FS I/O,
> +	 * so freezing queue plus canceling dispatch work is enough to
> +	 * drain any dispatch activities originated from passthrough
> +	 * requests, then no need to quiesce queue which may add long boot
> +	 * latency, especially when lots of disks are involved.
> +	 */
>   	blk_mq_freeze_queue(q);
> -	blk_mq_quiesce_queue(q);
> +	blk_mq_cancel_work_sync(q);
>   
>   	err = blk_mq_init_sched(q, e);
>   
> -	blk_mq_unquiesce_queue(q);
>   	blk_mq_unfreeze_queue(q);
>   
>   	if (err) {
> 
> 
> 
> thanks,
> Ming
> 
> .
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
