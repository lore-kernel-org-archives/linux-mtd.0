Message-ID: <1329134891.22240.116.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: atmel_nand: Update driver to support Programmable
 HW ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hong Xu <hong.xu@atmel.com>
Date: Mon, 13 Feb 2012 14:08:11 +0200
In-Reply-To: <1329117469-23637-1-git-send-email-hong.xu@atmel.com>
References: <1329117469-23637-1-git-send-email-hong.xu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YpsnkMY5w0pDybk1WSs6"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YpsnkMY5w0pDybk1WSs6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-13 at 15:17 +0800, Hong Xu wrote:
> The Programmable Hardware ECC (PMECC) controller is a programmable binary
> BCH(Bose, Chaudhuri and Hocquenghem) encoder and decoder. This controller
> can be used to support both SLC and MLC NAND Flash devices. It supports t=
o
> generate ECC to correct 2, 4, 8, 12 or 24 bits of error per sector of dat=
a.
>=20
> To use this driver, the user needs to pass in the correction capability a=
nd
> the sector size.
>=20
> This driver has been tested on AT91SAM9X5-EK and AT91SAM9N12-EK with JFFS=
2,
> YAFFS2, UBIFS and mtd-utils.
>=20
> Signed-off-by: Hong Xu <hong.xu@atmel.com>

Please, do not forget to fix the following warnings as well:

Sparse:
+drivers/mtd/nand/atmel_nand.c:1446:52: warning: Using plain integer as NUL=
L pointer [sparse]

gcc:
+drivers/mtd/nand/atmel_nand.c: In function 'atmel_nand_probe':
+drivers/mtd/nand/atmel_nand.c:1451:1: warning: label 'err' defined but not=
 used [-Wunused-label]

--=20
Best Regards,
Artem Bityutskiy

--=-YpsnkMY5w0pDybk1WSs6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPOP0rAAoJECmIfjd9wqK0uw4QAMvUHvsDIwk7ZaMcuuWOotZp
YiLzmZQzUvpkHHWHBI7M0DWeKUvip4nuKpIGh7eSFphRIw8vHwCy830QMsfvsD0c
O8n+Ye9oNDTfjS2fNRf1PHpDGzcYgp60c+75YRsGIUMEZgZ3KioxLKqPZJbe4UQ8
LTYK0IFzHppxtllWUOFNIlfCbV174w5HZ3e94XaunpbJm4L0jPTdtxu+hxG/QgAq
p2UE/uLir14Pcc2xT+gIf7cdF6D7N+NUq2/izZUyqRikdJgPyzxjm6NKOey4Rzr5
nndaLe/iUAP5gJgPycNey0jB8xOdmdVzsNBoPtf7kKgiRJBMP13S18KJVNDY3aWf
ySTlN/1hC5ve4TU3YdNsMBvCKkkTJDizR839HXwUjhXZcsaxrcVF8Da9l5Eiecv7
MFMEUEQwjVLcVzsoMgMFQpm9N+dAnr74jMubQbDE/RSNkCu7wlqGf2mwSydirIqD
jpWeFVBqjK5zG5Xm4vkO5soq8CwkM83zjMR7el3/dc/ddjbqxiihbpqmXFOK0pU0
HCPvPOndCb+LZZ9uItWgL6M6z1ikHsdukUH7bnAjoD5hrruLJ5+OazlrzHttUCJ5
irgSDQ4vWgfKAmyjS0sJ9mmKyzIK6cMqj8VF3HVFyFO6egFqVHTxZ3eshgf2Bx0x
jgZbPhjy5aaf08GHZQWN
=2AK1
-----END PGP SIGNATURE-----

--=-YpsnkMY5w0pDybk1WSs6--
