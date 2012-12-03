Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfTl2-0002Rw-H1
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 11:00:17 +0000
Message-ID: <1354532461.30168.191.camel@sauron.fi.intel.com>
Subject: Re: UBI wl_tree_add problems after PEB scrubbed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Date: Mon, 03 Dec 2012 13:01:01 +0200
In-Reply-To: <1354531729.30168.189.camel@sauron.fi.intel.com>
References: <50B8CB36.3010604@itwatchdogs.com>
 <1354531729.30168.189.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-sZBkprJ9Z9JW6veacKCM"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-sZBkprJ9Z9JW6veacKCM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 12:48 +0200, Artem Bityutskiy wrote:
> Also, it seems UBI is completely broken ATM - it craps out immediately
> on the first bit-flip. Let me revert fastmap and check if it is
> fastmap.=20

When I revert fastmap the assert goes away but the WL thread craps out
differently. I will try to investigate it.

--=20
Best Regards,
Artem Bityutskiy

--=-sZBkprJ9Z9JW6veacKCM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvIZtAAoJECmIfjd9wqK0PPgP/0cHYA+gCj6wj/udo0oa8n+H
I0oejGTXLS17cwvoTUTUV5TlgqMw22B0swM28qxRJEaTc1pYlvz7SHJLKCfDTqTU
Xl3lzy2EGWgbUnzkWHpUrlFothN6xQLWNSFeNC2rpQb4blL0M7ilwEyhBkGDDvtX
gJYyDzeTekdKiY5xWD8mSx3BAFUEn3k8fThUoGk8mIsn9eysI3044SPhBOEfeUc0
/izwqtrvxuUltt0GGgB0rJJQmOIEyh4E4D2mci4Fh2xDm1QH2bJws7Yv1alel6VS
ZVAwAu++2MwK4BvdUMeEFhNYMoreav77bhoUZ6LyblCJyt0GP+BL8cpgwAqw3JSq
IExewsLRyPwr/z8YK4IWubQ14KK7OtcIJooNBKkT2xGMr+NFhLAPCmxcDYRLZB1k
6+4OfGvW5cq8Ae2i39lkJmBUqZPmLtgJBiP7vfcRsNDgv6+A/ied7ue6EQ+pKxWU
Hed+aKc9BSOmiMSTGyK8KsItnWkh1wwFw0M9Q8T7scJ+tzD7Hlx/JbO/yV+U7xZo
JgJaUrGjqbdIyijV+swdA1O6FN1O17SjSNP3Zgg5gxuDnK2xf9Mw2arVsdICnWTq
E5JyBuHlYqimqU3k56dSPwMldeXVgkw0tMp0lQFY5xtfAxihoXPQGj40suLgKKs/
3N5TyyyUXVWUFYAHai2/
=MxIa
-----END PGP SIGNATURE-----

--=-sZBkprJ9Z9JW6veacKCM--
