Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F35C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 10:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD2821527
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 10:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p22Y/1yR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FD2821527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LA6Vngl2f1HAyL6nABD3JMR6nBTR6aZzCCy0qzsIws=; b=p22Y/1yR+W8jmb
	uH60v8ElccsuG66VBEnIYedO04FRw2w/HZTzIRYvLwbAW2wi7PLIQcvrnJZOM1APW4b3EXJjQCVUb
	WGbYZl9ru+l4HkCXcu37NFqAcjWayeqX7mk7W7OreKpCDj4pxDZzTtC8skjgKmKaZrI3GwPIL6O/F
	nBwmGsJ+TZxX51ZHmYwN0zKvYUlBHkxAvkFVF27AtmN/9XI8OVYVq5EikJrl4qmReAataFywU9eB/
	nvQaszVZnl0uEVzl92siSoRvNQjnBZyZTJepgTnz+hGD6Va57/qblr52Je218bJ0NeGWvxOkRkku8
	DGO533y5fA9Ei2udU70w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdt6j-0001TH-J2; Wed, 27 May 2020 10:16:21 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdt6f-0001SU-VK
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 10:16:20 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6C0BB16A13684D21B3BA;
 Wed, 27 May 2020 18:16:13 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 27 May 2020 18:16:03 +0800
Subject: Re: [RFC PATCH 3/3] spi: hisi-sfc-v3xx: Add prepare/unprepare methods
 to avoid race condition
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
 <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
 <20200526114348.6295df6b@collabora.com>
 <5a3cd626-fb5c-d87c-9cfa-3992caad3ebe@hisilicon.com>
 <20200527112036.69506ed5@collabora.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <9c2a2f25-1ae5-229a-d446-ab30c69dd008@hisilicon.com>
Date: Wed, 27 May 2020 18:16:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200527112036.69506ed5@collabora.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_031618_595178_F4D7FF8D 
X-CRM114-Status: GOOD (  22.71  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 john.garry@huawei.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 2020/5/27 17:20, Boris Brezillon wrote:
> On Wed, 27 May 2020 16:55:00 +0800
> Yicong Yang <yangyicong@hisilicon.com> wrote:
>
>> Hi Boris,
>>
>>
>> On 2020/5/26 17:43, Boris Brezillon wrote:
>>> On Thu, 21 May 2020 19:23:51 +0800
>>> Yicong Yang <yangyicong@hisilicon.com> wrote:
>>>  
>>>> The controller can be shared with the firmware, which may cause race
>>>> problems. As most read/write/erase/lock/unlock of spi-nor flash are
>>>> composed of a set of operations, while the firmware may use the controller
>>>> and start its own operation in the middle of the process started by the
>>>> kernel driver, which may lead to the kernel driver's function broken.
>>>>
>>>> Bit[20] in HISI_SFC_V3XX_CMD_CFG register plays a role of a lock, to
>>>> protect the controller from firmware access, which means the firmware
>>>> cannot reach the controller if the driver set the bit. Add prepare/
>>>> unprepare methods for the controller, we'll hold the lock in prepare
>>>> method and release it in unprepare method, which will solve the race
>>>> issue.  
>>> Okay, so it looks like what we really need is a way to pass sequences
>>> (multiple operations) that are expected to be issued without
>>> interruptions. I'd prefer extending the spi_mem interface to allow that:
>>>
>>> int spi_mem_exec_sequence(struct spi_mem *spimem,
>>> 			  unsigned int num_ops,
>>> 		  	  const struct spi_mem_op *ops);
>>>
>>> struct spi_controller_mem_ops {
>>> 	...
>>> 	int (*exec_sequence)(struct spi_mem *mem,
>>> 			     unsigned int num_ops,
>>> 			     const struct spi_mem_op *op);
>>> 	...
>>> };  
>> The prepare/unprepare hooks is just like what spi_nor_controller_ops provides.
>> Alternatively we can use the interface you suggested, and it'll require
>> upper layer(spi-nor framework, etc) to pack the operations before call
>> spi_mem_exec_sequence().
> We have to patch the upper layers anyway, right?

sure.

>>> The prepare/unprepare hooks are a bit too vague. Alternatively, we
>>> could add functions to grab/release the controller lock, but I'm not
>>> sure that's what we want since some controllers might be able to address
>>> several devices in parallel, and locking the whole controller at the
>>> spi-nor level would prevent that.  
>> I suppose the method is optional and device may choose to use it or not
>> following their own design. And the implementation is rather controller
>> specific, they may choose to lock the whole controller or only the desired
>> device to operate. 
> Yes, this is what I'm complaining about. How can the upper layer know
> when it should call prepare/unprepare? Let's take the SPI NAND case,
> should we prepare before loading a page in the cache and unprepare
> after we're done reading the page, or should we unprepare just after
> the page has been loaded in the cache? BTW, you've not patched the SPI
> NAND layer to call ->prepare/unprepare().

It's already implemented in spi-nor framework. As for sequential operations,
taking read as an example, the call stack looks like:

->spi_nor_read()
---->spi_nor_lock_and_prep()
------->spi_nor_controller_ops->prepare() or spi_mem_prepare() in PATCH 1/3
...
---->spi_nor_read_data() // maybe called several times
...
---->spi_nor_unlock_and_unprep()
------->spi_nor_controller_ops->unprepare() or spi_mem_unprepare() in PATCH 1/3

As for nand flash, I didn't add it in this RFC as I'm not certain where
should prepare/unprepare be called.

If we use spi_mem_exec_sequence() seems we'll do more works to adapt, at least
at spi-nor side. what do you think?


>
>>
>>> BTW, I don't know all the details about this lock or what this FW is
>>> exactly (where it's running, what's his priority, what kind of
>>> synchronization exists between Linux and the FW, ...), but I'm worried
>>> about potential deadlocks here.  
>> For SFC controller, both firmware and the kernel driver will require the
>> lock before a sequence of operations, and single operations like register
>> access for spi-nor flash is implemented atomically. Once the lock is held
>> by firmware/driver, then the controller cannot perform the operations sent
>> by the other one unless the lock is released.
> Yes, that's my point. What prevents the FW from preempting Linux while
> it's holding the lock and waiting indefinitely on this lock. Is the FW
> running on a separate core? Don't you have other IPs with the same kind
> of locks leading to issues if locks are not taken/released in the same
> order? ...

The firmware is running on a separate co-processor so it may not preempt
the linux.

Thanks,
Yicong


> .
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
