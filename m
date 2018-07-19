Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg3Zr-0003R0-G3
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 07:42:20 +0000
Date: Thu, 19 Jul 2018 09:41:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Stephen
 Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] mtd: rawnand: jz4740: Use the proper format specifier
 to print chipnr
Message-ID: <20180719094143.0dd67bf6@xps13>
In-Reply-To: <20180719073720.19887-1-boris.brezillon@bootlin.com>
References: <20180719073720.19887-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
09:37:20 +0200:

> In jz_nand_detect_bank(), chipnr is a size_t argument. Use %zu instead
> of %i when printing it.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Thanks for fixing Stephen build warning report, I'll apply this patch
before the patch adding COMPILE_TEST for the jz4740 driver.

Miqu=C3=A8l
