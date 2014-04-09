Received: from mail-bn1blp0186.outbound.protection.outlook.com
 ([207.46.163.186] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY21g-0005py-Ei
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 23:35:30 +0000
Message-ID: <1397086473.20280.33.camel@snotra.buserror.net>
Subject: Re: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
From: Scott Wood <scottwood@freescale.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Wed, 9 Apr 2014 18:34:33 -0500
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC1D89@DBDE04.ent.ti.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
 <CAGXE3d8H=y3LeW54kwZg04-Edm-KkNbqXLCduNuPfAOrLymO+A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D89@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>, "Huang Shijie
 \(b32955@freescale.com\)" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Helmut Schaa <helmut.schaa@googlemail.com>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-04-09 at 10:33 +0000, Gupta, Pekon wrote:
> >From: Helmut Schaa [mailto:helmut.schaa@googlemail.com]
> >>On Wed, Apr 9, 2014 at 11:38 AM, Gupta, Pekon <pekon@ti.com> wrote:
> [...]
> >>
> >> (1) if chip->ecc.hwctl() and chip->ecc.calculate are not implemented but you
> >>  still want to use subpage write feature, then you need to provide custom
> >>  implementation for chip->ecc.write_subpage().
> >>  that's same for other interfaces of nand_chip like chip->ecc.write_page().
> >
> >But these don't cause panics :)
> >
> because fsl_elbc_nand.c uses custom implementations of chip->ecc.write_page()
> 	@@ fsl_elbc_chip_init(...)
> 		chip->ecc.write_page = fsl_elbc_write_page;
> 
> Same needs to be done if subpage write is needed. However, as this is
> a regression so please check if following patch solves your problem.[1]
> 
> 
> >> (2) If you don't want to use subpage write feature then just disable it using
> >>         chip->options |= NAND_NO_SUBPAGE_WRITE;
> >>
> >> Can you please tell which NAND controller driver is causing this ?
> >> We need to fix that..
> >
> >This happens with fsl_elbc_nand (while trying to run ubiformat on a
> >mtd dev) but the
> >crash was caused by the introduction of nand_write_subpage_hwecc. So, in this
> >case I think instead of trying to fix every possible driver we should
> >let the nand core
> >code handle this issue gracefully. Maybe we could add a WARN_ON_ONCE to
> >notice which drivers require adjustments.
> >
> Yes agree. May be good to keep subpage write disabled by default,
> as only handful drivers possibly use that.
> 
> 
> [1] ## <not compile tested>
> ------------
> From bfd39102ed6aa99b7ac2b8394a2d12b879fbb4b7 Mon Sep 17 00:00:00 2001
> From: Pekon Gupta <pekon@ti.com>
> Date: Wed, 9 Apr 2014 15:51:25 +0530
> Subject: [PATCH] mtd: eLBC NAND: disable subpage write support
> 
> As fsl_elbc_nand do not implement NAND ECC interfaces (like chip->ecc.hwctl(),
> chip->ecc.calculate, and chip->ecc.correct) So it cannot use default
> implementation of nand_write_subpage_hwecc() as in nand_base.c.
> Hence disabling subpage write support till a custom implementation for
> chip->ecc_write_subpage is added.
> 
> CC: <stable@vger.kernel.org> # 3.10.x+
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index ec549cd..a21252c 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -755,6 +755,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
> 
>         /* set up nand options */
>         chip->bbt_options = NAND_BBT_USE_FLASH;
> +       chip->options |= NAND_NO_SUBPAGE_WRITE;

Won't this break compatibility with existing UBI volumes?  That's why I
didn't set this flag on eLBC when I set it on IFC (on the latter UBI is
simply broken without that flag, but eLBC gets away with it because of
the ECC algorithm used).

-Scott
