Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Snt9z-0006uo-8F
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2012 15:12:34 +0000
Message-ID: <4FF9A337.2010006@nod.at>
Date: Sun, 08 Jul 2012 17:11:51 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: UBI fastmap updates
References: <1340982869-77042-1-git-send-email-richard@nod.at>
 <20120708144745.36109029@pixies.home.jungo.com> <4FF9780D.4010709@nod.at>
In-Reply-To: <4FF9780D.4010709@nod.at>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig59249887AD4D85623A65E480"
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
--------------enig59249887AD4D85623A65E480
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 08.07.2012 14:07, schrieb Richard Weinberger:
> Hi Shmulik!
>=20
> Am 08.07.2012 13:47, schrieb Shmulik Ladkani:
>> +
>> +		/* TODO: if find_fastmap=3D=3D1, we do not enter this block at all.=

>> +		 * shouldn't we? shouldn't we care of compatability of unknown
>> +		 * internal volumes OTHER than the fastmap ones, even if
>> +		 * find_fastmap=3D=3D1?
>> +		 */
>> +
>=20
> If find_fastmap=3D1 we scan only the first 64 PEBs (now by using scan_p=
eb()).
> When using fastmap can do not care about compatibility of unknown inter=
nal volumes
> at all.
> Fastmap keeps only track of known (and compatible volumes).
> Taking care of unknown internal volumes would imply a full scan.

Please forget the above statement.
We have to think of the case where no fastmap was found and the
64 scanned PEBs get reused by scan_all().
Thanks for pointing this out!

Thanks,
//richard


--------------enig59249887AD4D85623A65E480
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP+aM3AAoJEN9758yqZn9esSYIAJxgSb9+EgNvNphf1PvjCpNG
LfL4BMbO0oLa9SBvvwTFYAIZWxPu+R+0MCNc1cHqHCOqWr9ZbIV87AheHDg68pSB
3nxbSolEqSIXMilxmlFyrx6lvZddAi2yhh6onAM6EiB598BfYUGVsooHZMpGrDbY
RjoadObWJ0XS6dfR+TcAVLCbHBDNqP2k71cj9xFDlooL5/LXa5e3W2jxmXZSfKYt
3/wNF1xSYphxL4B/HxpHA5mbw7L447jourB2yhtIKVhRAplhp1k2rj476K2JgBM3
YoLiLl8q5eY/tklQisQAz1z/B7Uj1oeMLIDVP5GqCPcrWLwISv5kNHUjAPUTf8w=
=gwx4
-----END PGP SIGNATURE-----

--------------enig59249887AD4D85623A65E480--
