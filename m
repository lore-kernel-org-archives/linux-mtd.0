Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTRYk-00005b-39
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 11:04:15 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Tue, 17 Jan 2017 12:03:38 +0100
Message-Id: <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MR25 family doesn't support JEDEC, so they need explicit mentioning
in the list of supported spi IDs. This makes it possible to add these
using for example:

	compatible = "everspin,mr25h40";

There was already an entry for mr25h256. Move that one out of the "keep
for compatibility" section and put in a new group for Everspin MRAMs.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1:

 - use Kib instead of kib

Changes since v2:

 - update dt docs
 - handle already existing mr25h256 in m25p_ids[]

Thanks to Cyrille for catching these.

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
 drivers/mtd/devices/m25p80.c                            | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 2c91c03e7eb0..3e920ec5c4d3 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -14,6 +14,8 @@ Required properties:
                  at25df641
                  at26df081a
                  mr25h256
+                 mr25h10
+                 mr25h40
                  mx25l4005a
                  mx25l1606e
                  mx25l6405d
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd28034..0e2d3a64651a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -288,7 +288,6 @@ static const struct spi_device_id m25p_ids[] = {
 	 * should be kept for backward compatibility.
 	 */
 	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
-	{"mr25h256"},
 	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
 	{"mx25l25635e"},{"mx66l51235l"},
 	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
@@ -305,6 +304,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
 	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
 
+	/* Everspin MRAMs (non-JEDEC) */
+	{ "mr25h256" }, /* 256 Kib, 40 MHz */
+	{ "mr25h10" },  /*   1 Mib, 40 MHz */
+	{ "mr25h40" },  /*   4 Mib, 40 MHz */
+
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
-- 
2.11.0
