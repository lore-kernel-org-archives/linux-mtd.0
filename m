Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2A3FA3728
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 10:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA672067D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 10:55:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o1qSJNLl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA672067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSLRnE0c4wA41tU60vbeAVWmvwogy4IZaHGqx2nc4QQ=; b=o1qSJNLlJIoTlg
	UUuz43qGh5Mx63MyZWIuTq3zoEKxrqkzDiW1x8MK5TkxzQ0lBzHBMpueODvSL5GX3448RHPvHtN6l
	ZOY8B5Oie4+pGl0X9rdP0WtojDH6X2DWQ/lbUxpUVMKIVBoR2SM1h6OfP9vPDURyosA5DwAbVnDI9
	+iuG89DavDgO21STOBiWeP5c+/ktH9BBX6TOfXaHZtZRiN/voTXQyWTzgP9j+M/UFOEYPDBhE6HIp
	25lSC8vVgRS2xPjmIfnHqn9d0D1FW3UEsAd6ledogiqhGz+W82F9Ycg6q/uos3yzXoP0qYWFlz/70
	sdu5y+XG+s73nSpTmWsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKgxc-00018U-Sg; Wed, 16 Oct 2019 10:55:20 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKgxa-000183-2T
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 10:55:19 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A34394649D96C44C6B6A;
 Wed, 16 Oct 2019 18:55:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.14) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 18:55:13 +0800
Subject: Re: [PATCH] mtd: blkdevs: protect tr->devs list by mtd_table_mutex
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20190929141157.115845-1-houtao1@huawei.com>
 <CAFLxGvwQ=4UOuscf0uuoOvckrncF2RC+rF_Pr70SpayFKfCg7Q@mail.gmail.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <205a5e75-e904-8c8f-a386-f3f51c7c6a01@huawei.com>
Date: Wed, 16 Oct 2019 18:55:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwQ=4UOuscf0uuoOvckrncF2RC+rF_Pr70SpayFKfCg7Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.177.31.14]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_035518_289386_6738967F 
X-CRM114-Status: GOOD (  19.46  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Richard
 Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 2019/10/16 4:10, Richard Weinberger wrote:
> On Sun, Sep 29, 2019 at 4:05 PM Hou Tao <houtao1@huawei.com> wrote:
>>
>> There may be list corruption if there are concurrent list traversal
>> and list deletion on tr->devs as showed in the following case:
>>
>> CPU 0                               CPU 1
>>
>> open /dev/mtdblock1
>>
>> // remove mtd1
>> blktrans_notify_remove()
>>     del_mtd_blktrans_dev()
>>
>> close /dev/mtdblock1
>>   blktrans_release
>>     blktrans_dev_put
>>       acquire blktrans_ref_mutex     // remove mtd0
>>       // the final release           acquire mtd_table_mutex
>>       blktrans_dev_release()         blktrans_notify_remove()
>>         // remove mtdblock1            // next is mtdblock1
>>         list_del(&dev->list)           list_for_each_entry_safe()
>>
>> We could fix the problem by acquiring blktrans_ref_mutex during
>> the traversal of tr->devs, but blktrans_ref_mutex needs to be released
>> before invoking tr->remote_dev(), so we also need to increase the kref
>> of current device else the device may be freed and decrease the kref
>> after the removal.
>>
>> Or we could move the list deletion to del_mtd_blktrans_dev(), and protect
>> the operations on tr->devs by mtd_table_mutex which has already be taken.
>>
>> The latter fix is simpler. We also can remove the unnecessary acquisitions
>> of blktrans_ref_mutex in add_mtd_blktrans_dev() because operations on
>> tr->devs have already been protected by mtd_table_mutex.
>>
>> Fixes: 048d87199566 ("mtd: blktrans: Hotplug fixes")
>> Signed-off-by: Hou Tao <houtao1@huawei.com>
>> ---
>> I found the problem by code review, and could not find a way to
>> ensure the problem, because the removal of mtd devices almost
>> comes from the removal of modules, and the open of /dev/mtdblockX
>> will prevent the module from removing.
> 
> I'm confused. Can the problem only happen if you remove a mtd while
> it is open?
> 
No. The problem may happen when closing a mtd block device (instead of
the mtd char device) for which its mtd device had already been removed.

The reason why I can not confirm the problem is that I am trying to
confirm the problem by the following steps:
(1) insmod block2mtd.ko to create a mtd device (e.g., /dev/mtd0)
(2) open /dev/mtdblock0
(3) remove /dev/mtd0 by removing block2mtd.ko

step (3) always fails because the opening of /dev/mtdblock0 has already
increased the reference count of block2mtd.ko, so /dev/mtd0 can not be removed.

If the removal of mtd device doesn't need the removal of the module (for example,
the removal comes from unbinding from its driver), the problem may occur.

And according the implementation of del_mtd_blktrans_dev(), the scenario is possible
as show in the following lines:

    /* If the device is currently open, tell trans driver to close it,
        then put mtd device, and don't touch it again */
    mutex_lock(&old->lock);
    if (old->open) {
        if (old->tr->release)
            old->tr->release(old);
        __put_mtd_device(old->mtd);
    }

Regards,
Tao










> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
