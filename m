Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZkH6-0001fl-65
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 21:20:37 +0000
Date: Thu, 11 Jan 2018 22:20:20 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix nand_do_read_oob() return value
Message-ID: <20180111222020.208d2359@xps13>
In-Reply-To: <20180111203958.8211-1-miquel.raynal@free-electrons.com>
References: <20180111203958.8211-1-miquel.raynal@free-electrons.com>
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

On Thu, 11 Jan 2018 21:39:58 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Starting from commit 041e4575f034 ("mtd: nand: handle ECC errors in
> OOB"), nand_do_read_oob() (from the NAND core) did return 0 or a
> negative error, and the MTD layer expected it.
>=20
> However, the trend for the NAND layer is now to return an error or a
> positive number of bitflips. Deciding which status to return to the
> user belongs to the MTD layer.
>=20
> Commit e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
> brought this logic to the mtd_read_oob() function while the status
> coming from nand_do_read_oob() (called by the ->ecc.read_oob() hook)
> was left unchanged.
>=20
> Fixes: e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---

Oops, patch untested, will send a v2, sorry for the noise.

Thanks,
Miqu=C3=A8l
