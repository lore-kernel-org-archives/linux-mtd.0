Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T33N3-0007Eq-Mb
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2012 11:08:42 +0000
Received: by wibhn17 with SMTP id hn17so2244142wib.0
 for <linux-mtd@lists.infradead.org>; Sun, 19 Aug 2012 04:08:40 -0700 (PDT)
Message-ID: <1345374517.1832.2.camel@kyv>
Subject: Re: [PATCH 5/6] mtd: s3c2410: Fix checkpatch warnings and errors
 related to whitespaces
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Sun, 19 Aug 2012 14:08:37 +0300
In-Reply-To: <1342434747-27622-5-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
 <1342434747-27622-5-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Pqm2/Ax5YKOYddwwdyBj"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, ben-linux@fluff.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Pqm2/Ax5YKOYddwwdyBj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-16 at 16:02 +0530, Sachin Kamat wrote:
> @@ -55,7 +55,7 @@
>  static struct nand_ecclayout nand_hw_eccoob =3D {
>         .eccbytes =3D 3,
>         .eccpos =3D {0, 1, 2},
> -       .oobfree =3D {{8, 8}}
> +       .oobfree =3D {{8, 8} }
>  };=20

I've removed this not very sane chunk and pushed the patch to
l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Pqm2/Ax5YKOYddwwdyBj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMMk1AAoJECmIfjd9wqK0Og8P/0lUx3D/elkEpHYlmC1fBsPr
wICF8eu3ieMLV5TEYGdQhgwo4w/ZIP6UO2kCGsKK4jbSOYkvsltWts86d/7m79bw
scXdzfTSgk5MGCJsMAFvoCqeX8PlQ5L/jLtqkaCH8AxnYWjuNum6yfEgTm3pGkyZ
e9xuvcRrrDoD+lWRa+6RPsg3b1wX53LEhGHom0g86+PEnKe83WIhIxbi6rcz3e1U
AWzhZ11xvMjeP7uFJMCWE4ynigOZnlYpiMDjmxqDibWOJlzYFVNbkHJE9vvG3bux
NV1Ubz73qGYX09BiNaWl/vM8EmixBZFf6plElf8r1RYrz55bnYxxSThFfG+PLdHs
rXbO3Ox/SXXUQ+8Ug2Dimx/4xGEMQB1GGWc2LryKjNpQE8eseHOWbaNhgwcnxsJj
SZPjNHq2GIsI0YcpCVYLYaW5oiHK2ThFYy+rXPIeSPOxeenNVDo1A9WS1qNEP1Ee
HlJQ3sCBDhM302yLN4QdlAknqTYadREA4jJjmiolmtR6Tw1RhxL9xyLgva2ge0bA
N2XO4LOklESltqvc/U+lP4hoxH972qcdAMDakL9faqGD6pZl5UP+lxKCqgiyzIYx
yLo4xG09mdLUM8PnIWD91R/sLJ79cJ2E0YIFGUGuDz9a/vcMalQesh2kxINxA8VB
j0xOSkc23LJMWzqPXdEw
=FpVb
-----END PGP SIGNATURE-----

--=-Pqm2/Ax5YKOYddwwdyBj--
