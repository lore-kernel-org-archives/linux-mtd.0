Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwAL-00072F-FG
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 12:45:22 +0000
Message-ID: <1335098716.4879.7.camel@golum>
Subject: Re: [PATCH] mtd: omap2: fix resource leak in prefetch-busy path
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Grazvydas Ignotas <notasas@gmail.com>
Date: Sun, 22 Apr 2012 15:45:16 +0300
In-Reply-To: <1334106274-24993-1-git-send-email-notasas@gmail.com>
References: <1334106274-24993-1-git-send-email-notasas@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IZTs6yjpwK6c0S+eo9hE"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IZTs6yjpwK6c0S+eo9hE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-11 at 04:04 +0300, Grazvydas Ignotas wrote:
> If prefetch engine is busy, current code "forgets" to call
> dma_unmap_single(), which results in a deadlock later, so add it.
>=20
> Signed-off-by: Grazvydas Ignotas <notasas@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-IZTs6yjpwK6c0S+eo9hE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPk/1dAAoJECmIfjd9wqK0zbsQAJiLSJIYdzQtC9syYamMc8yf
6x6cdglhtSj/BuOg/se8JqIWTVPS7uams6EU/uopvqxYZkCcj3bgTlPvPPT/nFhM
7wwpVBWLmvfFZUbMJb0J8s7H1yC222DmkQYCM6srhfyfVW9h/+2KEWgW1JbGEEuM
8wsRJLB89r6Tu52fjopo1W1CAYmduI/sXrgXisLiFACzrHkvLr9ljX7D/vTjmvR2
ZzgrGEPMh+czRGbwrg6b4eUFsvXN+xoppUZMo80v1C/Wq5OEv6008Ahzp0pcGUCr
zOoLPQ4Sosm87rF9DYrN1roqwiHztwuolFrWfGmSng36kyFLKxYuufuS/dXbeH9o
IdR5GCNky6/MtHx5+Wdpk3IxLCmeZVbl9LiPdsvypk0aXizAorZW+4arxqlKUOkg
7N/CfgT39qGqHo7meGvWWfoCdSWYyPCEZmckAoreNiCjUBpLqHXXxQNxi/vkb0sU
Fr/6eB3rMi9gKSeIZ7UyQ3ZqxcvRBu02unkScs3Hfrk5uzX3uD6ybAOgPFXo4F3u
6vissNSvo0EXDb+5usR85/drytRg7sMXpymQKcOP91Ybcia1GIET8kup6tRHm2RI
b9YOL0hThVqhjS2l0duRtsitqMTC7D2VWBIhCZtGIBmvPwWcGCzdvc/iYF4+3W/C
8qOUp+302riNyPvoQAbj
=GN7r
-----END PGP SIGNATURE-----

--=-IZTs6yjpwK6c0S+eo9hE--
