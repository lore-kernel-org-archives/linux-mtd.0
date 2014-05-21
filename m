Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn2PK-0005Fe-SY
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 09:01:56 +0000
Message-ID: <537C6B37.8090508@huawei.com>
Date: Wed, 21 May 2014 17:00:39 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] UBIFS: replace simple_strtoul() with kstrtoint()
References: <1400641191-27877-1-git-send-email-zhenzhang.zhang@huawei.com>
 <537C16C6.9070904@huawei.com>
 <CAMuHMdVqimC046YXDVmPt5+8_bphy_gn963AMo-_bMtgobjMKA@mail.gmail.com>
In-Reply-To: <CAMuHMdVqimC046YXDVmPt5+8_bphy_gn963AMo-_bMtgobjMKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Hu Jianyang <hujianyang@huawei.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/5/21 14:30, Geert Uytterhoeven wrote:
> On Wed, May 21, 2014 at 5:00 AM, Zhang Zhen <zhenzhang.zhang@huawei.com> wrote:
>> @@ -1922,7 +1922,10 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
>>         if (!isdigit(name[3]))
>>                 return ERR_PTR(-EINVAL);
>>
>> -       dev = simple_strtoul(name + 3, &endptr, 0);
>> +       endptr = name + 3;
> 
> As Adrian pointed out, endptr is used later, and it must point to the
> character after the parsed number.
> 
Okay, it appears kstrtoint is not suitable to replace the simple_strtoul here.
The first argument of kstrto* can not point to the character after the parsed number.
>> +       ret = kstrtoint(endptr, 0, &dev);
>> +       if (ret)
>> +               return ERR_PTR(-EINVAL);
>>
>>         /* ubiY method */
>>         if (*endptr == '\0')
>> @@ -1930,7 +1933,10 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
>>
>>         /* ubiX_Y method */
>>         if (*endptr == '_' && isdigit(endptr[1])) {
>> -               vol = simple_strtoul(endptr + 1, &endptr, 0);
>> +               endptr = endptr + 1;
>> +               ret = kstrtoint(endptr, 0, &vol);
>> +               if (ret)
>> +                       return ERR_PTR(-EINVAL);
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
