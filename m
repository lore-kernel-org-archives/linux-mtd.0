Received: from [212.176.242.38] (helo=barber.spb.rtsoft.ru)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWFSa-0000qn-T6
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 18:32:26 +0000
Date: Mon, 3 Mar 2008 21:01:21 +0300
From: Andrei Dolnikov <adolnikov@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD][NOR]Add support for the SST 36VF3203 flash chip
Message-ID: <20080303180121.GA9206@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for the SST 36VF3203 flash chip. It is used on Emerson KSI8560 board.

Signed-off-by: Andrei Dolnikov <adolnikov@ru.mvista.com>

---
 jedec_probe.c |   13 +++++++++++++
 1 files changed, 13 insertions(+)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 6405938..15e061b 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -160,6 +160,7 @@
 #define SST49LF030A	0x001C
 #define SST49LF040A	0x0051
 #define SST49LF080A	0x005B
+#define SST36VF3203	0x7354
 
 /* Toshiba */
 #define TC58FVT160	0x00C2
@@ -1412,6 +1413,18 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x1000,256)
 		}
 	}, {
+		.mfr_id		= MANUFACTURER_SST,
+		.dev_id		= SST36VF3203,
+		.name		= "SST 36VF3203",
+		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
+		.dev_size	= SIZE_4MiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 1,
+		.regions	= {
+			ERASEINFO(0x10000,64),
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_ST,
 		.dev_id		= M29F800AB,
 		.name		= "ST M29F800AB",
