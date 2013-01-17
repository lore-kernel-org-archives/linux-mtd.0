Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvohx-0005BJ-VI
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 12:36:38 +0000
Message-ID: <1358426286.2731.245.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: simplify size calculation to one
 loop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 17 Jan 2013 14:38:06 +0200
In-Reply-To: <1357484916-29965-1-git-send-email-zajec5@gmail.com>
References: <1357484916-29965-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CsuTGC1FghTAdpvd+0TI"
Mime-Version: 1.0
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CsuTGC1FghTAdpvd+0TI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2013-01-06 at 16:08 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> I've checked this patch and got:
> > Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linu=
x-", no issues

There is some breakage in upstream and aiaia cannot compile the bcm47xx
configuration. Any idea?

init/calibrate.c:257:47: warning: no previous prototype for 'calibrate_dela=
y_is_known' [-Wmissing-prototypes]
In file included from arch/mips/bcm47xx/nvram.c:17:0:
include/linux/ssb/ssb.h:440:19: error: field 'gpio' has incomplete type
In file included from include/linux/bcma/bcma.h:7:0,
                 from arch/mips/include/asm/mach-bcm47xx/bcm47xx.h:23,
                 from arch/mips/bcm47xx/nvram.c:22:
include/linux/bcma/bcma_driver_chipcommon.h:582:19: error: field 'gpio' has=
 incomplete type
make[3]: *** [arch/mips/bcm47xx/nvram.o] Error 1

--=20
Best Regards,
Artem Bityutskiy

--=-CsuTGC1FghTAdpvd+0TI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9/CuAAoJECmIfjd9wqK0dsIP/3ZibDtdgfhU8MGeoeqIMema
dvhYz+BajqvCm5azsNkdTwSTgq2k8YJ80BaMT2oCpdam3op+dK+5q5u6Vf0fp/xh
ZSengOQXlkLrYSrYPA23awQrfiOh0EuZ9QRi0xo8JO9Os2Eg1JWAHvK91vcOIGOv
13gZVTi62HD19eQBFDO4pkuSLX/tp+MG5zy4rEosxP/V0DQnOm3uaM7B51Kzoaxc
wl4mHaWmzQ6zWWdDD68L0DmfEFwSl9BAKVIZ8zKHH7QBXDsDAkifNrKFqGoQpZHJ
UX8phRgLbQWWlufJZknrhM91KE2DWNE6Nw905qZ7V5gRqk28VZ86rA+F7UAWqnca
uNCQFBtPr9kX16FUfnJo4Hy50OByGM0qcAW2FZaBeHOqn7ufDNrMMPHykNiZmV7G
DGXyLb0XzO4nEif/RmZ+uifxYgIMqp3rC40/XCPEqHFIfY9Z6tvEW3L91k9HsQjo
u6GaEKwTwUNWMSWpEmsZvc6LQ/IpM2+fxX3XKM9E18NwWL+JBhZg7sXIDIhveE4w
JOAjKo9zZtjkVu5GM///xQfNHkB4m9sJ6HhjaYfQrbae0Xjl6L2qOEEEvECV1S+M
f6m9VUzSutxlc/TLz2dtRSXoyOU78Abm/X3aMYSi7Eh7a/Bv64ycNKUsvRTl8wVO
JvgzzCZ3C5XJOAApgfPe
=FSkk
-----END PGP SIGNATURE-----

--=-CsuTGC1FghTAdpvd+0TI--
