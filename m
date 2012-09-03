Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8VAG-0002OU-UQ
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 11:50:02 +0000
Message-ID: <1346673285.3061.46.camel@sauron.fi.intel.com>
Subject: Re: TR: Notification d'envoi de fichier via http://dl.free.fr
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabien Comte <fabien.comte@ercogener.com>
Date: Mon, 03 Sep 2012 14:54:45 +0300
In-Reply-To: <1346671221.3061.42.camel@sauron.fi.intel.com>
References: <20120831133153.764EC3495D9@dl.free.fr>
 <003d01cd877e$39b71020$ad253060$@ercogener.com>
 <1346671221.3061.42.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-M+miR2RCiDl8ydPK9sm5"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-M+miR2RCiDl8ydPK9sm5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 14:20 +0300, Artem Bityutskiy wrote:
> Also, you never sent me the full log. Please, _before_ mounting, enable
> debugging prints:
>=20
> 1. modprobe ubifs
> 2. echo 'format "UBIFS DBG" +pf' > /sys/kernel/debug/dynamic_debug/contro=
l
> 3. mount
>=20
> then type "dmesg" and send full log please.

Also note, I am using x86_64 PC.

Can you try to take the ubifs-v3.0 tree and try to reproduce the issue?

If it is reproducible, then we can find the guilty commit using git
bisect.

--=20
Best Regards,
Artem Bityutskiy

--=-M+miR2RCiDl8ydPK9sm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRJqFAAoJECmIfjd9wqK0at4P/AhwkjvrdMkyaa2wIlhPDcmm
0llbvL7xF9dGdhfkeM+QiCyumkhNVRZkgarsXTLww3gTmiv2N0qfqmx4fekWSxb/
WJwDcvHVg3Wc4fObG98D76foLGyjCPx892+Jzc/egVvuj49iWQaQlE0v86iAczDO
vjD2qyraMY4Uw5vR3AbCtXjBqrDUNq5wLZ+LvAMcLYlwM9PwCj/V92a1KKiTo9Iv
cfZX4WL4Prp3JM6aFnlaHZTbjGclrca9kfnGkwArO7nBRyZdoEQIJmtGzVrsX2eD
p7EWWb/gdlj34Z2HjA9arKDPuXmhvG3YB+oslsOrn0HvYgERbQEyNSwt40flPpg7
uec6fcN7MhQM/uaIwl+b2qCS19lM3pCVZYTFIRIMpykldgOUwoOOBQPF83yu2TUP
0ysoZAuUkciQptUxmEnO+67CtmX99LAkWiUUswcvSE6tqKwgBvAsSa8H11ynkMIf
AlCkzKVGivAKpmR1UnUF1C8VY7fcMjns2xfhcP6Z3Z0c5nxMzkmDvMQ9ICqMLz8y
ttYF0aBlAXyuKG1e9JQd86S2NWzhclZsuFXvlm+anmc5tKZN0Qq/aLrnYjN/8nQX
Cru/ygg7ZlGM16IcnoVSHpGg++etE5RLsAikH6M/WvXQ3OYmERdlD8hYMvHNSYVT
cAv7vxSsAX8EGiEaaAxB
=hkSO
-----END PGP SIGNATURE-----

--=-M+miR2RCiDl8ydPK9sm5--
