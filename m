Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaMmX-0005Nf-LZ
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 08:00:26 +0000
Message-ID: <4FC8768E.1010703@nod.at>
Date: Fri, 01 Jun 2012 10:00:14 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1337771191-95358-2-git-send-email-richard@nod.at>
 <4FC85780.9070200@intel.com>
In-Reply-To: <4FC85780.9070200@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigBCA54CF66458531BF608E578"
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBCA54CF66458531BF608E578
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 01.06.2012 07:47, schrieb Adrian Hunter:
> It looks like, if you lose power at this point, the old fastmap may hav=
e
> been erased but the new fastmap has not been written.  That would mean
> you lose the fastmap.  Is that correct?  I guess you need to write the
> new fastmap first and then erase the old one.

True. But why is this a problem?
If we can recovers using a full scan after a power cut we are fine.
By deleting the old fastmap after writing the new one we may run out of f=
ree PEBs.
E.g: Assume a fastmap needs 4 PEBs and we have only 2 PEBs available the =
current approach works fine
because after returning and deleting the old fastmap we have 6 PEBs avail=
able and can write the new one.

Thanks,
//richard


--------------enigBCA54CF66458531BF608E578
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPyHaSAAoJEN9758yqZn9eq8gIAJTl1iwx6RZTaE1GW35sKAsW
6tZV6ep+4kaDrhtsuAf3na88ng/nYNiyYmXCYw9QUr2KBDjbv8TE/9awrncZG/v2
z8xuhXR697JSTW930whbsg0N9RAfJXCjuJSsw2LlffFvBWDQHaRq+v4VESMs2hDS
TD8UZcVd5jb86jqjkpOyQ3D33/QY/IzrtS+tcr4/svbOjpXvbu/8wmdDQEzvJD7a
aY9yiip7AV1qY8IiIwpd8t6WAsjCWeDeaIZNA9WvH/G7tn9ZbgihTs7TKtnWAbaS
elighN35N7sPXPasbfnt/YHwPU8zE1vBLHwCqTgpoRuJaBPGHpBf8RgZUZssS0o=
=N/qi
-----END PGP SIGNATURE-----

--------------enigBCA54CF66458531BF608E578--
