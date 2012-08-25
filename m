Received: from mail-qa0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5Cdq-0004u3-32
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 09:26:55 +0000
Received: by qaeb19 with SMTP id b19so950984qae.15
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 02:26:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120825120231.73577d6a@halley>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
Date: Sat, 25 Aug 2012 05:26:51 -0400
Message-ID: <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number when
 truncating occurs
From: Huang Shijie <shijie8@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 25, 2012 at 5:02 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> Hi Huang,
>
> On Sat, 25 Aug 2012 10:26:07 -0400 Huang Shijie <shijie8@gmail.com> wrote:
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
>
> Your analysis seems right, but let me offer an alternative approach.
>
> I would simply:
>
> -                                       part->num_parts = i;
your code does not wors in such kernel command line(also with the 1GB
nand chip):
#gpmi-nand:100m(root),100m(kernel),1g(rootfs),1g(user),-(rest)

For you see, we must keep the code robust enough. It should passes all
the possible kernel command lines.




>
> (and not replace it with anything).
>
> The specified cmdline partitions might not be ordered (according to
> start offset), so next partition specified after the truncated one might
> define a partition at the beginning of the device, which is okay
> (regardless the truncation of current partition).
could you please give me an example of this specified cmdline?

I can test it.

Best Regards
Huang Shijie

>
> Your patch skips the definitions of next partitions, which can be legit.
>
> I agree specifying "unsorted" partitions is not commonly used (and it
> might make no sense when using the "remaining" syntax), but it is legit
> to define all partitions _explicitly_ with their size@offset in an
> unordered fashion.
>
> Regards,
> Shmulik
