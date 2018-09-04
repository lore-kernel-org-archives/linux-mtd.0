Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJHk-0001St-T3
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:54:58 +0000
Date: Tue, 4 Sep 2018 23:54:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 1/2] mtd: rawnand: marvell: document a bit more the
 driver
Message-ID: <20180904235434.10b9318b@xps13>
In-Reply-To: <20180805145257.15256-1-miquel.raynal@bootlin.com>
References: <20180805145257.15256-1-miquel.raynal@bootlin.com>
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

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Sun,  5 Aug 2018
16:52:56 +0200:

> A stale document about the old pxa3cc_nand.c driver is available in
> Documentation/mtd/nand/. Rewrite the parts that explain the IP itself
> and some non-trivial choices made in the driver directly in
> marvell_nand.c to then be able to remove this file.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Series applied to nand/next.

Miqu=C3=A8l
