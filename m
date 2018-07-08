Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHja-00016E-Fk
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 22:00:50 +0000
Date: Mon, 9 Jul 2018 00:00:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: boris.brezillon@bootlin.com, Fabio Estevam <fabio.estevam@nxp.com>, Han
 Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Switch to SPDX identifier
Message-ID: <20180709000034.5d0920c5@xps13>
In-Reply-To: <CAOMZO5CU7EkPOsaneMm5cBsUvHD8diW8MLb+aD-Jaw-_G9AbYA@mail.gmail.com>
References: <1530898103-27125-1-git-send-email-festevam@gmail.com>
 <20180707190059.4f9837b0@xps13>
 <CAOMZO5CU7EkPOsaneMm5cBsUvHD8diW8MLb+aD-Jaw-_G9AbYA@mail.gmail.com>
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

Fabio Estevam <festevam@gmail.com> wrote on Sat, 7 Jul 2018 14:16:48
-0300:

> Hi Miquel,
>=20
> On Sat, Jul 7, 2018 at 2:00 PM, Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
>=20
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +//
> >> +// Freescale GPMI NAND Flash Driver
> >> +//
> >> +// Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
> >> +// Copyright (C) 2008 Embedded Alley Solutions, Inc. =20
> >
> > Maybe I'm not aware of something recent but I thought only the SPDX
> > license tag was supposed to use '//' comments while the other lines
> > should be still using '/* */' like any other comments in the code? =20
>=20
> There are some subsystem maintainers (and also Linus) that prefer
> putting everything in // style:
> https://lkml.org/lkml/2017/11/25/133

Thanks for the thread!

Well then, next time, just choose your favourite one.

v2 (with the two patches) applied to nand/next.

Thanks,
Miqu=C3=A8l
