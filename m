Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv6qX-0003Am-QW
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 13:46:34 +0000
Message-ID: <1358257677.2731.141.camel@sauron.fi.intel.com>
Subject: Re: [PATCH -v2 17/26] mtd: rename random32() to prandom_u32()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Tue, 15 Jan 2013 15:47:57 +0200
In-Reply-To: <1357215562-6288-18-git-send-email-akinobu.mita@gmail.com>
References: <1357215562-6288-1-git-send-email-akinobu.mita@gmail.com>
 <1357215562-6288-18-git-send-email-akinobu.mita@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qKbVCtNnQRi42NKfPLwE"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qKbVCtNnQRi42NKfPLwE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-03 at 21:19 +0900, Akinobu Mita wrote:
> Use more preferable function name which implies using a pseudo-random
> number generator.
>=20
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

Pushed to l2-mtd.git, thanks!=20

--=20
Best Regards,
Artem Bityutskiy

--=-qKbVCtNnQRi42NKfPLwE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9V4NAAoJECmIfjd9wqK0WtgQAKcSD2qAF8pDUvO1bRwg9S4B
i72IVOdKhd9mx8KOuklaDK7knxvOBKJ7uxT5wZmF+s1+MQ9VandfKihcf6t8xzRl
BFKY0QwrVJLy8R4y0EO/RSFM/Pm6DKjfrIKtwHIPmlQf7/TjCeyqkLQ/o/fGbanr
8FuRWOAalzJHavpumU3imhvLF899oDWDCUxxxtBPGFS1Rd0XlJTtbCzo4CUrrWvB
5wEKOKgIZGewmeWYCwX+tPgdI5qv4LiiaRLXbyj2xFQiEpHphBTAtbz1R5Fx0D/W
rdZR5kgF8OEV61zlfXSBwdP1ums4wVomEahWOEUz6GAOMRqyMrOzfWcgkhJa82cs
qbkDu9YzV7SKxtnDx3UxnnRH4rmiEyAuWd7oXDyqMb+Xxjg5u3IVgURG4MQpfbO+
GqU9VsOSCGSN6oOMz91EzShOVw3S2aHSetxBKJrO3i7M5Ap7sbWlZ5DIo6FF5Sgm
q18L2uE0BHT8vSqTvhbxLqa1PcNvliOtXLXr2cP/rR1zuFalG/4GLFtil+hdNDzV
JXQdgwACJS2Z15wthLPv6vBMugS7Q7DYQpmsv2846UJ/TCatvrZ+XqriKu6hvbAw
S3FnGCj27lCB6LTlnEsNyo6uWoeLLXnLEk3fyxYgTY/7ANNx/zk5hum63kV0xcXg
s0ai2QKa1Eyf1MymIqZ3
=S/Cf
-----END PGP SIGNATURE-----

--=-qKbVCtNnQRi42NKfPLwE--
