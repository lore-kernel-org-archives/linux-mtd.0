Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYJIp-0001v9-TO
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 18:02:21 +0000
Received: by mail-lb0-f169.google.com with SMTP id q8so2697055lbi.28
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 11:01:55 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1397064774-31784-7-git-send-email-computersforpeace@gmail.com>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-7-git-send-email-computersforpeace@gmail.com>
Date: Thu, 10 Apr 2014 20:01:55 +0200
Message-ID: <CAMuHMdWu7YVO_RD-SUfaTw1Jp97i5bm8iX5TzKeqgWAk_iN5qQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] mtd: st_spi_fsm: kill duplicate CMD definitions
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Lee Jones <lee.jones@linaro.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 9, 2014 at 7:32 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> These are also in serial_flash_cmds.h. (FWIW, I didn't know the C
> preprocessor allowed redefinitions without warning like this.)

Cpp only complains when the redefinitions are different.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
