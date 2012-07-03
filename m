Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm0fw-00049H-8t
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 10:49:45 +0000
Message-ID: <1341312827.2979.53.camel@sauron.fi.intel.com>
Subject: Re: [Q] ubi->beb_rsvd_pebs calculations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Tue, 03 Jul 2012 13:53:47 +0300
In-Reply-To: <20120701195230.0f141288@pixies.home.jungo.com>
References: <20120701195230.0f141288@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4S0fUF670BuqNkXc7sHA"
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


--=-4S0fUF670BuqNkXc7sHA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-07-01 at 19:52 +0300, Shmulik Ladkani wrote:
> What do you say?
> Would you consider removing this "beb_rsvd_pebs reclaim" block?

Yes, sounds like you are right. Also, with your new proposals all the
"reclaim" blocks should go away at the end, right?

--=20
Best Regards,
Artem Bityutskiy

--=-4S0fUF670BuqNkXc7sHA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP8s87AAoJECmIfjd9wqK0Ix4P/ix+bmwv5QVqLqta8eL6E6XW
GsEMqnG/fqYzzkt4SIX1M4rD8a7HHbOO2meMbUX3hqctM4CcxkZ5aTn6iYPceZ7e
V8lOVpQyNcAMERivM/S8OjsKWJYTWENb4tk8Qrj06T+Yysew34bOMuxx2iXjpMY6
AU3piTRCgkQoLkBoRSSjOtoQTP3qIVOKbBXVrcciKh+ZpNOP4FzIMGUvA2KnQzeZ
i/QGaIIxZ1arS5AzzXwCWvOC14OkVZeD9lL2W6AQCgollgktbQymp2bCQsfTgEdl
zdpv9vxRfkFRbjAGWT26+UEL9z8z7XKX63Co8ux6aDs8F2wYjIVOUnTKUAHYPGVp
qS1B8/yeWIQ07c3TBku4wd9+98nrWI/M32DdPRPylB7KfWPXW0SqfgWUnGrmgUE4
+qLJDz1f0ywpCRd73dsyqgC3ZzMY34X4y5/oYvep+MFWmanplnohlo+R2b5nuZhc
m2dCVR4A0f3463WobT9CgzI7Lb5RHmUj4fpVurzQLeWi4fE0f5eewf5WWQi09u93
pfywNsTNGNEVMxmJvYYSg2HZhNWeVufF8DZWUyKPB52BA7+XNhRDHGVGyY2sfgoG
f17mQqJRcbUh/I28Ehe6IbNLVOq92GESNBj8Hjht7bZezo5l3gNi39eQjzjCiajR
nmil7RJSqiQBmBP4DLr7
=4xIo
-----END PGP SIGNATURE-----

--=-4S0fUF670BuqNkXc7sHA--
