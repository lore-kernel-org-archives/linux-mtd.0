Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5uPC-0000O9-2m
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 14:37:55 +0000
Received: by mail-wr0-x242.google.com with SMTP id l49so13074412wrl.4
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 07:37:43 -0700 (PDT)
Subject: Re: [PATCH] mtd: partitions: Handle add_mtd_device() failures
 gracefully
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1523276721-4982-1-git-send-email-geert+renesas@glider.be>
 <9bea3ad8-7e84-87c2-9963-de81ad4cb3bf@gmail.com>
 <CAMuHMdWHoxrq-tj=QznAhuZ8eC22gTTgWFi9HgyqT9pNfJFJyw@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <87feac02-e955-1897-d4a4-d6d6d1082e45@gmail.com>
Date: Tue, 10 Apr 2018 16:37:40 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWHoxrq-tj=QznAhuZ8eC22gTTgWFi9HgyqT9pNfJFJyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/10/2018 03:26 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Mon, Apr 9, 2018 at 11:59 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 04/09/2018 02:25 PM, Geert Uytterhoeven wrote:
>>> Currently add_mtd_device() failures are plainly ignored, which may lead
>>> to kernel crashes later.
> 
>>> Fix this by ignoring and freeing partitions that failed to add in
>>> add_mtd_partitions().  The same issue is present in mtd_add_partition(),
>>> so fix that as well.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> I don't know if it is worthwhile factoring out the common handling.
>>>
>>> Should allocate_partition() fail instead?  There's a comment saying
>>> "let's register it anyway to preserve ordering".
> 
>>> --- a/drivers/mtd/mtdpart.c
>>> +++ b/drivers/mtd/mtdpart.c
> 
>>> @@ -746,7 +753,15 @@ int add_mtd_partitions(struct mtd_info *master,
>>>               list_add(&slave->list, &mtd_partitions);
>>>               mutex_unlock(&mtd_partitions_mutex);
>>>
>>> -             add_mtd_device(&slave->mtd);
>>> +             ret = add_mtd_device(&slave->mtd);
>>> +             if (ret) {
>>> +                     mutex_lock(&mtd_partitions_mutex);
>>> +                     list_del(&slave->list);
>>> +                     mutex_unlock(&mtd_partitions_mutex);
>>> +                     free_partition(slave);
>>> +                     continue;
>>> +             }
>>
>> Why is the partition even in the list in the first place ? Can we avoid
>> adding it rather than adding and removing it ?
> 
> Hence my question "Should allocate_partition() fail instead?".
> Note that if we go that route, it should be a "soft" failure, as we
> probably don't
> want to drop all other partitions on the device.
Is the number of partitions ie. in /proc/mtdparts an ABI ?

-- 
Best regards,
Marek Vasut
