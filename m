Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy0fF-0005GY-Rf
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 20:14:07 +0000
Date: Thu, 6 Sep 2018 22:13:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-mtd@lists.infradead.org, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/2] mtd: nand: reorder nand manufacturer ids
Message-ID: <20180906221353.02af21b0@xps13>
In-Reply-To: <20180906084922.14845-1-marcel@ziswiler.com>
References: <20180906084922.14845-1-marcel@ziswiler.com>
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

Hi Marcel,

Marcel Ziswiler <marcel@ziswiler.com> wrote on Thu,  6 Sep 2018
10:49:21 +0200:

> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> Reorder NAND manufacturer ids for clarity.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> ---

Both patches applied to nand/next with subject prefix s/nand:/rawnand:/
as well as upper-case: s/nand/NAND/ and s/id/ID/ in the commit log.

Thanks,
Miqu=C3=A8l
