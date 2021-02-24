Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7743C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 02:50:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE06601FC
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 02:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE06601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dcd9ZK0GQ2ulGLZk8qrqlShSg5hGWaoV/LEJAGY18V4=; b=f2fenO3WxCABHAIBYfosAcwpo
	APGVVaE2rGbp0N9cMcwiwHp0J+G7I2h9tKqqWpLM0KdwgvZwQXDuire22DDZ1B3YIlaTsx8qVtq0x
	H9jVcFWaW9KAPQ90qgP6ZZRIsXkCbWb+iQ08BqYbIH0ipYhdD2t4VQPeu5K23AV7cMl2DTGphpdyN
	1fDVvCP6Ibc2uah48E5/jxjMtpDllrg16Qlpq9Le6tp/+TC4Bgn+Kgicjpi7y2sXmDn8f4Sux3ATy
	xsw35XPFPEougO8X92ODXy+i+mz59yKm9rRAzMyLc8HOucDSrppUmZASJm4x4LxlGMTiKh9d+a0cu
	hWTeFXlWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEkF0-0008Fj-Gi; Wed, 24 Feb 2021 02:49:30 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEkEt-0008Ee-RK
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 02:49:25 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DlgLv5V6jz7pSP;
 Wed, 24 Feb 2021 10:47:35 +0800 (CST)
Received: from [10.174.177.167] (10.174.177.167) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Feb 2021 10:49:07 +0800
Subject: Re: [PATCH 0/3] fixes for ubifs xattr operations
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200630130438.141649-1-houtao1@huawei.com>
 <e2a0ddaa-402f-a4e0-ed0a-74ce7d620722@huawei.com>
 <CAFLxGvxHiFuHpwUOWxbf7djG0__-Z9qB5eG1oBYwGzY3FKSDGA@mail.gmail.com>
 <b3b82f88-c87e-6077-7189-f2f84a2739c2@huawei.com>
 <CAFLxGvwVK1M6FLnkL3xbSzAx5iTWmt2j5uOxJXhWKoep16kA8Q@mail.gmail.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <a13934c9-fcc1-60cb-9169-5ee60b4cd714@huawei.com>
Date: Wed, 24 Feb 2021 10:49:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwVK1M6FLnkL3xbSzAx5iTWmt2j5uOxJXhWKoep16kA8Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.167]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_214924_180647_D66C99E6 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 11/3/2020 4:19 PM, Richard Weinberger wrote:
> On Tue, Nov 3, 2020 at 3:04 AM Hou Tao <houtao1@huawei.com> wrote:
>> Hi,
>>
>> On 2020/11/1 5:10, Richard Weinberger wrote:
>>> Tao,
>>>
>>> On Fri, Oct 23, 2020 at 9:25 AM Hou Tao <houtao1@huawei.com> wrote:
>>>> Hi Richard,
>>>>
>>>> I have written two xfstest cases [1] for these fixes three months ago, could you please
>>>> check whether the proposed solution is OK ?
>>> Thanks for your time and reminding me about this issue!
>>> I agree that this is a problem but I'm not sure whether the lockless
>>> solution is the right path to go.
>>> DId you try the locking approach?
>>>
>> Yes. Adding an extra lock for xattr ops also works. I will post a V2 soon.
> Sounds promising!
Sorry for the long delay.
> Btw. you think of an extra rw lock because host->ui_mutex is too cause
> grained and
> would block xattr parallel read operations?

Yes, the locking order is another concern. But we can change host->ui_mutex to a rw lock

if both the locking order and the granularity are OK. I will check both.

Regards,

Tao


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
