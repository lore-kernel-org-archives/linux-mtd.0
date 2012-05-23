Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SX91d-0005k2-Ec
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 10:42:41 +0000
Message-ID: <1337769978.2483.204.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: introduce struct ubifs_keymap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Wed, 23 May 2012 13:46:18 +0300
In-Reply-To: <alpine.DEB.2.00.1205211640320.3833@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205211640320.3833@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/G3G2d1OPU4lxk7lxlxd"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/G3G2d1OPU4lxk7lxlxd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 16:41 +0200, Joel Reardon wrote:
> +static void generate_key(struct ubifs_keymap *km, u8 *to)
> +{
> +       get_random_bytes(to, km->key_size);
> +}

If this function is not going to grow soon, just open-code
'get_random_bytes()' instead. Try to not introduce wrappers like this -
we do not appreciate it usually, we prefer open-coding things unless
there is a good reason to have a wrapper function.

--=20
Best Regards,
Artem Bityutskiy

--=-/G3G2d1OPU4lxk7lxlxd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPvL/6AAoJECmIfjd9wqK0R3oQAJLN+3eJKoyhedcexw0TFUcT
sLh0dyZWEnVAYApfgx6trqOUK3dmrpg9Hy1UQhFUB4jcU25W2Jn97GcCrvVl6rDw
L/tEU7jkuylcCMSw4u4qvNFcm1R7BG7MMP95TkC3gHu7T9//zkUkaI5SjuDUiixf
u7N9t3vkOOzd+MNIgwQgFlpBlC4Pd48o6Okhe6VwxbOodwk1JX9GzBt6W5d5XQQ8
/XEl3Nbhn08Zs1Jd+xppbwcJbzt+EIajDqZtrP2eWDsWiuWDjM7EmfuUGJyYr9yd
ryhpqJyEE/9iPUz0VRKDHeKvLddYl6uS5UsBk+LrPczVmuGzgpitfG6glZMkEBxr
wSLMF00NN/uDpM4JLLKOFfUyFBW6rzcuoOGTVO+vtiM10VlBCcx4vgo2yCjIBeeV
U1lzODHQ2hTwVcg/6pmzvT1wqarpPTqzb2Zz+cp6rSEc2jzWD15s9AbYvPYbjwSh
/30JdgWaSrDHoflvLDbRhH+eQGGFilG7hKg1lhD2pxwu8VxuzvMj6FdII8x9IdOl
uZDvzetfdmWBrXM9XYWPyQXyvkify2d9Stw3Wfizyv0Myc6EVTETd3L8G9SeahGl
SwfhLbUf0ufxMr/BA74OsmkoGRqEbkBRtMYd0N7mqvkVoc7qBBUbsv0qPOiLojk4
epWjAe8CbIcUq/uiDde7
=R80t
-----END PGP SIGNATURE-----

--=-/G3G2d1OPU4lxk7lxlxd--
