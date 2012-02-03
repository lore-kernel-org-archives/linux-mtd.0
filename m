Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtJnN-0004l5-D2
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 14:07:22 +0000
Received: by dakp5 with SMTP id p5so3307128dak.36
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2012 06:07:20 -0800 (PST)
Message-ID: <1328278161.13362.23.camel@sauron.fi.intel.com>
Subject: Re: RFC : attach ubi in readonly mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Fri, 03 Feb 2012 16:09:21 +0200
In-Reply-To: <4F2BE3C1.8000104@parrot.com>
References: <4F2BE3C1.8000104@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rsinMtC4zLmGuC6mCWvc"
Mime-Version: 1.0
Cc: mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rsinMtC4zLmGuC6mCWvc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-02-03 at 14:40 +0100, Matthieu CASTET wrote:
> Hi,
>=20
> it could be interesting to attach ubi in read-only mode (for example gett=
ing ubi
> volume info without altering flash).
>=20
> A solution to do that could be to add an argument to UBI_IOCATT ioctl.

No objections in general, especially if you also:

1. amend the mtd-utils and add support for this option
2. add a piece of doc for the mtd web site
3. add a test for this feature to mtd-utils.git/tests/ubi-test/
(probably simpler to improve one of the existing tests there)

> Another solution should be to have a way to switch MTD_WRITEABLE flags.

This can be done as well, up to you. But I guess UBI will need changes
anyway to handle gracefully situation like:

1. you have RW partition, do a lot of I/O, then reboot uncleanly, so
that there are many erase operations unfinished

2. You reboot, mark the partition R/O, try to attach it - UBI will
probably anyway try to erase some blocks and get -EFORS, not sure will
it panic or not. Should be tested, but probably not a big deal.

IOW, both approaches should be OK.

--=20
Best Regards,
Artem Bityutskiy

--=-rsinMtC4zLmGuC6mCWvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK+qRAAoJECmIfjd9wqK09JwP/0p4GXTg1BENr/Wk8mnCww4P
AsggzUkMFYst7D9MxGFrxE2euH6XghuUACIzn9eEq9iKCpI2NfhtCFpOnwk+UlDw
Su+c9p+NJVegFg7KcpD1rpzTSq9Nd7vWbStAQBAZTiflAIn23Q5MXb7VgxHGh8cC
9ZPVOwtD23jCjSoeBObinMMwy1MmVTpiAjxbSkt4dNFljHFEitp/Xu/yJNsLfQDb
1EJ4ashAC7EKeYE5adhgKvtbXOmUrl2i7bNFl5SigFO/TS5ILFnrHxuSrbrUbYL7
Xdo+kNPLkJwru4ChuxU0h4gaMshOwIU1BfY9bdkSYg1pBGKDDYWOGWSrDPHEiFYe
LicEtUT1TIiRMQXMzzOeJ6X8zKm4k4puxmbHdW8JH16QykDPI8f/OyJWOtzTvYTZ
Magg09ItM28aHezyN/im3h0f5il1s//5iFRYgzKhhZGyhxZnd81CkD7aXNgY5ZQo
EfGk4I5ijfxCgzb33j9aXblRNmRzZVCfXEI6DYU4YV5m6ya/NojxHZB5ZFrC8MUp
S7DzfEWcDaIJgSfkPsQFPFeQTe2gj9p0VVIeOj+rSQYV5XY+LOGxUmIEA5P93Pur
3D58BpviN0hSBVoMhVSW7TuG++vYvo3QvBZzNAeJae1Jc26exvWt8udpnr+6LtLk
/WKajNCFGB0tpyKKqlX8
=QqDX
-----END PGP SIGNATURE-----

--=-rsinMtC4zLmGuC6mCWvc--
