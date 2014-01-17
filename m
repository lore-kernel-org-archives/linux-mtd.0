Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W42KN-0007kR-4d
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 05:50:47 +0000
Date: Fri, 17 Jan 2014 13:14:16 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: add support for Samsung K9LCG08U0B
Message-ID: <20140117051415.GA24683@shlinux2.ap.freescale.net>
References: <1387963135-22142-1-git-send-email-b32955@freescale.com>
 <20140116213637.GH8919@ld-irv-0074>
 <20140117014048.GA27652@shlinux2.ap.freescale.net>
 <CAN8TOE-6gwR1fXM_unGUo27JhLsZiUBXhTsGa+GD8tbe-kRf_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAN8TOE-6gwR1fXM_unGUo27JhLsZiUBXhTsGa+GD8tbe-kRf_A@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 16, 2014 at 09:41:38PM -0800, Brian Norris wrote:
> On Thu, Jan 16, 2014 at 5:40 PM, Huang Shijie <b32955@freescale.com> wr=
ote:
> > On Thu, Jan 16, 2014 at 01:36:37PM -0800, Brian Norris wrote:
> >> > +           case 7:
> >> > +                   mtd->oobsize =3D SZ_1K;
> >>
> >> #include <linux/sizes.h>
> >>
> >> Did you compile this?
> > we do not need this header.
>=20
> My compiler begs to differ :)
>=20
>   CC [M]  drivers/mtd/nand/nand_base.o
> drivers/mtd/nand/nand_base.c: In function =E2=80=98nand_decode_ext_id=E2=
=80=99:
> drivers/mtd/nand/nand_base.c:3159:19: error: =E2=80=98SZ_1K=E2=80=99 un=
declared (first
> use in this function)
>     mtd->oobsize =3D SZ_1K;
>                    ^
> drivers/mtd/nand/nand_base.c:3159:19: note: each undeclared identifier
> is reported only once for each function it appears in
> make[3]: *** [drivers/mtd/nand/nand_base.o] Error 1
> make[2]: *** [drivers/mtd/nand] Error 2
> make[1]: *** [drivers/mtd] Error 2
> make: *** [drivers] Error 2
>=20
> Maybe different ARCH's have implicit includes. But in any case, it's

yes. i only tested in my imx6 board.=20
> standard practice to explicitly include the headers you're using.
got it.


>=20
> > I had already tested this patch with the l2-mtd tree.
> >
> >>
> >> Anyway, I think just using the literal 1024 is better. I can fix it =
up
> >> and push myself in a bit.
> > Different person has different taste. :)
>=20
> Well, all the other sizes are literals.
>=20
> > It is okay to me if you the literal 1024.
>=20
> You also dropped the 'default' case, which leaves out the 0 case. I'll
> reintroduce the default, to go along with case 7. I'll post the
> complete patch here when/if I push it.
should i resend a new patch? or you fix it yourself?

thanks
Huang Shijie
