Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPTmr-0001Mi-AP
 for linux-mtd@lists.infradead.org; Mon, 26 Jun 2017 13:10:43 +0000
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
To: <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>
Subject: [PATCH v3 1/2] mtd: st_spi_fsm: remove SPINOR_OP_RDSR2 and use
 SPINOR_OP_RDCR instead
Date: Mon, 26 Jun 2017 15:09:59 +0200
Message-ID: <c8c997ad7a678490503006f7103fe4c2320ac477.1498481714.git.cyrille.pitchen@microchip.com>
In-Reply-To: <cover.1498481714.git.cyrille.pitchen@microchip.com>
References: <cover.1498481714.git.cyrille.pitchen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The 35h instruction op code has two aliases/macro definitions:
- SPINOR_OP_RDCR from include/linux/mtd/spi-nor.h
- SPINOR_OP_RDSR2 from drivers/mtd/devices/serial_flash_cmds.h

Actually, some manufacturers name the associated internal register Status
Register 2 whereas other manufacturers name it Configuration Register
hence the two different macros for the very same instruction op code.

Since the spi-nor.h file is the reference file for all SPI NOR instruction
op codes, this patch removes the definition of the SPINOR_OP_RDSR2 macro.

Also the SPINOR_OP_RDSR2 macro will be associated to another instruction
op code in a further patch so we need to avoid a conflict defining this
macro twice. Indeed the JESD216 rev B specification, defining the SFDP
tables, also refers to the 3Eh and 3Fh instruction op codes to write/read
the Status Register 2 on some SPI NOR flash memories, the 35h op code
still being used to read the Configuration Register/Status Register 2 on
other memories.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 drivers/mtd/devices/serial_flash_cmds.h | 1 -
 drivers/mtd/devices/st_spi_fsm.c        | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/serial_flash_cmds.h b/drivers/mtd/devices/serial_flash_cmds.h
index 8b81e15105dd..eba125c9f23f 100644
--- a/drivers/mtd/devices/serial_flash_cmds.h
+++ b/drivers/mtd/devices/serial_flash_cmds.h
@@ -13,7 +13,6 @@
 #define _MTD_SERIAL_FLASH_CMDS_H
 
 /* Generic Flash Commands/OPCODEs */
-#define SPINOR_OP_RDSR2		0x35
 #define SPINOR_OP_WRVCR		0x81
 #define SPINOR_OP_RDVCR		0x85
 
diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 804313a33f2b..21afd94cd904 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -1445,7 +1445,7 @@ static int stfsm_s25fl_config(struct stfsm *fsm)
 	}
 
 	/* Check status of 'QE' bit, update if required. */
-	stfsm_read_status(fsm, SPINOR_OP_RDSR2, &cr1, 1);
+	stfsm_read_status(fsm, SPINOR_OP_RDCR, &cr1, 1);
 	data_pads = ((fsm->stfsm_seq_read.seq_cfg >> 16) & 0x3) + 1;
 	if (data_pads == 4) {
 		if (!(cr1 & STFSM_S25FL_CONFIG_QE)) {
@@ -1490,7 +1490,7 @@ static int stfsm_w25q_config(struct stfsm *fsm)
 		return ret;
 
 	/* Check status of 'QE' bit, update if required. */
-	stfsm_read_status(fsm, SPINOR_OP_RDSR2, &sr2, 1);
+	stfsm_read_status(fsm, SPINOR_OP_RDCR, &sr2, 1);
 	data_pads = ((fsm->stfsm_seq_read.seq_cfg >> 16) & 0x3) + 1;
 	if (data_pads == 4) {
 		if (!(sr2 & W25Q_STATUS_QE)) {
-- 
2.7.4
