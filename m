Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGyO8-0003H9-NC
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 01:29:45 +0000
Received: by mail-vk0-x22d.google.com with SMTP id 137so7232073vkl.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 17:29:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <237b25c5-6f20-70ce-c96e-b1e617e4396b@sigma-star.at>
References: <CAGKNqbE+bWgfe60nh5LpjWcu8t5J66Fx7tpjw7FYrCqw_3Wu_Q@mail.gmail.com>
 <237b25c5-6f20-70ce-c96e-b1e617e4396b@sigma-star.at>
From: Jon Fether <jonf@mds.com>
Date: Tue, 13 Dec 2016 17:29:21 -0800
Message-ID: <CAGKNqbF6==y-UqNBVHDoj5Ht03kCwUCuEL+7HfnanjB38D=HXQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd-utils: Correct casting for final status report
 in flashcp
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My apologies, I used git diff where I see I needed to use
git-format-patch. I will re-post the patch from that.

Best Regards,
-Jon

On Tue, Dec 13, 2016 at 5:16 PM, David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
> On 12/14/2016 12:59 AM, Jon Fether wrote:
>> Add correct casting for filestat.st_size in flashcp.c. While the
>> interim status updates had correct casting from commit 08b243, the
>> final update was not.
>>
>> Signed-off-by: Jonathan Fether <jonf@mds.com>
>> ---
>> diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
>> index 6594a45..af3c88d 100644
>> --- a/misc-utils/flashcp.c
>> +++ b/misc-utils/flashcp.c
>> @@ -386,8 +386,8 @@ int main (int argc,char *argv[])
>>   if (flags & FLAG_VERBOSE)
>>   log_printf (LOG_NORMAL,
>>   "\rVerifying data: %lluk/%lluk (100%%)\n",
>> - KB (filestat.st_size),
>> - KB (filestat.st_size));
>> + KB ((unsigned long long)filestat.st_size),
>> + KB ((unsigned long long)filestat.st_size));
>>   DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long
>> long)filestat.st_size);
>
> Good catch! The cast used everywhere else in the file is indeed
> missing there.
>
> Unfortunately however, the format of your patch seems to be broken.
>
>
> Thanks,
>
> David
>
