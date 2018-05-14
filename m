Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIHgN-00009T-NB
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 17:54:49 +0000
Received: by mail-qt0-x22c.google.com with SMTP id d3-v6so17260082qtp.11
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2018 10:54:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180510140311.02805561@bbrezillon>
References: <1525920400-11392-1-git-send-email-Jane.Wan@nokia.com>
 <20180510140311.02805561@bbrezillon>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 May 2018 20:54:36 +0300
Message-ID: <CAHp75VcET7PZYfeRkmiP=n_xCnDzEFYS98ZLjszc1fHjdfDF2A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mtd: rawnand: use bit-wise majority to recover the
 contents of ONFI parameter
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Jane Wan <Jane.Wan@nokia.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, prabhakar.kushwaha@nxp.com,
 Shawn Guo <shawnguo@kernel.org>, jagdish.gediya@nxp.com,
 Shreeya Patel <shreeya.patel23498@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ties.bos@nokia.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 10, 2018 at 3:03 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

>> +#define GET_BIT(bit, val)   (((val) >> (bit)) & 0x01)
>
> Not sure we need that macro, see below.

+1. We have too many nice helpers for bit manipulations
(for_each_set_bit() as an example).


>                         for (k = 0; k < nbufs; k++) {
>                                 const u8 *srcbuf = srcbufs[j];
>
>                                 if (srcbuf[i] & BIT(k))
>                                         m++;
>                         }

...which is effectively hweightXX().

>> -     p = kzalloc(sizeof(*p), GFP_KERNEL);
>> +     p = kzalloc((sizeof(*p) * 3), GFP_KERNEL);
>>       if (!p)
>>               return -ENOMEM;

...which is kcalloc().


-- 
With Best Regards,
Andy Shevchenko
