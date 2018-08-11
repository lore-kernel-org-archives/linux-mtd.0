Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1foUWQ-0002iY-Gt
 for linux-mtd@lists.infradead.org; Sat, 11 Aug 2018 14:05:40 +0000
Date: Sat, 11 Aug 2018 16:05:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: atmel: Select GENERIC_ALLOCATOR
Message-ID: <20180811160524.0e549c24@xps13>
In-Reply-To: <20180811134712.2903-1-boris.brezillon@bootlin.com>
References: <20180811134712.2903-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Sat, 11 Aug 2018
15:47:12 +0200:

> The driver uses genalloc functions. Select GENERIC_ALLOCATOR to prevent
> build errors when selected through COMPILE_TEST.
>=20
> Fixes: 88a40e7dca00 ("mtd: rawnand: atmel: Allow selection of this driver=
 when COMPILE_TEST=3Dy")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - Use select instead of depends on (suggested by Thomas)
> ---

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

That's for your -rc1's fixes PR :)

Thanks,
Miqu=C3=A8l
