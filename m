Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5djW-0001wW-BT
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 15:59:23 +0000
Received: by mail-pd0-f172.google.com with SMTP id p10so4086406pdj.31
 for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2014 07:58:59 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <201401211642.55461.marex@denx.de>
References: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
 <1390309159-19643-5-git-send-email-geert@linux-m68k.org>
 <201401211642.55461.marex@denx.de>
Date: Tue, 21 Jan 2014 16:58:59 +0100
Message-ID: <CAMuHMdVMDO9nKQPgNwz47H2mK6kKreNYiyn-AFOB2KryRpSgoA@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: m25p80: Enable Dual SPI read transfers for
 s25fl256s1 and s25fl512s
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-spi@vger.kernel.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 21, 2014 at 4:42 PM, Marek Vasut <marex@denx.de> wrote:
>> Spansion s25fl256s1 and s25fl512s support Dual SPI transfers, hence set the
>> M25P80_DUAL_READ flag.

> Why don't you lump this together with 1/4 ? :)

Because I don't want to delay Quad support for s25fl512s by bike-shedding
about the need for Dual support.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
