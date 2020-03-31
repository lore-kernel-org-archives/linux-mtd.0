Return-Path: <SRS0=nWl7=5Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7BEC43331
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 11:07:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8068C20838
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 11:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rY4Fe+++"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8068C20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bhEAsp1VcCBvTv+2/KA4eS3/6P/9Z7c4gnI5z4+wEYg=; b=rY4Fe+++tONqOrJYAPvoDhVey
	utlmNY7xVZJfEOtqEEKAuI91PW+S08A2nOtt5apWjmhbaM3r01IBBrukRgm18PL2KObticrgFby9K
	HZWLvRll8fSNWMmifNBv3AMQTi0BknzC+4F8SJAoqwJ3ZTKVTZAoY4KP/LnppDdwABEswHRqh4FQk
	h0JwunYiS+JBfah1F0j3lBJSQMc69Id9Zfw1NDKynDt9/QhveSlI4Q+GRnS6PrRDE6r5IDEaFCSn2
	Vqc/FqA0aTmFfFJZGGK5N7Tnkr3ByARvlusy4R588nKyQtoZf2WdL+Ong1HBkGbFXGaULuaIOeFmK
	yBD+eoduw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJEjX-0006fP-Do; Tue, 31 Mar 2020 11:07:03 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJEjU-0006eO-3L
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2020 11:07:01 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E8ED3DB02715B946D6D2;
 Tue, 31 Mar 2020 19:06:43 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.197) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 31 Mar 2020
 19:06:34 +0800
Subject: Re: [PATCH v4] mtd: clear cache_state to avoid writing to bad blocks
 repeatedly
To: Greg KH <gregkh@linuxfoundation.org>
References: <1585618319-119741-1-git-send-email-nixiaoming@huawei.com>
 <20200331100526.GC1204199@kroah.com>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <045c988f-4106-1c5c-f33a-8c2617eddbb1@huawei.com>
Date: Tue, 31 Mar 2020 19:06:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200331100526.GC1204199@kroah.com>
X-Originating-IP: [10.67.102.197]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_040700_324362_682BE909 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: wangle6@huawei.com, vigneshr@ti.com, richard@nod.at, houtao1@huawei.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 zhangweimin12@huawei.com, miquel.raynal@bootlin.com, yebin10@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/3/31 18:05, Greg KH wrote:
> On Tue, Mar 31, 2020 at 09:31:59AM +0800, Xiaoming Ni wrote:
>> The function call process is as follows:
>> 	mtd_blktrans_work()
>> 	  while (1)
>> 	    do_blktrans_request()
>> 	      mtdblock_writesect()
>> 	        do_cached_write()
>> 	          write_cached_data() /*if cache_state is STATE_DIRTY*/
>> 	            erase_write()
>>
>> write_cached_data() returns failure without modifying cache_state
>> and cache_offset. So when do_cached_write() is called again,
>> write_cached_data() will be called again to perform erase_write()
>> on the same cache_offset.
>>
>> But if this cache_offset points to a bad block, erase_write() will
>> always return -EIO. Writing to this mtdblk is equivalent to losing
>> the current data, and repeatedly writing to the bad block.
>>
>> Repeatedly writing a bad block has no real benefits,
>> but brings some negative effects:
>> 1 Lost subsequent data
>> 2 Loss of flash device life
>> 3 erase_write() bad blocks are very time-consuming. For example:
>> 	the function do_erase_oneblock() in chips/cfi_cmdset_0020.c or
>> 	chips/cfi_cmdset_0002.c may take more than 20 seconds to return
>>
>> Therefore, when erase_write() returns -EIO in write_cached_data(),
>> clear cache_state to avoid writing to bad blocks repeatedly.
>>
>> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>   drivers/mtd/mtdblock.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> $ ./scripts/get_maintainer.pl --file drivers/mtd/mtdblock.c
> Miquel Raynal <miquel.raynal@bootlin.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
> Richard Weinberger <richard@nod.at> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
> Vignesh Raghavendra <vigneshr@ti.com> (maintainer:MEMORY TECHNOLOGY DEVICES (MTD))
> linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD))
> linux-kernel@vger.kernel.org (open list)
> 
> 
> No where on there is my name/email, so why am I getting these?
> 
> confused,
> 
> greg k-h

At v3, I added Cc: stable@vger.kernel.org and emailed you,
At v4, Cc: stable@vger.kernel.org was deleted, but forgot to remove you 
from the recipient list
I'm very sorry to bother you
Thanks
Xiaoming Ni


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
