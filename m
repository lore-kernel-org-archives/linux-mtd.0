Date: Tue, 4 Sep 2018 23:58:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Josh Wu <rainyfeeling@outlook.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kees
 Cook <keescook@chromium.org>
Subject: Re: [PATCH] mtd: rawnand: atmel: use struct_size() in devm_kzalloc()
Message-ID: <20180904235816.4b239b7a@xps13>
In-Reply-To: <20180824010938.GA25581@embeddedor.com>
References: <20180824010938.GA25581@embeddedor.com>
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

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote on Thu, 23 Aug
2018 20:09:38 -0500:

> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>=20
> struct foo {
> 	int stuff;
>         void *entry[];
> };
>=20
> instance =3D devm_kzalloc(dev, sizeof(struct foo) + sizeof(void *) * coun=
t, GFP_KERNEL);
>=20
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
>=20
> instance =3D devm_kzalloc(dev, struct_size(instance, entry, count), GFP_K=
ERNEL);
>=20
> This issue was detected with the help of Coccinelle.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
