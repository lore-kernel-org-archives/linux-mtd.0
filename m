Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CC8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 13:30:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4A860E76
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 13:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D4A860E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TttgGGKonUoXt939luWs7K5NZMmIhrRyCZ+czfnpwY4=; b=zfSdEAOYpUi9sn
	RJKRL8ghQIDjjsqaYIpvNIP3B7ChQrujIWIviIYDNHn38tMq8lVWxNTXyLzN/Q6Yjtc9Zq25qUmzG
	Mnc4AoeoQCpGi30k1QnddecUzi+QHyiC5s3W2EfOdKUR/SsFxfqFV2bWr4Putq2VLMdR/JQooDNU1
	Cvlp/aVi94X0XKwfsEr2WmKkSFMPc1nWxvfu3NWmjhy4mmZgHahwHcqNjrrl4FaoW2PyyPeMZjCHn
	z3gSsAjpB/PUnFvhz3vIbVTs+zRflmrIFyGe3fHJ5GqLyJJs3kZMzC+J6EztzcsoNaFGEX38ducb3
	oCgEQQCZhDVexdo3/t9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNEh8-000ulQ-7Q; Mon, 06 Sep 2021 13:29:54 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNEh5-000ukX-Jm
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 13:29:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 53FFE240010;
 Mon,  6 Sep 2021 13:29:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/3] mtd: rawnand: Add a helper to check if a
 CHANGE_READ_COLUMN is possible
Date: Mon,  6 Sep 2021 15:29:40 +0200
Message-Id: <20210906132942.36972-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_062951_810455_52014DCE 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Certain controllers are limited and cannot perform all type of
CHANGE_READ_COLUMN. Let's add a helper that allows checking this.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 15 +++++++++++++++
 include/linux/mtd/rawnand.h      |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 57a583149cc0..7f29f27bb6fd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1312,6 +1312,15 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 int nand_change_read_column_op(struct nand_chip *chip,
 			       unsigned int offset_in_page, void *buf,
 			       unsigned int len, bool force_8bit)
+{
+	return nand_check_change_read_column_op(chip, offset_in_page, buf, len,
+						force_8bit, false);
+}
+
+int nand_check_change_read_column_op(struct nand_chip *chip,
+				     unsigned int offset_in_page, void *buf,
+				     unsigned int len, bool force_8bit,
+				     bool check_only)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
@@ -1349,9 +1358,15 @@ int nand_change_read_column_op(struct nand_chip *chip,
 
 		instrs[3].ctx.data.force_8bit = force_8bit;
 
+		if (check_only)
+			return nand_check_op(chip, &op);
+
 		return nand_exec_op(chip, &op);
 	}
 
+	if (check_only)
+		return 0;
+
 	chip->legacy.cmdfunc(chip, NAND_CMD_RNDOUT, offset_in_page, -1);
 	if (len)
 		chip->legacy.read_buf(chip, buf, len);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b2f9dd3cbd69..a453386aee70 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1523,6 +1523,10 @@ int nand_read_page_op(struct nand_chip *chip, unsigned int page,
 int nand_change_read_column_op(struct nand_chip *chip,
 			       unsigned int offset_in_page, void *buf,
 			       unsigned int len, bool force_8bit);
+int nand_check_change_read_column_op(struct nand_chip *chip,
+				     unsigned int offset_in_page, void *buf,
+				     unsigned int len, bool force_8bit,
+				     bool check_only);
 int nand_read_oob_op(struct nand_chip *chip, unsigned int page,
 		     unsigned int offset_in_page, void *buf, unsigned int len);
 int nand_prog_page_begin_op(struct nand_chip *chip, unsigned int page,
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
