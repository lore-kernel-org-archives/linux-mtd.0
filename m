Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37DDC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:21:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76910606A5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76910606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5h1x55et8eTeZslf5cHhZBrhitAr8V5QmIjuTBn++vc=; b=WdxWfHxLrSn6ncv1WTyLAWWBv
	bwR2KF2dE5hIEFEPnZBiizSegeqaEnqe0prs9fJ6D+cqD7p5oOiudEPYmuvOzd2Jsd7IBaNCY0hHy
	R+r0cl3mf189A6xmapZ+8/DGDp8dcyqh5kO7s1kJi5tPIu5t5HBrfuGcFNutY0v13dXipopWWNFEe
	+C6OUnuVGzbnAnAKQ3sIxNzwtnRqF0yn8PySdo47s00sYxtcrvlW4wDDHU6F2GsQWgSAKIvvcD/Sx
	LuEL+1p6cXnZ3E/BVnp1kFykYAu7LANIoMiyc6J/c1vkfJoY8gya9dyacC/f0Hpdt1mwF0NW5JfMU
	xeGvsBuTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePsE-002Th4-Dr; Wed, 05 May 2021 22:20:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDm-002OpL-2X
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=VIZfzQNgSFOdebYqe5EgVDjOY0A+93iwvM/7DHpJNxo=; b=fDaO/aMaq1yHJlpAGtkJbK+VbE
 vAfOjXTp+iwn/CI6hZVWA8ac1uD1tz5iIeLUk0acwEu6xIARPBgfWbxeI32PcBcSEB5chgR88CWX4
 x1NPE9YySiOTv4ah3q8/J+TTurWRBdhOdcm4jvXWs591gjWXaqvqDq6VOd9uYyxpmt7FofLbR8/sp
 BSShBqKRnjuMgTdHlVRCRhsv8jiZt9OaP/7EKK8yW3ogbVUUGXCLaoQd4Z5aPZa6KfEuaxljgalRk
 Foa5JdwT7ELaQwlcJpinN1YU8iBSqf43q0T2xBCDCGFw1B4F+QLFVob9nBXpdo3UNkkN1P2E5kBYg
 HbU6O9rA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDj-005Ii0-8j
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:16 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 188A51BF20D;
 Wed,  5 May 2021 21:38:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 21/22] mtd: rawnand: arasan: Workaround a misbehaving prog
 type with NV-DDR
Date: Wed,  5 May 2021 23:37:49 +0200
Message-Id: <20210505213750.257417-22-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143815_603504_42B069D6 
X-CRM114-Status: GOOD (  17.81  )
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

As explained in the comment introduced above the fix, the Arasan
controller driver starts an operation when the prog register is being
written with a "type" specific to the action to perform.

The prog type used until now to perform a CHANGE READ COLUMN with an SDR
interface was the PAGE READ type (CMD + ADDR + CMD +
DATA). Unfortunately, for an unknown reason (let's call this a silicon
bug) any CHANGE READ COLUMN performed this way in NV-DDR mode will fail:
the data ready flag will never be triggered, nor will be the transfer
complete flag. Forcefully, this leads to a timeout situation which is
not easy to handle.

Fortunately, it was spotted that sending the same commands through a
different prog register "type", CHANGE READ COLUMN ENHANCED, would work
all the time (even though this particular command is not supported by
the core and is only available in a limited set of devices - we only
care about the controller configuration and not the actual command which
is sent to the device). So let's use this type instead when a CHANGE
READ COLUMN is requested.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index d5fab3cbaa54..307300eeb9cb 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -53,6 +53,7 @@
 #define   PROG_RST			BIT(8)
 #define   PROG_GET_FEATURE		BIT(9)
 #define   PROG_SET_FEATURE		BIT(10)
+#define   PROG_CHG_RD_COL_ENH		BIT(14)
 
 #define INTR_STS_EN_REG			0x14
 #define INTR_SIG_EN_REG			0x18
@@ -622,7 +623,23 @@ static int anfc_param_read_type_exec(struct nand_chip *chip,
 static int anfc_data_read_type_exec(struct nand_chip *chip,
 				    const struct nand_subop *subop)
 {
-	return anfc_misc_data_type_exec(chip, subop, PROG_PGRD);
+	u32 prog_reg = PROG_PGRD;
+
+	/*
+	 * Experience shows that while in SDR mode sending a CHANGE READ COLUMN
+	 * command through the READ PAGE "type" always works fine, when in
+	 * NV-DDR mode the same command simply fails. However, it was also
+	 * spotted that any CHANGE READ COLUMN command sent through the CHANGE
+	 * READ COLUMN ENHANCED "type" would correctly work in both cases (SDR
+	 * and NV-DDR). So, for simplicity, let's program the controller with
+	 * the CHANGE READ COLUMN ENHANCED "type" whenever we are requested to
+	 * perform a CHANGE READ COLUMN operation.
+	 */
+	if (subop->instrs[0].ctx.cmd.opcode == NAND_CMD_RNDOUT &&
+	    subop->instrs[2].ctx.cmd.opcode == NAND_CMD_RNDOUTSTART)
+		prog_reg = PROG_CHG_RD_COL_ENH;
+
+	return anfc_misc_data_type_exec(chip, subop, prog_reg);
 }
 
 static int anfc_param_write_type_exec(struct nand_chip *chip,
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
