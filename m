Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmjRN-0005wS-IZ
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 12:46:46 +0000
Message-ID: <537B4E6C.7050008@intel.com>
Date: Tue, 20 May 2014 15:45:32 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] UBIFS: replace simple_strtoul() with kstrtoint()
References: <1400575582-24841-1-git-send-email-zhenzhang.zhang@huawei.com>	<537B16CB.9070508@huawei.com>	<537B48C7.6080105@intel.com>
 <CAMuHMdWu30E2jg3=Z_bnDknD-HJqEAn_KxQH4WJ+B9nmwiKwGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWu30E2jg3=Z_bnDknD-HJqEAn_KxQH4WJ+B9nmwiKwGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Hu Jianyang <hujianyang@huawei.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Zhang Zhen <zhenzhang.zhang@huawei.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/20/2014 03:31 PM, Geert Uytterhoeven wrote:
> On Tue, May 20, 2014 at 2:21 PM, Adrian Hunter <adrian.hunter@intel.com> wrote:
>> On 05/20/2014 11:48 AM, Zhang Zhen wrote:
>>> --- a/fs/ubifs/super.c
>>> +++ b/fs/ubifs/super.c
>>> @@ -1903,7 +1903,7 @@ const struct super_operations ubifs_super_operations = {
>>>  static struct ubi_volume_desc *open_ubi(const char *name, int mode)
>>>  {
>>>       struct ubi_volume_desc *ubi;
>>> -     int dev, vol;
>>> +     int dev, vol, ret;
>>>       char *endptr;
>>>
>>>       /* First, try to open using the device node path method */
>>> @@ -1922,10 +1922,11 @@ static struct ubi_volume_desc *open_ubi(const char *name, int mode)
>>>       if (!isdigit(name[3]))
>>>               return ERR_PTR(-EINVAL);
>>>
>>> -     dev = simple_strtoul(name + 3, &endptr, 0);
>>> +     endptr = (char *)name + 3;
> 
> Please make endptr const char *, so the cast can be killed.
> Always think twice before adding a cast!
> 
> Ah, there's still another simple_strtoul() left below, that needs to be
> converted first.
> 
>>> +     ret = kstrtoint(endptr, 0, &dev);
>>
>> But endptr is used in the code later, so this is wrong.
> 
> That was my first thought, too. But upon closer look, I think it's correct.
> 
>>>
>>>       /* ubiY method */
>>> -     if (*endptr == '\0')
> 
> endptr would point to the trailing nul on success...
> 
>>> +     if (!ret)
> 
> ... which is now replaced by a test for ret not being an errorcoe.
> 
>>>               return ubi_open_volume(0, dev, mode);
>>>
>>>       /* ubiX_Y method */
> 
> If ret is an errorcode, the flow continues.
> 
> As parsing the number failed, the code checks if the first character
> (name + 3) is an underscore or colon:

No, it does not check if parsing failed, it checks for end-of-input.
The "X" and "Y" of "ubiX_Y" are numbers.

> 
>        if (*endptr == '_' && isdigit(endptr[1])) {
> 
> 
>                 vol = simple_strtoul(endptr + 1, &endptr, 0);
>                 if (*endptr != '\0')
>                         return ERR_PTR(-EINVAL);
>                 return ubi_open_volume(dev, vol, mode);
>         }
> 
>         /* ubiX:NAME method */
>         if ((*endptr == ':' || *endptr == '!') && endptr[1] != '\0')
>                 return ubi_open_volume_nm(dev, ++endptr, mode);
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
