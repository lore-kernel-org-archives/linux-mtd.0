Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOpBE-000208-0N
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 12:26:29 +0000
Message-ID: <1350563206.5769.313.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] jffs2: Fix lock acquisition order bug in
 jffs2_write_begin
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Betker <thomas.betker@freenet.de>
Date: Thu, 18 Oct 2012 15:26:46 +0300
In-Reply-To: <20779914.XYDRY924qZ@linux-fiwg>
References: <20779914.XYDRY924qZ@linux-fiwg>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wFqg+lqoKJjENNhKLDkx"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Joakim.Tjernlund@transmode.se,
 Thomas.Betker@rohde-schwarz.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wFqg+lqoKJjENNhKLDkx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-17 at 22:59 +0200, Thomas Betker wrote:
> jffs2_write_begin() first acquires the page lock, then f->sem. This=20
> causes an AB-BA deadlock with jffs2_garbage_collect_live(), which first=
=20
> acquires f->sem, then the page lock:

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-wFqg+lqoKJjENNhKLDkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQf/WGAAoJECmIfjd9wqK0QtQP/0Y2BgVw4FpXN5PkqkaeQqn4
rtZ++H6YO7fttm47SuNWn+36nfSPEzYOK2Zo16o6B17l83eu+l4LQaSAYBvsTEyS
Sz/NkloTITpz5TYSmppr7rpytk1LTkJ5kaItTfoHiQYT0tYg0Fh78Tkv3Gh7QtSY
Qal/TBFia7ogMwJulocOEZLZYijQhmXMYTKEN3ruSQNDi5R3QuALiQC/cvB3ySjw
BHVmkUT6BBeEK8R+mo80KBmkX/5mD1j2UAXH2c4fip/aNHRgsKG5aXwJ5m2B6iMF
AFDJBrRv4WxNSYCQAp8Nm20FN8NfxcP4o50Ggg5BaqHhTUG8DYCbPX5XO1OUS6Dq
BZARy3A/xw1nFxINE7IUs27x0tbXH/eoEkj21/yhErvggXUb3fiUrwHgffjDp7CA
fKE/d4llVAjPLTtWGB0qOnlRX9/Aa2Hl9ux22oNeyTciJgKmhmzDgWEvfJscW2ON
Ht1Xmc2nHXr43RbpxIfz/lj45YGwEdxU8ICqd/BohcbGwAgFCThjl8RyBfCYjT0e
D386q8Z8z2O9CHGHXB+hT3x3Z1KJGnZjRGY7aLc0AgM3kQebVaYOC71uzqqDpxYY
6Wm1D77ltXKMjZLpTbUlZXQ+dbVsSNeYdY0fwlH2vQcrFBR7CaCucfEYEEqNn5dB
fvYgG58An7w/6RAuqrjG
=g6dI
-----END PGP SIGNATURE-----

--=-wFqg+lqoKJjENNhKLDkx--
