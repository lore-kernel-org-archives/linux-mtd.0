Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5127FC47253
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D17020708
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 14:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmUZ2Mxw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D17020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zux2ci7VSnJWcC+wL4ih7QEL/qQc6RxD+mSfbuluYok=; b=hmUZ2MxwoJQw0u
	EUiqKr4ZodrO/ZHaHyG/7kEvoUl8nahU76iB9Z88De7YMNzSFXGsq6iDbpJoOtKaDM71uzOsqhWPT
	9yResIa+two+k9hQDIDNf9TfvfdMHaeN5FWSCDQFG8jW4ZDemgpQ2GzH2F4dBtpNaLD/ipH66xhJX
	X9LLcjc2wCcgEcfu3omizX5elfb6NEgXTS78Eyd+4yh1fY+6GKPAVmNhmNpzYye32lgmtuMCSPv15
	miDTHBGXSnAflMnhUHvSeWloTj6bubtZoNLS95F+bZvVpUCRQJorSV/oRH4UdvkgBHAHMR5uk6JZ5
	FfEiQu+d6fS6NWLanygw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUWrn-0005rb-9s; Fri, 01 May 2020 14:42:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUWp9-0000wS-2g
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 14:39:33 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 491DB2A30CF;
 Fri,  1 May 2020 15:39:25 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] mtd: rawnand: diskonchip: Get rid of the legacy interface
 implementation
Date: Fri,  1 May 2020 16:39:17 +0200
Message-Id: <20200501143917.1388957-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501143917.1388957-1-boris.brezillon@collabora.com>
References: <20200501143917.1388957-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_073931_410360_46C234EF 
X-CRM114-Status: GOOD (  18.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that exec_op() has been implemented we can get rid of the legacy
interface implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 292 ------------------------------
 1 file changed, 292 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 8adeb39905ac..85fa31f28b2e 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -86,10 +86,6 @@ static u_char empty_write_ecc[6] = { 0x4b, 0x00, 0xe2, 0x0e, 0x93, 0xf7 };
 #define DoC_is_Millennium(doc) ((doc)->ChipID == DOC_ChipID_DocMil)
 #define DoC_is_2000(doc) ((doc)->ChipID == DOC_ChipID_Doc2k)
 
-static void doc200x_hwcontrol(struct nand_chip *this, int cmd,
-			      unsigned int bitmask);
-static void doc200x_select_chip(struct nand_chip *this, int chip);
-
 static int debug = 0;
 module_param(debug, int, 0);
 
@@ -304,20 +300,6 @@ static void doc2000_write_byte(struct nand_chip *this, u_char datum)
 	WriteDOC(datum, docptr, 2k_CDSN_IO);
 }
 
-static u_char doc2000_read_byte(struct nand_chip *this)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-	u_char ret;
-
-	ReadDOC(docptr, CDSNSlowIO);
-	DoC_Delay(doc, 2);
-	ret = ReadDOC(docptr, 2k_CDSN_IO);
-	if (debug)
-		printk("read_byte returns %02x\n", ret);
-	return ret;
-}
-
 static void doc2000_writebuf(struct nand_chip *this, const u_char *buf,
 			     int len)
 {
@@ -430,20 +412,6 @@ static void __init doc2000_count_chips(struct mtd_info *mtd)
 	pr_debug("Detected %d chips per floor.\n", i);
 }
 
-static int doc200x_wait(struct nand_chip *this)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-
-	int status;
-
-	DoC_WaitReady(doc);
-	nand_status_op(this, NULL);
-	DoC_WaitReady(doc);
-	status = (int)this->legacy.read_byte(this);
-
-	return status;
-}
-
 static void doc2001_write_byte(struct nand_chip *this, u_char datum)
 {
 	struct doc_priv *doc = nand_get_controller_data(this);
@@ -454,19 +422,6 @@ static void doc2001_write_byte(struct nand_chip *this, u_char datum)
 	WriteDOC(datum, docptr, WritePipeTerm);
 }
 
-static u_char doc2001_read_byte(struct nand_chip *this)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-
-	//ReadDOC(docptr, CDSNSlowIO);
-	/* 11.4.5 -- delay twice to allow extended length cycle */
-	DoC_Delay(doc, 2);
-	ReadDOC(docptr, ReadPipeInit);
-	//return ReadDOC(docptr, Mil_CDSN_IO);
-	return ReadDOC(docptr, LastDataRead);
-}
-
 static void doc2001_writebuf(struct nand_chip *this, const u_char *buf, int len)
 {
 	struct doc_priv *doc = nand_get_controller_data(this);
@@ -495,20 +450,6 @@ static void doc2001_readbuf(struct nand_chip *this, u_char *buf, int len)
 	buf[i] = ReadDOC(docptr, LastDataRead);
 }
 
-static u_char doc2001plus_read_byte(struct nand_chip *this)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-	u_char ret;
-
-	ReadDOC(docptr, Mplus_ReadPipeInit);
-	ReadDOC(docptr, Mplus_ReadPipeInit);
-	ret = ReadDOC(docptr, Mplus_LastDataRead);
-	if (debug)
-		printk("read_byte returns %02x\n", ret);
-	return ret;
-}
-
 static void doc2001plus_writebuf(struct nand_chip *this, const u_char *buf, int len)
 {
 	struct doc_priv *doc = nand_get_controller_data(this);
@@ -559,84 +500,6 @@ static void doc2001plus_readbuf(struct nand_chip *this, u_char *buf, int len)
 		printk("\n");
 }
 
-static void doc2001plus_select_chip(struct nand_chip *this, int chip)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-	int floor = 0;
-
-	if (debug)
-		printk("select chip (%d)\n", chip);
-
-	if (chip == -1) {
-		/* Disable flash internally */
-		WriteDOC(0, docptr, Mplus_FlashSelect);
-		return;
-	}
-
-	floor = chip / doc->chips_per_floor;
-	chip -= (floor * doc->chips_per_floor);
-
-	/* Assert ChipEnable and deassert WriteProtect */
-	WriteDOC((DOC_FLASH_CE), docptr, Mplus_FlashSelect);
-	nand_reset_op(this);
-
-	doc->curchip = chip;
-	doc->curfloor = floor;
-}
-
-static void doc200x_select_chip(struct nand_chip *this, int chip)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-	int floor = 0;
-
-	if (debug)
-		printk("select chip (%d)\n", chip);
-
-	if (chip == -1)
-		return;
-
-	floor = chip / doc->chips_per_floor;
-	chip -= (floor * doc->chips_per_floor);
-
-	/* 11.4.4 -- deassert CE before changing chip */
-	doc200x_hwcontrol(this, NAND_CMD_NONE, 0 | NAND_CTRL_CHANGE);
-
-	WriteDOC(floor, docptr, FloorSelect);
-	WriteDOC(chip, docptr, CDSNDeviceSelect);
-
-	doc200x_hwcontrol(this, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
-
-	doc->curchip = chip;
-	doc->curfloor = floor;
-}
-
-#define CDSN_CTRL_MSK (CDSN_CTRL_CE | CDSN_CTRL_CLE | CDSN_CTRL_ALE)
-
-static void doc200x_hwcontrol(struct nand_chip *this, int cmd,
-			      unsigned int ctrl)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		doc->CDSNControl &= ~CDSN_CTRL_MSK;
-		doc->CDSNControl |= ctrl & CDSN_CTRL_MSK;
-		if (debug)
-			printk("hwcontrol(%d): %02x\n", cmd, doc->CDSNControl);
-		WriteDOC(doc->CDSNControl, docptr, CDSNControl);
-		/* 11.4.3 -- 4 NOPs after CSDNControl write */
-		DoC_Delay(doc, 4);
-	}
-	if (cmd != NAND_CMD_NONE) {
-		if (DoC_is_2000(doc))
-			doc2000_write_byte(this, cmd);
-		else
-			doc2001_write_byte(this, cmd);
-	}
-}
-
 static void doc200x_write_control(struct doc_priv *doc, u8 value)
 {
 	WriteDOC(value, doc->virtadr, CDSNControl);
@@ -797,144 +660,6 @@ static int doc2001plus_exec_op(struct nand_chip *this,
 	return 0;
 }
 
-static void doc2001plus_command(struct nand_chip *this, unsigned command,
-				int column, int page_addr)
-{
-	struct mtd_info *mtd = nand_to_mtd(this);
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-
-	/*
-	 * Must terminate write pipeline before sending any commands
-	 * to the device.
-	 */
-	if (command == NAND_CMD_PAGEPROG) {
-		WriteDOC(0x00, docptr, Mplus_WritePipeTerm);
-		WriteDOC(0x00, docptr, Mplus_WritePipeTerm);
-	}
-
-	/*
-	 * Write out the command to the device.
-	 */
-	if (command == NAND_CMD_SEQIN) {
-		int readcmd;
-
-		if (column >= mtd->writesize) {
-			/* OOB area */
-			column -= mtd->writesize;
-			readcmd = NAND_CMD_READOOB;
-		} else if (column < 256) {
-			/* First 256 bytes --> READ0 */
-			readcmd = NAND_CMD_READ0;
-		} else {
-			column -= 256;
-			readcmd = NAND_CMD_READ1;
-		}
-		WriteDOC(readcmd, docptr, Mplus_FlashCmd);
-	}
-	WriteDOC(command, docptr, Mplus_FlashCmd);
-	WriteDOC(0, docptr, Mplus_WritePipeTerm);
-	WriteDOC(0, docptr, Mplus_WritePipeTerm);
-
-	if (column != -1 || page_addr != -1) {
-		/* Serially input address */
-		if (column != -1) {
-			/* Adjust columns for 16 bit buswidth */
-			if (this->options & NAND_BUSWIDTH_16 &&
-					!nand_opcode_8bits(command))
-				column >>= 1;
-			WriteDOC(column, docptr, Mplus_FlashAddress);
-		}
-		if (page_addr != -1) {
-			WriteDOC((unsigned char)(page_addr & 0xff), docptr, Mplus_FlashAddress);
-			WriteDOC((unsigned char)((page_addr >> 8) & 0xff), docptr, Mplus_FlashAddress);
-			if (this->options & NAND_ROW_ADDR_3) {
-				WriteDOC((unsigned char)((page_addr >> 16) & 0x0f), docptr, Mplus_FlashAddress);
-				printk("high density\n");
-			}
-		}
-		WriteDOC(0, docptr, Mplus_WritePipeTerm);
-		WriteDOC(0, docptr, Mplus_WritePipeTerm);
-		/* deassert ALE */
-		if (command == NAND_CMD_READ0 || command == NAND_CMD_READ1 ||
-		    command == NAND_CMD_READOOB || command == NAND_CMD_READID)
-			WriteDOC(0, docptr, Mplus_FlashControl);
-	}
-
-	/*
-	 * program and erase have their own busy handlers
-	 * status and sequential in needs no delay
-	 */
-	switch (command) {
-
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_ERASE1:
-	case NAND_CMD_ERASE2:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_STATUS:
-		return;
-
-	case NAND_CMD_RESET:
-		if (this->legacy.dev_ready)
-			break;
-		udelay(this->legacy.chip_delay);
-		WriteDOC(NAND_CMD_STATUS, docptr, Mplus_FlashCmd);
-		WriteDOC(0, docptr, Mplus_WritePipeTerm);
-		WriteDOC(0, docptr, Mplus_WritePipeTerm);
-		while (!(this->legacy.read_byte(this) & 0x40)) ;
-		return;
-
-		/* This applies to read commands */
-	default:
-		/*
-		 * If we don't have access to the busy pin, we apply the given
-		 * command delay
-		 */
-		if (!this->legacy.dev_ready) {
-			udelay(this->legacy.chip_delay);
-			return;
-		}
-	}
-
-	/* Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine. */
-	ndelay(100);
-	/* wait until command is processed */
-	while (!this->legacy.dev_ready(this)) ;
-}
-
-static int doc200x_dev_ready(struct nand_chip *this)
-{
-	struct doc_priv *doc = nand_get_controller_data(this);
-	void __iomem *docptr = doc->virtadr;
-
-	if (DoC_is_MillenniumPlus(doc)) {
-		/* 11.4.2 -- must NOP four times before checking FR/B# */
-		DoC_Delay(doc, 4);
-		if ((ReadDOC(docptr, Mplus_FlashControl) & CDSN_CTRL_FR_B_MASK) != CDSN_CTRL_FR_B_MASK) {
-			if (debug)
-				printk("not ready\n");
-			return 0;
-		}
-		if (debug)
-			printk("was ready\n");
-		return 1;
-	} else {
-		/* 11.4.2 -- must NOP four times before checking FR/B# */
-		DoC_Delay(doc, 4);
-		if (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B)) {
-			if (debug)
-				printk("not ready\n");
-			return 0;
-		}
-		/* 11.4.2 -- Must NOP twice if it's ready */
-		DoC_Delay(doc, 2);
-		if (debug)
-			printk("was ready\n");
-		return 1;
-	}
-}
-
 static void doc200x_enable_hwecc(struct nand_chip *this, int mode)
 {
 	struct doc_priv *doc = nand_get_controller_data(this);
@@ -1496,9 +1221,6 @@ static inline int __init doc2000_init(struct mtd_info *mtd)
 	struct nand_chip *this = mtd_to_nand(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 
-	this->legacy.read_byte = doc2000_read_byte;
-	this->legacy.write_buf = doc2000_writebuf;
-	this->legacy.read_buf = doc2000_readbuf;
 	doc->late_init = nftl_scan_bbt;
 
 	doc->CDSNControl = CDSN_CTRL_FLASH_IO | CDSN_CTRL_ECC_IO;
@@ -1512,10 +1234,6 @@ static inline int __init doc2001_init(struct mtd_info *mtd)
 	struct nand_chip *this = mtd_to_nand(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 
-	this->legacy.read_byte = doc2001_read_byte;
-	this->legacy.write_buf = doc2001_writebuf;
-	this->legacy.read_buf = doc2001_readbuf;
-
 	ReadDOC(doc->virtadr, ChipID);
 	ReadDOC(doc->virtadr, ChipID);
 	ReadDOC(doc->virtadr, ChipID);
@@ -1542,13 +1260,7 @@ static inline int __init doc2001plus_init(struct mtd_info *mtd)
 	struct nand_chip *this = mtd_to_nand(mtd);
 	struct doc_priv *doc = nand_get_controller_data(this);
 
-	this->legacy.read_byte = doc2001plus_read_byte;
-	this->legacy.write_buf = doc2001plus_writebuf;
-	this->legacy.read_buf = doc2001plus_readbuf;
 	doc->late_init = inftl_scan_bbt;
-	this->legacy.cmd_ctrl = NULL;
-	this->legacy.select_chip = doc2001plus_select_chip;
-	this->legacy.cmdfunc = doc2001plus_command;
 	this->ecc.hwctl = doc2001plus_enable_hwecc;
 
 	doc->chips_per_floor = 1;
@@ -1740,10 +1452,6 @@ static int __init doc_probe(unsigned long physadr)
 
 	nand->controller	= &doc->base;
 	nand_set_controller_data(nand, doc);
-	nand->legacy.select_chip	= doc200x_select_chip;
-	nand->legacy.cmd_ctrl		= doc200x_hwcontrol;
-	nand->legacy.dev_ready	= doc200x_dev_ready;
-	nand->legacy.waitfunc	= doc200x_wait;
 	nand->ecc.hwctl		= doc200x_enable_hwecc;
 	nand->ecc.calculate	= doc200x_calculate_ecc;
 	nand->ecc.correct	= doc200x_correct_data;
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
