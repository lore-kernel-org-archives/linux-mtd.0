Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5tIA-0007Aj-4v
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 13:26:35 +0000
Received: by mail-qk0-x243.google.com with SMTP id c188so13306998qkg.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 06:26:22 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <9bea3ad8-7e84-87c2-9963-de81ad4cb3bf@gmail.com>
References: <1523276721-4982-1-git-send-email-geert+renesas@glider.be>
 <9bea3ad8-7e84-87c2-9963-de81ad4cb3bf@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Apr 2018 15:26:20 +0200
Message-ID: <CAMuHMdWHoxrq-tj=QznAhuZ8eC22gTTgWFi9HgyqT9pNfJFJyw@mail.gmail.com>
Subject: Re: [PATCH] mtd: partitions: Handle add_mtd_device() failures
 gracefully
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Mon, Apr 9, 2018 at 11:59 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 04/09/2018 02:25 PM, Geert Uytterhoeven wrote:
>> Currently add_mtd_device() failures are plainly ignored, which may lead
>> to kernel crashes later.

>> Fix this by ignoring and freeing partitions that failed to add in
>> add_mtd_partitions().  The same issue is present in mtd_add_partition(),
>> so fix that as well.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> I don't know if it is worthwhile factoring out the common handling.
>>
>> Should allocate_partition() fail instead?  There's a comment saying
>> "let's register it anyway to preserve ordering".

>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c

>> @@ -746,7 +753,15 @@ int add_mtd_partitions(struct mtd_info *master,
>>               list_add(&slave->list, &mtd_partitions);
>>               mutex_unlock(&mtd_partitions_mutex);
>>
>> -             add_mtd_device(&slave->mtd);
>> +             ret = add_mtd_device(&slave->mtd);
>> +             if (ret) {
>> +                     mutex_lock(&mtd_partitions_mutex);
>> +                     list_del(&slave->list);
>> +                     mutex_unlock(&mtd_partitions_mutex);
>> +                     free_partition(slave);
>> +                     continue;
>> +             }
>
> Why is the partition even in the list in the first place ? Can we avoid
> adding it rather than adding and removing it ?

Hence my question "Should allocate_partition() fail instead?".
Note that if we go that route, it should be a "soft" failure, as we
probably don't
want to drop all other partitions on the device.

>>               mtd_add_partition_attrs(slave);
>>               if (parts[i].types)
>>                       mtd_parse_part(slave, parts[i].types);
>>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
