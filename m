Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjSz6-0004s3-1e
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 17:58:46 +0000
Date: Tue, 15 Jan 2019 18:58:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: use struct_size() in devm_kzalloc()
Message-ID: <20190115185804.75e482c3@xps13>
In-Reply-To: <20190104182051.GA3603@embeddedor>
References: <20190104182051.GA3603@embeddedor>
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

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote on Fri, 4 Jan 2019
12:20:51 -0600:

> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>=20
> struct foo {
>     int stuff;
>     void *entry[];
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
> This code was detected with the help of Coccinelle.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to nand/next.


Thanks,
Miqu=C3=A8l
