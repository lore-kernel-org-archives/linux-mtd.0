Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13M8oi-0004h7-00
	for mtd-list@infradead.org; Tue, 08 Aug 2000 13:49:12 +0100
Message-ID: <3990022B.51406A3A@matrox.com>
Date: Tue, 08 Aug 2000 08:50:51 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: get_module_symbol / put_module_symbol
References: <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
>=20
> scote1@Matrox.COM said:
> >  I want to compile MTD builtin in the kernel but the usage of
> > get_module_symbol and put_module_symbol makes it impossible at the
> > moment.  I grepped -r 'put_module_symbol' in linux/drivers/* for linu=
x
> > 2.2.16 and MTD was the only driver using it.  I'm not sure how this
> > should be replaced but I'd really like to get rid of it.
>=20
> There's a fairly small patch to add put_module_symbol() to the 2.2 kern=
el,
> and to change the behaviour of get_module_symbol() accordingly - to mak=
e it
> match the 2.4 versions.
>=20
> If you can come up with a better way to handle use counts, feel free.


The problem is I want to compile a kernel with modules completly
disabled and right now it's not possible.
I COULD enable modules but since I want JFFS on my root partition, MTD
must be built in and I don't have any use for any other module.

But as I see it, the only problem is that get_module_sumbol() and
put_...() are called even if MTD isn't a module.  There's no need to
track use counts when you're not a module, right ?

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
