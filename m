Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvMG-0007Qh-4u
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:20:40 +0000
Received: by wyg8 with SMTP id 8so3750592wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:20:38 -0700 (PDT)
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: h-fache@ti.com
Date: Thu, 20 Oct 2011 19:20:20 +0300
In-Reply-To: <1318866038-11781-1-git-send-email-h-fache@ti.com>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mUIBZXGu3XT84iT8kJHU"
Message-ID: <1319127627.20953.8.camel@sauron>
Mime-Version: 1.0
Cc: joern@lazybastard.org, joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mUIBZXGu3XT84iT8kJHU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-17 at 17:40 +0200, h-fache@ti.com wrote:

> -static int phram_setup(const char *val, struct kernel_param *kp)
> +static int phram_init_called;
> +static __initdata char phram_paramline[64+12+12];

snip..
> +static int phram_setup(const char *val, struct kernel_param *kp)
> +{

snip..

> +	strlcpy(phram_paramline, val, sizeof(phram_paramline));

Accessing __initdata from non __init function. Please check that your
patch does not introduce a new section mismatch. There is even a kernel
config option to debug these issues.

--=20
Best Regards,
Artem Bityutskiy

--=-mUIBZXGu3XT84iT8kJHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoEpEAAoJEJtuLFy+q7feN5MIAIafWW+uIVFr78DKjXQEa5nb
+1nDnnkP4y0Q2wz0RkcOKSD+MPkGY3KrbHjeV22c1fPGfViRg2e6B8eXg+Oi2X9P
xp4hQceCOvCFpNnf3AtXTrrr/Clgc35bhId+WjLVd8cCdFTu7+jO7yhJjTSngD4P
WWD/cn0SkJXP1dLbAf01PSxeoG8VAwi/a1PTYuGrDdr5n2DjQzEdyubqHa4d2lxn
PWEhCYepY6DfjRGzmNwZWVuM7fAhRrhxm07OfLYBbXjd/TvwITnqtkW7vnFAq6OW
pJyNRSuoI6UETHlKDVcMuaXd3cIlGW7+uV9tHlr1MiLs91ZI1we2Ool6ktuDn1k=
=wJAK
-----END PGP SIGNATURE-----

--=-mUIBZXGu3XT84iT8kJHU--
