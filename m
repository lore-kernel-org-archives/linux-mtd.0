Message-ID: <1344853227.3393.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: gpmi: add NAND write verify support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 13 Aug 2012 13:20:27 +0300
In-Reply-To: <50288C0E.5060400@freescale.com>
References: <1344698728-8709-1-git-send-email-shijie8@gmail.com>
 <CAF4G-tKN683_EQCGcG4G8jMU5K6TamaHUv__3ugGUoEg_LPrcQ@mail.gmail.com>
 <50288C0E.5060400@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cR2Ppx9DNTama7OG9OY3"
Mime-Version: 1.0
Cc: marex@denx.de, fabio.estevam@freescale.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, shawn.guo@linaro.org,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-cR2Ppx9DNTama7OG9OY3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-13 at 13:09 +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B408=E6=9C=8813=E6=97=A5 12:44, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> > On Sat, Aug 11, 2012 at 6:25 PM, Huang Shijie<shijie8@gmail.com>  wrote=
:
> >> Add NAND write verify support in gpmi-nand driver.
> >>
> >> This patch fixes a kernel crash when we select
> >> CONFIG_MTD_NAND_VERIFY_WRITE=3Dy, and do some write tests:
> > I would just kill ONFIG_MTD_NAND_VERIFY_WRITE entirely. Some drivers
> > do not support it and it does not work for sub-pages for long time.
> > Both UBI and JFFS2 are able to read verify what they wrote already.
> > There are also MTD tests which do this verification. So I think there
> > is no reason to keep this in the NAND layer, let alone wasting RAM in
> > the driver to support this feature.
> >
> > I am also removing the -stable mailing list - ne need to spam it.
> >
> thanks a lot. Maybe we should send a patch to remove the=20
> CONFIG_MTD_NAND_VERIFY_WRITE feature entirely.

I'd suggest that instead. I have huge back-log, so wouldn't be able to
process it quickly, but at some point I would take it to the l2 tree.

--=20
Best Regards,
Artem Bityutskiy

--=-cR2Ppx9DNTama7OG9OY3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQKNTrAAoJECmIfjd9wqK0avYP/RuY86tMuKS4KYuNhmaFK48s
dakkcBDBcShsl54H2JS1GjH1bfV0WNjP0fUHJAODOgJL0gl4GceDoxP3eUrM0If+
BoQrjSj/WQmxjSRtB/nsnawqJVbzYoR6ebChdJjiH9YN6WI2TKJ6wc/HIQrmYGNx
FTDY8L2Vn5bLS3THQEB03dDb4hkcLvf7Gn5bCPb0huzpXIZDvSh3JE0GSI9yQNXw
mHbbH0deiPOg3KBqyOejpNIGPcrM3911yCgWFGl56RHJNI2web1C+Q2FcOwMK3Ia
rU2dydNyxmccb83KtC/uma0QYCxF2aCQ8MQ2SqSMwd71Ulp+VX4Av1iaiL345NmF
X0xA6k6zLSGY3MotKrXMXV/lC2W2dnp1Opo5PfVWKfoPfhg1Xng1GdiHrEGXDsrv
VOrFaKQWgAsbmNrRROEP+UQAe/FZfOImaHUQjusluGioJ63oTNTVoVErd7iO2rh7
Lnch5Cu5lvDOMis65r0zw1vbX2KGPJE5uI7R8PM9u+RPJjJWbrSII/gcGK+fOlBb
aUTXmqzUeorIw/AWb36EBZeNFDiDYhD6U5Y0t7vSvAHScDAYEW2pdjRxy/8YVcxR
MZbA0fnatuZDPXXOnTkW5DG5eqJogNqUx0yvlyeRWDIQchQrgR3OiC+Jjyv5PhnZ
skzWw7+X6qSacuaCJwQO
=E+98
-----END PGP SIGNATURE-----

--=-cR2Ppx9DNTama7OG9OY3--
