Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vacyq-0001RW-EB
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 02:55:00 +0000
Message-ID: <526DD29D.2070407@freescale.com>
Date: Mon, 28 Oct 2013 10:57:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
References: <1379470659-12158-1-git-send-email-b32955@freescale.com>
 <1382780870.5901.20.camel@karhu.quadriga.com>
In-Reply-To: <1382780870.5901.20.camel@karhu.quadriga.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8826=E6=97=A5 17:47, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> What is 'numeraseregions =3D=3D 1'? How is it different to 'numerasereg=
ions
> =3D=3D 0'?
>
> Is the "main" area covered by mtd->size, or 'mtd->size' spans the entir=
e
> chip and includes all the regions?
>
i think the mtd->size spans the entire chip and include the all the regio=
ns.


> What is the flash you are dealing with? Surely this is not gpmi-nand?
I meet this bug with a Micron's Parallel Nor: M29W256GL
it is not used by the gpmi-nand, it's used by weim driver:=20
drivers/bus/imx-weim.c

this NOR's Number of erase block regions is 1, i quote the test here,=20
see page 50
(i will send you the datasheet in a private email):

"
   It specifes the number of regions containning contiguous erase blocks=20
of the same size.

"

please see allocate_partition():

  =20
-------------------------------------------------------------------------=
--------
   if (master->numeraseregions > 1) {
       ................
   } else {
       /* Single erase size */
   }

  =20
-------------------------------------------------------------------------=
--------

this NOR is 32MB, its master partion has 1 for "numeraseregions". if we=20
add a 32MB slave partition
  to this NOR, the slave partition does NOT inherit the numeraseregions=20
of the master partition.
So the ubiattach will succeed with the slave partition.

But if we attach the master partition directly, we will fails.

thanks
Huang Shijie
