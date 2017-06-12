Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dKJ7G-0002Oz-Qh
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 06:46:24 +0000
Date: Mon, 12 Jun 2017 08:45:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] mtd: Fallback to ->_read/write_oob() when
 ->_read/write() is missing
Message-ID: <20170612084558.43fb1e21@bbrezillon>
In-Reply-To: <87poe9vi4b.fsf@belgarion.home>
References: <20170611204255.18622-1-boris.brezillon@free-electrons.com>
 <87poe9vi4b.fsf@belgarion.home>
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

Hi Robert,

Le Mon, 12 Jun 2017 08:24:04 +0200,
Robert Jarzmik <robert.jarzmik@free.fr> a =C3=A9crit :

> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>=20
> > Some MTD sublayers/drivers are implementing ->_read/write_oob() and
> > providing dummy wrappers for their ->_read/write() implementations.
> > Let the core handle this case instead of duplicating the logic. =20
>=20
> Hi Boris,
>=20
> Unless I'm wrong, you're using mtd_oob_ops structures allocated on the
> stack. This means they are not filled with 0/NULL at initialization, and
> therefore the code is not equivalent to what was before in docg3 for exam=
ple.
>=20
> For example, oobbuf field needs initialization. Is it taken care in the c=
ore ?

According to the C99 standard (section 6.7.8.21):

"
If there are fewer initializers in a brace-enclosed list than there are
elements or members of an aggregate, or fewer characters in a string
literal used to initialize an array of known size than there are
elements in the array, the remainder of the aggregate shall be
initialized implicitly the same as objects that have static storage
duration.
"

which should guarantee that uninitialized fields are actually set to 0,
even when the struct is allocated on the stack.

Regards,

Boris
