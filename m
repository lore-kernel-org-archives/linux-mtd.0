Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwfq-0005Lw-PA
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:17:55 +0000
Received: by lbol5 with SMTP id l5so3603928lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 06:17:50 -0700 (PDT)
Message-ID: <1335100504.28267.8.camel@brekeke>
Subject: Re: [PATCH] JFFS2: Add parameter to reserve disk space for root
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Date: Sun, 22 Apr 2012 16:15:04 +0300
In-Reply-To: <20120410212235.951079D401E@zog.reactivated.net>
References: <20120410212235.951079D401E@zog.reactivated.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-m5kOQNqXGgL+Of8msDFA"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dilinger@queued.net
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-m5kOQNqXGgL+Of8msDFA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-10 at 22:22 +0100, Daniel Drake wrote:
> Add a new rp_size=3D parameter which creates a "reserved pool" of disk
> space which can only be used by root. Other users are not permitted
> to write to disk when the available space is less than the pool size.
>=20
> Based on original code by Artem Bityutskiy in
> https://dev.laptop.org/ticket/5317
>=20
> Signed-off-by: Daniel Drake <dsd@laptop.org>

I think it is ok to merge this patch because JFFS2 is slowly dying and
adding new features like superblock would be too intrusive. Pushed to
l2-mtd.git, thanks.

--=20
Best Regards,
Artem Bityutskiy


--=-m5kOQNqXGgL+Of8msDFA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlARYAAoJECmIfjd9wqK01LIQALfJC3vzfmJJ1ZMwqYd+7wrG
jUU9iHrCJY/7EfGOgr8qLT5ZApqiutgQfHMfxmbkWcB1A6G0k6sTs/oP3B2DSaLm
jHcZQEszMNr9nwuHBDOHIDnLU+JEtN7TwlvzSgoqKJxLPQXtTOOwte6h+9or0QpC
GHnw47wX5xhXIBnTCFIoYrTWGshiIjyeXWjmgOPVdNbvVPzvwKFrm1NYYMPLt7qI
PU6lMkl74n8tTsi4QSHFfN2YlGa9aIy6GePU+4cljv1p5qPTiju9CdmR1JmbtWVB
YN/1xsaSbm0u77J3tAGmaZ0j0oblHGl17cSpjR9bTT6ynfOnBqfeKWkhzv2zNk5x
D8RhQ263XC0bwcrIxKSBO5+Amqzx4sfelnOoDjtXzw3uSXxmGyM2d8nO9JfexRyc
MHY68i5+KgYyKwA+zeKJxCNGHElnPxxBLloy4LqZUTpbWcgQTs5V1ldRuqxXB6JS
2NX4PoIgC0KyqzT1azk0aKdjB7sWcoIMFmVPppTMseF41ckY4pYrEarB/ZyN+3au
xf8CrM6TWZpT4lvXmQqXyxvhj2RzYqXZzsH0aepHWhIEMwqmVxwV7brTn6V2CqA7
ceTpRHnLvw2Dx/Yue9194n23C2eAEcNcGArLbhG4Y+0JCpyoiHQXm/pmzGDfbtoo
vkyHCbiEHT5y3ExyQtuE
=/asM
-----END PGP SIGNATURE-----

--=-m5kOQNqXGgL+Of8msDFA--
