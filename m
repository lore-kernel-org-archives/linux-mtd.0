Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2Ln4-0004aq-DX
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 12:36:39 +0000
Message-ID: <1345207255.27859.70.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND 1/2] MTD: autcpu12-nvram: Fix compile breakage
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Fri, 17 Aug 2012 15:40:55 +0300
In-Reply-To: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
References: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3ik6FXvoaS/r04JXf7aw"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3ik6FXvoaS/r04JXf7aw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-15 at 20:28 +0400, Alexander Shiyan wrote:
> Update driver autcpu12-nvram.c so it compiles. map_read32/map_write32
> are no longer exist in the kernel so the driver is totally broken.
> Additionally, map_info name passed to simple_map_init is incorrect.
>=20
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Would you please send me a defconfig that I could use to compile-test
this driver?

Also, does this need Cc: stable@vger.kernel.org ?

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-3ik6FXvoaS/r04JXf7aw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLjvXAAoJECmIfjd9wqK0G6YQALCUv2onpfiHV+krN3pNjiew
OYitd53yn9R4ZcuO+UEK74O8nIbg2cxG7ts/7NiDyAZwWzouFLfkIWcq0CVfhvE+
8p4zbs5iqVZ2longU8ot/WTpb5s9EhObPjp+H49jy+bBTvL1tN498FcSB5VQD1DH
Uj3ivIu8Id4+WnEd8LUHifsLxytZdsRlgn2VYTepiqdwzlanKXdkp/33b6rP3EQH
g0PyVdVdRDK9ic3R5Ww4XMxDqFhsJTyJTSlpCQ8rnUfmhs4bS780G+KH9cyYBWyw
8ToznkQVxw8fXxsidTRly/Yc8x4XPG9byu6+3uHlejYlex5MIsmoFHjk7RrUE7JQ
9eLLUX6dPhCd6cg0l2ogYIsXmdx8L9mf4N3wZuR3ikem7XnhvRHTlxGehM8zHtXE
AuYy6dmfakwn0rRmRGjRNMugUmewtBlfxgT+PPvdSlE7dC8lnAsjRvXUvIiqfLc0
njAGWoL5UPPKQXrBy4b2Ohj3ek0IGaFUzC5MjxqIlNIlk1WwHCyoOrY4dOFgEqqM
962vEe7sa/6eN/wEl1t0hZEfAmmyQ5YLwr4gyYuzDRToKC13cnfm7QGrzcLCUP11
J/CWfIBtabL/YkM00z1G1Ir7GuFkACEZNQZkRHoUU2KHHwdmL191fwFDccZMFv1Z
p9nWC3Oy1xOw2+8FNCQN
=OWzX
-----END PGP SIGNATURE-----

--=-3ik6FXvoaS/r04JXf7aw--
