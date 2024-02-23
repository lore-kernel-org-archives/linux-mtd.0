Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6FAC54798
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFvWIYIVyMf9Tx1whMB36c1x3xfkKiqzGtECKLC/TMU=; b=UHIAQQ3d9EVhVb
	yoa4vFSouhQOc5Mbs81o4DHTScwVqzGL0ppXa/Vt229KE56+Dfjbe3mssKrgYJ4is45EzkTpxpsFP
	tcT68ZHaJr5Oq3LDaz/kbiYGWEA55Z/9G/smx/YfAioWmN97tLaf2XvcYWQIGj+Yx4T0qdRhg2iIN
	PQq2MkIxZbNEPad/FSp/GgXghgRNbpvofPY5oa3VN1a3ypFT8GShl+jZG6F4lAPdOdUB8ut7TmNTA
	PTqlPY2aQsN7HB4z7XJ1Js8TuSW8Y9badkArRYIX1mKfFz9ww4uoCdp3YLp0gvytyjBV+KocaLbjn
	zhSc28EVDb4yNYYvtVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMYq-00000007jvE-3Js2;
	Fri, 23 Feb 2024 03:49:20 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMXv-00000007jaf-0n9x;
	Fri, 23 Feb 2024 03:48:29 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 54EC2C0019B2;
	Thu, 22 Feb 2024 19:48:22 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 54EC2C0019B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660102;
	bh=zTYFtRXVflXc15lp67aZg9HB9tF9WCLgh2W0BrCZeUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqtBWCGK0+UEuZoIETnIEjVaEXP1DFFMp61JUNeA0OH2Jiu5TB/YHnVSTdhSOBUIh
	 0N36ajlspw0YROIddO7Y/WDc0kLU4WxXXBxVbxllwrhoyuxg+7xspZG2EidFltxp56
	 cpSbJ8+zLSiWDaTemb1zVpEoiIP/d4B0sz8jQgVw=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id CDA7718041CAC4;
	Thu, 22 Feb 2024 19:48:20 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	David Regan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v6 02/13] mtd: rawnand: brcmnand: fix style issues
Date: Thu, 22 Feb 2024 19:47:47 -0800
Message-Id: <20240223034758.13753-3-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240223034758.13753-1-william.zhang@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_194826_354425_1BCA2503 
X-CRM114-Status: GOOD (  15.04  )
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

Fix various style issues.

Signed-off-by: David Regan <dregan@broadcom.com>
Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v6:
- Added to patch series

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index b8e70fc64348..5f34e5a51d25 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2339,7 +2339,7 @@ static int brcmnand_write_oob_raw(struct nand_chip *chip, int page)
 }
 
 static int brcmnand_exec_instr(struct brcmnand_host *host, int i,
-				const struct nand_operation *op)
+		const struct nand_operation *op)
 {
 	const struct nand_op_instr *instr = &op->instrs[i];
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -2353,7 +2353,7 @@ static int brcmnand_exec_instr(struct brcmnand_host *host, int i,
 	 * (WAITRDY excepted).
 	 */
 	last_op = ((i == (op->ninstrs - 1)) && (instr->type != NAND_OP_WAITRDY_INSTR)) ||
-		  ((i == (op->ninstrs - 2)) && (op->instrs[i+1].type == NAND_OP_WAITRDY_INSTR));
+		  ((i == (op->ninstrs - 2)) && (op->instrs[i + 1].type == NAND_OP_WAITRDY_INSTR));
 
 	switch (instr->type) {
 	case NAND_OP_CMD_INSTR:
@@ -2398,10 +2398,10 @@ static int brcmnand_exec_instr(struct brcmnand_host *host, int i,
 
 static int brcmnand_op_is_status(const struct nand_operation *op)
 {
-	if ((op->ninstrs == 2) &&
-	    (op->instrs[0].type == NAND_OP_CMD_INSTR) &&
-	    (op->instrs[0].ctx.cmd.opcode == NAND_CMD_STATUS) &&
-	    (op->instrs[1].type == NAND_OP_DATA_IN_INSTR))
+	if (op->ninstrs == 2 &&
+	    op->instrs[0].type == NAND_OP_CMD_INSTR &&
+	    op->instrs[0].ctx.cmd.opcode == NAND_CMD_STATUS &&
+	    op->instrs[1].type == NAND_OP_DATA_IN_INSTR)
 		return 1;
 
 	return 0;
@@ -2409,10 +2409,10 @@ static int brcmnand_op_is_status(const struct nand_operation *op)
 
 static int brcmnand_op_is_reset(const struct nand_operation *op)
 {
-	if ((op->ninstrs == 2) &&
-	    (op->instrs[0].type == NAND_OP_CMD_INSTR) &&
-	    (op->instrs[0].ctx.cmd.opcode == NAND_CMD_RESET) &&
-	    (op->instrs[1].type == NAND_OP_WAITRDY_INSTR))
+	if (op->ninstrs == 2 &&
+	    op->instrs[0].type == NAND_OP_CMD_INSTR &&
+	    op->instrs[0].ctx.cmd.opcode == NAND_CMD_RESET &&
+	    op->instrs[1].type == NAND_OP_WAITRDY_INSTR)
 		return 1;
 
 	return 0;
@@ -2440,8 +2440,7 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 		*status = ret & 0xFF;
 
 		return 0;
-	}
-	else if (brcmnand_op_is_reset(op)) {
+	} else if (brcmnand_op_is_reset(op)) {
 		ret = brcmnand_reset(host);
 		if (ret < 0)
 			return ret;
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
