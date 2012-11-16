Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHbE-0003ER-Uw
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 08:48:33 +0000
Message-ID: <1353055749.20111.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: s3c2410: Fix potential NULL pointer
 dereference error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Fri, 16 Nov 2012 10:49:09 +0200
In-Reply-To: <1352369324-25771-2-git-send-email-sachin.kamat@linaro.org>
References: <1352369324-25771-1-git-send-email-sachin.kamat@linaro.org>
 <1352369324-25771-2-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nGa0SKaudx78vsjzVjsr"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nGa0SKaudx78vsjzVjsr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-08 at 15:38 +0530, Sachin Kamat wrote:
> 'set' is tested for NULL. But subsequently accessed without the check.
> Thus making it conditional to avoid NULL pointer dereferencing.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

I did not take the previous patch which makes this patch not applicable.
Could you please re-send?

--=20
Best Regards,
Artem Bityutskiy

--=-nGa0SKaudx78vsjzVjsr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpf4FAAoJECmIfjd9wqK0Jw4QAJ9R/uI7E6S1NiHKZzIeXfxq
GPJxWGX9ULNwH1cEnH6kR811M2jnG7ZcW3UfyNCzblpGBGQVmdP86tIOgXeFVQlF
fKAGx1KU0wwErUy8SoRI/EmMc9ebVSajzYirpvV7NIV33tsx5Y4SXr6z83eugoFS
5vDooGumoHYm65KFOqQTEjeyqqn4SUAqbIWhErLjIebGc+c2XXbOIB9jt3U+H5tF
oLhfn/X4YY7RLEhQjnr6BVdtfm5SSLkQdrUSVx++ywiKXfvbST4aXxzrUdLMeo8x
HP64tPfgnc8swg+aT0yburWhbfPbHHesR5XHnDAz09oUNytMGRno7/YqEIrhGLxm
rBqcUdAVNmVg/usEH6rT1WhM49Bq2BcA0cKd9csY5Vr+AS+AmcpKqMix7LEJ2TYW
b7YBilcP2M6tTO5Kxes2IrYuacL56iUHl/e9slV81WgUXg0hwN527XRnLr0i7wFV
7WOzR54Xc3w7WRmIM+jY2pxhKgfsgBPc/8auTZUUHpeVEL3Qt178pvdFxgpLXOFj
sgiEsKVon2ZyrJPgEMzmxOlYawQk7dFvGX3MYRc77kOYq0wg2cxUY83gakrFg/Ai
KJQsuihDkhYq9NvzYPPJic7XQnBSWpGupwfEaPrLCCBvaZZ8fRLPW99h8hJxzLDO
bBLNkaY1eGlYl8AvmfAW
=+0pY
-----END PGP SIGNATURE-----

--=-nGa0SKaudx78vsjzVjsr--
