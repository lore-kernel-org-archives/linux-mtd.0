Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffhC8-0004Uu-FF
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 07:48:22 +0000
Date: Wed, 18 Jul 2018 09:47:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Abhishek Sahu
 <absahu@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, Masahiro
 Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nand: ranw: qcom_nand: stop using phys_to_dma()
Message-ID: <20180718094758.785ea21f@xps13>
In-Reply-To: <20180717223359.43dc5dfb@bbrezillon>
References: <20180717202759.2288076-1-arnd@arndb.de>
 <20180717223359.43dc5dfb@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
22:33:59 +0200:

> On Tue, 17 Jul 2018 22:27:42 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> > Compile-testing this driver on x86 caused a link error:
> >=20
> > ERROR: "__phys_to_dma" [drivers/mtd/nand/raw/qcom_nandc.ko] undefined!
> >=20
> > The problem here is that the driver attempts to convert the physical
> > address into the DMA controller as a dma_addr_t and calls phys_to_dma()
> > to do the conversion.
> >=20
> > The correct way to do the conversion is using the dma mapping interface=
s.
> >=20
> > Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de> =20
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
>=20
> Miquel, can you fix the subject prefix when applying?

Applied to nand/next with the subject prefix being:
"mtd: rawnand: qcom:"

Thanks
Miqu=C3=A8l
