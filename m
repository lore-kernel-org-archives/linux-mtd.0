Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti1hc-0006Lo-7R
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 11:39:16 +0000
Message-ID: <1355139583.25188.148.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: Embed ubi_debug_info field in ubi_device struct
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Mon, 10 Dec 2012 13:39:43 +0200
In-Reply-To: <1354105110-24721-3-git-send-email-elezegarcia@gmail.com>
References: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
 <1354105110-24721-3-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HgEdGDqvUXDu0x9WSXfN"
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


--=-HgEdGDqvUXDu0x9WSXfN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-28 at 09:18 -0300, Ezequiel Garcia wrote:
> ubi_debug_info struct was dynamically allocated which
> is always suboptimal, for it tends to fragment memory
> and make the code error-prone.
> Fix this by embedding it in ubi_device struct.
>=20
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>=20

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-HgEdGDqvUXDu0x9WSXfN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxcn/AAoJECmIfjd9wqK0ie8QAKyguooixXfZdHzbXtWNKjA8
80zRb7tUvQngiK9qe/gbFkhstC3GNabpo8xYozT4AnaH8i69ySRZ15h+v/1ntb+u
kgAunqQkOYOGN6wzjMJHFNC7aR1ZArU8W/1tSTiH6lhvSLim4Y5JsiJhZ+M3LYnh
bc8dX4Ea5DezmYbz5nKXCoShKczIkvuGHo54tOlu/EnTQEl/n650x5fzzPvBwe0A
BUX/ECFlfM7+okTnoWB3U1byIuRzAv+gcw0GFvQ+yk63nYoGSA1RkRa8UfgmQqwh
EtRNAyAE661iHz3gbsNesNRpSjBnGtuUgai26kemoLTMm8Nlo/yOkLEDx99nzUvl
8OkWJFzwX752sC8dCUoHwWxELc9OaQuak8F8qnJJ5Hrhe6qTJU/wNah1WfF2nCUP
AGh7v/M+6WpwmIiC+SLq0Jmtw54ZHjkZjEkg1okFt1ZtZ3FiFmwJFF0QeHFoky9a
jof9xkiabU9luo1cL/vyumpnkvuZfPmZmymTpCLVCZBSIkf4mNUMgkNN5eVPfCql
6qfxPLP/xcHwSK9UrciiwcNuZMS4NgPYq5cmXPqvEyH9RY8rqgpXZJaTOshCAYIp
lY/11iJUb1t5fVDkX5yhZ72PO79CzM6v6g96Xf0NLEDjfxROLycBrLKqnGzClYQf
Y8Vf9qA/EbTfIHfq5GmV
=rC0Y
-----END PGP SIGNATURE-----

--=-HgEdGDqvUXDu0x9WSXfN--
