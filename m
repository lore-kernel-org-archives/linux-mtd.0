Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1So9CA-0007IQ-50
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 08:19:51 +0000
Message-ID: <4FFA9419.1050208@nod.at>
Date: Mon, 09 Jul 2012 10:19:37 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: UBI fastmap updates
References: <1340982869-77042-1-git-send-email-richard@nod.at>
 <20120708144745.36109029@pixies.home.jungo.com> <4FF9780D.4010709@nod.at>
 <20120709103747.5270084d@pixies.home.jungo.com>
In-Reply-To: <20120709103747.5270084d@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig2638A3C8115494FAB351706C"
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2638A3C8115494FAB351706C
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 09.07.2012 09:37, schrieb Shmulik Ladkani:
> Hi Richard,
>=20
> On Sun, 08 Jul 2012 14:07:41 +0200 Richard Weinberger <richard@nod.at> =
wrote:
>>> +			/* TODO: in the new locking scheme, produce_free_peb is
>>> +			 * called under wl_lock taken.
>>> +			 * so when returning, should reacquire the lock
>>> +			 */
>>
>> Which new locking scheme?
>=20
> I am diffing linux-ubi fastmap HEAD against its fork point (vanilla
> ubi), that's 6b16351..d41a140 on linux-ubi.
>=20
> Which gives the following diff in produce_free_pebs:

Ahh. _my_ new locking scheme. I feared someone else changed it meanwhile =
in mainline. ;)
Yes, the &ubi->wl_lock in produce_free_peb() is no  longer needed.
Again, thanks for pointing this out!

Thanks,
//richard


--------------enig2638A3C8115494FAB351706C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP+pQdAAoJEN9758yqZn9el3IH/RMA0GXHHvxccQoULwSoxask
XNACvEWWfROfOY0IBsIsDPa3Ql9tCPCW6T9gGWHwWB4bf5hO8d7i4//3uhx7jEdj
rY6c4DcbSY1dt4iTG4WkMpqOQpH45CgDYrnzsmAArGo8Eyxql2pIVPh8WgDcpUtC
TX3siw1TWcd9K/Rs9CFGetKcTdogoBGLpFw1L/EQ3L2I9K49OLTtbF6qDlEiZnPA
tMtdogMf6U2fD4chYUtO7qmByTacr7wA7qDGiXeJgKzFvXi20HmTZVFS7mR7r6/R
7EWsniVxQZSUs59qBlub/oMWLoPk/gMtAFFRJtFFOQuMWH2oyJcD7HcMgB0vfoc=
=slIZ
-----END PGP SIGNATURE-----

--------------enig2638A3C8115494FAB351706C--
