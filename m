Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SO6EW-00023Z-6E
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 11:54:37 +0000
Received: by lboj14 with SMTP id j14so1287623lbo.36
 for <linux-mtd@lists.infradead.org>; Sat, 28 Apr 2012 04:54:33 -0700 (PDT)
Message-ID: <1335614070.1937.10.camel@koala>
Subject: Re: UBIFS switched to read-only mode after make_reservation warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matteo Mattei <matteo.mattei@gmail.com>
Date: Sat, 28 Apr 2012 14:54:30 +0300
In-Reply-To: <CAHea38Td0PrZSr2c8g12UvVgOsTdKi_-sXhbnizzyEG+U91sVg@mail.gmail.com>
References: <CAHea38Td0PrZSr2c8g12UvVgOsTdKi_-sXhbnizzyEG+U91sVg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kE2xqjg9yaGm0Y8XQpYS"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kE2xqjg9yaGm0Y8XQpYS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-24 at 17:46 +0200, Matteo Mattei wrote:
> Hi guys,
>=20
> continuing the tests on UBI/UBIFS and power cyclings I have the
> following errors (dumping dmesg):
>=20
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (123)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (124)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (125)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (126)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (127)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (128)
> UBIFS error (pid 776): make_reservation: stuck in space allocation
> UBIFS error (pid 776): make_reservation: cannot reserve 4144 bytes in
> jhead 2, error -28
> UBIFS error (pid 776): do_writepage: cannot write page 2075 of inode
> 80294, error -28
> UBIFS warning (pid 776): ubifs_ro_mode: switched to read-only mode, error=
 -28

Please, when sending bug-reports - type dmesg and sent its contents.
You miss stack-dumps. Also, please, have debugging enabled.

> Do you have any idea on what happened and how to fix this?
> Which are the conditions that lead this behavior?

Not really, if you sent more info - could be.  Did you read this:
http://linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

Is this reproducible?

--=20
Best Regards,
Artem Bityutskiy

--=-kE2xqjg9yaGm0Y8XQpYS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPm9p2AAoJECmIfjd9wqK0M6cP/1bC7rpoYPyQ0/G6EqOA1JSU
jyfN62bFElUXU6r7irlovfIiDT1I8zyVE9yoQ9VTtZ5DRLeR0X82F+9Ee393fXs5
U7qqN6/S6als4E7ZlZVUG9LFPdPzZO7ttPIBlvKmHF1TVKvtsW0iADTz35Lldjx4
JssS/4wklHRsCfSq9gc8w3b3c0RsnKXn4q0/R5AoWu3fQB2DNVRrvmtwmmlSJoGp
7phaOiFUyMakUWtJuA3CRee0ihNDiHXBmmk5keQ+G45GsvS+FE+n8qammYzKR+0A
2YPDYowwnkd3ZCmCrcGCnXVJ23G1a/72HNRxPAX17iVt1uiN2sdgmm1MVOWxzotD
57PeFiImfQhWjW8Qu4O1viVlrsM4ZVc5R6DEB9JaTG0qVcH2OajQBg9+ZD64GO2Y
MJLdZ8vdP+zps4GfKrTu4NmBbjnwNr3/vdrg5FcsHy/LqBYdQJx2/VYCfEHHoUgX
qP4+BATLedWEjQmpsIQn/2d3yARv15tWc/x8VbKtTiDMjI5vmTbue1yn5kYlVLUZ
g8CodJ5R6PfviOcYW5I4tv/mzmkTOFlrPRdICmzq3LvXIHY3S3wWVnB4U6RB76sN
fT58ggSm5Sg0xclYKzLZIC3p/2yOYbFtVo3whVxEoF6pw92eeazUc0wB45ln5zYZ
OXLcLXA9JlBFU3RQLGSU
=kyxm
-----END PGP SIGNATURE-----

--=-kE2xqjg9yaGm0Y8XQpYS--
