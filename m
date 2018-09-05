Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxeVV-0007sk-Ux
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 20:34:36 +0000
Date: Wed, 5 Sep 2018 22:34:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Jacopo Mondi
 <jacopo+renesas@jmondi.org>, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arch/sh: fix build warning in mach-kfr2r09/setup.c
Message-ID: <20180905223419.057a7c39@xps13>
In-Reply-To: <bad8a4af-a99d-c1ea-3494-02dbb0a47f6b@infradead.org>
References: <bad8a4af-a99d-c1ea-3494-02dbb0a47f6b@infradead.org>
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

Hi Randy,

Randy Dunlap <rdunlap@infradead.org> wrote on Wed, 5 Sep 2018 11:17:26
-0700:

> From: Randy Dunlap <rdunlap@infradead.org>
>=20
> arch/sh/boards/mach-kfr2r09/setup.c does not need to #include
> <mtd/onenand.h>, and doing so causes a build warning, so drop
> that header file.
>=20
> In file included from ../arch/sh/boards/mach-kfr2r09/setup.c:28:
> ../include/linux/mtd/onenand.h:225:12: warning: 'struct mtd_oob_ops' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
>      struct mtd_oob_ops *ops);
>=20
> Fixes: f3590dc32974 ("media: arch: sh: kfr2r09: Use new renesas-ceu camer=
a driver")
>=20
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> ---
>  arch/sh/boards/mach-kfr2r09/setup.c |    1 -
>  1 file changed, 1 deletion(-)
>=20
> --- lnx-419-rc1.orig/arch/sh/boards/mach-kfr2r09/setup.c
> +++ lnx-419-rc1/arch/sh/boards/mach-kfr2r09/setup.c
> @@ -25,7 +25,6 @@
>  #include <linux/memblock.h>
>  #include <linux/mfd/tmio.h>
>  #include <linux/mmc/host.h>
> -#include <linux/mtd/onenand.h>
>  #include <linux/mtd/physmap.h>
>  #include <linux/platform_data/lv5207lp.h>
>  #include <linux/platform_device.h>
>=20
>=20

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
