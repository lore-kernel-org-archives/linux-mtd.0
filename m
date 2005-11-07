Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZ6uP-00020q-CO
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 08:19:44 -0500
Message-ID: <436F54D8.2040607@ru.mvista.com>
Date: Mon, 07 Nov 2005 16:21:28 +0300
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>,  linux-mtd@lists.infradead.org
References: <435E6C74.8010406@ru.mvista.com> <4366294D.4000700@ru.mvista.com>
	<436F3436.2090707@ru.mvista.com>
In-Reply-To: <436F3436.2090707@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Konstantin Baidarov <kbaidarov@ru.mvista.com>
Subject: Re: [PATCH] CFI: prevent the false software timeouts on writes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hail you!

> yeah it works with XIP! :)
> I guess you can ask for commit now if no one objects.

    So, I beseech you sirs to have a mercy on my patch, and commit it with 
least possible delay.

God speed.

  > Vitaly Wool wrote:
> 
>> Hi Sergey,
>>
>> I'm going to verify if this works with XIP and get back to you.
>>
>> Best regards,
>>   Vitaly
>>
>> Sergei Shtylylov wrote:
>>
>>> Hello.
>>>
>>>       We've noticed that sometimes "MTD do_write_buffer(): software 
>>> timeout"
>>> message was printed out when writing to a Fujitsu NOR flash.
>>>       It turned out that this was because of a race in the timeout 
>>> handling
>>> do_write_buffer(). A small timeout of (HZ / 1000) + 1 is used there, and
>>> sometimes if the timer interrupt handling takes more than one or even 
>>> two
>>> jiffies (which is 1-2 ms with HZ == 1000) and that interrupt happens 
>>> just
>>> after chip_ready() call, the driver bails out from a ready polling loop
>>> despite the chip has actually become ready while all those interrupts 
>>> were
>>> handled. To deal with this issue, extra check for chip ready is 
>>> neccessary on
>>> timeout expiration (and the checks should better be reordered).
>>>       As do_write_oneword() uses the same approach, it needs to also 
>>> be changed.
>>>
>>> Signed-off-by: Konstantin Baidarov <kbaidarov@ru.mvista.com>
>>> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
>>>
>>>
>>>
>>>
>>> ------------------------------------------------------------------------
>>>
>>> Index: drivers/mtd/chips/cfi_cmdset_0002.c
>>> ===================================================================
>>> RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
>>> retrieving revision 1.120
>>> diff -a -u -p -r1.120 cfi_cmdset_0002.c
>>> --- drivers/mtd/chips/cfi_cmdset_0002.c    20 Jul 2005 21:01:13 
>>> -0000    1.120
>>> +++ drivers/mtd/chips/cfi_cmdset_0002.c    25 Oct 2005 15:38:44 -0000
>>> @@ -1014,16 +1014,16 @@ static int __xipram do_write_oneword(str
>>>             continue;
>>>         }
>>>
>>> -        if (chip_ready(map, adr))
>>> -            break;
>>> -
>>> -        if (time_after(jiffies, timeo)) {
>>> +        if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
>>>             xip_enable(map, chip, adr);
>>>             printk(KERN_WARNING "MTD %s(): software timeout\n", 
>>> __func__);
>>>             xip_disable(map, chip, adr);
>>> -                        break;
>>> +            break;
>>>         }
>>>
>>> +        if (chip_ready(map, adr))
>>> +            break;
>>> +
>>>         /* Latency issues. Drop the lock, wait a while and retry */
>>>         UDELAY(map, chip, adr, 1);
>>>     }
>>> @@ -1275,13 +1275,13 @@ static int __xipram do_write_buffer(stru
>>>             continue;
>>>         }
>>>
>>> +        if (time_after(jiffies, timeo) && !chip_ready(map, adr))
>>> +            break;
>>> +
>>>         if (chip_ready(map, adr)) {
>>>             xip_enable(map, chip, adr);
>>>             goto op_done;
>>>         }
>>> -            -        if( time_after(jiffies, timeo))
>>> -            break;
>>>
>>>         /* Latency issues. Drop the lock, wait a while and retry */
>>>         UDELAY(map, chip, adr, 1);
