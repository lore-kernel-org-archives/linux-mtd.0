Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9wS8-0003ho-0G
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2012 10:38:08 +0000
Message-ID: <1332240054.11468.15.camel@sauron.fi.intel.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matteo Mattei <matteo.mattei@gmail.com>
Date: Tue, 20 Mar 2012 12:40:54 +0200
In-Reply-To: <loom.20120319T102527-948@post.gmane.org>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
 <loom.20120319T102527-948@post.gmane.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Atu00wKXcU00VuGsTMQB"
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


--=-Atu00wKXcU00VuGsTMQB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-19 at 09:28 +0000, Matteo Mattei wrote:
> I have one more information about the problem...
> Commenting the goto corrupted line in scan.c (inside ubifs) I was able
> to recover a board with the previously reported error:

This is incorrect because it will also make UBIFS ignore real issues.

--=20
Best Regards,
Artem Bityutskiy

--=-Atu00wKXcU00VuGsTMQB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPaF62AAoJECmIfjd9wqK0ViIP/jzkUgOQCturI3RtphI0wL7c
fIvqKYjHHptJD+CNvW2fKhIJAfvE9ylo/c7YUfv2fbBjyQUapgWJuQDWtdke8jHH
xfrkuXGu7MMMQhI7wI64dl45s2fA1dfNT/mjJxsj0b5+EHVPhDt4KNWgAh3OZ/JC
fN+ozY7Ohd3q1C08V3Ja5HA4VEMJNjC4vu5Dn9g1UFJQnZdiBLX//TQ06bJqrTNP
4oEuccBuHXjJUdyVO34i0MnvfSD2Nujk0PS4PiBNZTu0v9x7baEfm//4G4XJqVpJ
OpmKRNsIuQjU/UeBzGWuPVqwWDS13wP8swjqHV2im4I1AZU9A5NyS0fkcrkX01Tn
zdjM4rafVNOO6WKEGCo8oNMNvxwltOza8uoTHJCReSUoExVJOh5OkvOmS27TMxOY
/JxLYwsO70dXPsesyJ6RqvR2x27Bg6TU1qsnmBVCO3zyLixsK75V2svyv2nYeUfy
0UAYUOpa4ptcMG+FI+xvT4aiX3COBo9hCjECgFAT+iEfPOsGByIkOH9BMb4EYpkU
cFHJV+JMP5hJLrf8WRF23U0jyPuRrJBpx5c8Z5iHv8szPPkM7WCiqQ7klL4TuOfU
RD6lgexC0viaaMsKsqiq0Y2dHmfsM8swQbD8b6aOdPFu25SHt+qeMjDm1RKPG1XP
2RYkQacJXD9S8rUpSODm
=7tjF
-----END PGP SIGNATURE-----

--=-Atu00wKXcU00VuGsTMQB--
