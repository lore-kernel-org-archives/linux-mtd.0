Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64016C4724C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E31720731
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KZvu/aQT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E31720731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb+7vmIOWVeYS0KdqMJYx3uK6qb5GFFoZebRislO+bk=; b=KZvu/aQTlAsGE6
	9T/ZZyWDbEQ8mH2N1Pf+j0bpyN0rvUJHBL8/oXokLnWsTtdRrumOj8CBzZMY1IDLfS920hp6FEg0W
	Rc+Biy+QBRj0Z9RQx2q6Rcu6FphB5a39byPndXueh420M0R0ocJ+/pP3W2lRoKD4r2P+BPqeW9njz
	PSCBZgeKjfEcNOWlJYygY/ScKXn7bFyoODH2OOmXJWuC7TxwT0rgxd2dgLB4rW30mbMH5v1fPc1xC
	Jae4qXG5c3oGD+1PUjA1UA3WhOlVlEIUjy9ILCsQz5EWZN1ngFJusobiEePNz3PN0lGamdoueK8LR
	HoRrJyJEuq+T4kSS9xsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jURee-000282-Nm; Fri, 01 May 2020 09:08:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jURdO-00019F-P2; Fri, 01 May 2020 09:07:05 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7286F2A2D50;
 Fri,  1 May 2020 10:07:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: rawnand: cs553x: Implement exec_op()
Date: Fri,  1 May 2020 11:06:49 +0200
Message-Id: <20200501090650.1138200-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200501090650.1138200-1-boris.brezillon@collabora.com>
References: <20200501090650.1138200-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_020703_069083_EF9599FA 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-geode@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Andres Salomon <dilinger@queued.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

So we can later get rid of the legacy hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 126 ++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 84cf87f02bd3..3596edc6b777 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -21,9 +21,9 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
+#include <linux/iopoll.h>
 
 #include <asm/msr.h>
-#include <asm/io.h>
 
 #define NR_CS553X_CONTROLLERS	4
 
@@ -165,6 +165,125 @@ static int cs553x_device_ready(struct nand_chip *this)
 	return (foo & CS_NAND_STS_FLASH_RDY) && !(foo & CS_NAND_CTLR_BUSY);
 }
 
+static int cs553x_write_ctrl_byte(struct cs553x_nand_controller *cs553x,
+				  u32 ctl, u8 data)
+{
+	u8 status;
+	int ret;
+
+	writeb(ctl, cs553x->mmio + MM_NAND_CTL);
+	writeb(data, cs553x->mmio + MM_NAND_IO);
+	ret = readb_poll_timeout_atomic(cs553x->mmio + MM_NAND_STS, status,
+					!(status & CS_NAND_CTLR_BUSY), 1,
+					100000);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void cs553x_data_in(struct cs553x_nand_controller *cs553x, void *buf,
+			   unsigned int len)
+{
+	writeb(0, cs553x->mmio + MM_NAND_CTL);
+	while (unlikely(len > 0x800)) {
+		memcpy_fromio(buf, cs553x->mmio, 0x800);
+		buf += 0x800;
+		len -= 0x800;
+	}
+	memcpy_fromio(buf, cs553x->mmio, len);
+}
+
+static void cs553x_data_out(struct cs553x_nand_controller *cs553x,
+			    const void *buf, unsigned int len)
+{
+	writeb(0, cs553x->mmio + MM_NAND_CTL);
+	while (unlikely(len > 0x800)) {
+		memcpy_toio(cs553x->mmio, buf, 0x800);
+		buf += 0x800;
+		len -= 0x800;
+	}
+	memcpy_toio(cs553x->mmio, buf, len);
+}
+
+static int cs553x_wait_ready(struct cs553x_nand_controller *cs553x,
+			     unsigned int timeout_ms)
+{
+	u8 mask = CS_NAND_CTLR_BUSY | CS_NAND_STS_FLASH_RDY;
+	u8 status;
+
+	return readb_poll_timeout(cs553x->mmio + MM_NAND_STS, status,
+				  (status & mask) == CS_NAND_STS_FLASH_RDY, 100,
+				  timeout_ms * 1000);
+}
+
+static int cs553x_exec_instr(struct cs553x_nand_controller *cs553x,
+			     const struct nand_op_instr *instr)
+{
+	unsigned int i;
+	int ret = 0;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		ret = cs553x_write_ctrl_byte(cs553x, CS_NAND_CTL_CLE,
+					     instr->ctx.cmd.opcode);
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			ret = cs553x_write_ctrl_byte(cs553x, CS_NAND_CTL_ALE,
+						     instr->ctx.addr.addrs[i]);
+			if (ret)
+				break;
+		}
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		cs553x_data_in(cs553x, instr->ctx.data.buf.in,
+			       instr->ctx.data.len);
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		cs553x_data_out(cs553x, instr->ctx.data.buf.out,
+				instr->ctx.data.len);
+		break;
+
+	case NAND_OP_WAITRDY_INSTR:
+		ret = cs553x_wait_ready(cs553x, instr->ctx.waitrdy.timeout_ms);
+		break;
+	}
+
+	if (instr->delay_ns)
+		ndelay(instr->delay_ns);
+
+	return ret;
+}
+
+static int cs553x_exec_op(struct nand_chip *this,
+			  const struct nand_operation *op,
+			  bool check_only)
+{
+	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
+	unsigned int i;
+	int ret;
+
+	if (check_only)
+		return true;
+
+	/* De-assert the CE pin */
+	writeb(0, cs553x->mmio + MM_NAND_CTL);
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = cs553x_exec_instr(cs553x, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+
+	/* Re-assert the CE pin. */
+	writeb(CS_NAND_CTL_CE, cs553x->mmio + MM_NAND_CTL);
+
+	return ret;
+}
+
 static void cs_enable_hwecc(struct nand_chip *this, int mode)
 {
 	struct cs553x_nand_controller *cs553x = to_cs553x(this->controller);
@@ -188,6 +307,10 @@ static int cs_calculate_ecc(struct nand_chip *this, const u_char *dat,
 
 static struct cs553x_nand_controller *controllers[4];
 
+static const struct nand_controller_ops cs553x_nand_controller_ops = {
+	.exec_op = cs553x_exec_op,
+};
+
 static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 {
 	struct cs553x_nand_controller *controller;
@@ -212,6 +335,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 
 	this = &controller->chip;
 	nand_controller_init(&controller->base);
+	controller->base.ops = &cs553x_nand_controller_ops;
 	this->controller = &controller->base;
 	new_mtd = nand_to_mtd(this);
 
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
