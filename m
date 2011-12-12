Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ra5IE-0000aW-MH
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 12:47:43 +0000
Received: by dajx4 with SMTP id x4so6899567daj.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 04:47:40 -0800 (PST)
Message-ID: <1323694138.24509.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 12 Dec 2011 14:48:58 +0200
In-Reply-To: <4EDFB142.6050208@newsguy.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com>
 <4EDB89E9.6070306@newsguy.com> <1323065234.2316.2.camel@koala>
 <4EDCF840.7050107@newsguy.com> <4EDCFAAC.90709@bitbox.co.uk>
 <4EDD142B.6090303@newsguy.com> <87hb1de5b6.fsf@free.fr>
 <4EDECC7A.1080202@newsguy.com>
 <Pine.LNX.4.64.1112070848340.32119@lnxricardw.se.axis.com>
 <4EDFB142.6050208@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bQWSCEJsFXN1HPPqsOw3"
Mime-Version: 1.0
Cc: Peter Horton <phorton@bitbox.co.uk>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bQWSCEJsFXN1HPPqsOw3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-12-07 at 10:32 -0800, Mike Dunn wrote:
> Hi Ricard, thanks for chiming in.
>=20
> On 12/07/2011 12:01 AM, Ricard Wanderlof wrote:
> >
> >
> > So, something like this:
> > - The driver reports number of bit flips and current ECC strength etc t=
o
> >   the mtd layer.
> > - Based on some userspace knob, the mtd framework reports -EUCLEAN if
> >   scrubbing is needed.
> > - Upper layers perform scrubbing if they want to (i.e. UBI) or not (i.e=
.
> >   JFFS2).
>=20
>=20
> Sounds like a nice compromise between user configurability and keeping th=
e
> decision in the mtd layer.  The problem is that the read method currently=
 goes
> directly to the driver, so all drivers would have to be patched.  The las=
t patch
> I submitted was rejected as being too large.  And it can't be broken into
> smaller patches because they are interdependent and not bisectable.=20
> Implementing this scheme would be an even larger patch, and the changes m=
ade to
> every driver would bear scrutiny.

Yeah, I think it is OK.

1. Sanitize MTD interfaces by turning mtd->kuku(buh, buh) to
mtd_kuku(mtd, buh, buh). This should be easy to do - introduce wrappers
which just call mtd->kuku(buh, buh).

Then you can add your ECC stuff to mtd_*() functions.

Careful with partitions - we want ECC levels to be per-partition, so
that one could set different scrublevels for different partitions. So I
guess your ECC stuff should be in partition functions.

I do not remember off-the top of my head how it is handled nowadays, but
in the past, when we had mtdpart as a separate module, it was possible
to bypass partition wrappers. You should make it so that even if there
are no partitions - everything goes via mtpart anyways. Nowadays mtdpart
is an integral part of mtd, so this should be easy to do.

--=20
Best Regards,
Artem Bityutskiy

--=-bQWSCEJsFXN1HPPqsOw3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO5fg6AAoJECmIfjd9wqK0SsgP/1NljEwU/vCc/tOr0VCWn0oD
7u9bYkNehLziufOQ/gq02lcdDsOPRussCfhVrlpd0Xfc481bRWuUf3U9WsMJdX5y
7V6xKBxVwYm6wll7+IOmWMgTmMtT28wODWHzKJr1ERT50XcMJeEx6aePtLmuk2Eg
SNI8krJNcbtGrVA3vV+XZ5BEnRtGKn5/WjkPZhWmcp7osk+MDs7SSN52WthnnnfF
0rrHYFBnuUrdFnYtMc8n3b+CD/wRaXSMiexbXrIvCytzlS8Luy7A9gBFDer/doj0
WDuWfUsX8ANLzhm23pabAj9kWLK/xTUgSkWfT91zMIWHoQrQtItMhjxeu/SU3+oq
H62qgG83LRbZnTUyCIUUha3FXJaICC5TH2k7WUrmUdl4aroLmvjAAXQlUXeSc9gV
KwdoL/PPYIw2B44qPhZA6hDNwsaGTTjafIJMUv4GHnD4jdqEafZnI7z/ClGvKK0A
hmwAr5QvDgUmLDHZOKaiQ7f/H6hdLVo1qXNc0Y9p3FvVIP0KJq9s7fc6byyj+Ode
UI7O/+EKRHbDomWD/gE/MADiuRm5F3B0UYB5AybEAfTM2UMS+Ba2VCO6fDtFRSF5
VI7gZJw/6oqXZfs3WdmUc1VOSJ5IwYC3Ke0XZR1ml61/GzrViowsMCliDLPaStN0
m3VW7M7vlnSauLtXWwT7
=H24D
-----END PGP SIGNATURE-----

--=-bQWSCEJsFXN1HPPqsOw3--
