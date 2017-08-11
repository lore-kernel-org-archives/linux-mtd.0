Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgFq1-0005BE-Dz
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 19:43:19 +0000
Received: by mail-oi0-x241.google.com with SMTP id b130so4223138oii.3
 for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2017 12:42:57 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <CAB0kKmyMK_vWTtyKcn4Li__9Q9AanSTEqCzPBmCUJA5XH4YKaA@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAK8P3a06YOEfbwo+PJ+fm7JcSUDO3fZEZazH1Q66MxUdsJ2d-g@mail.gmail.com>
 <CAB0kKmyMK_vWTtyKcn4Li__9Q9AanSTEqCzPBmCUJA5XH4YKaA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 11 Aug 2017 21:42:56 +0200
Message-ID: <CAK8P3a24mHdgqQoVJJ+DzSkudBQ-OH7zhoN9_vkDsNQv0jyryw@mail.gmail.com>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
To: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 11, 2017 at 7:57 PM, Sanjay Tandel
<sanjay.tandel@rockwellcollins.com> wrote:

>>>> +{
>>>> +     const unsigned char *t = to;
>>>> +
>>>> +     if (!(IS_ALIGNED((u32)from, sizeof(u16)))) {
>>>> +             from = (void __iomem *)ALIGN((u32)from, sizeof(u16))
>>>> +                                                     - sizeof(u16);
>>>> +             *(u8 *)t = (u8)((readw(from) & 0xff00) >> 8);
>>>> +             count--;
>>>> +             t++;
>>>> +             from += 2;
>>>> +     }
>>>> +     while (count >= 2) {
>>>> +             *(u16 *)t = readw(from);
>>>> +             count -= 2;
>>>> +             t += 2;
>>>> +             from += 2;
>>>> +     };
>>>> +     while (count > 0) {
>>>> +             *(u8 *)t = (u8)(readw(from) & 0x00ff);
>>>> +             count--;
>>>> +             t++;
>>>> +             from++;
>>>> +     }
>>>> +}
>>
>> This looks wrong on bit-endian kernels, which do a byte-swap
>> in readw. This is one of the few places that probably should use
>> __raw_readw().
>>
>
> Okay. will provide this change with fix-up patch.

On second thought, __raw_readw() can get combined into 32-bit
accesses on some architectures. If you want to be sure you use only
16-bit reads, then cpu_to_le32(readw_relaxed(from)) would be
the safer option.

      Arnd
