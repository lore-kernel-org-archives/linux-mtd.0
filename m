Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLwiA-0001yx-Ms
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 20:52:04 +0000
Date: Sun, 11 Nov 2018 21:51:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Fix unchecked return value in
 fsmc_read_page_hwecc
Message-ID: <20181111215149.72ab683e@xps13>
In-Reply-To: <20181010155857.GA18860@embeddedor.com>
References: <20181010155857.GA18860@embeddedor.com>
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

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote on Wed, 10 Oct
2018 17:58:58 +0200:

> Check return value of nand_read_data_op.
>=20
> Notice that, currently, all instances of nand_read_data_op() are
> being checked, with the exception of two of them in marvell_nand
> driver, in which the caller function explicitly returns 0 every
> time.
>=20
> Also, notice that I moved the declaration of *ret* to the top of
> fsmc_read_page_hwecc().
>=20
> Addresses-Coverity-ID: 1471968 ("Unchecked return value")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
