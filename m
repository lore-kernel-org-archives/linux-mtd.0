Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOqxS-0004Uz-VY
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 18:06:15 +0000
Received: by mail-ig0-x234.google.com with SMTP id t15so19076185igr.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2016 10:05:54 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <56A65CBA.9050705@free.fr>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr> <56A65CBA.9050705@free.fr>
Date: Thu, 28 Jan 2016 19:05:54 +0100
Message-ID: <CAMuHMdVEVmf_kSknPSkYUBkaemfcXP6HXorkjEayC6zR5-s_yw@mail.gmail.com>
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

On Mon, Jan 25, 2016 at 6:34 PM, Mason <slash.tmp@free.fr> wrote:
>> I'll spend a few hours to clean up the diffs and keep only what seems relevant.
>
> OK, here's my second attempt at presenting the information.
> I'm grateful if anyone has comments regarding the changes
> in core files, or even the driver itself.

One general comment: all these #ifdef CONFIG_TANGOX / #else / #endif
constructs do not cope well with multi-platform kernels.
The same is true for the CONFIG_MTD_NAND_BBM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
