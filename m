Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7Rfv-00037o-FA
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 13:54:20 +0000
Message-ID: <1346421558.9709.51.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] mtd: cmdlinepart: sort the unsorted partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 31 Aug 2012 16:59:18 +0300
In-Reply-To: <1346001700-26895-2-git-send-email-shijie8@gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346001700-26895-2-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UZkn5sQF3/o227WRBB0G"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UZkn5sQF3/o227WRBB0G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
> Assume we have a 1GB(8Gb) nand chip.
> It is legit if we set the partitions as the following:
>     gpmi-nand:1g@200m(rootfs),100m@0(boot),100m@100m(kernel)
>=20
> But the current code can not parse out any partition with this
> cmdline.
>=20
> This patch sorts the unsorted partitions by the @offset.
> For there are maybe only several partitions, i use the simple
> Bubble sort algorithm.
>=20
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

I still cannot find time to actually think about this carefully, but the
commit message does not sound convincing, it does not explain why
sorting is the right way to fix the issue, and what would be the
alternatives. It actually also does not explain why exactly we currently
cannot parse the example string.

--=20
Best Regards,
Artem Bityutskiy

--=-UZkn5sQF3/o227WRBB0G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQQMM2AAoJECmIfjd9wqK0SN4QAJL9lqZnDJbjpjMTdm2t5wTQ
pv8D4w0s2I2m+KqD4XhpDFzkzW03H4U3iGyjO4ovCTGhxuF47NVsY/ynH9nF5aMn
sFnq5L/i2lWGzdIM9HLnzYxj4ID9Uf02Xcb4Q6yt5H/5zBK1EH2JMATz/0JulhKR
nAJUufMISL6prv0M7WtKiBWGYcNXmIfrXQALS6UkDspKDTnc9Vf+hWL3wqM1FO/N
yxa5yvkto4K5UG+GedUPm0xt7CeuSZIb0/PrwsQw3ZR03sGKXaRbC9fcxv2rm634
S6kqwXNOxs32Rx8cCKuT5deJqwzh9YmCND9wkVi0MNrH6/PfZciLqF5UvZ/Iuay1
SEgGgRLrt+pR5D+FlP1NUwLpN+22v6Y+P8j28A2mg9KnqOoeQV97zTn5xCmEr4hw
GqRo3BdH8XkgVDWw51+mXMkrf5xJOVmDUr3ZJCShaSXQVgBbNr5b2H8J8y/XZfRS
+JR1qEzHgg9drqj70rCQRm7HruhJwByUaWqPSmoBDRygxj6Ao04+gpF6njYyD+zP
5ByewOdmka5oR2z358/hoF5LM/qWL6nIis+F0eifONy7BiuAMokms/Jn6z6incP9
c8LW5z45UPtrORvANkJoAIP47zLxzSj50fM3zzhMY7OFIBcEoM6NHAP7BfnBSsil
vbAysWK44o84RE8Kqrbv
=9J8d
-----END PGP SIGNATURE-----

--=-UZkn5sQF3/o227WRBB0G--
