Message-ID: <1345820924.2848.320.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: physmap_of: Add "no-unaligned-direct-access" DT
 property
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Fri, 24 Aug 2012 18:08:44 +0300
In-Reply-To: <1345209752-22938-1-git-send-email-sr@denx.de>
References: <1345209752-22938-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SXi7hJe3oqhDPZFOVX6r"
Mime-Version: 1.0
Cc: devicetree-discuss@ozlabs.org, Albrecht Dress <albrecht.dress@arcor.de>,
 linux-mtd@lists.infradead.org, Anatolij Gustschin <agust@denx.de>,
 David Woodhouse <dwmw2@infradead.org>, Stephan Gatzka <Stephan.Gatzka@hbm.com>,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SXi7hJe3oqhDPZFOVX6r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-17 at 15:22 +0200, Stefan Roese wrote:
> On some platforms (e.g. MPC5200) a direct 1:1 mapping may cause
> problems with JFFS2 usage, as the local bus (LPB) doesn't support
> unaligned accesses as implemented in the JFFS2 code via memcpy().
> By defining "no-unaligned-direct-access", the flash will not be
> exposed directly to the MTD users (e.g. JFFS2) any more.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-SXi7hJe3oqhDPZFOVX6r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN5j8AAoJECmIfjd9wqK0mIIP+wZdIF3Yp0dnJcmuS7QabS4W
2ZvgAcU5azo9ZYtaVS6+DfsJcRMmfPqu0vfny7ScjgydzUqww2lbitn8OL3xW9Oo
Su1u+WuBSVagR++GVw1RyetwlcgPAMvxSArlyIqNNpfPxMB5+KsKi0JxnSD4mw0m
swpTN9Fcq+/QfyWn2wEruIJov99nvofCTLOVVT1FXxIlvxiSYxGjXUkd40NKzJBA
eLvB9SGFiVEdyeLgPXNGe5gnQbjdK8uI1NBLYoeSgzd/KuYG9ezqzJ5JEHGc4mwO
n+tBFrR160EF4clDNB//m5t8ltkCnvaHOoAOVo3SACiUSt9rrGHxFxObIsOeBV+U
Jw4k75y8r9bDedBMAM8F0J5jJxiw29Y7yPw5B03I/iTrjBKhaJqVTUldQibgle8H
XLwvTZ/9nlzcwgIZqijcmmn4hfOgZNwJwV2V2qD+TWEnzu9T0YY8b6+uY8EimAkl
zxAvz8pRHnltxIENxh9dJHn30LDRqDYEEGgLzHM0DhN6YzXSqr1fM8NlqgJ4LZbK
2FsxWeI0nZHFlVsMGrfTMx5wi3qdB/2bcZ+XLgm2Br8BR47dNv8VUvtp1Ojuzd+l
1EBSwGT+r14Y7af2wqJNuChKzhdBt+Ds3KIkq6TySLuA4l4UJTHm1fw3AYMLsRXe
da7WHb7oJfIQqiPVHXx5
=Lz4X
-----END PGP SIGNATURE-----

--=-SXi7hJe3oqhDPZFOVX6r--
