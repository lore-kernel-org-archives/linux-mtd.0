Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjSyH-0004Ph-71
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 17:57:54 +0000
Date: Tue, 15 Jan 2019 18:57:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: Handle the tREA > tRC / 2 case
Message-ID: <20190115185739.3dbad9c3@xps13>
In-Reply-To: <20181220141047.31733-1-boris.brezillon@bootlin.com>
References: <20181220141047.31733-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 20 Dec 2018
15:10:47 +0100:

> In non-EDO, tREA should be less than tRP to guarantee that the
> controller does not sample the IO lines too early. Unfortunately, the
> sunxi NAND controller does not allow us to have different values for
> tRP and tREH (tRP =3D tREH =3D tRW / 2).
>=20
> We have 2 options to overcome this limitation:
>=20
> 1/ Extend tRC to fulfil the tREA <=3D tRC / 2 constraint
> 2/ Use EDO mode (only works if timings->tRLOH > 0)
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Applied to nand/next.


Thanks,
Miqu=C3=A8l
