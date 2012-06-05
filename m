Message-ID: <1338901457.2507.53.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v10 3/3] MTD: at91: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Tue, 05 Jun 2012 16:04:17 +0300
In-Reply-To: <1338545594-18483-4-git-send-email-josh.wu@atmel.com>
References: <1338545594-18483-1-git-send-email-josh.wu@atmel.com>
 <1338545594-18483-4-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9Xep7ML5aRYefLPbcvwE"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
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


--=-9Xep7ML5aRYefLPbcvwE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-01 at 18:13 +0800, Josh Wu wrote:
> +       end_time =3D jiffies + msecs_to_jiffies(PMECC_MAX_TIMEOUT_MS);
> +       while ((pmecc_readl_relaxed(host->ecc, SR) & PMECC_SR_BUSY)) {
> +               if (unlikely(time_after(jiffies, end_time))) {
> +                       dev_err(host->dev, "PMECC: Timeout to get ECC
> value.\n");
> +                       BUG();
> +               }
> +               cpu_relax();
> +       }=20

Sorry, but crashing the kernel is the worst thing to do. You should make
'->write_page()' allow to return an error code, just like
'->read_page()' does.

--=20
Best Regards,
Artem Bityutskiy

--=-9Xep7ML5aRYefLPbcvwE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzgPRAAoJECmIfjd9wqK0p9IP/RdYBST4+NyFfkZEDLCPMoY9
Qw39hYMUyxqfIRa8nye4xjxFFqwBcukXSoRHGiWFUhq5iPco330ziQ4gfN0xi0fz
n8WKAoJaxziSI4xTl+K9+Ct376HGcoQP+EFIHG9A5Q22kaQZVkU3s+VyR7yP5lUY
oFpyi0EFip33jaaCr/4H7buyErX1tG8AKbfgf2KPd+M633NInyVZ+3gq9MJfePEh
D87wrPea56XcqqKiiWBreU28E1Noq21lSW5vlLBkU9M2XatHXrluh9lwUcswQFdu
6ErUA+w1EjV6h9KsRE8unwpKeAHYLTYFchGDdlZPBqYzEmyJgUyCvLP71fBGPs0/
djgj4mNWh4IGhSWeTTlO75jgXroAmu1/3k3lTmLZwYSub61rQlV9CY8ssxVG3Xv4
f5bPRBW933Vaqcmp2PanYT798LKJr3gCzqElepXwHNgDU0xr1MgKP/A0ks2tsaFu
NcPTHk2SxYPJNArTTyGpUHE5rbVqRGsXd9SgGmveEN1owJVyxQaoBg1ut03NhPWb
ifrni/JWwGgGs8PPHsdKyD9U6EvoVjbWxCAXuUy39Eu+EDCDw2czU/muhNp08K14
rk/wmkb57A02sR/xAqzXjpGoQvssfAAg8QSgUF0JUi/lM7A/O7ESaXBrsSG9mpRN
jnQTjdM2NUXrRmhzhglZ
=RPDm
-----END PGP SIGNATURE-----

--=-9Xep7ML5aRYefLPbcvwE--
