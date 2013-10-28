Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VapxT-0002Xb-4g
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 16:46:27 +0000
Received: by mail-pa0-f43.google.com with SMTP id hz1so7389236pad.30
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2013 09:46:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3901382977358@web14h.yandex.ru>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <loom.20131023T201657-894@post.gmane.org> <237221382623942@web21m.yandex.ru>
 <106621382627723@web13g.yandex.ru> <3901382977358@web14h.yandex.ru>
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 28 Oct 2013 09:45:23 -0700
Message-ID: <CAGVrzcYj91m=rC5ye9eAo=eMN0mBzk9-Bv8K6myTpnH28PLUxQ@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
To: Konstantin Tokarev <annulen@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Yann Collet <yann.collet.73@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Brent Taylor <motobud@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/10/28 Konstantin Tokarev <annulen@yandex.ru>:
>
>
> 24.10.2013, 19:15, "Konstantin Tokarev" <annulen@yandex.ru>:
>> Attached patch to crypto API wrapper for lz4hc seems to fix the issue. I can save
>> and read files on LZ4HC-compressed volume, and I'm running on LZ4HC-compressed rootfs,
>> flashed from mkfs.ubifs generated image (patch by Elie De Brauwer). My software
>> works correctly.
>>
>> Unfortunately, on my board LZ4HC-compressed UBIFS volume performs noticeable worse
>> than LZO, while still faster than zlib. I guess the reason is that CPU is no longer a
>> bottleneck for my system, but NAND speed.
>>
>> Thank you all for your help!
>
> Can anyone review the correctness of my patch? Looks like API of LZ4 decompressor is
> used wrong way in crypto API.

Can you make a formal submission of it? That would probably help reviewing it.
--
Florian
