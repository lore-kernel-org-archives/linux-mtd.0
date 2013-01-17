Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvn6s-0003kh-Ca
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 10:54:16 +0000
Message-ID: <1358420143.2731.223.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mxc_nand: compress ID info for send_read_id_v3
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Schneider <schneider@at.festo.com>, Shawn Guo <shawn.guo@linaro.org>
Date: Thu, 17 Jan 2013 12:55:43 +0200
In-Reply-To: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
References: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jkQ6wVVKB7Qcrgx4QUt4"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-jkQ6wVVKB7Qcrgx4QUt4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-01-15 at 16:56 +0100, Roman Schneider wrote:
> ---
>  Also compress the id in case of a v3 NAND flash controller (i.mx51, i.mx=
53)
>  and 16Bit buswidth.

Unfortunately I cannot compile-test it with the configuration I have.
This is not your fault, just a breakage in upstream. I'll wait when this
is fixed upstream, and then take a look at your patch. The breakage is:

arch/arm/mach-imx/built-in.o: In function `imx6q_restart':
platform-spi_imx.c:(.text+0x2220): undefined reference to `imx_src_prepare_=
restart'
arch/arm/mach-imx/built-in.o: In function `imx6q_pm_enter':
platform-spi_imx.c:(.text+0x22e4): undefined reference to `imx_set_cpu_jump=
'
arch/arm/mach-imx/built-in.o: In function `imx6q_init_irq':
platform-spi_imx.c:(.init.text+0x7280): undefined reference to `imx_src_ini=
t'
make[1]: *** [vmlinux] Error 1

--=20
Best Regards,
Artem Bityutskiy

--=-jkQ6wVVKB7Qcrgx4QUt4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ99ivAAoJECmIfjd9wqK02PgQAMQlM+Erw4hNAGDLf7+nugob
zqpVVLMJKZAR7wIvvN2ON78iWp2nuJ81PK8U3yDVJpE6CjG6aGFbqhLtVsjAVTP9
3aYv05D2Yrz6tiisMI0Fw5JPsNbJoGOB5zGxWSFKHtUrSpWgMJFYqt2mYkWpt5AW
V2wJeEVhbzJCWCI2rbZDWssE8ObHE/uQrKxUkIfE/74KIn4DYNan96fLAdaijgML
d1DXm1Or13n1/rO1gTsTfVE/LXAuuPZqysp5x4D/R7LX/KHxwZqnhPmxj7bOgJ2S
YAumpofDV0dSXcF8ivyUHeflKXBP+1b9DQirRQxdeL4BB8ngJAoLjfDWbqtRDxSR
c657s3h2kxe+KxfO6t/g8ko+dAai1bJ88yJL8xFoqTdGaXQ76tr9wh/P72x8DYGi
84ZhFj7hBR1ne8ALohf0m3kPCjsZ4hJwYgMfzTgZhKHiowE3FTmIbkRRLHDkLgDf
EV1VMbSGY5bpBO1STVna4PQ9WhXJu60DMWcrtRKYp7cC9rb0sQkPkgOtlsVznOq9
2AnOrW7VezQN/vJccNXy+xE9nTAay3BBKtuh0Du1CUOr9XsjZkYZJjtehc2aqfD4
ysDZgK/PnHQZ3/jAEoEJPVoZBAoqgJnx1tZpFTvRS4cDYdtoDglSH/jTqY9szNfS
inRBSGlZAQwQY8oky3MA
=Rkgb
-----END PGP SIGNATURE-----

--=-jkQ6wVVKB7Qcrgx4QUt4--
