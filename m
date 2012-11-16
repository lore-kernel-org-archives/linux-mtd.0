Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHmh-0005Fz-Q8
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 09:00:24 +0000
Message-ID: <1353056458.20111.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] jffs2: Make handling of erase_completion_lock
 consistent in jffs2_do_reserve_space()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Date: Fri, 16 Nov 2012 11:00:58 +0200
In-Reply-To: <1352140814-25208-1-git-send-email-khoroshilov@ispras.ru>
References: <1352140814-25208-1-git-send-email-khoroshilov@ispras.ru>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gdVzduy1btVmWwKOx2qE"
Mime-Version: 1.0
Cc: ldv-project@linuxtesting.org, linux-mtd@lists.infradead.org,
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


--=-gdVzduy1btVmWwKOx2qE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-05 at 22:40 +0400, Alexey Khoroshilov wrote:
> Users of jffs2_do_reserve_space() expect they still held
> erase_completion_lock after call to it. But there is a path
> where jffs2_do_reserve_space() leaves erase_completion_lock unlocked.
> The patch fixes it.
>=20
> Found by Linux Driver Verification project (linuxtesting.org).
>=20
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-gdVzduy1btVmWwKOx2qE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpgDKAAoJECmIfjd9wqK0guQP+waXozU33WI+ACTmbSCJar05
BbPYnr4hK90tXTbY8rB8nQh8tNcdqk3cRXTBDF7BbGCCXfDS90eXPI4Nt1+Li1ny
lX/m0wTreI7t0GCql+K7i0mia206XNAHp3uCQlDQiXibeI7ljo+D5EWhhwR5AIZk
YDINVT2zsNkkCUaKixgAKPoFo4uaicejrnRahY+QYQe2nTtHpP8a+WEKxH34N/F1
A+XDV+UwbcJgE5Kg+teKKVJCmxl1N3mLjrUlQhlt47WJloQajzh9EIIxJDAW9+o0
uvrQQaG+lJ40CKuDLSFp4hpRLX+/Mi38sUTETwBtxOyxA2f63TEVcoIpHzhKNUb1
Td0ANXxayur7m2VABCXiLsyhhlDs/2kLKsFkncsmJnlY3FZCOsjojE2QyJJPxoj8
1aiVEuL/V5YRxHuEju67owKjMfNAGycNZ75CQH1Vs6gi0xY5H/apl62cI6UZYhyq
4lJbVzDnTJwWB4sbtSMygb5NUVnMnT7m48TZrHfLETeEaoMYUdTFWUJpwMygX9Lg
fl9fZp072vtc/4YC2jHdBFPNzD/6x7nh6daHyazFgwgdTphSCfQpeJjeQMrUzT+y
dq3/gR1qMFIsE1M+T1XgH3NEbdkXFl1oBgJ83oPQGrQ8X9SlbhyCOSp7+P0v4s0v
xXAN+HFnMAPQhG9CZTTT
=/abk
-----END PGP SIGNATURE-----

--=-gdVzduy1btVmWwKOx2qE--
