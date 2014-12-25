Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y40HK-0001ev-Pc
 for linux-mtd@lists.infradead.org; Thu, 25 Dec 2014 04:44:04 +0000
Message-ID: <549B95D6.2070100@huawei.com>
Date: Thu, 25 Dec 2014 12:43:02 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: ubi_check_volume() hung on a single core system
References: <549AAD57.8020307@huawei.com> <549ABF9D.6030901@nod.at>
In-Reply-To: <549ABF9D.6030901@nod.at>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/24 21:29, Richard Weinberger wrote:
> Am 24.12.2014 um 13:11 schrieb hujianyang:
>> Hi,
>>
>> When I was running mtd-utils/tests/ubi-tests/io_basic.c on a
>> single core system, watchdog reset the OS and printed:
>>
>> ERR:The task of feeding senior watchdog overtimes, system will reset!
>>
>> io_basic.c tests the UBI_IOCVOLUP feature of UBI driver. UBI
>> will perform ubi_check_volume() after updating operation is
>> finished. The used ebs will be scanned for a static volume in
>> this function.
>>
>> If I run schedule() in the loop of eraseblock scanning, the
>> *reset* not happen and the system works in right condition.
>>
>> diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
>> index dbda77e..f4f478c 100644
>> --- a/drivers/mtd/ubi/misc.c
>> +++ b/drivers/mtd/ubi/misc.c
>> @@ -74,6 +74,9 @@ int ubi_check_volume(struct ubi_device *ubi, int vol_id)
>>         for (i = 0; i < vol->used_ebs; i++) {
>>                 int size;
>>
>> +               set_current_state(TASK_UNINTERRUPTIBLE);
>> +               schedule_timeout(HZ/10);
> 
> cond_resched() please.
> 
>>                 if (i == vol->used_ebs - 1)
>>                         size = vol->last_eb_bytes;
>>                 else
>>
>>
>>
>> I think this error can't be re-created on a multi-core system.
>> It can only happen on a single core system. This directly
>> schedule I modified would hurt the performance of volume check.
>>
>> Does anyone interested in this issue?
> 
> Of course!
> 
> Thanks,
> //richard
> 
> .
> 

Hi Richard,

Thanks for your suggestion. I've tested it and achieve much better
performance. Certainly, fix this issue.

I'd like to send a patch about this problem. Do you think it is
necessary to fix this in mainline?

Thanks,
Hu
