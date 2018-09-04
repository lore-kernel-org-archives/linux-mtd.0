Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJDj-0007jY-CJ
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:50:48 +0000
Date: Tue, 4 Sep 2018 23:50:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: Get rid of the ->read_word() hook
Message-ID: <20180904235025.305527f9@xps13>
In-Reply-To: <20180727210542.8266-1-boris.brezillon@bootlin.com>
References: <20180727210542.8266-1-boris.brezillon@bootlin.com>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 27 Jul 2018
23:05:42 +0200:

> Commit c120e75e0e7d ("mtd: nand: use read_oob() instead of cmdfunc()
> for bad block check") removed this only user of the ->read_word()
> method but kept the hook in place. Remove it now.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c |  9 ---------
>  drivers/mtd/nand/raw/au1550nd.c              | 15 ---------------
>  drivers/mtd/nand/raw/denali.c                | 10 ----------
>  drivers/mtd/nand/raw/hisi504_nand.c          | 10 ----------
>  drivers/mtd/nand/raw/mpc5121_nfc.c           | 11 -----------
>  drivers/mtd/nand/raw/mxc_nand.c              | 13 -------------
>  drivers/mtd/nand/raw/nand_base.c             | 14 --------------
>  drivers/mtd/nand/raw/nandsim.c               | 10 ----------
>  drivers/mtd/nand/raw/sh_flctl.c              | 10 ----------
>  drivers/mtd/nand/raw/socrates_nand.c         | 12 ------------
>  include/linux/mtd/rawnand.h                  |  2 --
>  11 files changed, 116 deletions(-)
>=20

Applied to nand/next.

Thanks,
Miqu=C3=A8l
