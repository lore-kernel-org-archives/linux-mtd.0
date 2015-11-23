Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0gM7-0001wt-S9
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 01:55:49 +0000
Message-ID: <56527199.9080306@huawei.com>
Date: Mon, 23 Nov 2015 09:53:29 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RFC PATCH 0/5] MTD: nandsim: simulate multiple chips
References: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
 <20151120190630.GV64635@google.com>
In-Reply-To: <20151120190630.GV64635@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 11/21/2015 3:06 AM, Brian Norris wrote:
> On Wed, Aug 05, 2015 at 08:55:49AM +0000, Sheng Yong wrote:
>> Hi, folks,
>>
>> These patchset add a new module parameter, numchips, to supports to
>> simulate NAND flash with multiple chips.
>>
>> This simulation helps to test and improve generic NAND driver on
>> multiple chips NAND flash.
> 
Hi, Brian

Thanks for your reply.
> I'm not quite sure I understand the real purpose of this feature. Seems
> like you're just testing different corners of the internals of the NAND
> framework, but not actually exposing anything new that an MTD user would
> care about. Care to clarify?
> 
Sorry for I didn't put much explaination in the last mail. Test for multi-
chips NAND flash detection is not the main purpose. The main purpose of doing
this is that if nand_scan_ident() fails to read the first chip, it will not
continue to try to setup the other chips, while if we make an appropriate
partition strategy, the other chips may contains data we expect.

So we think it may worth trying to skip the faulty chips and continue scanning
the other chips and setup the partitions that are not on the faulty chips. We
are not quiet sure if it's correct to do so, but we think simulating a multi-
chip NAND is the first step.

thanks,
Sheng

> Brian
> 
>> MTD test (except for mtd_nandbiterr) are passed. 
>>
>> Thanks,
>> Sheng
>>
>> Sheng Yong (5):
>>   MTD: nandsim: add numchips module parameter
>>   MTD: nandsim: fix column address size of large page
>>   MTD: nandsim: fix page address size
>>   MTD: nandsim: add ADJUST_ROW() to find the real page number
>>   MTD: nandsim: extent outprint messages
>>
>>  drivers/mtd/nand/nandsim.c | 632 +++++++++++++++++++++++++++------------------
>>  1 file changed, 377 insertions(+), 255 deletions(-)
>>
>> -- 
>> 1.8.3.4
>>
> 
> 
