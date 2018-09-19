Date: Wed, 19 Sep 2018 23:27:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: atmel: Fix potential NULL pointer
 dereference
Message-ID: <20180919232745.4ed2197c@xps13>
In-Reply-To: <20180918135555.GA18114@embeddedor.com>
References: <20180918135555.GA18114@embeddedor.com>
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

Hi Gustavo,

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote on Tue, 18 Sep
2018 08:55:55 -0500:

> There is a potential execution path in which function
> of_find_compatible_node() returns NULL. In such a case,
> we end up having a NULL pointer dereference when accessing
> pointer *nfc_np* in function of_clk_get().
>=20
> So, we better don't take any chances and fix this by null
> checking pointer *nfc_np* before calling of_clk_get().
>=20
> Addresses-Coverity-ID: 1473052 ("Dereference null return value")
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
