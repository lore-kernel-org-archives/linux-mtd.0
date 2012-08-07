Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SyeFD-0000si-ST
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2012 07:30:25 +0000
Message-ID: <5020C3EA.7010009@nod.at>
Date: Tue, 07 Aug 2012 09:29:46 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBI fastmap updates
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343919530.25013.116.camel@sauron.fi.intel.com> <50200096.1070002@nod.at>
 <1344313269.1865.2.camel@kyv>
In-Reply-To: <1344313269.1865.2.camel@kyv>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE4384714B8005F2D6DD32325"
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE4384714B8005F2D6DD32325
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 07.08.2012 06:21, schrieb Artem Bityutskiy:
> On Mon, 2012-08-06 at 19:36 +0200, Richard Weinberger wrote:
>> I think we enable fastmap only if a MTD device has more than
>> UBI_FM_MAX_START*2 PEBs.
>> Any comments?
>=20
> With double space one can make it power-cut tolerant, because you shoul=
d
> be able to have either old or new fastmap at any point of time.

UBI_FM_MAX_START*2 has nothing do to with the Fastmap size.
IMHO we need a threshold where Fastmap makes sense.
Technically Fastmap can only be used if a MTD device has >=3D UBI_FM_MAX_=
START
PEBs.
But does this makes sense? Fastmap was invented to speedup attaching on *=
large* MTDs,
The benefit in small MTDs is very little.

Thanks,
//richard


--------------enigE4384714B8005F2D6DD32325
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJQIMPuAAoJEN9758yqZn9ewckH/jFyGnE0rgDut+Hx67jiHZSX
x19cMhHa8TOdlUmk9d+IYDRNlox8zmLe8wZRz+l60rkySPlbcc3atdtBUHOHxHm9
fI/LwoneJvnDxJuTVQw1KR9/Oc9ASFsz62Tha/FYMMqkvFDiGp+bL08r2dTOCs6g
697HICrVn0o3vxBuSRTyl7SGEe1JYRKGX9tTdZ0gjyb/6ZvhoIEWkBLeyU9+u7I2
xSFrFdo7Z51ZoXIIrn/u9GGhTOAXzOX2OsINgyCwy8AagH7TZ9zblcyr9AQtRykZ
2cT1Dott+OvJAaD3DwmRZzuE3uJiGzde3r7UukGW6j4vV+kdoB44DqkFlmTRZUk=
=e2tG
-----END PGP SIGNATURE-----

--------------enigE4384714B8005F2D6DD32325--
