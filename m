Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGjWZ-0007vy-26
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 06:23:51 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 1/5] mtd: nand: add the data structures for JEDEC parameter
 page
Date: Fri, 21 Feb 2014 13:39:37 +0800
Message-ID: <1392961181-20693-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1392961181-20693-1-git-send-email-b32955@freescale.com>
References: <1392961181-20693-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Create the nand_jedec_params{} and jedec_ecc_info{} according to
the JESD230A(Revision of JESD230, October 2012).

Acked-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |   75 ++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c034dc4..588f8a4 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -342,6 +342,81 @@ struct nand_onfi_vendor_micron {
 	u8 param_revision;
 } __packed;
 
+struct jedec_ecc_info {
+	u8 ecc_bits;
+	u8 codeword_size;
+	__le16 bb_per_lun;
+	__le16 block_endurance;
+	u8 reserved[2];
+} __packed;
+
+struct nand_jedec_params {
+	/* rev info and features block */
+	/* 'J' 'E' 'S' 'D'  */
+	u8 sig[4];
+	__le16 revision;
+	__le16 features;
+	u8 opt_cmd[3];
+	__le16 sec_cmd;
+	u8 num_of_param_pages;
+	u8 reserved0[18];
+
+	/* manufacturer information block */
+	char manufacturer[12];
+	char model[20];
+	u8 jedec_id[6];
+	u8 reserved1[10];
+
+	/* memory organization block */
+	__le32 byte_per_page;
+	__le16 spare_bytes_per_page;
+	u8 reserved2[6];
+	__le32 pages_per_block;
+	__le32 blocks_per_lun;
+	u8 lun_count;
+	u8 addr_cycles;
+	u8 bits_per_cell;
+	u8 programs_per_page;
+	u8 multi_plane_addr;
+	u8 multi_plane_op_attr;
+	u8 reserved3[38];
+
+	/* electrical parameter block */
+	__le16 async_sdr_speed_grade;
+	__le16 toggle_ddr_speed_grade;
+	__le16 sync_ddr_speed_grade;
+	u8 async_sdr_features;
+	u8 toggle_ddr_features;
+	u8 sync_ddr_features;
+	__le16 t_prog;
+	__le16 t_bers;
+	__le16 t_r;
+	__le16 t_r_multi_plane;
+	__le16 t_ccs;
+	__le16 io_pin_capacitance_typ;
+	__le16 input_pin_capacitance_typ;
+	__le16 clk_pin_capacitance_typ;
+	u8 driver_strength_support;
+	__le16 t_ald;
+	u8 reserved4[36];
+
+	/* ECC and endurance block */
+	u8 guaranteed_good_blocks;
+	__le16 guaranteed_block_endurance;
+	struct jedec_ecc_info ecc_info[4];
+	u8 reserved5[29];
+
+	/* reserved */
+	u8 reserved6[148];
+
+	/* vendor */
+	__le16 vendor_rev_num;
+	u8 reserved7[88];
+
+	/* CRC for Parameter Page */
+	__le16 crc;
+} __packed;
+
 /**
  * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
  * @lock:               protection lock
-- 
1.7.2.rc3
