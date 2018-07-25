Date: Wed, 25 Jul 2018 14:47:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Mans Rullgard <mans@mansr.com>, Maxime
 Ripard <maxime.ripard@bootlin.com>, Stefan Agner <stefan@agner.ch>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu
 <rainyfeeling@outlook.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Marek
 Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom
 Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Sylvain
 Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vladimir Zapolskiy
 <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Xiaolei
 Li <xiaolei.li@mediatek.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Richard Weinberger <richard@nod.at>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 04/35] mtd: rawnand: denali: convert to nand_scan()
Message-ID: <20180725144717.604d3197@xps13>
In-Reply-To: <20180725115116.1fb38fe3@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-5-miquel.raynal@bootlin.com>
 <CAK7LNASmJRWM7Gj9qqqZqwenPkoRFeA8tupx+3PKPXC6OxD_eA@mail.gmail.com>
 <20180725115116.1fb38fe3@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 25 Jul 2018
11:51:16 +0200:

> On Wed, 25 Jul 2018 18:42:44 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>=20
> >=20
> > You need to remove kfree(denali->buf)
> > from denali_remove(), right? =20
>=20
> Absolutely.
>=20
> >=20
> > void denali_remove(struct denali_nand_info *denali)
> > {
> >         struct mtd_info *mtd =3D nand_to_mtd(&denali->nand);
> >=20
> >         nand_release(mtd);
> >         kfree(denali->buf);       <---- REMOVE !!
> >         denali_disable_irq(denali);
> > }
> >=20
> >=20
> > Otherwise, denali_remove() will free denali->buf twice
> > because kfree(denali->buf) is called from denali_detach_chip(). =20
>=20

Absolutely, thanks for reviewing!

I'll apply with this changed.

Miqu=C3=A8l
