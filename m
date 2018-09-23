Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g42aw-0003bl-Uz
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2018 11:30:36 +0000
Date: Sun, 23 Sep 2018 13:30:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: Allow selection of ECC byte ordering at
 runtime
Message-ID: <20180923133019.1c6c9cbc@xps13>
In-Reply-To: <20180904142328.26577-1-boris.brezillon@bootlin.com>
References: <20180904142328.26577-1-boris.brezillon@bootlin.com>
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
16:23:28 +0200:

> Currently, the selection of ECC byte ordering for software hamming is
> done at compilation time, which doesn't make sense when ECC byte
> calculation is done in hardware and byte ordering is forced by the
> hardware engine.
> In this case, only the correction is done and software and we want to

                                            ^ in

> force the byte-ordering no matter the value of CONFIG_MTD_NAND_ECC_SMC.
>=20
> This is typically the case for the FSMC (Smart Media ordering), TMIO and
> TXX9NDFMC (regular byte ordering) blocks.
>=20
> For all other use cases (pure software implementation, SM FTL and
> nandecctest), we keep selecting the byte ordering based on the
> CONFIG_MTD_NAND_ECC_SMC value. It might not be ideal for SM FTL (I'd
> expect Smart Media ordering to be employed by the Smart Media FTL), but
> this option doesn't seem to be enabled in the existing _defconfig, so
> I can't tell setting sm_order to true is the right choice.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Applied to nand/next with the above typo corrected.

Thanks,
Miqu=C3=A8l
