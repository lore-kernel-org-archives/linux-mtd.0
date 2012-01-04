Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiTtH-0002Vl-Vo
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 16:40:40 +0000
Received: by iadk27 with SMTP id k27so36379691iad.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 08:40:38 -0800 (PST)
Message-ID: <1325695363.8917.102.camel@sauron.fi.intel.com>
Subject: Re: ubifs panic with 2.6.39 stable - followup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brad Parker <brad@heeltoe.com>
Date: Wed, 04 Jan 2012 18:42:43 +0200
In-Reply-To: <4F043A7C.1060504@heeltoe.com>
References: <4F043A7C.1060504@heeltoe.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HNCLQvwxuZ+EV2Jvsa5K"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-HNCLQvwxuZ+EV2Jvsa5K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-04 at 06:39 -0500, Brad Parker wrote:
> [sorry for the duplicate post; I tried to post a followup with just
>   the url to the pastebin log but for some reason  it got stuck
>   waiting for the moderator]
>=20
> Running and older 2.6.31 kernel with UBIFS I see a panic which appears
> to be during recovery of a bad block. The root fs (which is UBIFS)
> won't mount and the kernel panics.
>=20
> I upgraded the kernel 2.6.39-stable, hoping that would fix the problem,
> as I noticed a lot of recovery fixes had gone in.  It still panics;
> it appears the recovery fails.
>=20
> I rebooted with "ignore_loglevel" and the output is here:
>=20
>      http://pastebin.com/ETJjP4uw
>=20
> The board is essentially an Olimex SAM9-L9260, with Samsung NAND.
>=20
> I'm curious if this looks familiar and if it might be fixed post 2.5.39
>=20
> thanks for any insight.

Would you please also enable scanning, mount, and recovery debugging
messages and provide the log?=20

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_debug

But in newer kernels this has been turned into dynamic debug, see
Documentation/dynamic-debug-howto.txt

(Gosh, I have to update the web site!)

In older kernels you can do this via the configuration menu, in newer
kernel this has been turned into Documentation/dynamic-debug-howto.txt

To use them at boot time, use ddebug_query=3D...

You need to use 3 format string to show "UBIFS DBG mnt" and the like.

I think, but did not verify, you need to add kernel boot 3 parameters:

ddebug_query=3D"format UBIFS DBG rcvry" ddebug_query=3D"format UBIFS DBG
mnt" ddebug_query=3D"format UBIFS DBG scan"

--=20
Best Regards,
Artem Bityutskiy

--=-HNCLQvwxuZ+EV2Jvsa5K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPBIGDAAoJECmIfjd9wqK0f44P/0mMIqEVZaqdcHEiPRsM8hiX
i+kRDztzFZCvuxTLBmkR1b/Krn1Xiip1tqoaRVNnmA+5En/hj6qR7XpYqH91Zhsp
Ahas7iwoComzQX59Wic7GwFFDHBAwionycxBHPRwr1AMcXp0E0UIdMKVF16349qR
1aS/bL59TlDE6NeArj4xDcXKWnPUC7T1F04PEBcE1AylaaoCELmrAPatCwvRjcgM
OgEz2GG6/25IwbUKlCgwbpGre0KFB8QX0y1iQbyQIC3Yb0TJDr2QU9vsqBCGHRQD
a7E8xfHE1J6TEZcHZCpkCwpcKhKb9kVstbg9QIkR88IrGD4KiCjEYNnumMCBnlC0
gngPcSmWV6pWdfcjDNDwHF7uOz/TseBIPAgcNV3N7RznVbZYMq3n6I3mpsxAmXSd
YOTKkEsssxrEPmYdaqkJ1BSvHmEoVbuUzwtCNeJBMMkOUnuWQl6d+LPOMaXamcaY
bUMW3AtboqNqSm/6oDQ8Fd6EPJhrEkzjo3VcUf5mhXbMVbiwxA0AjwBoLpZnc40j
avWrnC68wTn0CX1xhKq019TrKDGxhIIAxlge3JTXivKOty6Y67/FIZgyiyCrXqwN
GAQZLwTbZV9lv4Yd825Smsr/tz9OIC91YydnxqMhMINmzD06iOPMy121VuOHt+M4
XjW+oFS1L6p1x1IjAv9K
=rS5a
-----END PGP SIGNATURE-----

--=-HNCLQvwxuZ+EV2Jvsa5K--
