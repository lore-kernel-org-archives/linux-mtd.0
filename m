Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbqa8-0004Re-Gt
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 17:01:14 +0000
Date: Sat, 7 Jul 2018 19:00:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: boris.brezillon@bootlin.com, Fabio Estevam <fabio.estevam@nxp.com>,
 han.xu@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Switch to SPDX identifier
Message-ID: <20180707190059.4f9837b0@xps13>
In-Reply-To: <1530898103-27125-1-git-send-email-festevam@gmail.com>
References: <1530898103-27125-1-git-send-email-festevam@gmail.com>
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

Hi Fabio,

Fabio Estevam <festevam@gmail.com> wrote on Fri,  6 Jul 2018 14:28:23
-0300:

> From: Fabio Estevam <fabio.estevam@nxp.com>
>=20
> Adopt the SPDX license identifier headers to ease license compliance
> management.
>

Can you please cc: me also when you send NAND patches? thanks!

> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 27 +++++++-----------------=
---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 27 +++++++-----------------=
---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 11 +----------
>  3 files changed, 15 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand=
/raw/gpmi-nand/gpmi-lib.c
> index 83697b8..5673cb2 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> @@ -1,23 +1,10 @@
> -/*
> - * Freescale GPMI NAND Flash Driver
> - *
> - * Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
> - * Copyright (C) 2008 Embedded Alley Solutions, Inc.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License alo=
ng
> - * with this program; if not, write to the Free Software Foundation, Inc=
.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - */
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Freescale GPMI NAND Flash Driver
> +//
> +// Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
> +// Copyright (C) 2008 Embedded Alley Solutions, Inc.

Maybe I'm not aware of something recent but I thought only the SPDX
license tag was supposed to use '//' comments while the other lines
should be still using '/* */' like any other comments in the code?

I think the rest of this subsystem uses:

// SPDX tag
/*
 *
[...]
 */

Would you mind changing this?

Kind regards,
Miqu=C3=A8l
