Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VExO8-0003l7-4H
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 08:15:33 +0000
Received: by mail-pa0-f47.google.com with SMTP id kl13so597478pab.6
 for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2013 01:15:10 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com>
References: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com>
Date: Thu, 29 Aug 2013 10:15:10 +0200
Message-ID: <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
Subject: Re: m68k: io{read,write} accessors
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 28, 2013 at 8:36 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> It appears that m68k doesn't properly define the io{read,write}
> functions. I get complaints like this from my compile testing:
>
> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
> drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
> function 'iowrite8_rep' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
> drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
> function 'ioread8_rep' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
> drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
> function 'iowrite16_rep' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
> drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
> function 'ioread16_rep' [-Werror=implicit-function-declaration]

This is a nommu config?
If CONFIG_MMU=y,  GENERIC_IOMAP=y and iowrite8_rep() is available.

Greg: is there any reason we can't use GENERIC_IOMAP=y for the nommu
case too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
