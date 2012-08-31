Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7PLn-0006l8-Ri
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 11:25:24 +0000
Message-ID: <1346412626.9709.41.camel@sauron.fi.intel.com>
Subject: Re: UBIFS corruption after software upgrade
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell Zuck <rzuck@cincinnatitechnologies.com>
Date: Fri, 31 Aug 2012 14:30:26 +0300
In-Reply-To: <500F0D81.8050902@cincinnatitechnologies.com>
References: <500F0D81.8050902@cincinnatitechnologies.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rwSM3g0MyJYoLPokDfti"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rwSM3g0MyJYoLPokDfti
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-24 at 17:02 -0400, Russell Zuck wrote:
> I am attempting to troubleshoot an issue where the root partition=20
> (ubi0_0) of my embedded platform becomes corrupted after a few upgrades=
=20
> of our system software.

Just took a look at your dmesg log again, it really does not look like
UBIFS issue. Something has changed so that UBIFS reads all 0xFFs instead
of nodes - may be driver returns bogus data.

If you have a working kernel then you can bisect and find the commit
which broke your system.

E.g., if you know 2.6.32 worked, but 2.6.35 does not, you can check if
2.6.33 works or not. If yes, check 2.6.34. When you find the first
non-working release, you may start using 'git bisect' to find the quilty
commit.

--=20
Best Regards,
Artem Bityutskiy

--=-rwSM3g0MyJYoLPokDfti
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQQKBSAAoJECmIfjd9wqK0K54QALpZu/pxSqQmP6mlns04QWqo
e9D7WfXvrkaP+wXUyZphY9FLB4wAVrlLvKMbO4Lc7rRYKIo0WPaQ7KhnkFS4zG/y
NSwcEEkV2lMRwyl6XXLgHEQqoSi+tRl9iedA0TOBY9qKcJ175IKbaFNb16rZWhv0
BSbB6t5uv99Lb7f5CeXFa1+V7Fc9uANwpbzpPqwdo6s2qHBidimMeIVfkcNqOirn
SJqhZzkve7sXzUADKUwHOXh3+Hgk4dZkSmVH8HbgRtN3plj30UiuE7gwjRQDhTVX
d54p305VfCUCU+bUepjhfY/FqMedIA7x8xme/PSO46GniUs1v0h71YCeI2EbwVrL
GepmiJLZy9ZDfourTjN7PdnHYYYgladOm3gdo/UhjwrEM6ies19g5eK0IKpAUFXi
lhWm67wUKLrpAP3emQLegxXJOjx7fGs/9tW1bKUKPcQk9V/PASAhV2MLlpTwh8ag
5r9YnMD2ExTsDdZGMUfFMdtIR9Jzwzy6xW3a47mmOI4Z3TKpsZLCDt2o7VZuRXTS
fp5oml59IZ9whAPdz8ZFjlK4FpWBx+WjGrHMknY0bqnPJHNpPdGUe6n28tpWb3Jp
017jzTpv9N9BMxZ6vFZiIbbm8Lwm4rk7F6dJEI24HGNADlzpiKHrN3Fd66g2domP
PADtz3yaAdFTN15Sx5tD
=6+S4
-----END PGP SIGNATURE-----

--=-rwSM3g0MyJYoLPokDfti--
