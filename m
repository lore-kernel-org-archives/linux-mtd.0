Content-Type: multipart/mixed; boundary="===============1050433394=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Huang Shijie-B32955 <B32955@freescale.com>
Subject: =?utf-8?B?UmU6IOetlOWkjTogW1BBVENIXSBtdGQvZ3BtaSA6IGFkZCBncG1pIHN1cHBv?=
 =?utf-8?Q?rt_for_mx6q?=
Date: Mon, 13 Feb 2012 15:34:21 +0000
Message-ID: <1329147404.22240.178.camel@sauron.fi.intel.com>
References: <1328505606-27981-1-git-send-email-b32955@freescale.com>	,
 <1329134454.22240.114.camel@sauron.fi.intel.com>
 <14C4E31473AF7E4B98176CB73615181C362D9F@039-SN1MPN1-006.039d.mgd.msft.net>
In-Reply-To: <14C4E31473AF7E4B98176CB73615181C362D9F@039-SN1MPN1-006.039d.mgd.msft.net>
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

--===============1050433394==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-C8wo3w+qRk0uNtVgNoMO"

--=-C8wo3w+qRk0uNtVgNoMO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-13 at 15:05 +0000, Huang Shijie-B32955 wrote:
> Hi Artem:
>=20
> >Please, let me know how I can compile-test this. This diver depends on
> >imx23 or imx28 and I cannot find a defconfig for these. When I select
> >MXS platform the compilation fails. Could you please describe some way
> >to generate a compilable configuration which would include this driver
> >as well, or send me the defconfig file.
>=20
> use make mxs_defconfig to make the .config.
> and select the gpmi-nand driver. then you can compile it.
>=20
> This patch is just part of the patches for mx6q, another two patches are =
the mxs-dma patches.
> So in the mx6q, I do not enable the  gpmi-nand driver. you can compile-te=
st it just on mxs_defconfig.

Thanks. When I select MTD stuff I get the following Kbuild complaint:

scripts/kconfig/conf --savedefconfig=3Ddefconfig Kconfig
warning: (MTD_NAND_GPMI_NAND) selects MTD_CMDLINE_PARTS which has unmet dir=
ect dependencies (MTD=3Dy)

Would mxs people send a fix?

--=20
Best Regards,
Artem Bityutskiy

--=-C8wo3w+qRk0uNtVgNoMO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPOS4MAAoJECmIfjd9wqK0MykP/ibZPQieN1m4yR8K+6FqIiA3
HEi7JU3x4EI56VJhcxwA9uf7z3JeijV4A/mCOyjgzy/cRR8Y6LAU9Y/MrshlyRGk
tGI8uHMwAq4QR2MO8NzWCUH4ZypkGvAddP8HRjFZXmzcN9fES7MVlvcFjwrVzMOC
4OzO1I+GKKn/xpK5scFqZqO/rl1mJgtrPoo6mjXF0hWqHTEm0rrBC1qnHZLRO/K2
PsgwJxAARUW35VDTTERd48ymTXRaPnmXFrqxonCfTV7xSvWlbAcFRPEUpaLHXDyi
YWzYf7YfzAwt02PY9CFtGqlLYeTyroDItXw+F5lLv75f5bCSBu3FP7Df5nBpX+UO
Ap568Wxqf/ldBZpzAJ98PF/O7KvBrxzGNoNvLpWer7Dk1F/D6EdmJkIgULf9X+Uj
dAAYrbLEM/T0F5cJ9ynV/i+cbcRXKgEodniLfNP3vhcr9yuXUOANF1OqtPS5Bco1
MukOR+FuzQpQhpM11XxBW4PAxaNCi88wbh5gL2Tw0uwvUhqMBDfN/uchmhtU7prb
ov8P4hqW07jSfmgQLYx5SUbQX/Cp5/odLA84B3mT/h7a6aHmwQtM7wMACKdCGuAn
AcD8KVJCKqOyWWs4tf5Anru17qAR8/t4Z0kPd+1zJ4NvMJYSURQTQKSYfET/rp9G
oFiDu61hnzKA0VEoJXo2
=Dian
-----END PGP SIGNATURE-----

--=-C8wo3w+qRk0uNtVgNoMO--

--===============1050433394==
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

--===============1050433394==--
