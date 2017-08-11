Received: from secvs01.rockwellcollins.com ([205.175.225.240])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgECS-0003WK-3b
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 17:58:26 +0000
Received: by mail-yw0-f200.google.com with SMTP id t139so68183613ywg.6
 for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2017 10:57:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a06YOEfbwo+PJ+fm7JcSUDO3fZEZazH1Q66MxUdsJ2d-g@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAK8P3a06YOEfbwo+PJ+fm7JcSUDO3fZEZazH1Q66MxUdsJ2d-g@mail.gmail.com>
From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Date: Fri, 11 Aug 2017 12:57:56 -0500
Message-ID: <CAB0kKmyMK_vWTtyKcn4Li__9Q9AanSTEqCzPBmCUJA5XH4YKaA@mail.gmail.com>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

On Wed, Aug 9, 2017 at 2:51 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Aug 9, 2017 at 8:10 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> +Arnd for the memcpy_to/fromio aspects.
>>
>> Hi Matt,
>>
>> Subject should be something like "mtd: map: support 16-bit block
>> transfers"
>>
>> Le Fri,  4 Aug 2017 08:02:20 -0500,
>> Matt Weber <matthew.weber@rockwellcollins.com> a =C3=A9crit :
>>
>>> From: sgtandel <sanjay.tandel@rockwellcollins.com>
>>>
>>> This patch adds 16-bit I/O memory write function (map_copy_to16) in map=
-ram
>>> driver. map-ram driver's block write function(i.e map_copy_to) uses
>>> memcpy_toio() function for block transfer. memcpy_toio() is limited to =
do
>>> single byte write, irrespective of bankwidth.
>>
>> That's not true. Depending on the platform (+ config options)
>> memcpy_to/fromio() can be a simple redirection to memcpy, and
>> memcpy is likely to be optimized to do 32bit or 64bit accesses when
>> possible (IOW, when alignment allows it).
>
> right. I think we also have a helper that always does 32-bit
> transfers, but I can't find the name at the moment.
>

agree.

>>> +{
>>> +     const unsigned char *t =3D to;
>>> +
>>> +     if (!(IS_ALIGNED((u32)from, sizeof(u16)))) {
>>> +             from =3D (void __iomem *)ALIGN((u32)from, sizeof(u16))
>>> +                                                     - sizeof(u16);
>>> +             *(u8 *)t =3D (u8)((readw(from) & 0xff00) >> 8);
>>> +             count--;
>>> +             t++;
>>> +             from +=3D 2;
>>> +     }
>>> +     while (count >=3D 2) {
>>> +             *(u16 *)t =3D readw(from);
>>> +             count -=3D 2;
>>> +             t +=3D 2;
>>> +             from +=3D 2;
>>> +     };
>>> +     while (count > 0) {
>>> +             *(u8 *)t =3D (u8)(readw(from) & 0x00ff);
>>> +             count--;
>>> +             t++;
>>> +             from++;
>>> +     }
>>> +}
>
> This looks wrong on bit-endian kernels, which do a byte-swap
> in readw. This is one of the few places that probably should use
> __raw_readw().
>

Okay. will provide this change with fix-up patch.

>>>  static inline void inline_map_copy_from(struct map_info *map, void *to=
, unsigned long from, ssize_t len)
>>>  {
>>>       if (map->cached)
>>>               memcpy(to, (char *)map->cached + from, len);
>>> +     else if (map_bankwidth_is_2(map))
>>> +             map_copy_from16(to, map->virt + from, len);
>>>       else
>>>               memcpy_fromio(to, map->virt + from, len);
>>
>> We're likely to face the same problem with map_bankwidth_is_4()
>> (AKA 32bit busses), right? Why not patching the code to handler this
>> case?
>>
>> BTW, I'm not sure what kind of guarantees are provided by
>> memcpy_to/fromio(), but I'd expect them to optimize things when they
>> can, so they might use 32bit or 64bit accesses when alignment
>> authorizes it. Will that work correctly even on 8bit chips?
>
> I think it may or may not work, depending on the particular bus
> interface.
>

agree...

>         Arnd


Thanks,
Sanjay
