Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3066C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E8F601FA
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 14:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69E8F601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6plhcit8vbq/yG657f+J/TAwTN3bOhk2awHwtpY9CE=; b=ifhQwWAPxENdag
	+E1JHY+jr9rG7+FiVOkr1pKvKHronm005x/FPu2rFGEVb9nMKyOvqRoZBHshFNLyU2ia1vaZsQ7ea
	2M27bOeKPKIUH5KszDhwt7Nj+vR9/wENFdw7OeUmLLjlgzkHpb4ywcHsiGZSu4Wd5ImgOaAakM3TS
	mHl0LIsPUalmUDeHnumA7AoW+ywP6I/EYV94y++Fy1zH851obm1jBnteA3tVmkCju4lI+B9jthh+G
	B5TYDO5H9elj2ACvxRDqSzcqELJgk/af4IiDVPIcbYmHXE5GJBa0tu3y2L+Ee1SnWQXoEz6c6AQis
	s5kUmav8hgowlusIzhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlXvM-00AvDr-Te; Fri, 12 Nov 2021 14:53:05 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlXiH-00AqG7-13
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 14:39:34 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPA id 1973C40005;
 Fri, 12 Nov 2021 14:39:31 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 2/4] mtd: rawnand: fsmc: Force to use 8 bits access when
 expected
Date: Fri, 12 Nov 2021 15:38:53 +0100
Message-Id: <20211112143855.2678989-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112143855.2678989-1-herve.codina@bootlin.com>
References: <20211112143855.2678989-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_063933_247137_3FBBC4F8 
X-CRM114-Status: UNSURE (   9.66  )
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

Some data transfers are expected on 8 bits by the nand core.
The fsmc driver did not check this constraint and these transfers
can be done on 32 bits depending on buffer alignment and transfers
data size.

This patch ensures that these transfers will be 8bits transfers in
all cases.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 658f0cbe7ce8..7f057cfee6c4 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -540,12 +540,12 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
  * @len:	number of bytes to write
  */
 static void fsmc_write_buf(struct fsmc_nand_data *host, const u8 *buf,
-			   int len)
+			   int len, bool force_8bit)
 {
 	int i;
 
 	if (IS_ALIGNED((uintptr_t)buf, sizeof(u32)) &&
-	    IS_ALIGNED(len, sizeof(u32))) {
+	    IS_ALIGNED(len, sizeof(u32)) && !force_8bit) {
 		u32 *p = (u32 *)buf;
 
 		len = len >> 2;
@@ -563,12 +563,13 @@ static void fsmc_write_buf(struct fsmc_nand_data *host, const u8 *buf,
  * @buf:	buffer to store date
  * @len:	number of bytes to read
  */
-static void fsmc_read_buf(struct fsmc_nand_data *host, u8 *buf, int len)
+static void fsmc_read_buf(struct fsmc_nand_data *host, u8 *buf, int len,
+			  bool force_8bit)
 {
 	int i;
 
 	if (IS_ALIGNED((uintptr_t)buf, sizeof(u32)) &&
-	    IS_ALIGNED(len, sizeof(u32))) {
+	    IS_ALIGNED(len, sizeof(u32)) && !force_8bit) {
 		u32 *p = (u32 *)buf;
 
 		len = len >> 2;
@@ -646,7 +647,8 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 						  instr->ctx.data.len);
 			else
 				fsmc_read_buf(host, instr->ctx.data.buf.in,
-					      instr->ctx.data.len);
+					      instr->ctx.data.len,
+					      instr->ctx.data.force_8bit);
 			break;
 
 		case NAND_OP_DATA_OUT_INSTR:
@@ -656,7 +658,8 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
 						   instr->ctx.data.len);
 			else
 				fsmc_write_buf(host, instr->ctx.data.buf.out,
-					       instr->ctx.data.len);
+					       instr->ctx.data.len,
+					       instr->ctx.data.force_8bit);
 			break;
 
 		case NAND_OP_WAITRDY_INSTR:
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
