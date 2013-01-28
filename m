Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TzrJD-0000bg-H9
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 16:11:48 +0000
Message-ID: <1359389600.7570.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: onfi don't WARN if we are in 16 bits mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Mon, 28 Jan 2013 18:13:20 +0200
In-Reply-To: <1358346345-7920-1-git-send-email-matthieu.castet@parrot.com>
References: <1358346345-7920-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6IeUWbJCj1ELGmYFTrM3"
Mime-Version: 1.0
Cc: paul@pwsan.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6IeUWbJCj1ELGmYFTrM3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-16 at 15:25 +0100, Matthieu CASTET wrote:
> ff3206b2450499203532af2505a7f6f8413e92c0 adds a WARN if the onfi probe is
> in 16 bits mode.
> This allows to detect driver that need to be fixed, but this is a bit noi=
sy [1].
> Transform the WARN in a pr_err.
>=20
> [1]
> http://article.gmane.org/gmane.linux.ports.arm.omap/91317
>=20
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

This one is in linux-mtd.git now.

--=20
Best Regards,
Artem Bityutskiy

--=-6IeUWbJCj1ELGmYFTrM3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRBqOgAAoJECmIfjd9wqK0i0wQAIgyHwhL1rYDc6Rg87uSNLrK
CyR9v9CJOmdXFxYGIVst5HhGvCAaRoeM5/AsTdr4zfwC3DwgrhzZa/9dWPfpNTn7
zWL9RdYGOZSFP4uTmVNs8+2upEN6ZAV73F1+8uvF4+GdA8Zh3wTbKUdiCj99sqvE
pmyR/LcCp0TcsX5c/uZVZWptFvJ9udSTL5hCHvYuThUBxPCoTOeBi+MUVWmUhbUy
q1KxVnL+0z2IUdLztAfGBo9Pu/fAfM5dqgZC4S/jhPTeMtFaj5Jan0TTjBgq7R09
XuAWtnFJpyWEFgBHZ9jLxEnFRIUIJ1s/0j7887kuhjI5KBPFBupOsiZW6CudfO6O
cD9VYInxzrPMqmOPBaYAGBKRn5V6fXt9vdXqsckzCbgcyO432/KLY/0yxK/cOM6x
zOhn3uCuGWf+lpmQeeOnIp5Fshr7x4Sa8zvrL2htoKV4rLkNy8DNahReMak6NYsc
4SEYIPAsZLkcPw91bdJa+tOHr5RiErMUW+cc34RDq8cfSn4c7BS1uPxiCahvpApR
16r2aXR++w7kxMFA3ZVK3gxca/rtN3VLpWVr1vDBZrA1BLNTiS8Y1tUcTyVfls/R
FSuo7rEXh2LR67gqn1MeTpPIvxGdf4VOY52jL5cv/2LjfRc0osV0PvVAEh0s09Iv
QwbesRPL8N7Zb2sDTiHy
=JlYK
-----END PGP SIGNATURE-----

--=-6IeUWbJCj1ELGmYFTrM3--
