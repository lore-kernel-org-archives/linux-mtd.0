Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WU3fp-0007g9-0z
 for linux-mtd@lists.infradead.org; Sun, 30 Mar 2014 00:32:30 +0000
Message-ID: <533765F8.2090700@oracle.com>
Date: Sat, 29 Mar 2014 20:31:52 -0400
From: Sasha Levin <sasha.levin@oracle.com>
MIME-Version: 1.0
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH] mtd: diskonchip: mem resource name is not optional
References: <1395267877-15223-1-git-send-email-sasha.levin@oracle.com>
 <1395477572.57478225@f224.i.mail.ru>
In-Reply-To: <1395477572.57478225@f224.i.mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/22/2014 04:39 AM, Alexander Shiyan wrote:
> Wed, 19 Mar 2014 18:24:37 -0400 от Sasha Levin <sasha.levin@oracle.com>:
>> Passing a name to request_mem_region() isn't optional and can't just
>> be NULL. Passing NULL causes a NULL ptr deref later in the boot
>> process.
>>
>> Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
>> ---
>>   drivers/mtd/nand/diskonchip.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
>> index b9b4db6..f68a7bc 100644
>> --- a/drivers/mtd/nand/diskonchip.c
>> +++ b/drivers/mtd/nand/diskonchip.c
>> @@ -1439,7 +1439,7 @@ static int __init doc_probe(unsigned long physadr)
>>   	int reg, len, numchips;
>>   	int ret = 0;
>>
>> -	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, NULL))
>> +	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, "DiskOnChip"))
>>   		return -EBUSY;
>>   	virtadr = ioremap(physadr, DOC_IOREMAP_LEN);
>>   	if (!virtadr) {
>> --
>
> Tested-by: Alexander Shiyan <shc_work@mail.ru>

It seems that no one pulled this patch anywhere. It fixes a straightforward
boot failure on boot when diskonchip is enabled in the config.

Someone grab it please?


Thanks,
Sasha
