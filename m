Received: from 6.mo177.mail-out.ovh.net ([46.105.51.249])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqpmp-0006KW-1y
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 23:35:44 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 5B91643625
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 00:35:03 +0100 (CET)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, jartur@cadence.com,
 kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [RFC PATCH v5 4/6] mtd: spi-nor: add support to non-uniform SPI NOR
 flash memories
Date: Thu, 23 Mar 2017 00:33:54 +0100
Message-Id: <fa832746dedee8d1b6ea97b0418f22da81031606.1490220411.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1490220411.git.cyrille.pitchen@atmel.com>
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1490220411.git.cyrille.pitchen@atmel.com>
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is a first step in introducing  the support of SPI memories
with non-uniform erase sizes like Spansion s25fs512s.

It introduces the memory erase map which splits the memory array into one
or many erase regions. Each erase region supports up to 4 erase commands,
as defined by the JEDEC JESD216B (SFDP) specification.
In turn, an erase command is defined by an op code and a sector size.

To be backward compatible, the erase map of uniform SPI NOR flash memories
is initialized so it contains only one erase region and this erase region
supports only one erase command. Hence a single size is used to erase any
sector/block of the memory.

Besides, since the algorithm used to erase sectors on non-uniform SPI NOR
flash memories is quite expensive, when possible, the erase map is tuned
to come back to the uniform case.

This is a transitional patch: non-uniform erase maps will be used later
when initialized based on the SFDP data.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 368 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h   |  56 +++++++
 2 files changed, 410 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f648374d6824..2e54792d506d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -256,6 +256,18 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
 
+	if (!spi_nor_has_uniform_erase(nor)) {
+		struct spi_nor_erase_map *map = &nor->erase_map;
+		struct spi_nor_erase_command *cmd;
+		int i;
+
+		for (i = 0; i < SNOR_CMD_ERASE_MAX; i++) {
+			cmd = &map->commands[i];
+
+			cmd->opcode = spi_nor_convert_3to4_erase(cmd->opcode);
+		}
+	}
+
 	nor->flags |= SNOR_F_4B_OPCODES;
 }
 
@@ -456,6 +468,132 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 	return nor->write_reg(nor, nor->erase_opcode, buf, nor->addr_width);
 }
 
+static inline u64
+spi_nor_div_by_erase_size(const struct spi_nor_erase_command *cmd,
+			  u64 dividend, u32 *remainder)
+{
+	if (likely(cmd->size_shift)) {
+		*remainder = (u32)dividend & cmd->size_mask;
+		return dividend >> cmd->size_shift;
+	}
+
+	return div_u64_rem(dividend, cmd->size, remainder);
+}
+
+static bool
+spi_nor_test_erase_region(struct spi_nor *nor, u64 addr, u32 len,
+			  const struct spi_nor_erase_region *region,
+			  const struct spi_nor_erase_command **cmd)
+{
+	const struct spi_nor_erase_map *map = &nor->erase_map;
+	const struct spi_nor_erase_command *best_cmd = NULL;
+	const struct spi_nor_erase_command *tested_cmd;
+	u64 region_start, region_end, cmd_mask;
+	u32 rem;
+	int i;
+
+	region_start = region->offset & ~SNOR_CMD_ERASE_MASK;
+	region_end = region_start + region->size;
+
+	cmd_mask = region->offset & SNOR_CMD_ERASE_MASK;
+	for (i = 0; i < SNOR_CMD_ERASE_MAX; i++) {
+		/* Does the erase region support the tested erase command? */
+		if (!(cmd_mask & BIT(i)))
+			continue;
+
+		tested_cmd = &map->commands[i];
+
+		/* Don't erase more than what the user has asked for. */
+		if (tested_cmd->size > len)
+			continue;
+
+		/* 'addr' must be aligned to the erase size. */
+		spi_nor_div_by_erase_size(tested_cmd, addr, &rem);
+		if (rem)
+			continue;
+
+		/*
+		 * 'addr' must be inside the region.
+		 * Erase regions may overlap, so compute the actual start offset
+		 * of this erase region based on the size of the tested erase
+		 * command.
+		 */
+		spi_nor_div_by_erase_size(tested_cmd, region_start, &rem);
+		if (addr < (region_start - rem) || region_end <= addr)
+			continue;
+
+		/*
+		 * The tested erase size is valid but we still need to check
+		 * whether it is better than the current best erase command.
+		 */
+		if (!best_cmd || best_cmd->size < tested_cmd->size)
+			best_cmd = tested_cmd;
+	}
+
+	*cmd = best_cmd;
+	return (best_cmd != NULL);
+}
+
+static bool
+spi_nor_find_erase_region(struct spi_nor *nor, u64 addr, u32 len,
+			  const struct spi_nor_erase_region **region,
+			  const struct spi_nor_erase_command **cmd)
+{
+	const struct spi_nor_erase_map *map = &nor->erase_map;
+	const struct spi_nor_erase_region *best_region = NULL;
+	const struct spi_nor_erase_command *best_cmd = NULL;
+	int i;
+
+	for (i = 0; i < map->num_regions; i++) {
+		const struct spi_nor_erase_command *tested_cmd = NULL;
+
+		if (!spi_nor_test_erase_region(nor, addr, len, &map->regions[i],
+					       &tested_cmd))
+			continue;
+
+		if (!best_cmd || best_cmd->size < tested_cmd->size) {
+			best_region = &map->regions[i];
+			best_cmd = tested_cmd;
+		}
+	}
+
+	*region = best_region;
+	*cmd = best_cmd;
+	return (best_cmd != NULL);
+}
+
+static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u32 addr, u32 len)
+{
+	const struct spi_nor_erase_region *region;
+	const struct spi_nor_erase_command *cmd;
+	u64 region_start, region_end;
+	int ret;
+
+	while (len) {
+		if (!spi_nor_find_erase_region(nor, addr, len, &region, &cmd))
+			return -EINVAL;
+
+		nor->erase_opcode = cmd->opcode;
+
+		region_start = region->offset & ~SNOR_CMD_ERASE_MASK;
+		region_end = region_start + region->size;
+		while (len && (u64)addr < region_end) {
+			ret = spi_nor_erase_sector(nor, addr);
+			if (ret)
+				return ret;
+
+			addr += cmd->size;
+			len -= cmd->size;
+
+			ret = spi_nor_wait_till_ready(nor);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * Erase an address range on the nor chip.  The address range may extend
  * one or more erase sectors.  Return an error is there is a problem erasing.
@@ -470,9 +608,11 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
 			(long long)instr->len);
 
-	div_u64_rem(instr->len, mtd->erasesize, &rem);
-	if (rem)
-		return -EINVAL;
+	if (likely(spi_nor_has_uniform_erase(nor))) {
+		div_u64_rem(instr->len, mtd->erasesize, &rem);
+		if (rem)
+			return -EINVAL;
+	}
 
 	addr = instr->addr;
 	len = instr->len;
@@ -511,7 +651,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	 */
 
 	/* "sector"-at-a-time erase */
-	} else {
+	} else if (likely(spi_nor_has_uniform_erase(nor))) {
 		while (len) {
 			write_enable(nor);
 
@@ -526,6 +666,12 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			if (ret)
 				goto erase_err;
 		}
+
+	/* erase multiple sectors */
+	} else {
+		ret = spi_nor_erase_multi_sectors(nor, addr, len);
+		if (ret)
+			goto erase_err;
 	}
 
 	write_disable(nor);
@@ -1588,10 +1734,38 @@ spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
 	pp->proto = proto;
 }
 
+static inline void
+spi_nor_set_erase_command(struct spi_nor_erase_command *cmd,
+			  u32 size, u8 opcode)
+{
+	cmd->size = size;
+	cmd->opcode = opcode;
+
+	if (is_power_of_2(cmd->size))
+		cmd->size_shift = ffs(cmd->size) - 1;
+	else
+		cmd->size_shift = 0;
+
+	cmd->size_mask = (1 << cmd->size_shift) - 1;
+}
+
+static inline void
+spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
+			       u32 cmd_mask, u64 flash_size)
+{
+	map->num_regions = 1;
+	map->regions = &map->uniform_region;
+	map->uniform_region.offset = SNOR_CMD_ERASE_OFFSET(cmd_mask, 0);
+	map->uniform_region.size = flash_size;
+}
+
 static int spi_nor_init_params(struct spi_nor *nor,
 			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
 {
+	struct spi_nor_erase_map *map = &nor->erase_map;
+	u32 erase_mask = 0;
+
 	/* Set legacy flash parameters as default. */
 	memset(params, 0, sizeof(*params));
 
@@ -1628,6 +1802,21 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
 				SPINOR_OP_PP, SNOR_PROTO_1_1_1);
 
+	/* Sector Erase settings. */
+	erase_mask |= BIT(0);
+	spi_nor_set_erase_command(&map->commands[0],
+				  info->sector_size, SPINOR_OP_SE);
+	if (info->flags & SECT_4K_PMC) {
+		erase_mask |= BIT(1);
+		spi_nor_set_erase_command(&map->commands[1],
+					  4096u, SPINOR_OP_BE_4K_PMC);
+	} else if (info->flags & SECT_4K) {
+		erase_mask |= BIT(1);
+		spi_nor_set_erase_command(&map->commands[1],
+					  4096u, SPINOR_OP_BE_4K);
+	}
+	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
+
 	/* Select the procedure to set the Quad Enable bit. */
 	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
 				   SNOR_HWCAPS_PP_QUAD)) {
@@ -1731,25 +1920,176 @@ static int spi_nor_select_pp(struct spi_nor *nor,
 	return 0;
 }
 
+static bool spi_nor_find_uniform_erase(const struct spi_nor *nor,
+				       u32 preferred_size,
+				       const struct spi_nor_erase_command **cmd)
+{
+	const struct spi_nor_erase_map *map = &nor->erase_map;
+	const struct spi_nor_erase_command *tested_cmd;
+	const struct spi_nor_erase_region *region;
+	const struct mtd_info *mtd = &nor->mtd;
+	u64 pos, region_start, region_end;
+	int cidx, ridx;
+	u32 rem;
+
+	/* Try all erase commands to find the best one (greatest erase size). */
+	*cmd = NULL;
+	for (cidx = 0; cidx < SNOR_CMD_ERASE_MAX; cidx++) {
+		tested_cmd = &map->commands[cidx];
+
+		/* The SPI flash size must be a multiple of the erase size. */
+		spi_nor_div_by_erase_size(tested_cmd, mtd->size, &rem);
+		if (rem)
+			continue;
+
+		/*
+		 * Walk through regions to check whether the whole memory can be
+		 * erased using only the tested erase command.
+		 */
+		pos = 0;
+		while (pos < mtd->size) {
+			for (ridx = 0; ridx < map->num_regions; ridx++) {
+				region = &map->regions[ridx];
+
+				/* The region must support the erase command. */
+				if (!(region->offset & BIT(cidx)))
+					continue;
+
+				/*
+				 * Compute the actual start and end offsets of
+				 * region based on the erase size.
+				 */
+				region_start = region->offset;
+				region_start &= ~SNOR_CMD_ERASE_MASK;
+				region_end = region_start + region->size;
+
+				spi_nor_div_by_erase_size(tested_cmd,
+							  region_start,
+							  &rem);
+				region_start -= rem;
+
+				spi_nor_div_by_erase_size(tested_cmd,
+							  region_end,
+							  &rem);
+				if (rem)
+					region_end += tested_cmd->size - rem;
+
+				/*
+				 * The current position must be the start offset
+				 * of the region.
+				 */
+				if (region_start == pos) {
+					/* Keep walking through regions. */
+					pos = region_end;
+					break;
+				}
+			}
+
+			/* No region found. */
+			if (ridx == map->num_regions)
+				break;
+		}
+
+		/*
+		 * If we can't erase the whole memory using only the current
+		 * erase command, stop here and try the next supported erase
+		 * command.
+		 */
+		if (pos != mtd->size)
+			continue;
+
+		/*
+		 * If the current erase size is the preferred one, stop here:
+		 * we have found the right uniform Sector Erase command.
+		 */
+		if (tested_cmd->size == preferred_size) {
+			*cmd = tested_cmd;
+			break;
+		}
+
+		/*
+		 * Otherwise, the current erase size is still a valid canditate:
+		 * we select the highest possible erase size.
+		 */
+		if (!(*cmd) || tested_cmd->size > (*cmd)->size)
+			*cmd = tested_cmd;
+	}
+
+	return (*cmd != NULL);
+}
+
 static int spi_nor_select_erase(struct spi_nor *nor,
 				const struct flash_info *info)
 {
+	struct spi_nor_erase_map *map = &nor->erase_map;
+	const struct spi_nor_erase_command *cmd = NULL;
+	u32 preferred_size = info->sector_size;
 	struct mtd_info *mtd = &nor->mtd;
+	bool is_uniform = false;
+	int i;
 
+	/*
+	 * The previous implementation handling Sector Erase commands assumed
+	 * that the SPI flash memory has an uniform layout then used only one
+	 * of the supported erase sizes for all Sector Erase commands.
+	 * So to be backward compatible, the new implementation also tries to
+	 * manage the SPI flash memory as uniform with a single erase sector
+	 * size.
+	 */
 #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
 	/* prefer "small sector" erase if possible */
-	if (info->flags & SECT_4K) {
-		nor->erase_opcode = SPINOR_OP_BE_4K;
-		mtd->erasesize = 4096;
-	} else if (info->flags & SECT_4K_PMC) {
-		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
-		mtd->erasesize = 4096;
-	} else
+	if (info->flags & (SECT_4K | SECT_4K_PMC))
+		preferred_size = 4096u;
 #endif
-	{
-		nor->erase_opcode = SPINOR_OP_SE;
-		mtd->erasesize = info->sector_size;
+
+	if (spi_nor_has_uniform_erase(nor)) {
+		/* The SPI flash memory is a real uniform one. */
+		cmd = NULL;
+		for (i = 0; i < SNOR_CMD_ERASE_MAX; i++) {
+			if (!(map->uniform_region.offset & BIT(i)))
+				continue;
+
+			if (map->commands[i].size == preferred_size) {
+				cmd = &map->commands[i];
+				break;
+			}
+			if (!cmd || map->commands[i].size > cmd->size)
+				cmd = &map->commands[i];
+		}
+
+		if (!cmd || !cmd->size)
+			return -EINVAL;
+
+		/* Disable all other Sector Erase commands. */
+		map->uniform_region.offset &= ~SNOR_CMD_ERASE_MASK;
+		map->uniform_region.offset |= BIT(cmd - map->commands);
+		is_uniform = true;
+	} else if (spi_nor_find_uniform_erase(nor, preferred_size, &cmd)) {
+		/* The SPI flash memory can be managed as an uniform one. */
+		spi_nor_init_uniform_erase_map(map, BIT(cmd - map->commands),
+					       mtd->size);
+		is_uniform = true;
+	}
+
+	if (is_uniform) {
+		/* Set the Sector Erase opcode and the associated size. */
+		nor->erase_opcode = cmd->opcode;
+		mtd->erasesize = cmd->size;
+		return 0;
 	}
+
+	/*
+	 * For non-uniform SPI flash memory, set mtd->erasesize to the
+	 * maximum erase sector size. No need to set nor->erase_opcode.
+	 */
+	cmd = NULL;
+	for (i = 0; i < SNOR_CMD_ERASE_MAX; i++)
+		if (!cmd || map->commands[i].size > cmd->size)
+			cmd = &map->commands[i];
+	if (!cmd || !cmd->size)
+		return -EINVAL;
+
+	mtd->erasesize = cmd->size;
 	return 0;
 }
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index d270788f5ab6..c12cafe99bee 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -216,6 +216,55 @@ enum spi_nor_option_flags {
 };
 
 /**
+ * struct spi_nor_erase_command - Structure to describe a SPI NOR erase command
+ * @size:		the size of the sector/block erased by the command.
+ * @size_shift:		the size shift: if @size is a power of 2 then the shift
+ *			is stored in @size_shift, otherwise @size_shift is zero.
+ * @size_mask:		the size mask based on @size_shift.
+ * @opcode:		the SPI command op code to erase the sector/block.
+ */
+struct spi_nor_erase_command {
+	u32	size;
+	u32	size_shift;
+	u32	size_mask;
+	u8	opcode;
+};
+
+/**
+ * struct spi_nor_erase_region - Structure to describe a SPI NOR erase region
+ * @offset:		the offset in the data array of erase region start.
+ *			LSB bits are used as a bitmask encoding the erase
+ *			commands supported inside this erase region.
+ * @size:		the size of the region in bytes.
+ */
+struct spi_nor_erase_region {
+	u64		offset;
+	u64		size;
+};
+
+#define SNOR_CMD_ERASE_MAX	4
+#define SNOR_CMD_ERASE_MASK	GENMASK_ULL(SNOR_CMD_ERASE_MAX - 1, 0)
+#define SNOR_CMD_ERASE_OFFSET(_cmd_mask, _offset)	\
+	((((u64)(_offset)) & ~SNOR_CMD_ERASE_MASK) |	\
+	 (((u64)(_cmd_mask)) & SNOR_CMD_ERASE_MASK))
+
+/**
+ * struct spi_nor_erase_map - Structure to describe the SPI NOR erase map
+ * @commands:		an array of erase commands shared by all the regions.
+ * @uniform_region:	a pre-allocated erase region for SPI NOR with a uniform
+ *			sector size (legacy implementation).
+ * @regions:		point to an array describing the boundaries of the erase
+ *			regions.
+ * @num_regions:	the number of elements in the @regions array.
+ */
+struct spi_nor_erase_map {
+	struct spi_nor_erase_command	commands[SNOR_CMD_ERASE_MAX];
+	struct spi_nor_erase_region	uniform_region;
+	struct spi_nor_erase_region	*regions;
+	u32				num_regions;
+};
+
+/**
  * struct flash_info -	Forward declaration of a structure used internally by
  *			spi_nor_scan() and spi_nor_init().
  */
@@ -238,6 +287,7 @@ struct flash_info;
  * @write_proto:	the SPI protocol for write operations
  * @reg_proto		the SPI protocol for read_reg/write_reg/erase operations
  * @cmd_buf:		used by the write_reg
+ * @erase_map:		the erase map of the SPI NOR
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
  * @unprepare:		[OPTIONAL] do some post work after the
@@ -273,6 +323,7 @@ struct spi_nor {
 	bool			sst_write_second;
 	u32			flags;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
+	struct spi_nor_erase_map	erase_map;
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
@@ -293,6 +344,11 @@ struct spi_nor {
 	void *priv;
 };
 
+static inline bool spi_nor_has_uniform_erase(const struct spi_nor *nor)
+{
+	return (nor->erase_map.regions == &nor->erase_map.uniform_region);
+}
+
 static inline void spi_nor_set_flash_node(struct spi_nor *nor,
 					  struct device_node *np)
 {
-- 
2.9.3
