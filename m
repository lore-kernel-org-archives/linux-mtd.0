Return-Path: <SRS0=WLwv=MJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47FCC12002
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Jul 2021 01:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C56613D0
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Jul 2021 01:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C56613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hJlCHFR3j6WkBw+/CZYjBPSYfn9jIq7+YbQ/hs6EMAI=; b=GHl760Kjld4pFWyCy6+RdejBTV
	wZbIegZPdIBUHxDT+LsL61KM3kQvwoyP9nOOIvGB2oFS3LloPP6h1LVBxNvKDOAP9dwRNYFFeTsih
	zJlEkXxzdAjMRpbgqux8QEN8bQ7VXFwGvlhGLJSuidAFv7/W7qoalijf+Rlc+OSEV0Ufy4F/8Ja99
	RBFpzzCuZ6paoGHZiLuAItzCHKHGfjvzfPQ35W7Kz/QWySqKb5/iHYuvA6NUS9k6jTzuDqddl5Zd3
	PStaPpixFQiagkukQLUl+PpOJPXS+0DojXOlvCZLB6KEysV84ILJ8RQNBgaYZA6IbAcp72zbTldhK
	asHuPkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4ZYv-005lvP-Rz; Sat, 17 Jul 2021 01:56:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ZYp-005luU-UB
 for linux-mtd@lists.infradead.org; Sat, 17 Jul 2021 01:56:13 +0000
Received: from dggeme703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GRWMX1H3SzZm1l;
 Sat, 17 Jul 2021 09:52:40 +0800 (CST)
Received: from [10.174.178.125] (10.174.178.125) by
 dggeme703-chm.china.huawei.com (10.1.199.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 17 Jul 2021 09:55:59 +0800
Subject: Re: [PATCH] mtd: fix size in mtd_info_user to support 64-bit
To: Rob Landley <rob@landley.net>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <David.Woodhouse@intel.com>,
 <Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linfeilong@huawei.com>
References: <20210708131359.21591-1-linmiaohe@huawei.com>
 <20210716010224.44582046@xps13>
 <95e3d455-ccb1-0e22-ee83-78dc6ad8aab1@huawei.com>
 <20210716114808.246e92ba@xps13>
 <f7f55c5e-f6b2-542c-66d2-20f4d88bf669@landley.net>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <91b48a5d-3a33-2a8f-8b8d-9ebeb31a8ec6@huawei.com>
Date: Sat, 17 Jul 2021 09:55:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f7f55c5e-f6b2-542c-66d2-20f4d88bf669@landley.net>
Content-Language: en-US
X-Originating-IP: [10.174.178.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_185612_213917_4F97F4BE 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On 2021/7/16 21:34, Rob Landley wrote:
> On 7/16/21 4:48 AM, Miquel Raynal wrote:
>> Hi Miaohe,
>>
>> Miaohe Lin <linmiaohe@huawei.com> wrote on Fri, 16 Jul 2021 09:42:19
>> +0800:
>>
>>> On 2021/7/16 7:02, Miquel Raynal wrote:
>>>> Hi Miaohe,
>>>>
>>>> Miaohe Lin <linmiaohe@huawei.com> wrote on Thu, 8 Jul 2021 21:13:59
>>>> +0800:
>>>>   
>>>>> From: Feilong Lin <linfeilong@huawei.com>
>>>>>
>>>>> The size in struct mtd_info_user is 32-bit, which will cause errors
>>>>> when obtaining the size of large-capacity MTD devices, such as TLC
>>>>> NAND FLASH-2048Gb.  
>>>>
>>>> Besides the fact that such devices are far from being supported by the
>>>> Linux kernel, this change would basically break userspace, it cannot
>>>> enter as-is...
>>>>   
>>>
>>> I see. Many thanks for your reply! We're working with these large-capacity
>>> MTD devices now, any suggestion to work around this?
>>
>> The only way is to create a second UAPI.
> 
> Twelve years ago a patch was submitted to add a 64 bit MTD api:
> 
>   https://lwn.net/Articles/326418/
> 
> But for some reason they only merged 64 bit erase:
> 
>   https://github.com/torvalds/linux/commit/0dc54e9f33e2
> 
> But NOT the rest of the 64 bit mtd API in the same patch. I've never understood why.
> 
> Rob
> .
> 

Many thanks for both of you! This really helps! :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
