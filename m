Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=VA3EHSOBE005.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsPkW-00009q-Su
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 02:16:41 +0000
Message-ID: <4F28A0E4.2020700@freescale.com>
Date: Wed, 1 Feb 2012 10:18:12 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd: nand: gpmi: use correct member for checking
 NAND_BBT_USE_FLASH
References: <1328011843-7402-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1328011843-7402-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA01=D4=C231=C8=D5 20:10, Wolfram Sang =D0=B4=B5=C0:
> This has been moved from .options to .bbt_options meanwhile. So, it
> currently checks for something totally different (NAND_OWN_BUFFERS) and
> decides according to that.
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Huang Shijie <b32955@freescale.com>
> ---
>
> Artem: NAND_OWN_BUFFERS should not get set, so no danger. But I'd think=
 we
> should add the stable tag nonetheless if Huang is fine with this change=
.
>
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 493ec2f..f39f83e 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1124,7 +1124,7 @@ static int gpmi_block_markbad(struct mtd_info *mt=
d, loff_t ofs)
>  		chip->bbt[block >> 2] |=3D 0x01 << ((block & 0x03) << 1);
> =20
>  	/* Do we have a flash based bad block table ? */
> -	if (chip->options & NAND_BBT_USE_FLASH)
> +	if (chip->bbt_options & NAND_BBT_USE_FLASH)
>  		ret =3D nand_update_bbt(mtd, ofs);
>  	else {
>  		chipnr =3D (int)(ofs >> chip->chip_shift);
Acked-by: Huang Shijie <b32955@freescale.com>


I noticed this too.

thanks a lot.

Huang Shijie
