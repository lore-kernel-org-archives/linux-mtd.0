Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VT4PA-0001aE-Uf
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 06:34:57 +0000
Received: by mail-pb0-f42.google.com with SMTP id un15so6711685pbc.1
 for <linux-mtd@lists.infradead.org>; Sun, 06 Oct 2013 23:34:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <47881381073118@web4j.yandex.ru>
References: <CAGWqfihkGT5wWDoFGTtBHK31+Fvav8if6iy_jFJ7io1H_wktFA@mail.gmail.com>
 <165301380997382@web12j.yandex.ru> <47881381073118@web4j.yandex.ru>
Date: Mon, 7 Oct 2013 08:34:34 +0200
Message-ID: <CAGWqfihRaNSs-uc9utTPaNPHU__KTS5saxgc2xUrkw5sYy4kkQ@mail.gmail.com>
Subject: Re: [PATCH v0.5] mtd-utils: mkfs.ubifs: Add support for LZ4HC
 compression
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brent Taylor <motobud@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin,

Sounds interesting, I'll integrate this into a next version of the
patch. Perhaps it make sense just to replace favor_lzo and favor_lz4hc
into something generic like favor_COMPR1_COMPR2 where COMPR2 gets
chosen if it is more than favor-percent better than COMPR1. Even
though today you're probably use lzo/zlib to optimise for size at a
reasonable cost of some speed  while you're probably use lzo/lz4hc if
you want to optimise for speed at a reasonable cost of size, but that
probably makes it more extensible in the future. Does this sound
reasonable ?

my 2 cents
E.


On Sun, Oct 6, 2013 at 5:25 PM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>
> 05.10.2013, 22:24, "Konstantin Tokarev" <annulen@yandex.ru>:
>> 05.10.2013, 18:48, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
>>
>>>  All,
>>>
>>>  After some time to do some testing this is a second version of the
>>>  same patch. Now lz4hc gets actually used.  However at this moment in
>>>  time only improvement in terms of cpu time is seen, but lz4hc in this
>>>  context seems to behave worse than LZO, on my local system:
>>>
>>>  -rw-r--r-- 1 edb  edb  28M Oct  5 16:22 imag.lz4hc
>>>  -rw-r--r-- 1 root root 25M Oct  5 16:22 imag.lzo
>>>  -rw-r--r-- 1 root root 43M Oct  5 16:11 imag.none
>>>  -rw-r--r-- 1 root root 22M Oct  5 16:30 imag.zlib
>>>
>>>  The only thing which comes immediately to mind is that due to the size
>>>  of the chunks (in my case large block being compressed is 4k) lz4hc
>>>  isn't starting to pay off ..
>>
>> Looks like it might be useful to have mixed lz4hc/lzo mode - lz4hc is faster,
>> lzo provides better ratio, and both don't use additional memory for decompression.
>> I did no speed benchmarks yet though.
>>
>> It also might be that lz4 has tuning parameters which may be useful for rootfs
>> compression in case when most of files are not modified most of the times, i.e.
>> trade compression time to space efficiency while keeping decompression speed.
>
> In attached patch I've replaced "favor lz4hc" mode with lz4hc/lzo mix, depending
> purely on which algorithm gives smaller size for the block. In my case it allowed
> to get slightly smaller image size than lzo (27564 blocks were compressed with lzo
> and 1054 - with lz4hc).
>
> --
> Regards,
> Konstantin



-- 
Elie De Brauwer
