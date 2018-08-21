Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs2FU-00041w-Kh
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 08:42:50 +0000
Date: Tue, 21 Aug 2018 10:42:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: denali: do not pass zero maxchips to
 nand_scan()
Message-ID: <20180821104224.6aafb0bd@xps13>
In-Reply-To: <1534839799-14112-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534839799-14112-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 21 Aug
2018 17:23:19 +0900:

> Commit 49aa76b16676 ("mtd: rawnand: do not execute nand_scan_ident()
> if maxchips is zero") gave a new meaning for calling nand_scan_ident()
> with maxchips=3D0.
>=20
> It is a special usage for some drivers such as docg4, but in fact
> the Denali driver may pass maxchips=3D0 to nand_scan() when the driver
> is enabled but no NAND chip is found on the board for some reasons.
>=20
> If nand_scan_with_ids() is called with maxchips=3D0, nand_scan_ident()
> is skipped, i.e. nand_set_defaults() is skipped.  Therefore, the
> driver must have set chip->controller beforehand.  Otherwise,
> nand_attach() causes NULL pointer dereference.
>=20
> In fact, the Denali controller knows the number of connected chips
> before calling nand_scan_ident(); if DEVICE_RESET fails, there is no
> chip in that chip select.  Then, denali_reset_banks() sets the maxchips
> to the number of detected chips.  If no chip is found, it is zero.
>=20
> The reason of this trick was, as commit f486287d2372 ("mtd: nand:
> denali: fix bank reset function to detect the number of chips")
> explained, nand_scan_ident() issued Set Features (0xEF) command
> to all CS lines, some of which may not be connected with a chip.
> Then, the driver would wait until R/B# response, which never happens.
>=20
> This problem was solved by commit 107b7d6a7ad4 ("mtd: rawnand: avoid
> setting again the timings to mode 0 after a reset").  In the current
> code, nand_setup_data_interface() is called from nand_scan_tail(),
> which is after the chip detection is done.
>=20
> Remove the code that is causing NULL pointer dereference.  Now, the
> maxchips passed to nand_scan() is the maximum number of chip selects
> supported by the IP (typically 4 or 8).  Leave all the chip detection
> process to nand_scan_ident().
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for the fix.

Actually the docg4 driver is getting removed and the special handling
in nand_scan() about having 0 maxchips will also disappear.
Nonetheless, I think the below code was buggy and I would like to apply
the fix anyway.

> ---
>=20
>  drivers/mtd/nand/raw/denali.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index ca18612..3e4b8e1 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1086,7 +1086,6 @@ static void denali_reset_banks(struct denali_nand_i=
nfo *denali)
>  	}
> =20
>  	dev_dbg(denali->dev, "%d chips connected\n", i);
> -	denali->max_banks =3D i;
>  }
> =20
>  static void denali_hw_init(struct denali_nand_info *denali)

Thanks,
Miqu=C3=A8l
