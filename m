Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbRuz-0000st-89
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 08:13:53 +0000
Message-ID: <1353572075.2701.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] mtd: ofpart: Replicate mtd cmdline "lk" option with
 device tree "lock" property
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Radel <jradel@gmail.com>
Date: Thu, 22 Nov 2012 10:14:35 +0200
In-Reply-To: <1352931092-8916-1-git-send-email-jradel@gmail.com>
References: <1352931092-8916-1-git-send-email-jradel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IPuJsZH/cTzAFy88XhJV"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IPuJsZH/cTzAFy88XhJV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-14 at 14:11 -0800, Josh Radel wrote:
> The mtd partition command line parser already supports a "lk" option to m=
ask
> MTD_POWERUP_LOCK. This extends that same functionality to device tree
> partition specifications.
>=20
> Signed-off-by: Josh Radel <jradel@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-IPuJsZH/cTzAFy88XhJV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrd7rAAoJECmIfjd9wqK0Xc4QAJQXVYE8iGFVkK4lKZispoIk
wSgCIxH8j7gfk7rwHdNYlEL7OTuyARHO3JSz9igJZHHRF/BQvflRt5lARm74P7i5
F8NO2pv563Xx8FcDZu9U4sU/H6mVkxStcIUAW2K8OqXfWHa11GzBB5HxRxFYPevX
tux+99YtXXLjcWFfLhBaRHffD3Z/FSeafPdFiA1/8Z/nHJwfUBpA+u/+KQaSPaqG
k5MpRYTAUU9ZoDz1ZDPBu1ksJ/4/ehF/8wJ/byGwow5+JPYkOEoEKY21RoJD1Kam
QKHuna9RTobzzVD9hWgtYkb4reEAJxjNXohkWULHYUCLaDaeMBUHNGBcYBh1cwKX
KJzNQ2atZcIeBhPYNSxFAbsfm28yhbVyiROnBPdJaGFYrKLN2AlQD4J5SMH16TgZ
YEABU0PgFVPxsFrdb9eW+F+V44zY/6ESQraOINBI1AQTXfinxEpu3ZveSnXO7A/0
FP/JTTcOXEvbLwp5engF9DVv9rqtdQ5maHqO2S2NkSe43IfaKc0JAgyuRG1DmD4z
m85cV/rYxdz6kELMHAub9KqQiSb7EjH802GRM/6BPfqpTs/obEF740a4V6ggyVEb
Bbim1MhgfceNxHx71olwH76YogDthJLh7F3sQJ04mrFDXy4jXA2HFOwrnfPUdUWA
aYlZRR8dqBho5CzJgMf+
=v0Gn
-----END PGP SIGNATURE-----

--=-IPuJsZH/cTzAFy88XhJV--
