Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ob9wh-00047b-U3
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 10:21:09 +0000
Message-ID: <4C457885.9000404@pengutronix.de>
Date: Tue, 20 Jul 2010 12:20:53 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] mxc_nand: fix Unbalanced enable for IRQ
References: <1276178584-10074-1-git-send-email-eric@eukrea.com>
	<1279345824.3212.24.camel@localhost.localdomain>
In-Reply-To: <1279345824.3212.24.camel@localhost.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig2F7E3CF394C91174153354AB"
Cc: s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de,
	linux-mtd@lists.infradead.org, ivo.clarysse@gmail.com,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2F7E3CF394C91174153354AB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Artem,

Artem Bityutskiy wrote:
> On Thu, 2010-06-10 at 16:03 +0200, Eric B=C3=A9nard wrote:
>> * preset should be done before sending the reset command
>>
>> * without this, I get the following error on an i.MX35 :
>> [    0.900000] ------------[ cut here ]------------
>> [    0.900000] WARNING: at kernel/irq/manage.c:290 __enable_irq+0x4c/0=
x88()
>> [    0.900000] Unbalanced enable for IRQ 33
>> [    0.900000] Modules linked in:
>> [    0.900000] [<c002ffb8>] (unwind_backtrace+0x0/0xf0) from [<c02f7d0=
c>] (dump_stack+0x18/0x1c)
>> [    0.900000] [<c02f7d0c>] (dump_stack+0x18/0x1c) from [<c0049a44>] (=
warn_slowpath_common+0x54/0x6c)
>> [    0.900000] [<c0049a44>] (warn_slowpath_common+0x54/0x6c) from [<c0=
049b00>] (warn_slowpath_fmt+0x38/0x40)
>> [    0.900000] [<c0049b00>] (warn_slowpath_fmt+0x38/0x40) from [<c008f=
65c>] (__enable_irq+0x4c/0x88)
>> [    0.900000] [<c008f65c>] (__enable_irq+0x4c/0x88) from [<c008fca0>]=
 (enable_irq+0x54/0x98)
>> [    0.900000] [<c008fca0>] (enable_irq+0x54/0x98) from [<c021e618>] (=
wait_op_done+0x40/0x134)
>> [    0.900000] [<c021e618>] (wait_op_done+0x40/0x134) from [<c021e808>=
] (send_cmd+0x30/0x38)
> ....
>=20
> Pushed to l2-mtd-2.6.git / master

Current mainline has (still) this problem, too. Is there any change to
get this patch into 2.6.35 before the release?

cheers, Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig2F7E3CF394C91174153354AB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkxFeIkACgkQjTAFq1RaXHOsEwCglMFQ5TCkNz5oueG7fgCRl79M
QqsAn26wk20meMgcUDKxqK/nnmu6Q7+K
=dQCt
-----END PGP SIGNATURE-----

--------------enig2F7E3CF394C91174153354AB--
