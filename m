Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmYiQ-0005Qg-MH
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 01:19:39 +0000
Message-ID: <537AAD6E.6020806@huawei.com>
Date: Tue, 20 May 2014 09:18:38 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ubi: replace simple_strtoul() with kstrtoul()
References: <1400488570-20288-1-git-send-email-zhenzhang.zhang@huawei.com>
 <5379C2E8.5040000@huawei.com>
 <CAMuHMdVyVyKifhntPBeFS893MfkugYsMpKOizfDD8CqzPP96vQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVyVyKifhntPBeFS893MfkugYsMpKOizfDD8CqzPP96vQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Hu Jianyang <hujianyang@huawei.com>, MTD
 Maling List <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/5/19 17:14, Geert Uytterhoeven wrote:
> Please don't add mindless casts!
> 
> On Mon, May 19, 2014 at 10:38 AM, Zhang Zhen <zhenzhang.zhang@huawei.com> wrote:
>> --- a/drivers/mtd/ubi/build.c
>> +++ b/drivers/mtd/ubi/build.c
>> @@ -1190,10 +1190,13 @@ static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
>>  static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
>>  {
>>         struct mtd_info *mtd;
>> -       int mtd_num;
>> +       int mtd_num, ret;
>>         char *endp;
>>
>> -       mtd_num = simple_strtoul(mtd_dev, &endp, 0);
>> +       endp = (char *)mtd_dev;
>> +       ret = kstrtoul(endp, 0, (unsigned long *)&mtd_num);
> 
> On 64-bit, long is 64-bit, hence this will write beyond mtd_num and will corrupt
> the stack.

Yeah, you are right. This really may write beyond dev.

The kstrtoul(const char *s, unsigned int base, unsigned long *res) only accept unsigned long
pointer as the third parameter.
And the original function simple_strtoul() returns unsigned long type value.
It is also cast. So this may not corrupt the stack.

Or do you have any better suggestion about this?
Thanks.
> 
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
