Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJIk-00033v-68
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:55:59 +0000
Date: Tue, 4 Sep 2018 23:55:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Jagdish Gediya <jagdish.gediya@nxp.com>, Jane
 Wan <Jane.Wan@nokia.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mtd: rawnand: fsl_ifc: fix SRAM initialization
 for newer controller
Message-ID: <20180904235535.165be621@xps13>
In-Reply-To: <20180813071846.9433-1-kurt@linutronix.de>
References: <20180813071846.9433-1-kurt@linutronix.de>
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

Hi Kurt,

Kurt Kanzenbach <kurt@linutronix.de> wrote on Mon, 13 Aug 2018 09:18:44
+0200:

> Hi,
>=20
> this is version two of
>=20
>  lkml.kernel.org/r/20180806092137.9287-1-kurt@linutronix.de
>=20
> Changes since v1:
>=20
>  - Addressed comments from Miquel Raynal
>    - Changed subject
>    - Coding style
>    - Using timeout constants
>    - Moving version check completely into fsl_ifc_sram_init()
>=20
> Thanks,
> Kurt
>=20
> Kurt Kanzenbach (2):
>   mtd: rawnand: fsl_ifc: check result of SRAM initialization
>   mtd: rawnand: fsl_ifc: fixup SRAM init for newer ctrl versions
>=20
>  drivers/mtd/nand/raw/fsl_ifc_nand.c | 36 +++++++++++++++++++++++++++++++=
+----
>  include/linux/fsl_ifc.h             |  2 ++
>  2 files changed, 34 insertions(+), 4 deletions(-)
>=20

Series applied to nand/next.

Thanks,
Miqu=C3=A8l
