Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti1gv-0006IM-Bo
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 11:38:34 +0000
Message-ID: <1355139572.25188.147.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: Introduce helpers dbg_chk_{io, gen}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Mon, 10 Dec 2012 13:39:32 +0200
In-Reply-To: <1354105110-24721-2-git-send-email-elezegarcia@gmail.com>
References: <1354105110-24721-1-git-send-email-elezegarcia@gmail.com>
 <1354105110-24721-2-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-XPeOKyJ5QvnZVpU2zD9N"
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


--=-XPeOKyJ5QvnZVpU2zD9N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-28 at 09:18 -0300, Ezequiel Garcia wrote:
> With this patch code is a bit more readable and there's no
> generated code or functionality impact.
> Furthermore, this abstracts implementation details and
> will allow to change ubi_debug_info in a less invasive way.
>=20
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-XPeOKyJ5QvnZVpU2zD9N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxcn0AAoJECmIfjd9wqK0HzkP/AkKRMcalWZs50LfZQqH4oMt
paX3VVO0lt5u9wqolvJAaAs/8oW5VtHznXM4FnnRiBuNyGLJyfFOFv6CH2CWxP8h
r9AIbL+9T3M1w7sDENxSwFCh9iChXgr45XT7N7jBOvzgROpNZwKt2LFLrPLa21/+
JerXmEHVGCCID94bYuKWb10cQfz72f7Vgxtmv3uDIbUKiWh7nhnvScw4hOUxJLcU
x/asbbByVZa2urFBb7f/kokjQAGXJ4K6fFF56RWIZwZl+lk/2BvsC5RysEjSQpSx
PNHRTgzjKI2br5M3eOQY7GP5cBU+lYZ9czhPX8M3l1hl8W2RRh+YZZUZ1lwg6p87
xE8FwxIc9Cs/m4k+s4Ql6F4hyhzA9MzrKxRamtGSnmo/Kw8ifow3RiqMn0N4qYEl
zFnFXF8dE6g+WQ1yZ4eA5RSrLbv8AbinsD6wmbllX37Lrf4h7rNP8kGXhQLUAOO7
Cz0mqjoGcj8k/X4QOG5yIHehPnb0nnbaAtNJiSkMoC5ZyWN1Q2Exd34u+kv0Txke
fmhvRAYCdoQdaulCgF7BFJv94Hns2Bh0KN4RWa/j5l6cY/DjtzHweldAg78ag8HN
b6AJIvqadFL6TeK1Iu3iZsqlSdIISh4YuQy2I3z10jG9WyuIG56L8PoxwLdZLDPU
R46kbxMIxkf+Your+VHB
=0eY1
-----END PGP SIGNATURE-----

--=-XPeOKyJ5QvnZVpU2zD9N--
