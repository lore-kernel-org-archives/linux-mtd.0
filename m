Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SStRW-0008Fs-89
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 17:15:51 +0000
Message-ID: <4FAD493F.1040804@nod.at>
Date: Fri, 11 May 2012 19:15:43 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/7] [RFC] UBI: Add checkpoint on-chip layout
References: <1336585125-127220-1-git-send-email-richard@nod.at>
 <1336585125-127220-2-git-send-email-richard@nod.at>
 <1336735041.2625.35.camel@sauron.fi.intel.com> <4FACFFED.40105@nod.at>
 <1336738864.2625.66.camel@sauron.fi.intel.com>
In-Reply-To: <1336738864.2625.66.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB1AEBCACE2ED29265F02FD19"
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB1AEBCACE2ED29265F02FD19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 11.05.2012 14:21, schrieb Artem Bityutskiy:
>>> It is weird that you do not have an array of ECs instead for _every_
>>> PEB. Why wasting the flash and time writing/reading this data?
>>
>> By array of ECs you mean that all ec values are written to the flash
>> and pnum is the index?
>> Sounds sane.
>=20
> Yes, to me it sounds like the only sane way, unless there is a strong
> reason to have redundant "pnum" fields. :-)

While looking at my own code a bit closer I found out why I haven't used =
the
array approach. B-)
Currently only ec values for PEBs within the free and used list are store=
d.
Therefore, the array can have gaps. E.g. If PEB X is in the erroneous lis=
t.

Thanks,
//richard


--------------enigB1AEBCACE2ED29265F02FD19
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPrUlAAAoJEN9758yqZn9eu7AH/0rH+EZlYtxEtPVYPzA2i5tS
r4vBePn9ZyCrz+9DYIZP6oz0K3WhFrfAIh6oV0+4AgtIn9flsMCaioD53j+OsAdz
GXiN3IggSL/5rvaVc5cLt4dRCQpcLOn1aI/pnWZtYkspB7QuR09nkI/v8X43AHCI
itdDwLCZBN1sZQsz0aT2pVFEz2yUFT5C8dRPOkyn7VsRnmdpQSrd9uBfPNqzBREV
ttbk4jFvRhMS2Ikhq0swu+Eb1wcIzAGZkwv9hDE5AvKHdEGB80HGAr+Tx+lpa92w
3+jURMhJM8UkkDGsqLMGDGVwTRQuvJfu3rHIFR773UtfjiAI2kNOzBofhajYoYg=
=1tS2
-----END PGP SIGNATURE-----

--------------enigB1AEBCACE2ED29265F02FD19--
