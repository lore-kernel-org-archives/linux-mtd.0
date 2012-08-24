Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wep-0007Xe-WC
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 16:22:52 +0000
Received: by vcbfl15 with SMTP id fl15so884059vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 09:22:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345822982.2848.328.camel@sauron.fi.intel.com>
References: <1345308662-24023-1-git-send-email-shijie8@gmail.com>
 <1345822982.2848.328.camel@sauron.fi.intel.com>
Date: Fri, 24 Aug 2012 12:22:51 -0400
Message-ID: <CAMiH66Fk1-DayDuYaY5bHm0p9=ekFwLkv9FDnXT3NeOuxO_xDA@mail.gmail.com>
Subject: Re: [PATCH] mtd: cmdlinepart: fix the wrong partitions number when
 truncating occurs
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 24, 2012 at 11:43 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2012-08-18 at 12:51 -0400, Huang Shijie wrote:
>> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
>> index 4558e0f..fc960a3 100644
>> --- a/drivers/mtd/cmdlinepart.c
>> +++ b/drivers/mtd/cmdlinepart.c
>> @@ -344,7 +344,8 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>>                                              "%s: partitioning exceeds flash size, truncating\n",
>>                                              part->mtd_id);
>>                                       part->parts[i].size = master->size - offset;
>> -                                     part->num_parts = i;
>> +                                     part->num_parts = i + 1;
>> +                                     break;
>>                               }
>>                               offset += part->parts[i].size;
>>                       }
>
> I do not understand this change. Could you explain some more which
> problem you solve and how?
ok.

I will explain more in the next version as well as another patch.

thanks
Huang Shijie

>
> --
> Best Regards,
> Artem Bityutskiy
