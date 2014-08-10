Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGcZD-0003aH-0z
 for linux-mtd@lists.infradead.org; Sun, 10 Aug 2014 23:30:23 +0000
Received: by mail-pa0-f49.google.com with SMTP id hz1so9964211pad.22
 for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2014 16:29:59 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandsim: add id_bytes module parameter
Date: Mon, 11 Aug 2014 08:29:01 +0900
Message-Id: <1407713341-4446-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nandsim can simulate NAND Flash which returns the ID bytes specified
by first_id_byte, ..., fourth_id_byte module parameters.

In order to simulate NAND flash which returns more than four ID bytes,
this adds id_bytes module parameter which is specified by the array of
byte like this:

 # modprobe nandsim id_bytes=0x98,0xdc,0x90,0x26,0x76,0x15,0x01,0x08 bch=1

This doesn't add fifth_id_byte, ..., seventh_id_byte module parameters,
becuase they are redundant.  But the existing first_id_byte, ...,
fourth_id_byte module parameters are preserved.

Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/mtd/nand/nandsim.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 4c0ada3..8b4a48e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -89,10 +89,6 @@
 #define CONFIG_NANDSIM_MAX_PARTS  32
 #endif
 
-static uint first_id_byte  = CONFIG_NANDSIM_FIRST_ID_BYTE;
-static uint second_id_byte = CONFIG_NANDSIM_SECOND_ID_BYTE;
-static uint third_id_byte  = CONFIG_NANDSIM_THIRD_ID_BYTE;
-static uint fourth_id_byte = CONFIG_NANDSIM_FOURTH_ID_BYTE;
 static uint access_delay   = CONFIG_NANDSIM_ACCESS_DELAY;
 static uint programm_delay = CONFIG_NANDSIM_PROGRAMM_DELAY;
 static uint erase_delay    = CONFIG_NANDSIM_ERASE_DELAY;
@@ -113,11 +109,19 @@ static unsigned int overridesize = 0;
 static char *cache_file = NULL;
 static unsigned int bbt;
 static unsigned int bch;
+static u_char id_bytes[8] = {
+	[0] = CONFIG_NANDSIM_FIRST_ID_BYTE,
+	[1] = CONFIG_NANDSIM_SECOND_ID_BYTE,
+	[2] = CONFIG_NANDSIM_THIRD_ID_BYTE,
+	[3] = CONFIG_NANDSIM_FOURTH_ID_BYTE,
+	[4 ... 7] = 0xFF,
+};
 
-module_param(first_id_byte,  uint, 0400);
-module_param(second_id_byte, uint, 0400);
-module_param(third_id_byte,  uint, 0400);
-module_param(fourth_id_byte, uint, 0400);
+module_param_array(id_bytes, byte, NULL, 0400);
+module_param_cb(first_id_byte, &param_ops_byte, &id_bytes[0], 0400);
+module_param_cb(second_id_byte, &param_ops_byte, &id_bytes[1], 0400);
+module_param_cb(third_id_byte, &param_ops_byte, &id_bytes[2], 0400);
+module_param_cb(fourth_id_byte, &param_ops_byte, &id_bytes[3], 0400);
 module_param(access_delay,   uint, 0400);
 module_param(programm_delay, uint, 0400);
 module_param(erase_delay,    uint, 0400);
@@ -138,6 +142,7 @@ module_param(cache_file,     charp, 0400);
 module_param(bbt,	     uint, 0400);
 module_param(bch,	     uint, 0400);
 
+MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
 MODULE_PARM_DESC(third_id_byte,  "The third byte returned by NAND Flash 'read ID' command");
@@ -306,7 +311,7 @@ struct nandsim {
 	unsigned int nbparts;
 
 	uint busw;              /* flash chip bus width (8 or 16) */
-	u_char ids[4];          /* chip's ID bytes */
+	u_char ids[8];          /* chip's ID bytes */
 	uint32_t options;       /* chip's characteristic bits */
 	uint32_t state;         /* current chip state */
 	uint32_t nxstate;       /* next expected state */
@@ -2214,17 +2219,18 @@ static int __init ns_init_module(void)
 	 * Perform minimum nandsim structure initialization to handle
 	 * the initial ID read command correctly
 	 */
-	if (third_id_byte != 0xFF || fourth_id_byte != 0xFF)
+	if (id_bytes[6] != 0xFF || id_bytes[7] != 0xFF)
+		nand->geom.idbytes = 8;
+	else if (id_bytes[4] != 0xFF || id_bytes[5] != 0xFF)
+		nand->geom.idbytes = 6;
+	else if (id_bytes[2] != 0xFF || id_bytes[3] != 0xFF)
 		nand->geom.idbytes = 4;
 	else
 		nand->geom.idbytes = 2;
 	nand->regs.status = NS_STATUS_OK(nand);
 	nand->nxstate = STATE_UNKNOWN;
 	nand->options |= OPT_PAGE512; /* temporary value */
-	nand->ids[0] = first_id_byte;
-	nand->ids[1] = second_id_byte;
-	nand->ids[2] = third_id_byte;
-	nand->ids[3] = fourth_id_byte;
+	memcpy(nand->ids, id_bytes, sizeof(nand->ids));
 	if (bus_width == 16) {
 		nand->busw = 16;
 		chip->options |= NAND_BUSWIDTH_16;
-- 
1.9.1
