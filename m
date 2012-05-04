Message-ID: <1336124510.4275.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: add device tree support to gpmi-nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 04 May 2012 12:41:50 +0300
In-Reply-To: <1336101182-5200-1-git-send-email-b32955@freescale.com>
References: <1336101182-5200-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FfcFePT8lNaneI1VWXbq"
Mime-Version: 1.0
Cc: shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
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


--=-FfcFePT8lNaneI1VWXbq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-04 at 11:13 +0800, Huang Shijie wrote:
> This patch just adds the DT support to gpmi-nand.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> Please select the CONFIG_USE_OF before you do the compiler-test.
> thanks.

It should compile without CONFIG_USE_OF also just fine. Currently it
does not.

--=20
Best Regards,
Artem Bityutskiy

--=-FfcFePT8lNaneI1VWXbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPo6ReAAoJECmIfjd9wqK0y1oP/0gc54u6rXLMZkg/Pcf1pyaZ
vbmYzhHru5XSfKRR4BgbKAQF4mAuslgQEstWEndiDJCde2vWhW13/VHdR8PmNr+o
M2lHjD0xnUxLnIvtYActY4hnIW78guVGyScHlBvI+wtkAXRT2dcSkB5kVlTDGF/C
FhsppQrcHekfdp+MCWw6lVr/bbslWlLnO4X1p7bMRctl+sWmfwnnBoWaoOviilcV
nfhjmKWtF2+nnNY4sr0yMM1uVmn5eKgYnsJZSLuByRxH+FnmpqiHmDrGVzuOJsZ1
irqllXdam81S6vb0lgUaeEBUn4IxAW+Y+zZYWLQ1jrScSbEZaZnNBpbqRa57sPiz
rEezErcRjF2/58tpXcvqkaepu5Gq+27lhJ9L9AMl97wBwWFVwfrqgyFU1Nl0ZiHN
1LNoudw2X4U/PoSxZqxM0Eo9LnVZWFq8UgMfHCVNYBFe8lqgSNkCZuzZB1xlIeD3
7Of8X5WEQkjH/MGvk7Xn8Qjrz5BUXEzA84gq1/7OFJvQShN2UA00HMPlf+sp6MmS
OE6noDvPQlFJ5kAuJgP3F3BfR8zqroA9Bt9FD9+Dr9BR01SZ/sIuO3+L4jWamtsm
mG0xZExfTbNfbW0vKzkcPaFehNBiDpGY8PnpN2Shn58QyPweC506awapg456LlXW
+dby/Vf2IVEJnWt8zpNz
=mJKh
-----END PGP SIGNATURE-----

--=-FfcFePT8lNaneI1VWXbq--
