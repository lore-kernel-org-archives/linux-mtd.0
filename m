Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScPyj-0001zO-Lv
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 23:49:30 +0000
Received: by wgbds1 with SMTP id ds1so13483wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2012 16:49:27 -0700 (PDT)
Message-ID: <1339026321.8066.19.camel@brekeke>
Subject: Re: [PATCH 1/5] UBI: fastmap: add more TODOs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 07 Jun 2012 02:45:21 +0300
In-Reply-To: <4FCFEBC2.9000009@nod.at>
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
 <1338909119-5188-2-git-send-email-dedekind1@gmail.com>
 <4FCFCBDD.8030907@nod.at> <1339025892.8066.16.camel@brekeke>
 <4FCFEBC2.9000009@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iYS18Z12auBNr9SHGay7"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iYS18Z12auBNr9SHGay7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-07 at 01:46 +0200, Richard Weinberger wrote:
> >> To catch UBI_IO_BAD_HDR, UBI_IO_BAD_HDR_EBADMSG and friends.
> >=20
> > Which are never returned by ubi_io_read().
>=20
> Also never ever in future?
> If so, I'll drop this check.=20

Well, if you read those constants they suggest that they are specific to
functions which read the UBI headers. ubi_io_read() function is just a
general read function which is just a simple wrapper over mtd_read()
plus re-trying, nice error messaging, debugging prints, some error codes
handling, nothing else.

So no, it is not going to ever check UBI headers and return those codes.

/me goes to sleep.

--=20
Best Regards,
Artem Bityutskiy

--=-iYS18Z12auBNr9SHGay7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz+uRAAoJECmIfjd9wqK0xEgP/3w77IDpOhJ4c3OEQ9iW8h3b
KBiiMqJIBCuAT6i4B+vcHqs24jb6uSkJ5IafsIY5sy7nxgOGpHOJ5s1niZnUrAyD
M9DUIUegoS+uXxLoY4+4iOzLv7XG3gYLAlwR4c5yoyxaiAq8fqrkGSktAO7Z7Bgz
UoyML6mHX5IkdKey6vBQudUCz2ZV5CQLwaPWoe4zMzLirk0ZP9tjWlTkaJzkbP4W
gd3VrrUhPZ2Hq1dOYWCTWxfKPnxOyZFyWv6aWqlm4He0MW3YcZVl8mO4YjKgcZNF
kpNvM08vd7HUIRZZ12wNq6NR1xgLTjZGzKwAVGveeCu6qQ8gIuC4pX1GtX7env6K
Zv8vz0VELcAUBdSGf0uq9BWmrOjNHW5A9Z7wM+vOIsmu0Noluc0afqIY3wh9OhBY
t7cZvZwa2yPmUPg5CX/BuyKC+QUWwwH002j9hQ9YEWgLnzpHzdqYA9MnKgqB/1CQ
qCOEozU4ZmeBPVdhEJ3qnh3egeCD1vznIBc+2vmqCrtPxofyZFHCNqP0Gyf6NXsM
ay3BJ2mDfGIoJM1BYDRbzDP2laBZclr8MF47dW1OooYThFip4pTT23szujCntn7M
XhTifkt7zr24P5riQiMxtK1bUdzcOxG9XKY+rS2iXcISSxOuBnoN0d82RGgbL0CK
I4N1W01JpGUPdmStupgH
=mOf7
-----END PGP SIGNATURE-----

--=-iYS18Z12auBNr9SHGay7--
