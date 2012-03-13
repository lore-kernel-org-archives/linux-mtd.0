Content-Type: multipart/mixed; boundary="===============1558675968=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : fix the wrong DMA command.
Date: Tue, 13 Mar 2012 12:33:22 +0000
Message-ID: <1331642159.3595.28.camel@sauron.fi.intel.com>
References: <1331518938-24047-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1331518938-24047-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "w.sang@pengutronix.de" <w.sang@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============1558675968==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-N61pK41Cxr6ClDhkQjf6"

--=-N61pK41Cxr6ClDhkQjf6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-12 at 10:22 +0800, Huang Shijie wrote:
> The last DMA command of ECC read page is used to disable the BCH module.
> But the original code missed to set the pio[2] which is used to set the
> GPMI_HW_GPMI_ECCCTRL register. fix it now.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-N61pK41Cxr6ClDhkQjf6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXz8vAAoJECmIfjd9wqK0TYMP/Ay9gicjug1QhAa1KKvRSH60
MFsoj4Pzm7dTZMOgN+LcnhFj5YOqKMb5Ryiv9lunLE9KWLSLNg5zpiIr+954eOjL
M2M9k3GhMYHCePZzAxcn99pRPbK8Hrmk8lWQnDnyCPoMiA2lNW6A3gIemCj2Bc3z
haO3x2d0P9qFuXffTOKSyQlQ60HQIwmLC+xuXDJo+bRPhirsZsXZhD3qVC6FtUOz
AGkkKcEtEPX/+z2k9+ZvxdK8Klv/Y574oPQnk1mMi6+09qTDBkM+OCyeM5g8ZMF/
upedSQLCC1wFFDEvfCXHipYnaM5jbIzNSCYDC00SNIpXFYt7zPkf6FH50XjgJXfK
I3RUoU/RlVRKFW3nQpAKm3GqGY9CgtfDFLD5sNmdx/8dy7ibwOV/jKvogWcmkWRu
fLFD8zv1PV0qUFM1wFW0Lu8B1C3Sc6rliMHVEKpcNpzGw1ntD5RlFWPG6DRgYjjq
DNPo1yBJySa63i0YL+KMQI3DcP7Ws/W9xEr+JxhhVjdgn6SrWX+iCTl6mQY663cp
0EpShkt21dm6bFDHIO2xv7gvKRxjAMlnGcItEJTlmUd6g2sDHMTlATFUIB4cNi6M
0SfSpE2ZCc5eVHOPA8npaS/2oqIzv67WZPd+pOktB4D//VzZTF8/Kk1Ua8Bce8NT
CynMHr00Yikm2XwbXP26
=NPtF
-----END PGP SIGNATURE-----

--=-N61pK41Cxr6ClDhkQjf6--

--===============1558675968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============1558675968==--
