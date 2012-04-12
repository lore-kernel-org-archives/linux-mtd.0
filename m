Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIE9I-0007KK-NR
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2012 07:08:57 +0000
Message-ID: <1334214713.13842.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] Add security.* XATTR support for the UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: subodh.nijsure@gmail.com
Date: Thu, 12 Apr 2012 10:11:53 +0300
In-Reply-To: <1334179707-31754-1-git-send-email-snijsure@grid-net.com>
References: <1334179707-31754-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2T522Pv7TlN/cXvWOuqW"
Mime-Version: 1.0
Cc: linux-security-module@vger.kernel.org,
 Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2T522Pv7TlN/cXvWOuqW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-11 at 14:28 -0700, subodh.nijsure@gmail.com wrote:
> +#ifdef CONFIG_UBIFS_FS_XATTR
> +
> +	err =3D ubifs_init_security(dir, inode, &dentry->d_name);
> +	if (err) {
> +		ubifs_err("cannot initialize extended attribute, error %d",
> +			  err);
> +		goto out_cancel;
> +	}
> +
> +#endif

Suboodh,

would you please first create a preparational patch which removes
the CONFIG_UBIFS_FS_XATTR completely and makes xattr support to be
always present.

And then you could add the security stuff on top of this without the
#ifdef churn.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-2T522Pv7TlN/cXvWOuqW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPhoA5AAoJECmIfjd9wqK0I1UP/1k4rgvfhMlwtsMtWeSIyfgf
qk1bQ3psE8wj4zKt/9FhkGdVuGF3Bz0x2BqYJDGzQbUfVTpCwS/VQ+0DljKoawe9
VpbhUau0H8D8A/Fo+6ajZ9AxdA5nAkW+q04lYbGULOWDQD/sY+cj7VO+y4Hj1bFz
fx58ZqxEkwhJx0DN0VbuoN6g+9BA1fwjCNtc6WUrPdQY44Km8WlXy9TAwCxJWB9o
zTLzC+/XBZVteD8eBgt79kCTEdU5nQkLCssu+WuSJvreLqaWRGY37pJgMePOproF
c+XMu04gKnkxlvdyiRorkdYrbeJKpqTkyzpErGeopFACK5A9JE6xu6gHEQwfwr0J
EVg0pxfWrLzR2RSD2B11LORnyJsfgOYe96eDSlqMfvT+1HJ5L1V8wITtOnuvN/zM
C+LxfIFaFEFuiCqTLk9cCnDCFVSKs1N7BVUYKLiHNiqamMaXRox8KXBZybWgnUFg
bYpbtxdtx83kF4M0imhpUGWTv2Fbu8lzQZ1hAFFFVdAwOROGDw7jaOgKCSQ75hST
bYSOP4S7hpVBeHIqhmJiTP9FO0zG070RtejsuOTTzSlpd5A6mD7uNMVeXw6UnE/i
eHhDpd2LA6ZKcJ2N3CartCAz7W3TuL+bHKv6+SkoNqPtgFP1fRiNMgLJMyvxDICI
7NzLhQB9VqbcIfSQ9Ork
=5TAZ
-----END PGP SIGNATURE-----

--=-2T522Pv7TlN/cXvWOuqW--
