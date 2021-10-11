Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB60C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C8AD60F11
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C8AD60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHMlWyl8n8jq2RQuI0UJ7ZeAeHPbXb5vL4e4gTMCRZM=; b=yZHZAukCLu6reO
	CGEdBbY08ZDdvlHma2OHyo8P5hrOw40qIjBSRFkIbegAkAg8P36AJCUGO3Qsz+xHiZRvmV6viDhIx
	exxpGBgYcHJYBXoUuzLaCp7Jn2iMODGjUxXw73CgZoKAHPXfmWj6S9EEcQFU1VB2pjZQJY+lxB2Rg
	s8vTw7rPZgch2EvsDwpM1wAA1wlCQY4XJUZ7e7ZDnoQfUBN+sppqj9nkRwflE3L8Hh2wZA2fgjLBi
	jpQ9rglaqFwCfETxYx3idbxRSYuWFryYDyuvFhW68IaMXWlMlGolbAiN8qEHpg0PZmgIEIWXBkux0
	qD2PqjzBtiALNFttTH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2Kj-00AfZF-EG; Mon, 11 Oct 2021 20:55:41 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2Cz-00Add2-3W
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:47:43 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKlYhB120796;
 Mon, 11 Oct 2021 15:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985254;
 bh=aE9h+iCpn2bT2W0hUbw4QOpt5bFgcYuqQIMWifBo9M0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OPgGLEnbJb7axirW0W1zFlv74snzAqIf0bWAf1HoyT7tD9lRYkpf8xzCu9rUQHcBm
 lXaLFLHpSB/MxQcb7bFDJQFXmWoJHqdkcIf/W8Ligi7RwB7omNjB2ZvPCzfAMIir3r
 5LSEKeNIeP1T87laksN2XJ98wgITQsvEHIVoMxfs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKlYOt097449
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:47:34 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:47:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:47:34 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEq069811;
 Mon, 11 Oct 2021 15:47:28 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 12/14] mtd: spinand: Add adjust_op() in Winbond
 manufacturer_ops
Date: Tue, 12 Oct 2021 02:16:17 +0530
Message-ID: <20211011204619.81893-13-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134741_285507_2ACFD1AA 
X-CRM114-Status: GOOD (  12.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add implementation of adjust_op() manufacturer_ops for Winbond. This
handles the variations introduced in read register, read vcr, blk
erase, page read and program exec ops when operating in Octal DTR mode.
Read register operation requires 7 dummy cycles and read VCR operation
requires 8 dummy cycles in Octal DTR mode instead of default 0 dummy
cycle. Block erase, page read and program exec operations require
2 byte address in Octal DTR mode instead of default 3 bytes.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/winbond.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index e2cb82d68f96..d962221d4082 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -16,6 +16,13 @@
 
 #define WINBOND_CFG_BUF_READ		BIT(3)
 
+#define WINBOND_BLK_ERASE_OPCODE	0xD8
+#define WINBOND_PAGE_READ_OPCODE	0x13
+#define WINBOND_PROG_EXEC_OPCODE	0x10
+#define WINBOND_READ_REG_OPCODE_1	0x05
+#define WINBOND_READ_REG_OPCODE_2	0x0F
+#define WINBOND_READ_VCR_OPCODE		0x85
+
 /* Octal DTR SPI mode (8D-8D-8D) with Data Strobe output*/
 #define WINBOND_IO_MODE_VCR_OCTAL_DTR	0xE7
 #define WINBOND_IO_MODE_VCR_ADDR	0x00
@@ -197,9 +204,47 @@ static int winbond_spinand_octal_dtr_enable(struct spinand_device *spinand)
 	return 0;
 }
 
+static void winbond_spinand_adjust_op(struct spi_mem_op *op,
+				      const enum spinand_proto reg_proto)
+{
+	/*
+	 * To support both 1 byte opcode and 2 byte opcodes, extract the MSB
+	 * byte from the opcode as the LSB byte in 2 byte opcode is treated as
+	 * don't care.
+	 */
+	u8 opcode = op->cmd.opcode >> (8 * (op->cmd.nbytes - 1));
+
+	if (reg_proto == SPINAND_OCTAL_DTR) {
+		switch (opcode) {
+		case WINBOND_READ_REG_OPCODE_1:
+		case WINBOND_READ_REG_OPCODE_2:
+			op->dummy.nbytes = 14;
+			op->dummy.buswidth = 8;
+			op->dummy.dtr = true;
+			return;
+
+		case WINBOND_READ_VCR_OPCODE:
+			op->dummy.nbytes = 16;
+			op->dummy.buswidth = 8;
+			op->dummy.dtr = true;
+			return;
+
+		case WINBOND_BLK_ERASE_OPCODE:
+		case WINBOND_PAGE_READ_OPCODE:
+		case WINBOND_PROG_EXEC_OPCODE:
+			op->addr.nbytes = 2;
+			return;
+
+		default:
+			return;
+		}
+	}
+}
+
 static const struct spinand_manufacturer_ops winbond_spinand_manuf_ops = {
 	.init = winbond_spinand_init,
 	.octal_dtr_enable = winbond_spinand_octal_dtr_enable,
+	.adjust_op = winbond_spinand_adjust_op,
 };
 
 const struct spinand_manufacturer winbond_spinand_manufacturer = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
