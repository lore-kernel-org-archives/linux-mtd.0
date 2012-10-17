Message-ID: <1350477109.5769.141.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 03/11] fsmc/nand: Support multiple banks connected to
 controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Wed, 17 Oct 2012 15:31:49 +0300
In-Reply-To: <9748ce2483f539fb32279b8ea9df065cfdbe8ab1.1349778820.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <9748ce2483f539fb32279b8ea9df065cfdbe8ab1.1349778820.git.vipin.kumar@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9U7EQSS1uwx4zhM2+SUU"
Mime-Version: 1.0
Cc: plagnioj@jcrosoft.com, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9U7EQSS1uwx4zhM2+SUU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-09 at 16:14 +0530, Vipin Kumar wrote:
> Support up to max_banks number of banks in fsmc driver.
>=20
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

I tried to apply this, but it does not apply cleanly to l2-mtd.git,
which is based on 3.7-rc1.

--=20
Best Regards,
Artem Bityutskiy

--=-9U7EQSS1uwx4zhM2+SUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfqU1AAoJECmIfjd9wqK0/R4P/0RbLsjkqC59tBcLiG2IDxFw
2xS/6DXCZOiMqr3la/GgAKvB1/D2eEavC0Io1HPLMy8fKUKssIr0TIq/ClzpfzQR
rIqIllslVkp97dHEYJJeg9igGDobSqVq1OEqrUAbUwvYgq6cbaGMtWbl1PdVUGuZ
SQY0lJeC18wRcn+cMm8/hrLiJtwcxfx/9o60mC0Tbm+40nddST1pXR+H4aK4/Pqi
emtQdm1OvfM+UHUc70IXsFu67seBd27GhnDWlDslBomfofoRJpZ6fq7tITAUc7Rn
oguhdQ7vWS7gHNPxbcRqC6O1jHSSybrJqyL36X/uv1rMS9yvnWZllhaWFGEe/0CD
sd/HwaoIl9ytlPq5AxEF2Ru3BCcfWvzf4O6eeCrxpmONvzWBlHQcIJJLYxXynHqf
/P5+afqSDkFrrvWa/dZPZ23nLfmz26gkz9UgGyy4uDJK0HlrTpCeLjGjpT0YTvb8
TztjvI+Hikr62FFsZRBzRxF/BBGCqw9Ttjv+duXZh1z3FpA6cQbRn7JSmYoJ+hNi
s3w9RZZrSv4gepbCPmINm0Cwd6CnktADT/UZ/AeaIjd3KCRihnYHcsQvwnX2p0dZ
iknBH6p1r+ExQJ7uxHmUzbCN3h6qvDsnbcJSNhKUc+HK+3V/mgDmQ0dtFnatERv4
yVwqSY8RTPn+jpss2MwO
=VMrO
-----END PGP SIGNATURE-----

--=-9U7EQSS1uwx4zhM2+SUU--
