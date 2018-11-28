Received: from mail-vk1-f195.google.com ([209.85.221.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRvPX-0003xN-GE
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 08:41:33 +0000
Received: by mail-vk1-f195.google.com with SMTP id t132so4966494vkc.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2018 00:41:20 -0800 (PST)
MIME-Version: 1.0
References: <CGME20181128080244eucas1p15d9478c4fdbb0609005a12d24703d6d8@eucas1p1.samsung.com>
 <1543392134-1443-1-git-send-email-huijin.park@samsung.com>
In-Reply-To: <1543392134-1443-1-git-send-email-huijin.park@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Nov 2018 09:41:07 +0100
Message-ID: <CAMuHMdV6nm7yBFD4G5gCPTZMCpddGVMwNDPd9x6DaSCaqmzt9Q@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: cast to u64 to avoid uint overflows
To: huijin.park@samsung.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bbanghj.park@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 28, 2018 at 9:03 AM Huijin Park <huijin.park@samsung.com> wrote:
> From: "huijin.park" <huijin.park@samsung.com>
>
> The "params->size" is defined as "u64".
> And "info->sector_size" and "info->n_sectors" are defined as
> unsigned int and u16.
> Thus, u64 data might have strange data(loss data) if the result
> overflows an unsigned int.
> This patch casts "info->sector_size" to an u64.
>
> Signed-off-by: huijin.park <huijin.park@samsung.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
