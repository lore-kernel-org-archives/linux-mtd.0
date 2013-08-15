Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9szd-0001yA-5H
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 08:33:18 +0000
Received: by mail-pb0-f52.google.com with SMTP id wz12so493526pbc.25
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 01:32:55 -0700 (PDT)
Message-ID: <520C9235.5070104@gmail.com>
Date: Thu, 15 Aug 2013 01:32:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Caizhiyong <caizhiyong@huawei.com>
Subject: Re: [PATCH] block: add command line partition parser
References: <C3050A4DBA34F345975765E43127F10F1C061D75@szxeml512-mbs.china.huawei.com>
 <20130805152206.76462cc4a42e51b16a0532f1@linux-foundation.org>
 <C3050A4DBA34F345975765E43127F10F1C06237C@szxeml512-mbs.china.huawei.com>
 <20130814155742.d3cd651e40e552696667e4f2@linux-foundation.org>
 <CAN8TOE-aGcKQNayzEVQaS1wJ_Uqp3RAZ5pTuVEhaaY9f487-xA@mail.gmail.com>
 <C3050A4DBA34F345975765E43127F10F1C063B36@szxeml512-mbx.china.huawei.com>
 <20130815050007.GA23474@brian-ubuntu>
 <C3050A4DBA34F345975765E43127F10F1C064357@szxeml512-mbx.china.huawei.com>
 <20130815070938.GB24007@brian-ubuntu>
 <C3050A4DBA34F345975765E43127F10F1C064375@szxeml512-mbx.china.huawei.com>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F1C064375@szxeml512-mbx.china.huawei.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Wanglin \(Albert\)" <albert.wanglin@huawei.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/15/2013 12:45 AM, Caizhiyong wrote:
>> -----Original Message-----
>> From: Brian Norris [mailto:computersforpeace@gmail.com]
...
>> On Thu, Aug 15, 2013 at 06:16:04AM +0000, Caizhiyong wrote:
>>> I want to use the MTD command line partition method on block devices (eMMC).
>>> It is very suitable for embedded systems. I think, in embedded system partition
>> method,
>>> if somebody need some feature on MTD device, he may be also need it on block device.
>>> so I fully functional reference MTD command line partition.
>>
>> I agree.
>>
>> I'm curious: have you seen any need for a similar arrangement via
>> device-tree? See, for example, drivers/mtd/ofpart.c.
>
> So far, I have no seen. We mainly use ARM. For ARM, device-tree is a new thing.

But device-tree is *the* thing for ARM going forward, and the kernel 
command line can get unwieldy (and beyond its limits) pretty quickly 
like this.

>>> I hope extend the flexibility to block device.
>>
>> Sure. I'll try to review the full patch soon and test out integrating
>> it with MTD.
>
> If there is no problem, I will send my next patch, mtd cmdline parts use cmdline-parser lib.

We will get some reviews on this soon (no time for me tonight). Do you 
already have a mtd patch? If so, you might as well post it for review as 
well.

Thanks,
Brian
