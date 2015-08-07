Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNhBe-0001Cf-UG
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 12:55:51 +0000
Received: by oip136 with SMTP id 136so53385480oip.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 05:55:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxjKVLRQ1Jrjw-hTLq8k1jMTeWVOYwdgHzg=_dQfFsnRg@mail.gmail.com>
References: <CAEo2pzuPdN56QQbvoao_oo9oppr1CNmBMhq7d0BSGQXraBZYOA@mail.gmail.com>
 <CAFLxGvxjKVLRQ1Jrjw-hTLq8k1jMTeWVOYwdgHzg=_dQfFsnRg@mail.gmail.com>
Date: Fri, 7 Aug 2015 15:55:29 +0300
Message-ID: <CAEo2pzsyFea_De6A-dZEzs6UBKcebfieSwVab0xe-TcjYLo1+A@mail.gmail.com>
Subject: Re: ubifs: nand flash wear profiling for userspace application file
 i/o
From: =?UTF-8?B?0JjQu9GM0Y/RgSDQk9Cw0YHQsNC90L7Qsg==?= <torso.nafi@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

2015-08-07 15:30 GMT+03:00 Richard Weinberger <richard.weinberger@gmail.com>:
> 10000 is not much, is this MLC?

Maybe, I'm not sure. At least, this is the guaranteed value, not the
average one, afaik.

> ubinfo prints the maximum erase counter value, does this help?
> This info is also available via /sys/class/ubi/ubi0/max_ec.

Yes, it does for our purpose. We need to test it for some days though,
for precision reasons.

> If you want the distribution you have to write a small script which
> reads the EC header of all blocks.
> But as UBI does wear leveling for you, the distribution should not
> matter. Please keep in mind that you need to define a sane
> WL threshold.

That about covers it, thank you.

Best regards,
Ilyas Gasanov
