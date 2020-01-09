Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52A5C32771
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 10:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7C4720673
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 10:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GNaz9K1j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7C4720673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vDA/9zzfbxPqhYRsRUbX2cwT7OObUx+q/umn1D8CUFc=; b=GNaz9K1jD493OSP7nGxsmzkCE
	FmOByuVxHlieIo9lcV+iYGwwap757usr1QNlZKp9w6orQwMmyae1C2AuB7ZTEHPV1hIHoSvu/pReG
	TkQ0Tb/qNkw7Ape+ZDF6ISNMksX5Rnal4b3mp4O9G3IU2qBYJpBqL9ld2h0N8pg97yyOY9+y+FjtW
	pGEGLKJ49oHLE5olkuFEi4pj7wEq3es9sjlTAxQdi8Wj/T1byrZwJkrd2bbbTP7j589wWDupvA/Gk
	fBr+dM08xLCkq1zHB19iAkIZc98G9IZ4RVuvLU1eR38BA4E0X8R2jHil2C5U98bEqWOBBsVNdT/om
	IakO8yMAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipVAw-0001dP-S9; Thu, 09 Jan 2020 10:36:26 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipVAq-0001c2-UC
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 10:36:22 +0000
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 50743541D61702CF1CED;
 Thu,  9 Jan 2020 10:36:13 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 9 Jan 2020 10:36:12 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 9 Jan 2020
 10:36:12 +0000
Subject: Re: flash_lock issue for n25q 128mb spi nor part
To: Vignesh Raghavendra <vigneshr@ti.com>, <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
 <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
 <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
 <b73c8a25-a58d-a1f1-f68c-0ba35a5c7c51@huawei.com>
 <9d41bfca-f4e3-beb2-ff7f-78be49e8d80e@microchip.com>
 <32a6af31-341b-67cf-a98d-d77a495c7ecc@huawei.com>
 <ee532299-eaa7-28b5-d34c-46816640a1f0@huawei.com>
 <c1a92c89-020d-0847-b7bf-41dbfd9b972e@microchip.com>
 <6667f429-4732-d098-843a-7a030010f192@ti.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <e7d782d3-2b7a-4141-e511-a238de626688@huawei.com>
Date: Thu, 9 Jan 2020 10:36:11 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <6667f429-4732-d098-843a-7a030010f192@ti.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_023621_118873_8803F082 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: broonie@kernel.org, fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 17/12/2019 08:57, Vignesh Raghavendra wrote:
> Hi Tudor,
> 
> On 12/16/2019 11:39 PM, Tudor.Ambarus@microchip.com wrote:
> [...]
> 
>>>
>>> But, as you may see, it seems that my change to spi_nor_write() is still
>>> required to stop the first unlock failure message, but it needs to be
>>> relocated to after write_err label, as we now jump there for
>>> spi_nor_wait_till_ready() failure. I guess the equivalent relocation is
>>> also required for spi_nor_erase().
>>>
>>> Or maybe spi_nor_wait_till_ready() should clear this flag always.
>>
>> I reproduced this on a n25q256a, with both erase and write. Did a lock,
>> an erase or write, and then the unlock raises an error on the read back test:
>> it receives 0x02 to write (the prev operation let the SR.WE set to 1),
>> and after write, it reads back 0x00 (which is correct, WE is de-asserted).
>>
>> What is pretty strange is that Micron says about erase or program operations
>> that: "When the operation is in progress, the write in progress bit is set
>> to 1. The write enable latch bit is cleared to 0, whether the operation is
>> successful or not".
>>
>> So what I guess it happens, is that when an erase/write command tries to
>> modify a software protected area, the flash completely ignores the command,
>> so no Write In Progress, and no clearing of the WE.
>>
> 
> 
>>From PROGRAM Operations section of mt25q datasheet:
> 
> " When a command is applied to a protected sector, the command is not
> executed, the write enable latch bit remains set to 1, and flag status
> register bits 1 and 4 are set."
> 
> So, Data sheet is quite clear about this and SW would need to clear WEL
> (if required) after write failure.
> 

Hi guys,

Apart from this issue, on another topic, is there any special reason 
which we don't support status register.BP3? Is it that it is not 
adjacent to BP2 in the register, so makes handling trickier?

I ran these commands, which show how this is broken:

root@ubuntu:/home/john# sudo flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x1000000
Lock status: locked
Return code: 1
root@ubuntu:/home/john# sudo mtd_debug write /dev/mtd0 0xf80000 4096 
dump4096
[ 134.573819] spi-nor spi-PRP0001:00: Program operation failed.
[ 134.579567] spi-nor spi-PRP0001:00: Attempted to modify a protected 
sector.
file_to_flash: write, size 0x1000, n 0x1000
write(): Input/output error
root@ubuntu:/home/john# sudo mtd_debug read /dev/mtd0 0x100000 4096 temp
[ 105.657411] spi-nor spi-PRP0001:00: from 0x00100000, len 4096
Copied 4096 bytes from address 0x00100000 in flash to temp
root@ubuntu:/home/john# hexdump temp
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0001000
root@ubuntu:/home/john# sudo mtd_debug write /dev/mtd0 0x100000 4096 
dump4096
[ 140.161265] spi-nor spi-PRP0001:00: to 0x00100000, len 4096
Copied 4096 bytes from dump4096 to address 0x00100000 in flash
root@ubuntu:/home/john# sudo mtd_debug read /dev/mtd0 0x100000 4096 temp
[ 150.697181] spi-nor spi-PRP0001:00: from 0x00100000, len 4096
Copied 4096 bytes from address 0x00100000 in flash to temp
root@ubuntu:/home/john# diff temp dump4096
root@ubuntu:/home/john#

Here is are told that all sectors for the chip are locked, which is 
untrue, and we could execute the write command successfully on the 
bottom half.

Thanks,
John

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
