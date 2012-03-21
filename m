Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAM4r-0005CJ-6Z
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2012 13:59:49 +0000
Message-ID: <1332338496.14983.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MIPS: Kbuild: remove -Werror
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ralf Baechle <ralf@linux-mips.org>
Date: Wed, 21 Mar 2012 16:01:36 +0200
In-Reply-To: <1331292947-14913-1-git-send-email-dedekind1@gmail.com>
References: <1331292947-14913-1-git-send-email-dedekind1@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-8fUx/z2EktEUi1++CT0s"
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 John Crispin <blogic@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8fUx/z2EktEUi1++CT0s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-09 at 13:35 +0200, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>=20
> MIPS does not build with the standard W=3D1 Kbuild switch with - tested w=
ith
> gcc-4.6 by me and gcc-4.5 by John Crispin. The reason is that MIPS adds

Hi Ralf,

what's the fate of this patch?

--=20
Best Regards,
Artem Bityutskiy

--=-8fUx/z2EktEUi1++CT0s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPad9AAAoJECmIfjd9wqK0gvwP/RIFHMvlayHuShAnh9Ingceh
rX/qO7QN1yEGZEnIol05Jsbo0wCtsltRDJklGhpsiEIr3TQdnQzu+6V5hYG85S/n
78CodPiRysw4K1trsyb7DUGhWHAI/rU2wuv//UAcCgQ/rdTkBGjgTtLkpx8vlg03
es+2+nAIAgI1szQjwXqTmBDxPACwmYRq/+S9/bruysNR9xEtRnNkJ30YDkAMT/yZ
2oYStUi8elJtX+Ec4X5lSoT3YmycXRH2TIs5WbaVY/Y7Pf4ZXEvX1VFZunWowokT
wnVh7R8lV5/nmGGRNplFWJy3j2EpHVFb2SimxcrGeTfq9Qoh7tc49QTX5PBq/CqR
Ne+Tahjjdi6QweFGYBYqVCUeypeh4+wO6dAYHh1eh+aDGb4DWVurNsTR9ESPuxXw
Rv5gHEU1WythsvFs8jQoV+QjmzMGwRngIqyvk6SS0STvpot2h4WIw+pmM3W3jcwE
r52FbH5p22z+Y8MhBmT49qpKYsp5/dOaLy4o9BcEJyeQoNI6Vt9fDxyYckFYR0Zy
GpAgH+Gg26DFYjl4maA+RPU9mamkbWRaLykhoU60G9eH9AMZWQIyVDfRb7Th3jaH
eqKAQHNZfPqp3L824S7A6FeTTDtblPRZW87LkBAYXWBs+CQdhvjAGQdfaoR4AgAt
aP6xjcZsMsjQLaEqb2e2
=/UiI
-----END PGP SIGNATURE-----

--=-8fUx/z2EktEUi1++CT0s--
