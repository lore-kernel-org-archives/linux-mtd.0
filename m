Received: from usausmgw01.spansion.com ([12.110.209.161])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZlkl-0001sg-GV
	for linux-mtd@lists.infradead.org; Fri, 16 Jul 2010 14:19:04 +0000
From: "Hoyler, Gernot" <Gernot.Hoyler@spansion.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 16 Jul 2010 07:08:44 -0700
Subject: Spansion SPI parts
Message-ID: <D0271AF888369C4C85548462366DB24B3F524EF2@US2K7EXMBPF1.spansion.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can we fix the Spansion SPI flash device names in drivers/mtd/devices/m25p8=
0.c?
There is no Spansion s25sl device family. The references should be changed =
to s25fl, at a couple of locations (see below).

Thanks,
Gernot

--
Dr. Gernot Hoyler, Customer Engineering, Spansion LLC
---------------------------------------------------------------------------=
----------

diff -rupN linux-2.6.34/drivers/mtd/devices/Kconfig linux-2.6.34-fixed/driv=
ers/mtd/devices/Kconfig
--- linux-2.6.34/drivers/mtd/devices/Kconfig    2010-05-16 23:17:36.0000000=
00 +0200
+++ linux-2.6.34-fixed/drivers/mtd/devices/Kconfig      2010-07-16 15:45:16=
.000000000 +0200
@@ -84,7 +84,7 @@ config MTD_M25P80
        help
          This enables access to most modern SPI flash chips, used for
          program and data storage.   Series supported include Atmel AT26DF=
,
-         Spansion S25SL, SST 25VF, ST M25P, and Winbond W25X.  Other chips
+         Spansion S25FL, SST 25VF, ST M25P, and Winbond W25X.  Other chips
          are supported as well.  See the driver source for the current lis=
t,
          or to add other chips.
=20
diff -rupN linux-2.6.34/drivers/mtd/devices/m25p80.c linux-2.6.34-fixed/dri=
vers/mtd/devices/m25p80.c
--- linux-2.6.34/drivers/mtd/devices/m25p80.c   2010-05-16 23:17:36.0000000=
00 +0200
+++ linux-2.6.34-fixed/drivers/mtd/devices/m25p80.c     2010-07-16 15:45:02=
.000000000 +0200
@@ -649,13 +649,13 @@ static const struct spi_device_id m25p_i
        /* Spansion -- single (large) sector size only, at least
         * for the chips listed here (without boot sectors).
         */
-       { "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-       { "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
-       { "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
-       { "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
-       { "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
-       { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-       { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
+       { "s25fl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
+       { "s25fl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
+       { "s25fl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
+       { "s25fl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
+       { "s25fl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
+       { "s25fl128p0", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
+       { "s25fl128p1", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
        { "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
        { "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
