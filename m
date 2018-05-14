Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIB5x-00012k-Dm
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 10:52:49 +0000
Received: by mail-vk0-x241.google.com with SMTP id x66-v6so7166025vka.11
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2018 03:52:35 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAMuHMdVdteVYjXkmZW+PouVsvPehT_GMfvEKo7OKqs4XYdiSpA@mail.gmail.com>
References: <20180513140212.3961-1-boris.brezillon@bootlin.com>
 <CAMuHMdVdteVYjXkmZW+PouVsvPehT_GMfvEKo7OKqs4XYdiSpA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 May 2018 12:52:33 +0200
Message-ID: <CAMuHMdWNGYaMT2AwO4yGB_usvJztsgsQ0D=X0rB2zuwAiqP-fA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement ndelay() as an inline function to force
 type checking/casting
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, May 14, 2018 at 11:29 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, May 13, 2018 at 4:02 PM, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
>> ndelay() is supposed to take an unsigned long, but if you define
>> ndelay() as a macro and the caller pass an unsigned long long instead
>> of an unsigned long, the unsigned long long to unsigned long cast is
>> not done and we end up with an "undefined reference to `__udivdi3'"
>> error at link time.
>>
>> Fix that by making ndelay() an inline function and then defining dummy
>> ndelay() macro that redirects to the ndelay() function (it's how most
>> archs do to implement ndelay()).
>>
>> Fixes: c8ee038bd148 ("m68k: Implement ndelay() based on the existing udelay() logic")
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> ---
>> Hello Geert,
>>
>> This patch is fixing the bug reported by kbuild test robot here [1].
>> I could have patched the PSEC_TO_NSEC() macro to cast the result of
>> the division on a u32, but I thought making m68k consistent with what
>> other archs do would be preferable.
>>
>> Let me know if don't like the solution, and I'll patch the ndelay()
>> caller instead.
>
> Thanks for your patch!
>
> With the comment a few lines above removed:
>
>     - * This is a macro so that the const version can factor out the first
>     - * multiply and shift.
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

I've just posted a fix for the root cause ("[PATCH] mtd: nand: Fix return
type of __DIVIDE() when called with 32-bit",
https://lkml.org/lkml/2018/5/14/578), so the fix for m68k's ndelay() is not
that urgent anymore.

As your patch is still a valid fix, I'll apply it, and queue it up for v4.18.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
