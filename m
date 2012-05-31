Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sa5TH-0002FE-EK
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 13:31:26 +0000
Message-ID: <4FC7729C.3000307@nod.at>
Date: Thu, 31 May 2012 15:31:08 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1337771191-95358-2-git-send-email-richard@nod.at> <4FC74A04.30100@intel.com>
In-Reply-To: <4FC74A04.30100@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig8D7BA475F269EFAC6255320E"
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
--------------enig8D7BA475F269EFAC6255320E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 31.05.2012 12:37, schrieb Adrian Hunter:
> How do you know that this is the current fastmap and not a remnant of a=
n old
> fastmap?

In the current fastmap we delete always the old one upon attaching.
But I think it would to better to scan all UBI_FM_MAX_START PEBs
and pick the super block with the highest sequence number.

Thanks,
//richard


--------------enig8D7BA475F269EFAC6255320E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPx3KhAAoJEN9758yqZn9emCAIAKLqtvG3Yu272VSpCrsyYh70
VaaCSG9ZOHGTyvZ8x9o3EHLNbRvIDUmX9lhSNbIUNjtcCXKRuCMU0Rbpre5r+Z5p
rxyM9IIHpgAmcMuK7Jb4o6kFxm/H5YR5dqHIeCVR0dy+nY0u5R1gktAHGvlNLwT+
dRj2MuSpCsPLqPT2K8iCA+jSlaXz4sKRlsIl4smKcClzPQYFOlrYlHQmfuVAMnUo
XF9jIULFGBm6rJA5ZziXQ4y8gi5FRrpJIn+HosSBC0VUn001W6JkdBZvdHemWVqZ
CWeZQ+cnZh/NraIrgZZiJx3GQ8iNkiyWaVb864nsaH8KsWEOV7tG2SwYAaEDBUE=
=ci0A
-----END PGP SIGNATURE-----

--------------enig8D7BA475F269EFAC6255320E--
