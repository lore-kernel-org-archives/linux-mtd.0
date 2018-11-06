Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK2yM-0007gA-Aj
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 15:08:56 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 13/22] mtd: rawnand: Pass the CS line to be selected in
 struct nand_operation
Date: Tue,  6 Nov 2018 16:08:01 +0100
Message-Id: <20181106150810.9569-14-boris.brezillon@bootlin.com>
In-Reply-To: <20181106150810.9569-1-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to deprecate the ->select_chip hook we need to pass the CS
line a NAND operations are targeting. This is done through the
addition of a cs field to the nand_operation struct.

We also need to keep track of the currently selected target to
properly initialize op->cs, hence the ->cur_cs field addition to the
nand_chip struct.

Note that op->cs is not assigned in nand_exec_op() because we might
rework the way we execute NAND operations in the future (adopt a
queuing mechanism instead of the serialization we have right now).

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- Initialize ->cur_cs
---
 drivers/mtd/nand/raw/internals.h  |  3 +++
 drivers/mtd/nand/raw/nand_base.c  | 39 +++++++++++++++++--------------
 drivers/mtd/nand/raw/nand_hynix.c |  4 ++--
 include/linux/mtd/rawnand.h       | 11 ++++++++-
 4 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 6e2f61fbc5f0..b62728d5884b 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -101,6 +101,9 @@ static inline int nand_exec_op(struct nand_chip *chip,
 	if (!chip->exec_op)
 		return -ENOTSUPP;
 
+	if (WARN_ON(op->cs >= chip->numchips))
+		return -EINVAL;
+
 	return chip->exec_op(chip, op, false);
 }
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c684beab8f34..26e7bfb22a58 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -246,6 +246,7 @@ void nand_select_target(struct nand_chip *chip, unsigned int cs)
 	if (WARN_ON(cs > chip->numchips))
 		return;
 
+	chip->cur_cs = cs;
 	chip->select_chip(chip, cs);
 }
 EXPORT_SYMBOL_GPL(nand_select_target);
@@ -260,6 +261,7 @@ EXPORT_SYMBOL_GPL(nand_select_target);
 void nand_deselect_target(struct nand_chip *chip)
 {
 	chip->select_chip(chip, -1);
+	chip->cur_cs = -1;
 }
 EXPORT_SYMBOL_GPL(nand_deselect_target);
 
@@ -1022,7 +1024,7 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 				 PSEC_TO_NSEC(sdr->tRR_min)),
 		NAND_OP_DATA_IN(len, buf, 0),
 	};
-	struct nand_operation op = NAND_OPERATION(instrs);
+	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 	int ret;
 
 	/* Drop the DATA_IN instruction if len is set to 0. */
@@ -1065,7 +1067,7 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 				 PSEC_TO_NSEC(sdr->tRR_min)),
 		NAND_OP_DATA_IN(len, buf, 0),
 	};
-	struct nand_operation op = NAND_OPERATION(instrs);
+	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 	int ret;
 
 	/* Drop the DATA_IN instruction if len is set to 0. */
@@ -1160,7 +1162,7 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 					 PSEC_TO_NSEC(sdr->tRR_min)),
 			NAND_OP_8BIT_DATA_IN(len, buf, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		/* Drop the DATA_IN instruction if len is set to 0. */
 		if (!len)
@@ -1216,7 +1218,7 @@ int nand_change_read_column_op(struct nand_chip *chip,
 				    PSEC_TO_NSEC(sdr->tCCS_min)),
 			NAND_OP_DATA_IN(len, buf, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 		int ret;
 
 		ret = nand_fill_column_cycles(chip, addrs, offset_in_page);
@@ -1298,7 +1300,7 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 		NAND_OP_CMD(NAND_CMD_PAGEPROG, PSEC_TO_NSEC(sdr->tWB_max)),
 		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tPROG_max), 0),
 	};
-	struct nand_operation op = NAND_OPERATION(instrs);
+	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 	int naddrs = nand_fill_column_cycles(chip, addrs, offset_in_page);
 	int ret;
 	u8 status;
@@ -1412,7 +1414,7 @@ int nand_prog_page_end_op(struct nand_chip *chip)
 				    PSEC_TO_NSEC(sdr->tWB_max)),
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tPROG_max), 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		ret = nand_exec_op(chip, &op);
 		if (ret)
@@ -1520,7 +1522,7 @@ int nand_change_write_column_op(struct nand_chip *chip,
 			NAND_OP_ADDR(2, addrs, PSEC_TO_NSEC(sdr->tCCS_min)),
 			NAND_OP_DATA_OUT(len, buf, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 		int ret;
 
 		ret = nand_fill_column_cycles(chip, addrs, offset_in_page);
@@ -1574,7 +1576,7 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 			NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tADL_min)),
 			NAND_OP_8BIT_DATA_IN(len, buf, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		/* Drop the DATA_IN instruction if len is set to 0. */
 		if (!len)
@@ -1613,7 +1615,7 @@ int nand_status_op(struct nand_chip *chip, u8 *status)
 				    PSEC_TO_NSEC(sdr->tADL_min)),
 			NAND_OP_8BIT_DATA_IN(1, status, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		if (!status)
 			op.ninstrs--;
@@ -1646,7 +1648,7 @@ int nand_exit_status_op(struct nand_chip *chip)
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_READ0, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1685,7 +1687,7 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 				    PSEC_TO_MSEC(sdr->tWB_max)),
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tBERS_max), 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		if (chip->options & NAND_ROW_ADDR_3)
 			instrs[1].ctx.addr.naddrs++;
@@ -1743,7 +1745,7 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
 					      PSEC_TO_NSEC(sdr->tWB_max)),
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tFEAT_max), 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1791,7 +1793,7 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 			NAND_OP_8BIT_DATA_IN(ONFI_SUBFEATURE_PARAM_LEN,
 					     data, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1811,7 +1813,7 @@ static int nand_wait_rdy_op(struct nand_chip *chip, unsigned int timeout_ms,
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(timeout_ms),
 					 PSEC_TO_NSEC(delay_ns)),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1844,7 +1846,7 @@ int nand_reset_op(struct nand_chip *chip)
 			NAND_OP_CMD(NAND_CMD_RESET, PSEC_TO_NSEC(sdr->tWB_max)),
 			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tRST_max), 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		return nand_exec_op(chip, &op);
 	}
@@ -1878,7 +1880,7 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 		struct nand_op_instr instrs[] = {
 			NAND_OP_DATA_IN(len, buf, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		instrs[0].ctx.data.force_8bit = force_8bit;
 
@@ -1922,7 +1924,7 @@ int nand_write_data_op(struct nand_chip *chip, const void *buf,
 		struct nand_op_instr instrs[] = {
 			NAND_OP_DATA_OUT(len, buf, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		instrs[0].ctx.data.force_8bit = force_8bit;
 
@@ -5006,6 +5008,9 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	unsigned int i;
 	int ret;
 
+	/* Assume all dies are deselected when we enter nand_scan_ident(). */
+	chip->cur_cs = -1;
+
 	/* Enforce the right timings for reset/detection */
 	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
 
diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index ac1b5c103968..1e4499d01e14 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -84,7 +84,7 @@ static int hynix_nand_cmd_op(struct nand_chip *chip, u8 cmd)
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(cmd, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		return nand_exec_op(chip, &op);
 	}
@@ -103,7 +103,7 @@ static int hynix_nand_reg_write_op(struct nand_chip *chip, u8 addr, u8 val)
 			NAND_OP_ADDR(1, &addr, 0),
 			NAND_OP_8BIT_DATA_OUT(1, &val, 0),
 		};
-		struct nand_operation op = NAND_OPERATION(instrs);
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
 		return nand_exec_op(chip, &op);
 	}
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index def6dff11e8b..aa1512df38a9 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -875,18 +875,21 @@ struct nand_op_parser {
 
 /**
  * struct nand_operation - NAND operation descriptor
+ * @cs: the CS line to select for this NAND operation
  * @instrs: array of instructions to execute
  * @ninstrs: length of the @instrs array
  *
  * The actual operation structure that will be passed to chip->exec_op().
  */
 struct nand_operation {
+	unsigned int cs;
 	const struct nand_op_instr *instrs;
 	unsigned int ninstrs;
 };
 
-#define NAND_OPERATION(_instrs)					\
+#define NAND_OPERATION(_cs, _instrs)				\
 	{							\
+		.cs = _cs,					\
 		.instrs = _instrs,				\
 		.ninstrs = ARRAY_SIZE(_instrs),			\
 	}
@@ -1008,6 +1011,10 @@ struct nand_legacy {
  *			this nand device will encounter their life times.
  * @blocks_per_die:	[INTERN] The number of PEBs in a die
  * @data_interface:	[INTERN] NAND interface timing information
+ * @cur_cs:		currently selected target. -1 means no target selected,
+ *			otherwise we should always have cur_cs >= 0 &&
+ *			cur_cs < numchips. NAND Controller drivers should not
+ *			modify this value, but they're allowed to read it.
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @setup_data_interface: [OPTIONAL] setup the data interface and timing. If
  *			  chipnr is set to %NAND_DATA_IFACE_CHECK_ONLY this
@@ -1069,6 +1076,8 @@ struct nand_chip {
 
 	struct nand_data_interface data_interface;
 
+	int cur_cs;
+
 	int read_retries;
 
 	flstate_t state;
-- 
2.17.1
