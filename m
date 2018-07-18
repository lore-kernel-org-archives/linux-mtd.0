Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffu7q-0006Em-3K
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 21:36:47 +0000
Date: Wed, 18 Jul 2018 23:36:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Stop using chip->read_buf()
Message-ID: <20180718233633.3416f720@xps13>
In-Reply-To: <20180718082814.17203-1-boris.brezillon@bootlin.com>
References: <20180718082814.17203-1-boris.brezillon@bootlin.com>
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
10:28:14 +0200:

> chip->read_buf is left unassigned since commit 4da712e70294 ("mtd: nand:
> fsmc: use ->exec_op()"), leading to a NULL pointer dereference when it's
> called from fsmc_read_page_hwecc(). Fix that by using the appropriate
> helper to read data out of the NAND.
>=20
> Fixes: 4da712e70294 ("mtd: nand: fsmc: use ->exec_op()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---,

Thanks for the fix.

As nobody complained I don't think it is urgent to get it
merged so I applied it to nand/next.

Thanks,
Miqu=C3=A8l
