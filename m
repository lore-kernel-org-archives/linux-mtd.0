Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daWlV-00011x-HG
 for linux-mtd@lists.infradead.org; Thu, 27 Jul 2017 00:35:00 +0000
Received: by mail-ua0-x244.google.com with SMTP id q25so13263683uah.0
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2017 17:34:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1500105555-14074-1-git-send-email-geert@linux-m68k.org>
References: <1500105555-14074-1-git-send-email-geert@linux-m68k.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 26 Jul 2017 17:34:34 -0700
Message-ID: <CAHQ1cqHdARCaee5Aocc+qncZKXR9tM5B9ZKte1UwtC4o0d3x9g@mail.gmail.com>
Subject: Re: [PATCH] mtd: dataflash: Use ULL suffix for 64-bit constants
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 15, 2017 at 12:59 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> With gcc 4.1.2:
>
>     drivers/mtd/devices/mtd_dataflash.c:740: warning: integer constant is=
 too large for =E2=80=98long=E2=80=99 type
>     drivers/mtd/devices/mtd_dataflash.c:741: warning: integer constant is=
 too large for =E2=80=98long=E2=80=99 type
>
> Add the missing "ULL" suffix to fix this.
>
> Fixes: 67e4145ebf2c161d ("mtd: dataflash: Add flash_info for AT45DB641E")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

My bad, sorry about that. FWIW,

Acked-by: Andrey Smirnov <andrew.smirnov@gmail.com>

> ---
>  drivers/mtd/devices/mtd_dataflash.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mt=
d_dataflash.c
> index 5dc8bd042cc54b2d..504e34f295180fd9 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -737,8 +737,8 @@ static struct flash_info dataflash_data[] =3D {
>         { "AT45DB642x",  0x1f2800, 8192, 1056, 11, SUP_POW2PS},
>         { "at45db642d",  0x1f2800, 8192, 1024, 10, SUP_POW2PS | IS_POW2PS=
},
>
> -       { "AT45DB641E",  0x1f28000100, 32768, 264, 9, SUP_EXTID | SUP_POW=
2PS},
> -       { "at45db641e",  0x1f28000100, 32768, 256, 8, SUP_EXTID | SUP_POW=
2PS | IS_POW2PS},
> +       { "AT45DB641E",  0x1f28000100ULL, 32768, 264, 9, SUP_EXTID | SUP_=
POW2PS},
> +       { "at45db641e",  0x1f28000100ULL, 32768, 256, 8, SUP_EXTID | SUP_=
POW2PS | IS_POW2PS},
>  };
>
>  static struct flash_info *jedec_lookup(struct spi_device *spi,
> --
> 2.7.4
>
