Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPwXI-0000Jw-4C
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 19:52:33 +0000
Date: Tue, 27 Jun 2017 21:52:00 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Robert
 Jarzmik <robert.jarzmik@free.fr>, Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v2 1/2] mtd: Stop directly calling master ->_xxx() hooks
 from mtdpart code
Message-ID: <20170627215200.71248cb3@bbrezillon>
In-Reply-To: <20170627211938.05abf5ac@bbrezillon>
References: <20170625160113.11860-1-boris.brezillon@free-electrons.com>
 <20170627184614.GC55942@google.com>
 <20170627211938.05abf5ac@bbrezillon>
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

Le Tue, 27 Jun 2017 21:19:38 +0200,
Boris Brezillon <boris.brezillon@free-electrons.com> a =C3=A9crit :

> >=20
> > [...]
> >=20
> > I was also wondering whether this patch couldn't go a step further, and
> > remove conditions like this:
> >=20
> > 	if (parent->_panic_write)
> > 		slave->mtd._panic_write =3D part_panic_write;=20
> >=20
> > Since part_panic_write() should call mtd_panic_write() on the parent
> > (master), which would do its own -EOPNOTSUPP check. But then I suppose
> > that might invert the order of the checks, causing (for example) -EINVAL
> > for out-of-bounds panic write instead of -EOPNOTSUPP. So maybe that's
> > better left alone. =20
>=20
> I considered doing that but was too lazy to check if all helpers were
> properly checking the pointer value before dereferencing it :).

I just checked, and it seems we can unconditionally set part hooks and
rely on default mtd_xxx() helpers to detect when the feature is not
supported by the master.
