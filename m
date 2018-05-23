Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLNF8-000772-Ui
 for linux-mtd@lists.infradead.org; Wed, 23 May 2018 06:27:28 +0000
Received: by mail-ua0-x244.google.com with SMTP id a2-v6so13995929uak.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2018 23:27:16 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180523082047.2aa9e6ac@bbrezillon>
References: <1527001673-16318-1-git-send-email-geert+renesas@glider.be>
 <20180523082047.2aa9e6ac@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 May 2018 08:27:15 +0200
Message-ID: <CAMuHMdX+nGoS=8RYG7QqCk7iAR_R_UMQ3B+i1XZegPemGJ2kUQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: cmdlinepart: Update comment for introduction of
 OFFSET_CONTINUOUS
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
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

Hi Boris,

On Wed, May 23, 2018 at 8:20 AM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Tue, 22 May 2018 17:07:53 +0200
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
>> The comment about offset zero was not updated when changing behavior:
>>   - Automatic offset calculation is indicated by OFFSET_CONTINUOUS,
>>   - Zero really means offset zero.
>>
>> Fixes: b175d03dd2072836 ("[PATCH] mtd cmdlinepart: allow zero offset value")
>
> Did we switch to 16bytes for the short commit ids (I usually use 12
> bytes)?

Checkpatch says 12+ chars. I'm putting my bet on Linux growth ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
