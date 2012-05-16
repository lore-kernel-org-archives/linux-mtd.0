Message-ID: <1337160353.24809.26.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 3/3] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Wed, 16 May 2012 12:25:53 +0300
In-Reply-To: <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Zc6ZNC4faNyGjr1rjur4"
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


--=-Zc6ZNC4faNyGjr1rjur4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 22:47 +0800, Josh Wu wrote:
> +	while (!(pmerrloc_readl(host->pmerrloc_base, ELISR)
> +		 & PMERRLOC_CALC_DONE))
> +		cpu_relax();

How about some kind of time-out in something goes wrong?

> +		dev_warn(host->dev, "Only 2048 page size is currently " \
> +			"supported for PMECC, rolling back to Software ECC\n");

Why do you use backslashes?


--=20
Best Regards,
Artem Bityutskiy

--=-Zc6ZNC4faNyGjr1rjur4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs3KhAAoJECmIfjd9wqK0J8gP/RkAa11ceb6TEy6n8DBSD0Zs
K5jnIGHHJxRPU7nQTDWf89n4nonToFcCvA6DXai1CcLktZsjb0Asp9zHRsFJLw/V
i7dWEMXmkVFSOz5jGMwvxZS2ohF32qv1p7Bx7ew5t1N77v52PjWJyqnnEqzXGu8u
wbczzpH6pok8KnoyyGna6ElecVsK/4igp7N0xDMLxSR/KTg5it1W5bxV57mq28+U
AIHWoEVU+6cDuZaMtttQ6KEPeWIs4lFBKj06NqmOS7vMtEIqITyFdA7+a2OZl5gc
Nrzj/lkBbB+9Bzi48hboojtTMuEn1uIAYEqaV1Ja8nwQI7H4Zbaf9v0/+nHxdZg8
6JF6FBysJiwXV2uewLsITzTsI06PVu+igupzCQw0/SQZs8UHjXSQZIjlf80Iv/XT
TX1eeF/Z9mub+iNzcqyffTRtCE93ixkaZILyTBeUTvAjPrlff/6mP76ArIVNPPlj
1J39A6x0imlcW/x23N9xJLDbOF02w2vnpkYIeRwV2b/hZTvbaUO6gNDaFqqIkQLT
sxZd9PViIGFkbH09gNXF5862fE93Sa3Ut3JFyG/mWbZRVMzqMkHS9HfPinpDaiT3
+9kVvupr6fvME6n0nLy5ZcrRRUvJM4C9m9cm/volsqNk4/1BeQvELsmfqv9TRmpf
I3f0tI8I9HekGzSIkAYA
=twyP
-----END PGP SIGNATURE-----

--=-Zc6ZNC4faNyGjr1rjur4--
