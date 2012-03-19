Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9fwX-0003YQ-Fj
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 17:00:26 +0000
Message-ID: <1332176584.11468.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: Add device-tree support to fsmc_nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Mon, 19 Mar 2012 19:03:04 +0200
In-Reply-To: <1331889571-3372-1-git-send-email-sr@denx.de>
References: <1331889571-3372-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-W+0wGxT/dZQ9sDcX76gz"
Mime-Version: 1.0
Cc: Viresh Kumar <viresh.kumar@st.com>, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, devicetree-discuss@ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-W+0wGxT/dZQ9sDcX76gz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-16 at 10:19 +0100, Stefan Roese wrote:
> This patch adds support to configure the FSMC NAND driver (used amongst
> others on SPEAr platforms) via device-tree instead of platform_data.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-W+0wGxT/dZQ9sDcX76gz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPZ2bIAAoJECmIfjd9wqK0694QAIHlo/oULY37l2TC9V/EFq21
mXYtPX06Q3dfMv35/O1bLqkHLbYlm4kRMWQ3mL+0PPHHuLxy8xTh9LPbs6qQ84Rl
9WOlpQb2tr+oNRBsHMKSqe9rLdHjh1WdJpy6TLv1Ri+XzB+vgDw7I1vI87H8DNoe
McmNX8RBvomWHaSYpe5VpLX2yMAVGrgEwaUxpyovUS8yYqJO2ZzMdFwLn+qrLKDQ
8Jf4FfFQMvavYgTfn8Z6PKofdEK2+tJWR+Ra4P6nby0UFT640IirvCFgebU7QFR7
eL7PulzqzqXwWWvPxuZskbM++yYGnZykoWJyMqMAFoZ4hSIHgi6i0srZ1iw4NfNk
Tqb866wXD0TBrcxWM7LzxHIX2rTPL0J2E7EBINcs6hhPFVzc2zuGHkTbfNxbCvGK
VGsgPC36Jtuqz0qBLpNcyI3RxkAj3Po3WFB08N5m//6x4rFSflP6bIVFVntDV3mR
hPU+vp45XRzZUzZRnf3P61GigbKtPU7PfEyBjQLAkWuJZBgfb9Ot7gZE1EcIE+2d
qQVcy2gFq+i41Litj2WHyunxLAtnegnEITBc1y5font2z9JU+HoWB4VZc23RxOY1
C+eFk+GjZd+hi6sn9+Cpz+s1V6NqgMQ0BSNUC28xwHJx5OMr2+rpQu7YjH8l/4Uq
zfn+zlfAdthv8ZOFMDax
=vtDE
-----END PGP SIGNATURE-----

--=-W+0wGxT/dZQ9sDcX76gz--
