Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fipg3-0007YL-JC
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 23:28:13 +0000
Date: Fri, 27 Jul 2018 01:27:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 linux-ia64@vger.kernel.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] sparc64: add reads{b,w,l}/writes{b,w,l}
Message-ID: <20180727012758.664d5dcf@xps13>
In-Reply-To: <20180720102339.22c9aa57@bbrezillon>
References: <20180711120824.3882108-1-arnd@arndb.de>
 <20180711120824.3882108-2-arnd@arndb.de>
 <20180720102339.22c9aa57@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 20 Jul 2018
10:23:39 +0200:

> +Miquel who's in charge of the NAND tree for this release
>=20
> On Wed, 11 Jul 2018 14:08:06 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> > Some drivers need these for compile-testing. On most architectures
> > they come from asm-generic/io.h, but not on sparc64, which has its
> > own definitions.
> >=20
> > Since we already have ioread*_rep()/iowrite*_rep() that have the
> > same behavior on sparc64 (i.e. all PCI I/O space is memory mapped),
> > we can rename the existing helpers and add macros to define them
> > to the same implementation.
> >=20
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de> =20
>=20
> I tried to compile a sparc64 kernel with COMPILE_TEST=3Dy plus the
> orion and s3c2410 NAND drivers enabled and it compiles fine (it does
> without this patch). So it seems to fix the compilation error reported
> by kbuild robots.
>=20
> Tested-by: Boris Brezillon <boris.brezillon@bootlin>
> (only compile-tested)
>=20
> Dave gave his A-b, so, if everyone is okay with that, I'd like this
> patch to go trough the NAND tree.

Applied to nand/next.

Thanks,
Miqu=C3=A8l
