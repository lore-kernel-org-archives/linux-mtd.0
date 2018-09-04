Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx9jG-0007NE-Ko
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 11:42:44 +0000
Date: Tue, 4 Sep 2018 13:42:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Fix Hamming ECC
Message-ID: <20180904134218.3da32738@xps13>
In-Reply-To: <20180904091438.3755-1-boris.brezillon@bootlin.com>
References: <20180904091438.3755-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue,  4 Sep 2018
11:14:38 +0200:

> Apparently ECC bytes are not ordered as expected by nand_correct_data()
> in the ecc_calc buffer which leads to invalid bitflip correction when
> an ECC error is detected (can be reproduced with 'nandbiterrs -i').
>=20
> Re-ordering ECC bytes seems to fix the problem.
>=20
> While at it, get rid of the useless u8 cast.
>=20
> Fixes: 6c009ab89a21 ("mtd: generic FSMC NAND MTD driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
