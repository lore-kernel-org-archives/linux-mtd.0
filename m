Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6fzI-0003rT-2W
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 10:59:08 +0000
Message-ID: <1346238245.2848.468.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: m25p80: add support for the EON EN25Q64 chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gabor Juhos <juhosg@openwrt.org>, John Crispin <blogic@openwrt.org>
Date: Wed, 29 Aug 2012 14:04:05 +0300
In-Reply-To: <1345970251-2029-1-git-send-email-juhosg@openwrt.org>
References: <1345970251-2029-1-git-send-email-juhosg@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-F12mD1RlJqBqe2/vwo1t"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-F12mD1RlJqBqe2/vwo1t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 10:37 +0200, Gabor Juhos wrote:
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> ---
>  drivers/mtd/devices/m25p80.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 5d0d68c..d812552 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -638,6 +638,7 @@ static const struct spi_device_id m25p_ids[] =3D {
>  	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
>  	{ "en25q32b", INFO(0x1c3016, 0, 64 * 1024,  64, 0) },
>  	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
> +	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },

I've already pushed a similar patch from "John Crispin
<blogic@openwrt.org>", but it did not have "SECT_4K". So I am not
picking this one.

--=20
Best Regards,
Artem Bityutskiy

--=-F12mD1RlJqBqe2/vwo1t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPfclAAoJECmIfjd9wqK0u9QP/RSTiv4P5UJ77Sw0JVwUjAPM
cffoiBCasn9n8ukNiQoTsQryEiRvlxw4PEEM8hi5Tpn7Th85XBJ+HbjoWPgagxUJ
gjWqVhPb/zctpH3vFYtUxvMPsostm8ekTJCcklifYnw87zF62rzKFpKzGZVFpX4I
bViVwJyHJT4C5dh4KJfWbsCh+Tdq/tgpOLHLZsabckn8K4BbOZMaT++Rf8VcWfCp
cRntt9LoEw0J0ygt5ZQubJNF5tSUIHT7gP33fJ7eyFDV93UXjGEa/mkSYpbmxfmo
E+u+hnYbgvygaOEIbbA0bH85WRDt7/930dM4jU46wKnllxtGkWIe9F1olK1BCtns
5GRgPjCQuSKJ4RE4IZJXVYp+sDpPBDiqpLR4cfA2I663lL4Ar1LXjtmVPYWatQxh
2QcRpHCZ6x226G364JW0pK1zl0msoan/3WNytcT/ISkwyCL2M99iXWSAEXRpMeWH
f2Y9vIK6siBchy5FFIh7gvWll6TsgSEyc6iJBjk1+UiFBPAhlQqlPdUrQQcdkSYk
16BJMH42zkBHRj6+KBBlWXZvFscKc2gT2Tt8ET67gKgpK92b/O8CU2T8MpyssD5D
c3MZmzhiJwKkft9b7mm5NyS6tiNdZGGUdNaxjKPdLJ8ml7ROj68So1wHKylnrVYZ
10uCHI8pR+20LAKnRhTi
=UakO
-----END PGP SIGNATURE-----

--=-F12mD1RlJqBqe2/vwo1t--
