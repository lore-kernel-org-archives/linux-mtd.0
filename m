Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzM2b-0005lD-3S
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2018 13:15:47 +0000
Date: Mon, 10 Sep 2018 15:15:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: prevent harmless warnings
Message-ID: <20180910151523.38a59b68@xps13>
In-Reply-To: <20180910145744.4a73b068@bbrezillon>
References: <20180907142954.13299-1-miquel.raynal@bootlin.com>
 <20180910145744.4a73b068@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 10 Sep 2018
14:57:44 +0200:

> On Fri,  7 Sep 2018 16:29:54 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Since the addition of WARN_ON() in nand_subop_get_data/addr_len()
> > helpers, this driver will produce harmless warnings (mostly at probe)
> > just because it always called the *_data_len() helper in the parsing =20
>=20
> 			 ^calls
>=20
> > function (even on non-data instructions, where this value is
> > meaningless and unneeded. =20
>=20
> 			  ^ missing ')'
>=20
> >=20
> > Fix these warnings by deriving the length only when it is relevant.
> >=20
> > Fixes: 760c435e0f85 ("mtd: rawnand: make subop helpers return unsigned =
values")
> > Cc: stable@vger.kernel.org =20
>=20
> You can drop the above line this 760c435e0f85 was merged in 4.19-rc1.
>=20
> If you're okay with these changes, no need to send a new version, I'll
> fix it when applying.

Sure, you can apply, thanks for fixing it.

Thanks,
Miqu=C3=A8l
