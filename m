Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXtVo-0004rh-C0
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 12:20:57 +0000
Message-ID: <1337948678.30969.31.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: introduce struct ubifs_keymap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 25 May 2012 15:24:38 +0300
In-Reply-To: <alpine.DEB.2.00.1205250947210.1340@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205211640320.3833@eristoteles.iwoars.net>
 <1337769818.2483.202.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205250947210.1340@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-x1s2xCuPahR6RpUBs2/Z"
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


--=-x1s2xCuPahR6RpUBs2/Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 09:49 +0200, Joel Reardon wrote:
> This patch introduces struct ubifs_keymap, the entity responsible for key
> generation, distribution, and lifetime management for ubifs's secure dele=
tion.
> In addition to the struct's (partial) definition, it is added as a field =
to
> ubifs_info. The alloc routines are provided. More fields and functions
> will come in following patches.
>=20
> This is tested using local unit tests for the functions: alloc,
> and checking couple/decouple is sound. UBIFS integck is also run to ensur=
e
> UBIFS is not effected.

Pushed to the "joel" branch with a minor amendment, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-x1s2xCuPahR6RpUBs2/Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPv3oGAAoJECmIfjd9wqK0mX4QAJq1y73HE0QrzTXrRwIPyrF/
HnMs4nxN4UjEZOLt5faLNORahiupauRfyJZPRCFaalUC2/D8kisBM/wW1wroQy69
pgHshqoh1pN1TdDUby6m99MWLYl3BV/CrH1g1kSIVeb8gkSMeDtvKjOV6rj/Qg9q
bOwC5/d99t44sTXhTUtcdOfFqUqBss7ze1V74WmRnqfH5iiEensh5crPJgq15VVG
i/FeaMJxi6i5PxUw8FrnT6AdawGsFXUXa7zP5f7ji9woyH52jYGQOdgrVi2Ur2Ko
VQiDtD98Yd/qOPb/nKlMMLMY42nUDrB2M01MKzcHsd40Yq7X2enpER81QV5bXuKP
oWIug/o260dczJ0DBrLGAJf12T8n3FqcxQoU1VJhh5E67HutCWZLGOXUSWrHWK82
OQ7vMTXaEnMsEfEe5AuMOwxTEdg7lmC/N2/01P3qG9jwer/hbAAr2CvEt3vMWXEs
0x4m5d+E7Tl7rBp8G/Il3pORAN7oLm65WF+RSW4SelX1TNwfI7COQrdJzhxZ1rWb
14+ElsKSvXG6P+/d7k12Q640kyNCm38+Zduwov2eJlbf7HfFrSbXUJulNvN8QvBg
adPQuk/klS15NwplFoiljlBIO+C2nUQQw3Uecb+IYfeT0TKI3BjmRJCfM5jv9v8U
3XvzCZBM/DmgoZq7tPo5
=EMqy
-----END PGP SIGNATURE-----

--=-x1s2xCuPahR6RpUBs2/Z--
