Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffhEN-0006ph-Bj
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 07:50:40 +0000
Date: Wed, 18 Jul 2018 09:50:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand/raw: MTD_NAND_BCM47XXNFLASH needs CONFIG_BCMA
Message-ID: <20180718095017.4efa2b37@xps13>
In-Reply-To: <20180711104446.69af988a@bbrezillon>
References: <20180711084010.57950-1-arnd@arndb.de>
 <20180711104446.69af988a@bbrezillon>
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

Hi Arnd,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 11 Jul 2018
10:44:46 +0200:

> On Wed, 11 Jul 2018 10:39:44 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> > We already have a dependency on BCMA_NFLASH, which in turn depends on
> > BCMA, but since BCMA is a tristate option and BCMA_NFLASH is bool,
> > we can run into an invalid configuration with MTD_NAND_BCM47XXNFLASH=3Dy
> > and BCMA=3Dm:
> >=20
> > drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.o: In function `bcm47xxn=
flash_ops_bcm4706_init':
> > ops_bcm4706.c:(.text+0x790): undefined reference to `bcma_chipco_pll_re=
ad'
> >=20
> > Adding the dependency here forces MTD_NAND_BCM47XXNFLASH to only be
> > configured =3Dm here so it can link against the BCMA driver.
> >=20
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de> =20
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
>=20

Applied with prefix changed to "mtd: rawnand:".

Thanks,
Miqu=C3=A8l
