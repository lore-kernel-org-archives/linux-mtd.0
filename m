Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UU5T8-0003jS-AF
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 01:22:58 +0000
Message-ID: <1366593764.3408.133.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [ 10/11] mtdchar: fix offset overflow detection
From: Ben Hutchings <ben@decadent.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 22 Apr 2013 02:22:44 +0100
In-Reply-To: <1366059320.3072.65.camel@shinybook.infradead.org>
References: <20130415020614.067692418@linuxfoundation.org>
 <20130415020614.846683113@linuxfoundation.org>
 <1366059320.3072.65.camel@shinybook.infradead.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-uycp4Q+gsp3Xv78hwP0k"
Mime-Version: 1.0
Cc: Brad Spengler <spender@grsecurity.net>,
 Suresh Siddha <suresh.b.siddha@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uycp4Q+gsp3Xv78hwP0k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-04-15 at 21:55 +0100, David Woodhouse wrote:
> On Sun, 2013-04-14 at 19:17 -0700, Greg Kroah-Hartman wrote:
> > 3.0-stable review patch.  If anyone has any objections, please let me k=
now.
>=20
> Please use f5cf8f07423b2677cebebcebc863af77223a4972 instead (for 3.4
> too).

I've queued that up for 3.2, thanks.

Ben.

--=20
Ben Hutchings
Klipstein's 4th Law of Prototyping and Production:
                                    A fail-safe circuit will destroy others=
.

--=-uycp4Q+gsp3Xv78hwP0k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUXSQ5Oe/yOyVhhEJAQqxNA//YjPQNQY2nWD1GpQz1lyAaymlyXDQbV2m
2v4Zm6V3eJ7F/jRyKMwKbVq8DcvFjnUoO7IZEOWBEh5OODVuNY0MW44Ia3/FC0Si
hzKsgHB2r3S0cVtkRDuElITZdzxrWtn9Px7HDCh7qhUzqI60J3mdGj+CyYZMRQb3
IiB4aw25YlmdW252Ws9GaL4Yd+IMgrl73jbHmHweHvohOiNNeRFSIIyOvjh4xi0+
X+G9sUnYvAJnX2Ck8fA1xvC/q/4ErTdKBMB54TotuzT0hPg3Z7a/lYihLNmew32o
9yjYbON9UW8KvJdi0fv3TgG38LWbXx7ehz+NXKQLtuyTR1uyjcwxHTPehvBJ0Qq/
vx4HLJ47Qpq6WHxtS+5NUKlJtntPrMinOAed8TKH5R8cNfRhuQJ11i/+6Ki/km1r
7ejc0Pa4I8mp7Uzd/hkvYZG2/F5uLn/bHqNxA4w1/QDXutsGr8e/icFeucaGwWTr
fAZ4S2tM0t5oJfwAA+qp8rYQfK4o8gvIsAJwZLvd8NkrSf/zj5Ah2OYWhga9f/f8
fThX47gmebofXBdznNXQQQ/mQls8g8zI44dF0mhxQwikMiJD4k1fRkhi4JGUF6/W
PTvDZ5fDULFCLsQ8ExlanWdpO2AfWnE5xHx/q+jQ255z2F21gvhqQ1wpsEUebScp
RsNcKIKkPa8=
=Dv71
-----END PGP SIGNATURE-----

--=-uycp4Q+gsp3Xv78hwP0k--
