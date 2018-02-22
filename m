Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eoslI-0000Nv-TC
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 15:26:25 +0000
Date: Thu, 22 Feb 2018 16:25:58 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, boris.brezillon@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH NAND v3] mtd: nand: Replace printk() with appropriate
 pr_*() macro
Message-ID: <20180222162558.3f5cfcad@bbrezillon>
In-Reply-To: <1519310758.2359.3.camel@gmail.com>
References: <1519305014-2547-1-git-send-email-shreeya.patel23498@gmail.com>
 <2093598.TLbMltDcSo@blindfold> <1519310758.2359.3.camel@gmail.com>
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

On Thu, 22 Feb 2018 20:15:58 +0530
Shreeya Patel <shreeya.patel23498@gmail.com> wrote:

> On Thu, 2018-02-22 at 15:30 +0100, Richard Weinberger wrote:
> > Am Donnerstag, 22. Februar 2018, 14:10:14 CET schrieb Shreeya Patel: =20
> > >=20
> > > @@ -438,7 +438,7 @@ static void __init doc2000_count_chips(struct
> > > mtd_info
> > > *mtd) break;
> > > =C2=A0	}
> > > =C2=A0	doc->chips_per_floor =3D i;
> > > -	printk(KERN_DEBUG "Detected %d chips per floor.\n", i);
> > > +	pr_debug("Detected %d chips per floor.\n", i); =20
> > <bike-shedding>
> >=20
> > You are aware of the fact that printk(KERN_DEBUG and pr_debug() are
> > not=C2=A0
> > equivalent?
> > Not a big deal, just want to make sure that you understand what you
> > are doing.=C2=A0 =20
>=20
> Actually pr_debug() shouldn't be used here.
>=20
> We usually don't prefer pr_debug for drivers, instead we use dev_dbg.
> But as Boris told me that it will be better to first having changed all
> printks to pr_*() macro and then think about dev_*() macros.

BTW, I see a bunch of remaining printks when I do 'git grep printk
drivers/mtd/nand', basically all those that don't have a
KERN_<LOGLEVEL> in it. I know your commit log explicitly says that only
printks embedding a log level are converted to pr_xxx(), but it's
probably worth patching those printks as well (choosing the appropriate
log level between info, err and warn and use pr_xxx() helpers).
This should be done in a separate patch of course.

>=20
> > :-)
> >=20
> > </bike-shedding>
> >=20
> > Thanks,
> > //richard =20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
