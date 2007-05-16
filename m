Received: from smtp2.int-evry.fr ([157.159.10.45])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoFAu-0007a9-SA
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 04:48:03 -0400
From: Florian Fainelli <florian.fainelli@int-evry.fr>
To: linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
Subject: [PATCH] Add support for SST 39VF6402B flash
Date: Wed, 16 May 2007 10:47:57 +0200
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_9UsSGONv4nzsjZ8"
Message-Id: <200705161047.57549.florian.fainelli@int-evry.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_9UsSGONv4nzsjZ8
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The SST 39VF6402B is currently not supported by the Linux kernel. This patch 
adds it to the list of JEDEC command set compatible Flash chips, so that it 
can be used in a flash map driver using "jedec_probe".

Note that according to the datasheet this flash has two possible erase sizes : 
64kb and 4kb. I prefer using 64Kb erase size since we do not have to change 
the erase command from 0x50 (64Kb) to 0x30 (4Kb).

The datasheet is available here : 
http://www.sst.com/downloads/datasheet/S71288.pdf

Signed-off-by: Florian Fainelli <florian.fainelli@int-evry.fr>
--

--Boundary-00=_9UsSGONv4nzsjZ8
Content-Type: text/plain;
  charset="us-ascii";
  name="sst_39VF6402B.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="sst_39VF6402B.diff"

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 58e561e..22f1d5b 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -159,6 +159,7 @@
 #define SST49LF030A	0x001C
 #define SST49LF040A	0x0051
 #define SST49LF080A	0x005B
+#define SST39VF6402B    0x236C
 
 /* Toshiba */
 #define TC58FVT160	0x00C2
@@ -1509,7 +1510,20 @@ static const struct amd_flash_info jedec_table[] = {
                        ERASEINFO(0x1000,256),
                        ERASEINFO(0x1000,256)
                }
-
+	}, {
+		.mfr_id         = MANUFACTURER_SST,
+		.dev_id         = SST39VF6402B,
+		.name           = "SST 39VF6402B",
+		.uaddr          = {
+			[0] = MTD_UADDR_0x5555_0x2AAA,  /* x8 */
+			[1] = MTD_UADDR_0x5555_0x2AAA   /* x16 */
+		},
+		.DevSize        = SIZE_8MiB,
+		.CmdSet         = P_ID_AMD_STD,
+		.NumEraseRegions= 4,
+		.regions        = {
+			ERASEINFO(0x10000,128)
+		}
        }, {
 		.mfr_id		= MANUFACTURER_ST,	/* FIXME - CFI device? */
 		.dev_id		= M29W800DT,

--Boundary-00=_9UsSGONv4nzsjZ8--
