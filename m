Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8px9-0003t3-Ni
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 10:01:52 +0000
Message-ID: <1346753195.12610.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 07/11] mtd: mtd_nandecctest: generalize injecting bit
 errors function for ecc code
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Tue, 04 Sep 2012 13:06:35 +0300
In-Reply-To: <1346677206-13621-8-git-send-email-akinobu.mita@gmail.com>
References: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
 <1346677206-13621-8-git-send-email-akinobu.mita@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wxttaSDgCly8EUXV3c3L"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wxttaSDgCly8EUXV3c3L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 22:00 +0900, Akinobu Mita wrote:
> In order to inject deliberate bit errors into the ecc code which only
> has 3 bytes, this adjusts the bitops usage in inject_single_bit_error()
> which is currently only used for injecting into the 256 or 512 bytes
> data block.
>=20
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

I do not understand the commit message and the patch.
> ---
>  drivers/mtd/tests/mtd_nandecctest.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_=
nandecctest.c
> index d3e8873..0274f73 100644
> --- a/drivers/mtd/tests/mtd_nandecctest.c
> +++ b/drivers/mtd/tests/mtd_nandecctest.c
> @@ -7,13 +7,22 @@
>  #include <linux/slab.h>
>  #include <linux/mtd/nand_ecc.h>
> =20
> +#include <asm/byteorder.h>

I think you do not need to include this.

> +
>  #if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)
> =20
> +#ifdef __LITTLE_ENDIAN
> +#define __change_bit_le(nr, addr) __change_bit(nr, addr)
> +#else
> +#define __change_bit_le(nr, addr) \
> +		__change_bit((nr) ^ ((BITS_PER_LONG - 1) & ~0x7), addr)
> +#endif

Why is this "#ifdef" needed? Can you please add a comment explaining
this? Which problem do you solve by adding '__change_bit_le()' ?

--=20
Best Regards,
Artem Bityutskiy

--=-wxttaSDgCly8EUXV3c3L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRdKrAAoJECmIfjd9wqK05hAP/AxvCxAFPmmtpu5VqaqwndK9
O105KSHWGv91HMtXKvqv/WggbqLfMQeqpsBvyihPHehpYhc+zJTK8RG1z2TNm5HN
hGB1xvIKbwMU8G/zfkZTivuhnjzyWgc6xLfk5o/KAb7K93sWOWN5DNKeUbctTLhw
TxkWZdDz8CoNdrqZ+j4HZUgfMqMIVnmTGr1u/S4WhpDU7IBlzM7f/1kWBPrkMkVn
3nQwdYF1xjL1Irfnmj+TMZVxgrEHRCEcWodpa0XVk9zBZVioi+nU6lD2hgJNKxDu
JA/YmShUsEZJmCzDj51bVO7MZjFhPlCUrB/ZEaQJYxxxY0frG3j3RngKISHBRDaC
f8WNDUoFGFiUc+AfNl1SwVTfaatWOG6AoSvgGtOnX22kwmBgQ9ZVvcpPCAdOPqg/
7mRE+jCxtiliQVXmWcyX+hyTng2XlMYSNCahaZCOM3zUXYH+gSl6pmsU9Let0q5Y
ntbZMXupjPpMtCFA6Zd54Ag+/x+ZtyWWSnWd2FxWA+aoxBw1jqyIwx7dv93yYqkY
Z4nKI8AT1TUf4IWeEXpTVE481mO3LEv1U+VhtTdc1fe0K8V9L1lqDHptFJ361l58
ljUBIIyWgFhsnlqS114sAxj6QZqVdYpJ8dBOAVdZPKFaNhVpbHExlCIJRvV6eBUl
Qcb8EzQfeKEYksv0MxIw
=8e2G
-----END PGP SIGNATURE-----

--=-wxttaSDgCly8EUXV3c3L--
