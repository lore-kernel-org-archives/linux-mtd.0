Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUt3e-0007gj-Li
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 12:14:56 +0000
Date: Mon, 18 Jun 2018 14:14:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@sigma-star.at>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>, Rob Herring
 <robh@kernel.org>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: rawnand: denali_dt: use dev as a shorthand of
 &pdev->dev
Message-ID: <20180618141431.68ca434e@xps13>
In-Reply-To: <20180618135410.5a480ccd@xps13>
References: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com>
 <20180618135410.5a480ccd@xps13>
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

Hi Masahiro,

On Mon, 18 Jun 2018 13:54:10 +0200, Miquel Raynal
<miquel.raynal@bootlin.com> wrote:

> Hi Masahiro,
>=20
> On Tue, 12 Jun 2018 19:31:54 +0900, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>=20
> > Add 'dev' as a shorthand before adding more code that takes a
> > pointer to struce device. =20
>=20
> s/struce/a struct/?
>=20
> >=20
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com> =20
>=20
> With this fixed:
>=20
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

I missed the two next versions with Boris/Richard reviews, forget about
this one.

Sorry for the inconvenience,
Miqu=C3=A8l
