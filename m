Return-Path: <SRS0=c5zc=3K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A21C33CAA
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 06:37:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C935221734
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 06:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c8eSLEyO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C935221734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCCsDyOYs5X5w1oDtiiFVKPl0SGVzyb8tF+OWcjoEZ4=; b=c8eSLEyOGjzK/F
	y3oHgIKEBAwUQjURLxtJQ7UtOQTmvNYrhq8qtylqwIjXr5iSrAP1hiCe9V6yJLL0e9LGtWjI+TML0
	0zalsy4AWwC16m9g4PvAun6dqwXK2vt5KnWtNDkm/iNKf2EYc3PoN8wdWjnML/yvCLnwg7Zn7WFBV
	5xSvriZwAOvGKS+MjwiYC9JO9rL71BfpupILORNfuebhNvUfLCKxIcCDkCow7BRYapg593ho/vu1Q
	tgO4z10ajsmo3BgEMwTRNsGLPlH8uLIPlFwk0AVLnDZCbErFPEN3Kf/BQUy1x41d6+TODnXYmtB0p
	X7avc7ewEUgwHke8zdrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itn9t-0000LV-Op; Tue, 21 Jan 2020 06:37:05 +0000
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itn9n-0000Kb-Uq; Tue, 21 Jan 2020 06:37:00 +0000
Subject: Re: [PATCH v1 06/11] Documentation: pstore/blk: blkoops: create
 document for pstore_blk
To: liaoweixiong <liaoweixiong@allwinnertech.com>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-7-git-send-email-liaoweixiong@allwinnertech.com>
 <b9cd734b-8bb1-5e26-a7ed-fbc79ab2d958@infradead.org>
 <c87bdf3a-f129-a2a7-40b2-2220f79b505a@allwinnertech.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <40d7f57a-119e-e51f-99a5-63e85ab5ab91@infradead.org>
Date: Mon, 20 Jan 2020 22:36:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <c87bdf3a-f129-a2a7-40b2-2220f79b505a@allwinnertech.com>
Content-Language: en-US
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/20/20 9:23 PM, liaoweixiong wrote:
> hi Randy Dunlap,
> 
> On 2020/1/21 PM12:13, Randy Dunlap wrote:
>> Hi,
>>
>> I have some documentation comments for you:
>>
>>
>> On 1/19/20 5:03 PM, WeiXiong Liao wrote:
>>> The document, at Documentation/admin-guide/pstore-block.rst, tells us
>>> how to use pstore/blk and blkoops.
>>>
>>> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
>>> ---
>>>  Documentation/admin-guide/pstore-block.rst | 278 +++++++++++++++++++++++++++++
>>>  MAINTAINERS                                |   1 +
>>>  fs/pstore/Kconfig                          |   2 +
>>>  3 files changed, 281 insertions(+)
>>>  create mode 100644 Documentation/admin-guide/pstore-block.rst
>>>
>>> diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
>>> new file mode 100644
>>> index 000000000000..58418d429c55
>>> --- /dev/null
>>> +++ b/Documentation/admin-guide/pstore-block.rst
>>> +
>>> +
>>> +dmesg_size
>>> +~~~~~~~~~~
>>> +
>>> +The chunk size in bytes for dmesg(oops/panic). It **MUST** be a multiple of
>>> +4096. If you don't need it, safely set it 0 or ignore it.
>>
>>                                       set it to 0 or ignore it.
>>
> 
> I will fix it, thank you.
> 
>> The example above is:  blkoops.dmesg_size=64
>> where 64 is not a multiple of 4096. (?)
>>
> 
> The module parameter dmesg_size is in unit KB.

I didn't see that documented anywhere.


>>> +Normally the number of bytes written should be returned, while for error,
>>> +negative number should be returned.
>>> +
>>> +panic_write (for block device)
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +It's much similar to panic_write for non-block device, but panic_write for
>>> +block device writes alignment to SECTOR_SIZE, that's why the parameters are
>>
>>                 writes only aligned sectors of SECTOR_SIZE  (??)
>>
> 
> How about this?
> 
> It's much similar to panic_write for non-block device, but the position and
> data size of panic_write for block device must be aligned to SECTOR_SIZE,
> that's why the parameters are @sects and @start_sect. Block device driver
> should register it by ``blkoops_register_blkdev``.

OK.

>>> +@sects and @start_sect. Block device driver should register it by
>>> +``blkoops_register_blkdev``.
>>> +
>>> +The parameter @start_sect is the relative position of the block device and
>>> +partition. If block driver requires absolute position for panic_write,
>>> +``blkoops_blkdev_info`` will be helpful, which can provide the absolute
>>> +position of the block device (or partition) on the whole disk/flash.
>>> +
>>> +Normally zero should be returned, otherwise it indicates an error.
>>> +
>>> +Compression and header
>>> +----------------------
>>> +
>>> +Block device is large enough for uncompressed dmesg data. Actually we do not
>>> +recommend data compression because pstore/blk will insert some information into
>>> +the first line of dmesg data. For example::
>>> +
>>> +        Panic: Total 16 times
>>> +
>>> +It means that it's the 16th times panic log since the first booting. Sometimes
>>
>>                                time of a panic log since ...
>>
> 
> Should it be like this?
> It means the time of a panic log since the first booting.

That sounds like clock time, not the number of instances or occurrences.

> 
>>> +the oops|panic occurs since burning is very important for embedded device to
>>
>>                                ^^^^^^^ huh??
>>
> 
> How about this?
> 
> Sometimes the number of occurrences of oops|panic since the first
> booting is important
> to judge whether the system is stable.

OK.

>>> +judge whether the system is stable.
>>> +
>>> +The following line is inserted by pstore filesystem. For example::
>>> +
>>> +        Oops#2 Part1
>>> +
>>> +It means that it's the 2nd times oops log on last booting.
>>
>>                           2nd time of an oops log on the last boot. (?)
>>
> 
> How about this?
> 
> It means that it's OOPS for the 2nd time on the last boot.

OK. It's an oops counter.

>>> +#. Just use CPU to transfer.
>>> +   Do not use DMA to transfer unless you are sure that DMA will not keep lock.
>>> +#. Operate register directly.
>>
>>       Don't know what that means.
>>
> 
> How about this?
> 
> #. Control registers directly.
>     Please control registers directly rather than use Linux kernel
> resources.

OK.

>     Do I/O map while initializing rather than wait until a panic occurs.
> 
>>> +   Try not to use Linux kernel resources. Do I/O map while initializing rather
>>> +   than waiting until the panic.


-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
