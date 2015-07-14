Received: from forward18p.cmail.yandex.net ([2a02:6b8:0:1465::ab])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZF0oD-0001wZ-9r
 for linux-mtd@lists.infradead.org; Tue, 14 Jul 2015 14:03:46 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
In-Reply-To: <CAFLxGvxedXbf4+HdWrJk0LCpgR=cEbK_JWeesgQc9kzGe+4P9w@mail.gmail.com>
References: <899311436867317@web30h.yandex.ru>
 <CAFLxGvxedXbf4+HdWrJk0LCpgR=cEbK_JWeesgQc9kzGe+4P9w@mail.gmail.com>
Subject: Re: Why UBIFS min I/O unit size must be power of 2?
MIME-Version: 1.0
Message-Id: <2298861436882598@web17g.yandex.ru>
Date: Tue, 14 Jul 2015 17:03:18 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



14.07.2015, 14:26, "Richard Weinberger" <richard.weinberger@gmail.com>:
> On Tue, Jul 14, 2015 at 11:48 AM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>> šHi all,
>>
>> šI'd like to increase compression ratio of UBIFS image (at the cost of possibly
>> šslower writes). However, my LEB size is 129024, so the largest block size that
>> šI could use is 2048 (otherwise LEB won't be multiple of I/O unit size).
>>
>> šSo I wonder why UBIFS cannot use 129024 as I/O unit size and requires it to be
>> špower of 2? Is it possible to eleminate this limitation?
>
> To my knowledge the property is defined by hardware limitations (i.e.
> flash properties).
>

Ah, this is *hardware* I/O unit size, and I was thinking of it as it was UBIFS
compression block size.

Thank you.

-- 
Regards,
Konstantin
