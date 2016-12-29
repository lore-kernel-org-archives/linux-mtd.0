Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMdZG-0000Qf-Ah
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2016 16:28:39 +0000
Date: Thu, 29 Dec 2016 17:28:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: nand: xway: fix build failure
Message-ID: <20161229172814.164145b3@bbrezillon>
In-Reply-To: <c077e285-65e5-f66d-246c-aa58bd88f110@gmail.com>
References: <1482481032-28043-1-git-send-email-sudipm.mukherjee@gmail.com>
 <c077e285-65e5-f66d-246c-aa58bd88f110@gmail.com>
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

+Hauke

Sudip, Marek,

On Fri, 23 Dec 2016 10:07:23 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 12/23/2016 09:17 AM, Sudip Mukherjee wrote:
> > The build of mips xway_defconfig was failing with the error:
> >=20
> > drivers/mtd/nand/xway_nand.c:235:1: warning:
> > 	data definition has no type or storage class
> >  MODULE_DEVICE_TABLE(of, xway_nand_match);
> >  ^~~~~~~~~~~~~~~~~~~
> > drivers/mtd/nand/xway_nand.c:235:1: error:
> > 	type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE'
> > 		[-Werror=3Dimplicit-int]
> >=20
> > It missed to include the header file.
> >=20
> > Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk> =20
>=20
> Acked-by: Marek Vasut <marex@denx.de>

Nack. Hauke already sent a fix for that one, and I'm about to queue it
in my fixes-for-4.10 branch.

Marek, if you want to ack these patches, please review [1] and [2].

Thanks,

Boris

[1]https://patchwork.ozlabs.org/patch/702880/
[2]https://patchwork.ozlabs.org/patch/702879/

>=20
> > ---
> >=20
> > Build log of next-20161223 is at:
> > https://travis-ci.org/sudipm-mukherjee/parport/jobs/186246753
> >=20
> > This error will be fixed but it will now uncover the next error as the
> > build goes on.
> >=20
> >  drivers/mtd/nand/xway_nand.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> > index 1f2948c..00168d6 100644
> > --- a/drivers/mtd/nand/xway_nand.c
> > +++ b/drivers/mtd/nand/xway_nand.c
> > @@ -7,6 +7,7 @@
> >   *  Copyright =C2=A9 2016 Hauke Mehrtens <hauke@hauke-m.de>
> >   */
> > =20
> > +#include <linux/module.h>
> >  #include <linux/mtd/nand.h>
> >  #include <linux/of_gpio.h>
> >  #include <linux/of_platform.h>
> >  =20
>=20
>=20
