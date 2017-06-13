Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dKfrH-0005Sc-MD
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 07:03:26 +0000
Date: Tue, 13 Jun 2017 09:02:49 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao
 Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH v6 00/18] mtd: nand: denali: Denali NAND IP patch bomb
Message-ID: <20170613090249.6a247389@bbrezillon>
In-Reply-To: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
References: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Tue, 13 Jun 2017 14:03:52 +0900,
Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :

> This patch series intends to solve various problems.
>=20
> [1] The driver just retrieves the OOB area as-is
>     whereas the controller uses syndrome page layout.
> [2] ONFi devices are not working
> [3] It can not read Bad Block Marker
>=20
> Outstanding changes are:
>  - Fix raw/oob callbacks for syndrome page layout
>  - Implement setup_data_interface() callback
>  - Fix/implement more commands for ONFi devices
>  - Allow to skip the driver internal bounce buffer
>  - Support PIO in case DMA is not supported
>  - Switch from ->cmdfunc over to ->cmd_ctrl
>=20
> 18 patches were merged by v2.
> 11 patches were merged by v3.
> 2 patches were merged by v4.
> 5 patches were merged by v5.
> Here is the rest of the series.
>=20
> v1: https://lkml.org/lkml/2016/11/26/144
> v2: https://lkml.org/lkml/2017/3/22/804
> v3: https://lkml.org/lkml/2017/3/30/90
> v4: https://lkml.org/lkml/2017/6/5/1005
>=20
> Masahiro Yamada (18):
>   mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
>   mtd: nand: denali: remove unneeded find_valid_banks()
>   mtd: nand: denali: handle timing parameters by setup_data_interface()
>   mtd: nand: denali: rework interrupt handling
>   mtd: nand: denali: fix NAND_CMD_STATUS handling
>   mtd: nand: denali: fix NAND_CMD_PARAM handling

AFAICT, patch 5 and 6 are unneeded...

>   mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc

... because you're anyway switching to ->cmd_ctrl() in patch 7, which
fixes the problem you were addressing in patch 5 and 6.

Please squash those 3 patches into a single one and adjust your commit
message accordingly (explaining that it fixes STATUS and PARAM handling).
See below if you need an example.

BTW, I also implemented ->read/write_buf_word() since the core may one
day call these functions, and the default implementations used by the
core when these hooks are NULL are not appropriate in your case.

--->8---
=46rom 136727ba7b453ca1567c711037230aa6ec0f124a Mon Sep 17 00:00:00 2001
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Jun 2017 14:03:57 +0900
Subject: [PATCH] mtd: nand: denali: switch over to cmd_ctrl instead of cmdf=
unc

The NAND_CMD_SET_FEATURES support is missing from denali_cmdfunc().

Besides, we see /* TODO: Read OOB data */ comment line.

It would be possible to add more commands along with the current
implementation, but having ->cmd_ctrl() seems a better approach from
the discussion with Boris [1].

Rely on the default ->cmdfunc() from the framework and implement the
driver's own ->cmd_ctrl(). We are also implementing
->read/write_buf/byte/word().

Also add ->write_byte(), which is needed for write direction commands.

Then, we can drop nand_onfi_get_set_features_notsupp from this driver.

This transition also fixes NAND_CMD_STATUS and NAND_CMD_PARAM handling.
NAND_CMD_STATUS was just faked by the implementation, and the only valid
bit returned in this case was the WP bit.
NAND_CMD_PARAM was completely broken: not only the command sent on the
bus was NAND_CMD_STATUS instead of NAND_CMD_PARAM, but the driver was
only reading 8 bytes of data, while the parameter page is contains
several hundreds of bytes.

[1] https://lkml.org/lkml/2017/3/15/97

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/denali.c | 204 +++++++++++++++++++++---------------------=
----
 drivers/mtd/nand/denali.h |   2 -
 2 files changed, 95 insertions(+), 111 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d7e7555a3d73..633faf2da1f4 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -85,43 +85,6 @@ static void index_addr(struct denali_nand_info *denali,
 	iowrite32(data, denali->flash_mem + 0x10);
 }
=20
-/* Perform an indexed read of the device */
-static void index_addr_read_data(struct denali_nand_info *denali,
-				 uint32_t address, uint32_t *pdata)
-{
-	iowrite32(address, denali->flash_mem);
-	*pdata =3D ioread32(denali->flash_mem + 0x10);
-}
-
-/*
- * We need to buffer some data for some of the NAND core routines.
- * The operations manage buffering that data.
- */
-static void reset_buf(struct denali_nand_info *denali)
-{
-	denali->buf.head =3D denali->buf.tail =3D 0;
-}
-
-static void write_byte_to_buf(struct denali_nand_info *denali, uint8_t byt=
e)
-{
-	denali->buf.buf[denali->buf.tail++] =3D byte;
-}
-
-/* reads the status of the device */
-static void read_status(struct denali_nand_info *denali)
-{
-	uint32_t cmd;
-
-	/* initialize the data buffer to store status */
-	reset_buf(denali);
-
-	cmd =3D ioread32(denali->flash_reg + WRITE_PROTECT);
-	if (cmd)
-		write_byte_to_buf(denali, NAND_STATUS_WP);
-	else
-		write_byte_to_buf(denali, 0);
-}
-
 /* Reset the flash controller */
 static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
@@ -267,20 +230,16 @@ static uint32_t denali_wait_for_irq(struct denali_nan=
d_info *denali,
 	return denali->irq_status;
 }
=20
-/* resets a specific device connected to the core */
-static void reset_bank(struct denali_nand_info *denali)
+static uint32_t denali_check_irq(struct denali_nand_info *denali)
 {
+	unsigned long flags;
 	uint32_t irq_status;
=20
-	denali_reset_irq(denali);
-
-	iowrite32(1 << denali->flash_bank, denali->flash_reg + DEVICE_RESET);
-
-	irq_status =3D denali_wait_for_irq(denali,
-					 INTR__RST_COMP | INTR__TIME_OUT);
+	spin_lock_irqsave(&denali->irq_lock, flags);
+	irq_status =3D denali->irq_status;
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
=20
-	if (!(irq_status & INTR__RST_COMP))
-		dev_err(denali->dev, "reset bank failed.\n");
+	return irq_status;
 }
=20
 /*
@@ -301,6 +260,82 @@ static void setup_ecc_for_xfer(struct denali_nand_info=
 *denali, bool ecc_en,
 	iowrite32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
 }
=20
+static void denali_read_buf(struct mtd_info *mtd, u8 *buf, int len)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	int i;
+
+	for (i =3D 0; i < len; i++) {
+		iowrite32(MODE_11 | BANK(denali->flash_bank) | 2,
+			  denali->flash_mem);
+		buf[i] =3D ioread32(denali->flash_mem + 0x10);
+	}
+}
+
+static u8 denali_read_byte(struct mtd_info *mtd)
+{
+	u8 ret;
+
+	denali_read_buf(mtd, &ret, 1);
+
+	return ret;
+}
+
+static u16 denali_read_word(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+
+	return ioread32(denali->flash_mem + 0x10);
+}
+
+static void denali_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	int i;
+
+	for (i =3D 0; i < len; i++) {
+		iowrite32(MODE_11 | BANK(denali->flash_bank) | 2,
+			  denali->flash_mem);
+		iowrite32(buf[i], denali->flash_mem + 0x10);
+	}
+}
+
+static void denali_write_byte(struct mtd_info *mtd, uint8_t byte)
+{
+	denali_write_buf(mtd, &byte, 1);
+}
+
+static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ct=
rl)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	uint32_t type;
+
+	if (ctrl & NAND_CLE)
+		type =3D 0;
+	else if (ctrl & NAND_ALE)
+		type =3D 1;
+	else
+		return;
+
+	/*
+	 * Some commands are followed by chip->dev_ready or chip->waitfunc.
+	 * irq_status must be cleared here to catch the R/B# interrupt later.
+	 */
+	if (ctrl & NAND_CTRL_CHANGE)
+		denali_reset_irq(denali);
+
+	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | type, dat);
+}
+
+static int denali_dev_ready(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+
+	return !!(denali_check_irq(denali) & INTR__INT_ACT);
+}
+
 /*
  * sends a pipeline command operation to the controller. See the Denali NA=
ND
  * controller's user guide for more information (section 4.2.3.6).
@@ -843,17 +878,6 @@ static int denali_read_page_raw(struct mtd_info *mtd, =
struct nand_chip *chip,
 	return 0;
 }
=20
-static uint8_t denali_read_byte(struct mtd_info *mtd)
-{
-	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
-	uint8_t result =3D 0xff;
-
-	if (denali->buf.head < denali->buf.tail)
-		result =3D denali->buf.buf[denali->buf.head++];
-
-	return result;
-}
-
 static void denali_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
@@ -863,7 +887,13 @@ static void denali_select_chip(struct mtd_info *mtd, i=
nt chip)
=20
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	return 0;
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	uint32_t irq_status;
+
+	/* R/B# pin transitioned from low to high? */
+	irq_status =3D denali_wait_for_irq(denali, INTR__INT_ACT);
+
+	return irq_status & INTR__INT_ACT ? 0 : NAND_STATUS_FAIL;
 }
=20
 static int denali_erase(struct mtd_info *mtd, int page)
@@ -884,45 +914,6 @@ static int denali_erase(struct mtd_info *mtd, int page)
 	return irq_status & INTR__ERASE_COMP ? 0 : NAND_STATUS_FAIL;
 }
=20
-static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
-			   int page)
-{
-	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
-	uint32_t addr, id;
-	int i;
-
-	switch (cmd) {
-	case NAND_CMD_STATUS:
-		read_status(denali);
-		break;
-	case NAND_CMD_READID:
-	case NAND_CMD_PARAM:
-		reset_buf(denali);
-		/*
-		 * sometimes ManufactureId read from register is not right
-		 * e.g. some of Micron MT29F32G08QAA MLC NAND chips
-		 * So here we send READID cmd to NAND insteand
-		 */
-		addr =3D MODE_11 | BANK(denali->flash_bank);
-		index_addr(denali, addr | 0, 0x90);
-		index_addr(denali, addr | 1, col);
-		for (i =3D 0; i < 8; i++) {
-			index_addr_read_data(denali, addr | 2, &id);
-			write_byte_to_buf(denali, id);
-		}
-		break;
-	case NAND_CMD_RESET:
-		reset_bank(denali);
-		break;
-	case NAND_CMD_READOOB:
-		/* TODO: Read OOB data */
-		break;
-	default:
-		pr_err(": unsupported command received 0x%x\n", cmd);
-		break;
-	}
-}
-
 #define DIV_ROUND_DOWN_ULL(ll, d) \
 	({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
=20
@@ -1238,12 +1229,6 @@ int denali_init(struct denali_nand_info *denali)
 	struct mtd_info *mtd =3D nand_to_mtd(chip);
 	int ret;
=20
-	/* allocate a temporary buffer for nand_scan_ident() */
-	denali->buf.buf =3D devm_kzalloc(denali->dev, PAGE_SIZE,
-					GFP_DMA | GFP_KERNEL);
-	if (!denali->buf.buf)
-		return -ENOMEM;
-
 	mtd->dev.parent =3D denali->dev;
 	denali_hw_init(denali);
 	denali_drv_init(denali);
@@ -1267,11 +1252,14 @@ int denali_init(struct denali_nand_info *denali)
=20
 	/* register the driver with the NAND core subsystem */
 	chip->select_chip =3D denali_select_chip;
-	chip->cmdfunc =3D denali_cmdfunc;
 	chip->read_byte =3D denali_read_byte;
+	chip->read_word =3D denali_read_word;
+	chip->read_buf =3D denali_read_buf;
+	chip->write_byte =3D denali_write_byte;
+	chip->write_buf =3D denali_write_buf;
+	chip->cmd_ctrl =3D denali_cmd_ctrl;
+	chip->dev_ready =3D denali_dev_ready;
 	chip->waitfunc =3D denali_waitfunc;
-	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;
=20
 	/* clk rate info is needed for setup_data_interface */
 	if (denali->clk_x_rate)
@@ -1286,8 +1274,6 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto disable_irq;
=20
-	/* allocate the right size buffer now */
-	devm_kfree(denali->dev, denali->buf.buf);
 	denali->buf.buf =3D devm_kzalloc(denali->dev,
 			     mtd->writesize + mtd->oobsize,
 			     GFP_KERNEL);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index a0ac0f84f8b5..a84d8784ee98 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -306,8 +306,6 @@
 #define MODE_11    0x0C000000
=20
 struct nand_buf {
-	int head;
-	int tail;
 	uint8_t *buf;
 	dma_addr_t dma_buf;
 };
--=20
2.11.0
