Received: from mail0.epfl.ch ([128.178.50.57])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17U0Tf-0001D8-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2002 08:41:03 +0100
Received: from fred by rhin with local (Exim 3.35 #1 (Debian))
	id 17U0Tc-0001DF-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2002 09:41:00 +0200
Date: Mon, 15 Jul 2002 09:41:00 +0200
From: Frederic Gobry <frederic.gobry@smartdata.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: mmap question
Message-ID: <20020715074100.GA4582@rhin>
References: <20020701131443.GA10227@rhin> <20020711161909.GA8143@rhin> <20020711191540.GA16466@wohnheim.fh-wedel.de> <10934.1026487279@redhat.com> <20020604132254.GA4911@rhin.smartdata.ch> <20020701131443.GA10227@rhin> <20020711161909.GA8143@rhin> <20020711191540.GA16466@wohnheim.fh-wedel.de> <20020712075715.GA9952@rhin> <20020712150813.GA19718@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <10934.1026487279@redhat.com> <20020712150813.GA19718@wohnheim.fh-wedel.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

J=F6rn said:
> BTW: Did you already try to mmap /dev/mtd* or /dev/mtdblock* ?

Sure, but neither does implement the mmap method.

> One possibility to order the pizza is Joeys:
> http://www.joeys.de/joeys/65/index.htm

Gargl, I'll need to find my french/german dictionnary first (I'm in
the french speaking part of switzerland !) Should I drop you an email
before, or is a pizza always welcome ?

David said:
> Er, ditch the crap 'point' semantics and implement something sane for=20
> mmapping, because that's about the only sane use of point() anyway.

Ok. What was the idea of unpoint, BTW ?

> That's not sufficient. If you let the erase or write operations happen=20
> while it's mapped, what prevents your app from reading from the flash=20
> _during_ the erase/write operation? You need to either prevent the erases/
> writes from happening while the flash is mapped (bad) or arrange for the=
=20
> pages mapped to userspace to be marked invalid during the erase/write=20
> operation, and faults on those pages have to wait until the flash is back=
=20
> in read mode again.

I admit I looked at it from the narrow point of view of my single
process which is safe by construction... I do agree that the only
acceptable solution is the second (disallow page access during write /
erase).

> We want some kind of mtd_remap() call which has its own struct vm_operati=
ons,
> with a nopage() which sets a flag in the state of the underlying mtd_info=
,=20
> and ensure that the page can be found again and made invalid before any=
=20
> other MTD operations. With the rmap VM the latter is quite simple, withou=
t=20
> it we'd need to keep track of all vmas ourselves.

I'm quite a newcomer to VM management (my only experience comes from
"Linux Device Drivers" and what I tested for this driver...). What is
the rmap VM ?

Fr=E9d=E9ric

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9MnyMFjQHpltE9KURAsN9AJ9BZ0cEjdIh5EDeoIREf2hM+FmsRwCffC9m
zrp8wKyw31D/J8uNPJY+mF0=
=1yCl
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
