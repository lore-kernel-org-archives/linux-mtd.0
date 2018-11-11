Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLwju-0002Cj-7i
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 20:53:51 +0000
Date: Sun, 11 Nov 2018 21:53:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: denali: include <linux/bits.h> instead of
 <linux/bitops.h>
Message-ID: <20181111215336.049ca786@xps13>
In-Reply-To: <1539664401-17651-1-git-send-email-yamada.masahiro@socionext.com>
References: <1539664401-17651-1-git-send-email-yamada.masahiro@socionext.com>
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

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 16 Oct
2018 13:33:21 +0900:

> The reason of including <linux/bitops.h> here is just for BIT() and
> GENMASK macros.
>=20
> Since commit 8bd9cb51daac8 ("locking/atomics, asm-generic: Move some
> macros from <linux/bitops.h> to a new <linux/bits.h> file"),
> <linux/bits.h> is enough for such compile-time macros.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
