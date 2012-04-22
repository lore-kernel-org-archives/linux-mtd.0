Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwaj-000559-Kc
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:12:38 +0000
Message-ID: <1335100353.4879.25.camel@golum>
Subject: Re: UBIFS mount failed with "Invalid argument" after power cut
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark <xiaoming1981.zhang@gmail.com>
Date: Sun, 22 Apr 2012 16:12:33 +0300
In-Reply-To: <4F86C039.8050603@gmail.com>
References: <4F86C039.8050603@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vsQUih9hKdNpo4LGULGs"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>, zxm927@163.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-vsQUih9hKdNpo4LGULGs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-04-12 at 19:44 +0800, Mark wrote:
> Hi,
>=20
> During FS stability test I get mount failures after power cut, all logs
> and info listed below. Any suggestion?

Hi, yes - fix your NAND dirver. It returns -77 on ECC failure, but
should return -EBADMSG. Or just start using a sensible open-source
driver.

--=20
Best Regards,
Artem Bityutskiy

--=-vsQUih9hKdNpo4LGULGs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlAPBAAoJECmIfjd9wqK0GO0P/iVNBF/i38hwL0yk9OR2eoQl
HtFOIXPemvFAfG0dXxDYbpNmeM1bfBf/rTOJSG7GpImp3+byFW9mjSaQCmjd3qrS
UW6GCFuT0z7v2aXaq645TxwSzFVGUEPbgJvV4rgGg162o4S883XZfDJh4gE4kQQU
U97x6AUWUfEDQxZ44tG2Ba+8ZAYKqYtXl0SCkarsp3wJDDwKsVwYa7GSSMferHSP
MCJRtXZBNhswW7nZS3Nis3f7mKDnsYfmBPtSq8kZG7uGEAt+mxMvfczNMYtVRddO
uDicr8EIbqA3cmUFjZxin/SK0Qz+taaq2pXmGT44W/3ZbNmsesXCgaMdBgnAyyTO
ypG3nQoaz8oDLgjHWvHa1X3QL7Tkf3hYfTvu6VldN+j84i8QuhMOGww0qvyZ2Bqs
nNvae1IL1WYN7WvVnFV0yxz2C6CXakY0ksyptlXnkisb7AZc1ryJU5mJ9yuoEuKF
l/GQvuzwUovZnBlFcC7lPwd7uwZvRT7sTNydjsuYsHcK2vGCj0l+Gl5BC/gaA9K8
3tbFmy6Qm3Ttu9AZ/sQ3k6rz3ovZSii0VqMG1ywCmF6e/Kvn0WJFdP3CLI+hdA7g
dFAe9WRxpbyqPNvDCvgMlfV3dx8EYh+FfGM1PQKwUNlZjMS699OyB2n/GHuCCe27
jJNTV9GNpzhnFotIKNKt
=NfU6
-----END PGP SIGNATURE-----

--=-vsQUih9hKdNpo4LGULGs--
