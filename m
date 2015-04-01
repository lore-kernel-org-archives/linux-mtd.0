Received: from mail-yk0-x235.google.com ([2607:f8b0:4002:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdPd8-0000AL-0t
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2015 20:52:54 +0000
Received: by ykcn8 with SMTP id n8so17044131ykc.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Apr 2015 13:52:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <551C1F71.3040508@free.fr>
References: <551C1F71.3040508@free.fr>
Date: Wed, 1 Apr 2015 22:52:29 +0200
Message-ID: <CAFLxGvw_NRsZQE=FckpdxH=wNJXQaTSx_YZKU5GNTckMcF6oig@mail.gmail.com>
Subject: Re: Tiny delays in drivers/mtd/nand/nand_base.c
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Mason <slash.tmp@free.fr>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 1, 2015 at 6:40 PM, Mason <slash.tmp@free.fr> wrote:
> Hello everyone,
>
> In drivers/mtd/nand/nand_base.c there are several instances of
> the following code:
>
>         /*
>          * Apply this short delay always to ensure that we do wait tWB in
>          * any case on any machine.
>          */
>         ndelay(100);
>
>
> Is the intent to spin for 100 nanoseconds?

Yes. tWB is 100ns.

> It seems that, for most platforms, ndelay is defined as:
> udelay(DIV_ROUND_UP(x, 1000))
>
> So it will resolve to udelay(1) if I understand correctly?

If your kernel has the above definition, yes.

> (I suppose sleeping longer is not a problem.)

That covers my knowledge.

> However the comment implies that 100 ns are sufficient, right?

Spec wants tWB to be at least 100ns.

> So if I override ndelay with a function that sleeps *exactly*
> the amount requested, everything should keep working?

Yes.

> The reason I ask is because someone added this comment in my
> source tree:
>
> #ifdef CONFIG_TANGOX
>         udelay(1); /* needs to make it much longer than tWB */
> #else
>         ndelay(100);
> #endif

Looks fishy. Maybe this papers over a BSP bug.

> Also I have to figure out why the build is not picking up this
> definition for ndelay (from include/asm-generic/delay.h)

Not all archs use generic delay.h

HTH,
//richard
