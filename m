Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7QoN-0000xJ-3U
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:26:43 +0000
Message-ID: <1331641756.3595.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] MTD: euclean_threshold added to mtd_info and sysfs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 13 Mar 2012 14:29:16 +0200
In-Reply-To: <1331500873-9792-4-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-4-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QLpwEGqF4RacYJhr//W/"
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


--=-QLpwEGqF4RacYJhr//W/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-11 at 14:21 -0700, Mike Dunn wrote:
> The element 'euclean_threshold' is added to struct mtd_info.  If the driv=
er
> leaves this uninitialized, mtd sets it to ecc_strength when the device or
> partition is registered.  This element is also exposed for reading and wr=
iting
> from userspace through sysfs.

Would you please change the name?

> An afterthought... ecc_strength should probably also be exposed through s=
yfs as
> a r/o value.  Ioctls for querying both these values could also be added t=
o
> mtdchar.

Yeah, I believe so!

--=20
Best Regards,
Artem Bityutskiy

--=-QLpwEGqF4RacYJhr//W/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXz2cAAoJECmIfjd9wqK0ER4QALI9eAN1cP+bZDK/WdRcPUes
rA1gqQ3pviay0N6U+BdnFLMlUIZ0xLmaCwxkK1v4zrzhbO5Nfr7nTzKZc30Ogv5H
M2od6lw0WvvYCVXj+sfEmk9rHlUkYLyhUd/ph3cMbURS0xJT/aq9wdB1wDOUq4hm
gzbA07ModdpzPb2f2sApawdLqiKX8Qj9+zusTQVgu11YO+Nsdbb/G58y7CsOjjJF
Y+YdU+Ev1R7WizJrj1qPV3Fpequz2duK4kzTh3ziYTsC/djtiyMiPEK5Pj5BlpRC
u+n27BTzgzOntyKi68HzM2Uj3XVmcJjm/apLLOaMhz4Tiyt0ftFimHPiqVm6GgLq
u7xNe9EWFbKPROQoFYMVZ9iFBHIkqRCdHPPgISb2k6k3IzAdqTUk8nW5kGElqMDz
oWxWM100JeKeqxATjL74gboJYYp/y4YJ+5sXZTQSPNubc2IJLFmSuA8iYU8zMxaK
TnaZdYreZQUeDiMyM4ufi+Ia6gSwadCa8t2bd5tL+vEkmPt3sxVUnf9ItPe/pZgP
LMaY3rAF2WZK6SupEikKF8oFKj1TcH/2Y0uAHim85zzrQ/Qw4CPfq8uXv39HQXyq
s+XaSJFLd95iFwYTAIXbRXDMY7zqiVuv313fn3qgXyLtKtblTx2CrZVPdvGa9RiW
j4hbYYvRvGKyfKoQf/Ar
=yFEP
-----END PGP SIGNATURE-----

--=-QLpwEGqF4RacYJhr//W/--
