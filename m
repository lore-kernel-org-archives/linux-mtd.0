Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eeKWP-0003Xq-Nb
 for linux-mtd@lists.infradead.org; Wed, 24 Jan 2018 12:51:24 +0000
Date: Wed, 24 Jan 2018 13:51:06 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: nand: gpmi: Fix subpage reads
Message-ID: <20180124135106.2a145a11@xps13>
In-Reply-To: <20180123101317.15925-1-boris.brezillon@free-electrons.com>
References: <20180123101317.15925-1-boris.brezillon@free-electrons.com>
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

Hello Boris,

On Tue, 23 Jan 2018 11:13:17 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Commit 25f815f66a14 ("mtd: nand: force drivers to explicitly send
> READ/PROG commands") added a call to nand_read_page_op() in
> gpmi_ecc_read_page(), which means this function now sends a READ0
> command and place the data pointer at the beginning of the page. This
> logic is breaking gpmi_ecc_read_subpage() which was calling
> gpmi_ecc_read_page() and expected it to only retrieve the data without
> sending the READ0 command.
>=20
> Create a gpmi_ecc_read_page_data() helper which only does the data
> retrieval and ECC correction steps and implement gpmi_ecc_read_page()
> as a wrapper that calls nand_read_page_op()+gpmi_ecc_read_page_data().
>=20
> This way, gpmi_ecc_read_subpage() can call gpmi_ecc_read_page_data()
> which restores the logic we had before commit 25f815f66a14 ("mtd: nand:
> force drivers to explicitly send READ/PROG commands").
>=20
> Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PR=
OG commands")
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Thanks for fixing it,
Miqu=C3=A8l
