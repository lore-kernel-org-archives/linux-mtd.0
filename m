Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T33MI-0007Ax-Ip
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2012 11:07:55 +0000
Received: by weyr3 with SMTP id r3so3668987wey.36
 for <linux-mtd@lists.infradead.org>; Sun, 19 Aug 2012 04:07:50 -0700 (PDT)
Message-ID: <1345374447.1832.1.camel@kyv>
Subject: Re: [PATCH 2/6] mtd: s3c2410: Use pr_* instead of printk
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Sun, 19 Aug 2012 14:07:27 +0300
In-Reply-To: <1342434747-27622-2-git-send-email-sachin.kamat@linaro.org>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
 <1342434747-27622-2-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YPhMtUy9dLC54R9Mi2ic"
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


--=-YPhMtUy9dLC54R9Mi2ic
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-16 at 16:02 +0530, Sachin Kamat wrote:
>  #ifdef CONFIG_MTD_NAND_S3C2410_DEBUG
>  #define DEBUG
>  #endif
> @@ -215,7 +217,8 @@ static int s3c_nand_calc_rate(int wanted, unsigned lo=
ng clk, int max)
>  	pr_debug("result %d from %ld, %d\n", result, clk, wanted);
> =20
>  	if (result > max) {
> -		printk("%d ns is too big for current clock rate %ld\n", wanted, clk);
> +		pr_err("%d ns is too big for current clock rate %ld\n",
> +								wanted, clk);

I've removed tabs to make "wanted" more aligned with where the format
string starts, and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-YPhMtUy9dLC54R9Mi2ic
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMMjvAAoJECmIfjd9wqK0yVAP/iABeQ2lp2fnCXKPyQJthPNl
o9SgxJBy3HVo/Z4awQEo4qZU6Xcz8q/SSBbtb4mpn0FtbR5sgYBVg6FnA5FLDa27
XCAtY3SEo8xcFl/dsEZft0Ry/+tCcO4UNiWepOKz5hIEgxxF5o6JNGcb0JpISZnx
6JAC12VNY2IqNX3otUeHALh4ZDvnSh2/Bbtaj2L6luVwsbAuKFWpA3sn0nFkyimk
RNhQgC/mhs9tSgztkcYCg6Ef8MPGlTGd87gLEDg2sFXln5XiQU7ufORxwBZA+qJt
ukAOZLJ7W4FYBmFPqVajJtLzJnG3ljRb0bXsICL6n2/0TkCDk9Ng44VX42+IWFU7
URFAK/TBOt0HOKVhFZ8uccOzASGorzkaF39nbG3OGM1FxD4QlhQpP8xJtusBheYP
NLfDUmIUC9ks7LFKUcsnyH2728STy+Qq1VtiytUX/Ha3or9Rxg5d3XkPIktNAFpe
jWtOFoVuk6SiIZiTBhsANfvuBj66Je5yGsA+tfZQ1KBVSI4ofU6S6+4vrCGIot04
Pg4jxPV9kSfXfdqheWpAsdlzGk3w0JMBdvZGOYgEC5zF3MYvfj9ZlgGs1Rrj1X9V
6xvd2efRPdT7z5NeRK7zcSa2E9AkMfRWbG+Cy6tzTLmtLGXTFkMGwx7g1VqBw8SK
rbL1e11g9ANEeJCapU7f
=9N1h
-----END PGP SIGNATURE-----

--=-YPhMtUy9dLC54R9Mi2ic--
