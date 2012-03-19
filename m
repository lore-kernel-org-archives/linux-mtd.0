Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9fwo-0003ej-0C
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 17:00:42 +0000
Message-ID: <1332176607.11468.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: spear_smi: Remove default partition
 information from driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Mon, 19 Mar 2012 19:03:27 +0200
In-Reply-To: <1331894500-21305-1-git-send-email-sr@denx.de>
References: <1331894500-21305-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yKlpu21DlGTz1ps+iNZF"
Mime-Version: 1.0
Cc: Vipin Kumar <vipin.kumar@st.com>, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yKlpu21DlGTz1ps+iNZF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-16 at 11:41 +0100, Stefan Roese wrote:
> Additionally, after failing in mtd_device_parse_register(), the driver
> unmap/free code is now executed.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Vipin Kumar <vipin.kumar@st.com>

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-yKlpu21DlGTz1ps+iNZF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPZ2bfAAoJECmIfjd9wqK0y/4P/jC8L0yHOQAvPUEF5LFmFC4A
gNg1X0sSp611LOUF2OT+1YPdzlFdN/Wrl+AyVHCA4mz3MDha/Q+y/3DlI76hQvss
UabmZkyrTKsZUqczyylE7fT+cTOWe5Be5znuC05FUr8ZWwrJ49zsXD94E3iumINv
4bgwezLL9VLZK3blaso4mImkPQSFirbeRKbFtRrLpUPYpsdivhNkxO9EXHN5+B9E
phtndQqWhByFLM5HtQbHp3xTSsrEK48N2my2UxSPvj/Oc+UAM7JPRV0wF1iEVub4
dnzEWqkBJEZzW8FXwoeEcMyJ/mV+7c4o9/qEOIR4NBKAtPJiQYaS+oZ/+gvNr3am
iMi2PYT4A2ZiF0DYWJt1hNsSocd8K3QA7DyNX8L6svFNbtFwielW9Sj1scB+k4QK
Ss1b9MqvW414Ik+4g34hriVw6wLaEvvovIhi4rvPrQNk+pwfigijFV4Gm2d4cUtU
XAjXOpAs9H9L5Z03uHCnx9hvz9cVKvA+Sv0muaQqWuuBP1Jug/byO3DHGKMiNT/b
i6jrbWCUdifMnWLz0K0AkAXP5PBpEOBiMKWxbPebOtA2ouZie57ziF45u11gCyLA
CCBZtSSjcgAjWnL2OEVNBeWtZdW5Xzjyr59zZLAEK0jl/OHllb7hTPl7qQJb0T4W
x/UJQ1c/Xc2kzWF/Op/E
=//lw
-----END PGP SIGNATURE-----

--=-yKlpu21DlGTz1ps+iNZF--
