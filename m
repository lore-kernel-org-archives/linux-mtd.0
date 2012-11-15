Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYxex-0003F3-TZ
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 11:31:04 +0000
Message-ID: <1352979100.2221.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: map: Fix compilation warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 15 Nov 2012 13:31:40 +0200
In-Reply-To: <dd11b4d47ab566931cb943dea34e67c1ce2c3e59.1351530856.git.viresh.kumar@linaro.org>
References: <dd11b4d47ab566931cb943dea34e67c1ce2c3e59.1351530856.git.viresh.kumar@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PC5xNdubqss0/04/nttW"
Mime-Version: 1.0
Cc: linaro-dev@lists.linaro.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PC5xNdubqss0/04/nttW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-29 at 22:47 +0530, Viresh Kumar wrote:
> This patch is an attempt to fix following compilation warning.
>=20
> In file included from drivers/mtd/chips/cfi_cmdset_0001.c:35:0:
> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'cfi_intelext_write_word=
s':
> include/linux/mtd/map.h:331:11: warning: 'r.x[0]' may be used uninitializ=
ed in this function [-Wmaybe-uninitialized]
>=20
> I could have used uninitialized_var() too, but didn't used it as the fina=
l else
> part of map_word_load() is missing. So there is a chance that it might be=
 passed
> uninitialized. Better initialize to zero.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-PC5xNdubqss0/04/nttW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpNKcAAoJECmIfjd9wqK0q5oP/0QdOzZ4RECzHjoYddrFAHK8
YJBFhKeK55B07cR7NyWve6Y30REBCubv9gccLsmCI192FMXchjFMuTm5i6HCN7QE
RBeKBmcOMnHLDrJRuJI1nKnScinp8dA6P6dLQTgqODYlcajhq11L8dr4TqI7GlgV
3cVNPtSz5IWUxbRqaUlrdoowrLqEfmXhdozP7smKD4vyk0LNwNWGhZzZMT8Rl6lW
jei6W3ZW/9FvjmLQLYMmtZq+nIvf6gXf9M6Tjz96WY2mBAyqk9XXu1qDVIQCxWlH
gW58Xg7e52aWRFzLPz73JNb3I4vYzR4/NP/4CcTcEX+wYByKBmXmVknJKsjTp1sQ
MMEpooUyZoy71ApyoLkCaHIv5i467xAxlk0y7i2YHXan6ONr0L4Raxg9q1XYWV7A
UUjZqNpqAmMEL+Szu7HWAVUclI/VAdGMZoNSJIU6nBQzQH1wh4YmXygsRPo55eBK
LSdiSymfwzbXEvtllYqt91d6WfrHrYfdnROjcru8KF/uerlPDoJOLyI5IeCLx27e
P9S+ANasaK0236x/Oo5/0h35UpPY0I+RwI7k1SZk6JQs2o+yxSASZyybwhvnJJUY
xVxVQOlkh4/dJ84fLhinKJI2vxCOhlPqPX3mJwE/17rcxLhS/LQUWZ4/QwiJ3hKw
QjXK+k3vAv82pXIYnN+D
=qaga
-----END PGP SIGNATURE-----

--=-PC5xNdubqss0/04/nttW--
