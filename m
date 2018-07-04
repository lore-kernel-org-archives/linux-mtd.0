Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faibv-0001CM-F5
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 14:18:25 +0000
Date: Wed, 4 Jul 2018 16:18:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: hynix: Use ->exec_op() in
 hynix_nand_reg_write_op()
Message-ID: <20180704161801.4db69955@xps13>
In-Reply-To: <20180704140858.28424-1-boris.brezillon@bootlin.com>
References: <20180704140858.28424-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed,  4 Jul 2018
16:08:58 +0200:

> Modern NAND controller drivers implement ->exec_op() instead of
> ->cmdfunc(), make sure we don't end up with a NULL pointer dereference =20
> when hynix_nand_reg_write_op() is called.
>=20
> Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
