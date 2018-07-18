Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffuA3-0007GZ-H4
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 21:39:05 +0000
Date: Wed, 18 Jul 2018 23:38:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/7] mtd: rawnand: micron: Fix on-die ECC detection logic
Message-ID: <20180718233851.5884696b@xps13>
In-Reply-To: <20180718084221.27821-1-boris.brezillon@bootlin.com>
References: <20180718084221.27821-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 18 Jul 2018
10:42:15 +0200:

> Basing the "mandatory on-die" detection on ID byte 2 does not work,
> because Micron has plenty of NANDs using the same device ID code, and
> not all of them have forcibly enabled on-die ECC.
>=20
> Since the "Array Operation" feature does not provide the "ECC
> enabled/disabled" bit when the ECC can't be disabled, let's try to use
> the "ECC enabled/disabled" bit in the READ_ID bytes.
>=20
> It seems that this bit is dynamically updated on NANDs where on-die ECC
> can freely be enabled/disabled, so let's hope it stays at one when we
> have a NAND with on-die ECC forcibly enabled.
>=20
> Fixes: 51f3b3970a8c ("mtd: rawnand: micron: detect forced on-die ECC")
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Series applied to nand/next in place of the previous -buggy- series,
with your SoB added. Actually as you answered the patches with it,
patchwork/git-pwc added it by itself!

Thanks,
Miqu=C3=A8l
