Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5EFy-0006wA-9t
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 11:10:22 +0000
Received: by bkcji2 with SMTP id ji2so849950bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 04:10:20 -0700 (PDT)
Message-ID: <1345893017.1815.2.camel@kyv>
Subject: Re: [PATCH 13/14] drivers/mtd/ubi/build.c: fix error return code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 25 Aug 2012 14:10:17 +0300
In-Reply-To: <1345365870-29831-14-git-send-email-Julia.Lawall@lip6.fr>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
 <1345365870-29831-14-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GC/AR0VLVxtZ2NnzK35z"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GC/AR0VLVxtZ2NnzK35z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-19 at 10:44 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Initialize return variable before exiting on an error path.

Pushed to linux-ubi.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-GC/AR0VLVxtZ2NnzK35z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOLKZAAoJECmIfjd9wqK0FlcQAL45bf4GsfJZHB8dOneVIEzC
jJS5Ck2X0YmijXq7oH14hcpHMPC/uQz/5xYoq+CxIj1z5HA3CcVC1xZmyeKvQfmJ
gvmD4e4MjbDpjKfB9SDCVXKar3hq5BWjCVpBChqX8yo+qzFyvWAWchA6F6KRcKlY
X6QHKffosiMQuMKebJvxbJG0z7MeNxgIhs1dA27Al84K0ZpwhjaDBC9UBiC4jeUN
dmqJMvNuN2yn/jCc5V7iwDBpacd00OIx/jPQ/i0viYEmcuIo+ePYWTPi0LDvBjnR
R80XICnXUJKq4Cs1ge/IjSKZ8pFzimI5WEnhfi1f6gMPKzmE+gcid+DXNTbOIyH0
AaP7qiH5sbeEOgPK8c6PsSrl4K8ZwVmGqVAsZXMIHt5Z66x4zCCz5YDT8267VNoV
QqfNrkRID7fn0CymeoEMwqhn6/VXO1iCAYA0WlCtTWhB2NQkvMTRJk8hPEga23DP
EnF8zHYuplTUf2ysIoIKCe+dYCMBRhTkglHsPeUmGsFf3YVAELFSdgcP24lxE+wd
Stdu3lEQGhGqyJDvlIPgQux/NEyqEtWnLgOMHQ62XwSjkHbSgusRNzW9GT+v0aGd
25eumBNQsPmrmBpg8vCawr0lOSdzWh8DIfI8EQfmbVi7UU6HjWP0ckVoxLdeRBeU
Pg6Ln7Vs1TKhqU2sn6nd
=D5+c
-----END PGP SIGNATURE-----

--=-GC/AR0VLVxtZ2NnzK35z--
