Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aP3pP-0005p0-Q1
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 07:50:48 +0000
Received: by mail-io0-x230.google.com with SMTP id f81so81089656iof.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2016 23:50:27 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <56AA82AD.2020808@free.fr>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr> <56A65CBA.9050705@free.fr>
 <CAMuHMdVEVmf_kSknPSkYUBkaemfcXP6HXorkjEayC6zR5-s_yw@mail.gmail.com>
 <56AA82AD.2020808@free.fr>
Date: Fri, 29 Jan 2016 08:50:26 +0100
Message-ID: <CAMuHMdVp16TOA=Go698NGM0uezBqVxPYu0UpqCobJR=66WW2mA@mail.gmail.com>
Subject: Re: RFC on large number of hacks in mtd core files
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Mason <slash.tmp@free.fr>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Sebastian Frias <sf84@laposte.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 28, 2016 at 10:05 PM, Mason <slash.tmp@free.fr> wrote:
> I see that include/linux/mtd/nand.h has
>
> #define NAND_MFR_EON            0x92
>
> ESMT apparently stands for
> Elite Semiconductor Memory Technology Inc
> Apparently ESMT bought Eon a few months ago.
> http://technews.co/2015/11/11/taiwans-elite-semiconductor-to-absorb-rival-eon-silicon/
>
> So I guess it's expected that these two manufacturers
> share the same ID?

Yes. You can add a comment to the #define to explain the link to ESMT.

> As for the MIRA ID... Looks like this patch is relevant:
> http://lists.infradead.org/pipermail/linux-mtd/2014-December/056765.html
> +#define NAND_MFR_GIGADEVICE    0xc8

Probably.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
