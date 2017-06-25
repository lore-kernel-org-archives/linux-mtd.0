Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dP93N-0005xq-TH
 for linux-mtd@lists.infradead.org; Sun, 25 Jun 2017 15:02:23 +0000
Date: Sun, 25 Jun 2017 17:01:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] mtd: Fallback to ->_read/write_oob() when
 ->_read/write() is missing
Message-ID: <20170625170158.0cf82223@bbrezillon>
In-Reply-To: <20170624221219.703762e1@bbrezillon>
References: <20170611204255.18622-1-boris.brezillon@free-electrons.com>
 <20170622212606.GF14148@google.com>
 <20170624221219.703762e1@bbrezillon>
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

Le Sat, 24 Jun 2017 22:12:19 +0200,
Boris Brezillon <boris.brezillon@free-electrons.com> a =C3=A9crit :

> Le Thu, 22 Jun 2017 14:26:06 -0700,
> Brian Norris <computersforpeace@gmail.com> a =C3=A9crit :
>=20
> > On Sun, Jun 11, 2017 at 10:42:55PM +0200, Boris Brezillon wrote: =20
> > > Some MTD sublayers/drivers are implementing ->_read/write_oob() and
> > > providing dummy wrappers for their ->_read/write() implementations.
> > > Let the core handle this case instead of duplicating the logic.
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > ---
> > > Note that the goldfish_nand driver (currently in staging) has not been
> > > updated because some the ops->len !=3D mtd->writesize check done in
> > > goldfish_nand_read/write_oob() prevents us from using this function as
> > > a fallback for ->_read/write().
> > >=20
> > > This behavior is buggy anyway, because the core expects drivers
> > > implementing ->_read_oob() to support reading more than ->writesize in
> > > a single call. Probably something we should fix.   =20
> >=20
> > Looks OK to me:
> >=20
> > Acked-by: Brian Norris <computersforpeace@gmail.com>
> >=20
> > This touches NAND drivers more than core MTD stuff, so feel free to take
> > it in your branch. =20
>=20
> Applied to nand/next.

It seems that this patch is triggering a NULL pointer exception,
probably because some code is calling ->_read/write() directly instead
of using mtd_read/write() wrappers.

Removed the from nand/next until I figure out what's happening and come
up with a better solution: either remove direct ->_read/write() calls or
implement a default _read/_write() -> _read/write_oob() wrapper instead
of handling that in the mtd_read/write() function.
