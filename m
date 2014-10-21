Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgXlu-0007Cf-Rm
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 11:38:39 +0000
Received: by mail-wg0-f49.google.com with SMTP id x12so1114498wgg.20
 for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2014 04:38:16 -0700 (PDT)
Sender: Michal Simek <monstr@monstr.eu>
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org,
	monstr@monstr.eu
Subject: [PATCH] mtd: spi-nor: Add support for SST spi flash
Date: Tue, 21 Oct 2014 13:37:59 +0200
Message-Id: <29606567142da0d52c462ef0aebacc2b91fe2508.1413891469.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
 boundary="=_mimegpg-monstr-desktop-32146-1413891479-0001";
 micalg=pgp-sha1; protocol="application/pgp-signature"
Cc: Marek Vasut <marex@denx.de>,
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Harini Katakam <harini.katakam@xilinx.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-32146-1413891479-0001

From: Harini Katakam <harini.katakam@xilinx.com>

Add sst25wf080 to the spi-nor device id table.

Signed-off-by: Harini Katakam <harinik@xilinx.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ae16aa2f6885..0786faac2920 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -575,6 +575,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
 	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
+	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },

 	/* ST Microelectronics -- newer production may have feature updates */
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
--
1.8.2.3


--=_mimegpg-monstr-desktop-32146-1413891479-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlRGRZcACgkQykllyylKDCGz+QCdHSedT8f1J5UpHh7OI8+PKKX/
1OQAn3/8RcyuNVyd7Gi5Y/BfJTh7tO+L
=j1Rv
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-32146-1413891479-0001--
