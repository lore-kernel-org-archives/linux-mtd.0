Received: from forward1h.mail.yandex.net ([2a02:6b8:0:f05::10])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vapaq-0001uB-T7
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 16:23:06 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Yann Collet <yann.collet.73@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brent Taylor <motobud@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
In-Reply-To: <106621382627723@web13g.yandex.ru>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <loom.20131023T201657-894@post.gmane.org> <237221382623942@web21m.yandex.ru>
 <106621382627723@web13g.yandex.ru>
Subject: Re: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <3901382977358@web14h.yandex.ru>
Date: Mon, 28 Oct 2013 20:22:38 +0400
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



24.10.2013, 19:15, "Konstantin Tokarev" <annulen@yandex.ru>:
> Attached patch to crypto API wrapper for lz4hc seems to fix the issue. I can save
> and read files on LZ4HC-compressed volume, and I'm running on LZ4HC-compressed rootfs,
> flashed from mkfs.ubifs generated image (patch by Elie De Brauwer). My software
> works correctly.
>
> Unfortunately, on my board LZ4HC-compressed UBIFS volume performs noticeable worse
> than LZO, while still faster than zlib. I guess the reason is that CPU is no longer a
> bottleneck for my system, but NAND speed.
>
> Thank you all for your help!

Can anyone review the correctness of my patch? Looks like API of LZ4 decompressor is
used wrong way in crypto API.

-- 
Regards,
Konstantin
