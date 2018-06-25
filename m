Date: Mon, 25 Jun 2018 14:31:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: raw: atmel: add module param to avoid using dma
Message-ID: <20180625143121.0104a671@xps13>
In-Reply-To: <20180618103908.17a04679@bbrezillon>
References: <20180329131054.22506-1-peda@axentia.se>
 <20180618103908.17a04679@bbrezillon>
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

Hi Peter,

On Mon, 18 Jun 2018 10:39:08 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> On Thu, 29 Mar 2018 15:10:54 +0200
> Peter Rosin <peda@axentia.se> wrote:
>=20
> > On a sama5d31 with a Full-HD dual LVDS panel (132MHz pixel clock) NAND
> > flash accesses have a tendency to cause display disturbances. Add a
> > module param to disable DMA from the NAND controller, since that fixes
> > the display problem for me.
> >=20
> > Signed-off-by: Peter Rosin <peda@axentia.se> =20
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
>=20
> Miquel, can you queue this one to nand/next.
>=20

Applied to nand/next with the prefix changed to "mtd: rawnand: atmel:".

Thanks,
Miqu=C3=A8l
