Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHzdL-0007V5-7w
 for linux-mtd@lists.infradead.org; Sun, 13 May 2018 22:38:28 +0000
Received: by mail-qk0-x22b.google.com with SMTP id s70-v6so8550296qks.13
 for <linux-mtd@lists.infradead.org>; Sun, 13 May 2018 15:38:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180513140212.3961-1-boris.brezillon@bootlin.com>
References: <20180513140212.3961-1-boris.brezillon@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 May 2018 01:38:15 +0300
Message-ID: <CAHp75Veu2Uapp-=ATL7v7uscsP+46eYcRi7MEoLt_QPR4BLZOQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement ndelay() as an inline function to force
 type checking/casting
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 13, 2018 at 5:02 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> ndelay() is supposed to take an unsigned long, but if you define
> ndelay() as a macro and the caller pass an unsigned long long instead
> of an unsigned long, the unsigned long long to unsigned long cast is
> not done and we end up with an "undefined reference to `__udivdi3'"
> error at link time.

> -#define ndelay(n) __delay(DIV_ROUND_UP((n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000))
> +static inline void ndelay(unsigned long nsec)
> +{
> +       __delay(DIV_ROUND_UP(nsec *
> +                            ((((HZSCALE) >> 11) *

One pair of parens is redundant.

> +                              (loops_per_jiffy >> 11)) >> 6),
> +                            1000));

Can't you keep as one line as in original?

> +}
> +#define ndelay(n) ndelay(n)
>
>  #endif /* defined(_M68K_DELAY_H) */
> --
> 2.14.1
>



-- 
With Best Regards,
Andy Shevchenko
