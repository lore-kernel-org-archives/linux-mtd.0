Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKS4X-0008MH-CG
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 10:25:17 +0000
Received: by lagy4 with SMTP id y4so6331437lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 03:25:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1334744404-721-1-git-send-email-hechtb@gmail.com>
References: <1334744404-721-1-git-send-email-hechtb@gmail.com>
Date: Wed, 18 Apr 2012 12:25:10 +0200
Message-ID: <CABYn4sxYynuD3WN_9+fmieMfjjGeG+P3EAY+HoXmFtgn8x0PiQ@mail.gmail.com>
Subject: Re: [RFC] mtd: nand: Add a STATUS CMD after write verification
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/4/18 Bastian Hecht <hechtb@googlemail.com>:
> When using CONFIG_MTD_NAND_VERIFY_WRITE=3Dy an extra read command is sent
> to the NAND chip after writing a page. We need an extra status command
> to avoid hick-ups that lead to page write failures.
> ---
>
> Hello all,
>
> I'm experiencing problems with my current setup and
> CONFIG_MTD_NAND_VERIFY_WRITE=3Dy. Usually the command sequence is like
> 0x70 =A0 =A0 =A0 =A0 =A0 =A0Status read
> 0x80 0x10 =A0 =A0 =A0 Page prog
> 0x70
> 0x80 0x10 =A0 =A0 =A0 Page prog
> 0x70
> ...
>
> When activating write verification there is a read command before the
> page prog.

I've written this unclearly. I mean if we issue multiple page writes,
the page writes are not preceeded by a status read, but by a page read
command from the last verification.

> 0x80 0x10
> 0x70
> 0x0 =A0 =A0 =A0 =A0 =A0 =A0 read
> 0x80 0x10
> 0x70
> ...
> This makes my chip write garbage, while the patch fixes it.
> Now I wonder if this problem is caused by my NAND chip only, or if this
> is a general problem that should be adressed.
> ---
> =A0drivers/mtd/nand/nand_base.c | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8a393f9..62d6691 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2101,6 +2101,8 @@ static int nand_write_page(struct mtd_info *mtd, st=
ruct nand_chip *chip,
>
> =A0 =A0 =A0 =A0if (chip->verify_buf(mtd, buf, mtd->writesize))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EIO;
> +
> + =A0 =A0 =A0 chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> =A0#endif
> =A0 =A0 =A0 =A0return 0;
> =A0}
> --
> 1.7.5.4
>
