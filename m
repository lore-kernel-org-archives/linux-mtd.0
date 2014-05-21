Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmwCo-0007xg-33
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 02:24:34 +0000
Message-ID: <537C0DF1.50309@huawei.com>
Date: Wed, 21 May 2014 10:22:41 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v2] UBIFS: replace simple_strtoul() with kstrtoint()
References: <1400575582-24841-1-git-send-email-zhenzhang.zhang@huawei.com>
 <537B16CB.9070508@huawei.com> <537B48C7.6080105@intel.com>
 <CAMuHMdWu30E2jg3=Z_bnDknD-HJqEAn_KxQH4WJ+B9nmwiKwGQ@mail.gmail.com>
 <537B4E6C.7050008@intel.com>
 <CAMuHMdVKz1cvRiCp0Ni1Sv+=n3z78tWZ0w6ijfaGMjunb9oZag@mail.gmail.com>
In-Reply-To: <CAMuHMdVKz1cvRiCp0Ni1Sv+=n3z78tWZ0w6ijfaGMjunb9oZag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, Hu
 Jianyang <hujianyang@huawei.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/5/20 20:55, Geert Uytterhoeven wrote:
> On Tue, May 20, 2014 at 2:45 PM, Adrian Hunter <adrian.hunter@intel.com> wrote:
>>>>> +     ret = kstrtoint(endptr, 0, &dev);
>>>>
>>>> But endptr is used in the code later, so this is wrong.
>>>
>>> That was my first thought, too. But upon closer look, I think it's correct.
>>>
>>>>>
>>>>>       /* ubiY method */
>>>>> -     if (*endptr == '\0')
>>>
>>> endptr would point to the trailing nul on success...
>>>
>>>>> +     if (!ret)
>>>
>>> ... which is now replaced by a test for ret not being an errorcoe.
>>>
>>>>>               return ubi_open_volume(0, dev, mode);
>>>>>
>>>>>       /* ubiX_Y method */
>>>
>>> If ret is an errorcode, the flow continues.
>>>
>>> As parsing the number failed, the code checks if the first character
>>> (name + 3) is an underscore or colon:
>>
>> No, it does not check if parsing failed, it checks for end-of-input.
>> The "X" and "Y" of "ubiX_Y" are numbers.
Sorry, i made a mistake. As parsing the number failed, it should just return
ERR_PTR(-EINVAL).

Thank you for your review. I learned a lot from you and Geert.
I will send another version.
> 
> Sorry, you're right. Thanks for noticing!
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
