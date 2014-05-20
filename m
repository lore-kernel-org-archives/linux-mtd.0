Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmfCw-0005AM-CJ
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 08:15:35 +0000
Message-ID: <537B0EE6.60006@huawei.com>
Date: Tue, 20 May 2014 16:14:30 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ubifs: replace simple_strtoul() with kstrtoul()
References: <1400469756-18212-1-git-send-email-zhenzhang.zhang@huawei.com>
 <537979E9.3060209@huawei.com>
 <CAMuHMdXoJKgzfyo6OcLz1SaTO_zCuvwM8iu-cNt6msvVSRCFKA@mail.gmail.com>
 <5379D3A1.8050703@huawei.com>
 <CAMuHMdU-3oUjvUtnfARjDZh8W_w3Yt4+deJdEy9F8ac9S8RmuA@mail.gmail.com>
 <CAMuHMdUmw_aSWDw9JmBKX8P7Na4rd+zig4yo8gDVD3vh34-xng@mail.gmail.com>
In-Reply-To: <CAMuHMdUmw_aSWDw9JmBKX8P7Na4rd+zig4yo8gDVD3vh34-xng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/5/20 14:57, Geert Uytterhoeven wrote:
> On Tue, May 20, 2014 at 8:53 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Mon, May 19, 2014 at 11:49 AM, Zhang Zhen <zhenzhang.zhang@huawei.com> wrote:
>>> On 2014/5/19 17:13, Geert Uytterhoeven wrote:
>>>> Please don't add mindless casts!
>>>>
>>>> On Mon, May 19, 2014 at 5:26 AM, Zhang Zhen <zhenzhang.zhang@huawei.com> wrote:
>>>>> --- a/fs/ubifs/super.c
>>>>> +++ b/fs/ubifs/super.c
>>>>> @@ -1905,6 +1905,7 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
>>>>>         struct ubi_volume_desc *ubi;
>>>>>         int dev, vol;
>>>>
>>>> dev is int
>>>>
>>>>>         char *endptr;
>>>>> +       int ret;
>>>>>
>>>>>         /* First, try to open using the device node path method */
>>>>>         ubi = ubi_open_volume_path(name, mode);
>>>>> @@ -1922,7 +1923,10 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
>>>>>         if (!isdigit(name[3]))
>>>>>                 return ERR_PTR(-EINVAL);
>>>>>
>>>>> -       dev = simple_strtoul(name + 3, &endptr, 0);
>>>>> +       endptr = (char *)name + 3;
>>>>> +       ret = kstrtoul(endptr, 0, (unsigned long *)&dev);
>>>>
>>>> On 64-bit, long is 64-bit, hence this will write beyond dev and will corrupt
>>>> the stack.
>>>>
>>> Yeah, you are right. This really may write beyond dev.
>>>
>>> The kstrtoul(const char *s, unsigned int base, unsigned long *res) only accept unsigned long
>>> pointer as the third parameter.
>>> And the original function simple_strtoul() returns unsigned long type value.
>>> It is also cast. So this may not corrupt the stack.
>>
>> That's not a cast, but an implicit conversion (which may truncate the
>> value from 64-bit to 32-bit).
>>
>>> Or do you have any better suggestion about this?
>>
>> Change dev and vol to long?
> 
> Oh, there exists a whole range of kstrto*() functions.
> 
> So you can just use kstrtoint().
> 
Hi Geert,

Thanks for your suggestion, i will send the version2 out.
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> 
