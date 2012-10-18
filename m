Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOmK5-0000rY-6i
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 09:23:27 +0000
Message-ID: <1350552211.5769.303.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] denali: nand: Fix build break for driver when built as
 a module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: dinguyen@altera.com
Date: Thu, 18 Oct 2012 12:23:31 +0300
In-Reply-To: <1350017169-22166-1-git-send-email-dinguyen@altera.com>
References: <1350017169-22166-1-git-send-email-dinguyen@altera.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vUJ2cRB64+qEf2LnHP5k"
Mime-Version: 1.0
Cc: dinh.linux@gmail.com, linux-mtd@lists.infradead.org, sfr@canb.auug.org.au
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-vUJ2cRB64+qEf2LnHP5k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-10-11 at 22:46 -0600, dinguyen@altera.com wrote:
> From: Dinh Nguyen <dinguyen@altera.com>
>=20
> Make denali_init and denali_remove accessible when the driver
> is built as a loadable module.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@altera.com>

I've folded this patch into
	"mtd: denali: split the generic driver and PCI layer"

--=20
Best Regards,
Artem Bityutskiy

--=-vUJ2cRB64+qEf2LnHP5k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQf8qTAAoJECmIfjd9wqK0NskP/0sFqnBmT+wy6tqzmIrIZYtt
ZnG8BwlpTSqFL7KYdQiW1QVLkajAxv64xKRhcuPunCcMjXkeN3we7Gm+eSc3oUa8
8e/6CNttq4Dp5V3lAxAewQ3i7RzHarwa+zxHEXkjAmnx5Bq+N0FVtVoqb35NkJn8
nsy4DrE7jbCxugwH2Es1xiQPVmyzPnzzO6laklQvnBSO26owBLdGD3emc5i1w8nw
wlDXErrbO2KszlX1mz7s9McZ8wKTKwSXXTNxCvUrAaRxArRfZ3ew9p49IgMwrDs/
iHZukbW5GOZt1sZF7uaSTfeJO0k32kiNjHqOAwYlz8u4XfuEfhDl4R3xHbx6ILlA
QxAVtbFPsrM4JFQBCPbTJPYs4T4vbz9l+/ag0DZrjZkMJW2gC7Ph4MblEkfqJTN2
eIcmw3SCxanPQGdtkXxz12KcGYyR/XNp5dfHVjKe2u8ph3FO3ZBP2Ha6CRG1Gd2q
U2LlfumiQjeSs86Z3gVyLAfJ0YKdPvgbtUCmZh98TpFCGjHgLu6ttTgOsp2J5e+2
AOY1Lo4jy3UrfHTALYFs2tSNuHAtHKzKW6pKgyDowYWNUdPD5hWi4lNFS7f7MbDJ
OaEWdh7c8VpklFGaJ88C7C+qGyYH43ZUbrBG1h2iHZIdxwbnlsAaluhMB8bk3ZkL
DAOp4PbqLjEo8e2SNwtI
=eakJ
-----END PGP SIGNATURE-----

--=-vUJ2cRB64+qEf2LnHP5k--
