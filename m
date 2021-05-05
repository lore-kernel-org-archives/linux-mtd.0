Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F8DC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:59:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 183D5613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 183D5613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ef5dl2+etpzR/anIuIRgXijGVq4b/KOT+gjyHCrLiN0=; b=kuAZFOCSkVxy9yekRikPVgGa4
	35Uonkj5lf8Azyq64BLX+2H1aa8i3s3XpHtSj3JxPiL5T9GA8r5iiIVIlPVXbKSeTo5l4/Rmj3vKM
	E3VNsyb9Iu1dihZKMY1jilVB4nOx755t4UtiT1E8f/319oe7qbemYcQ4gGeqgCaYIkVhcfdDjpfj2
	NDP7nGPKLx7YGRDiIvIn7MUpmUEMTgvatTF3ysiR7ufHFZRpn99lKSneuFvqD6e9OoVUkdPTdnc5w
	xlvwpgQKBiotDsUQTB8UbKnqniqtv87cfHJ71dfIfJDEdokrED/1fywSnBCmMcNHqiTHQU11BHfpK
	pKm/FYgGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePX9-002RoK-Ty; Wed, 05 May 2021 21:58:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDf-002OoL-7H
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=b33+glwC3I5zoB5klL7krUT13HKW9Z/7LW3kA/4eBtE=; b=BWvrvfUjsaJdZDgR5SH08Dxgn2
 VkMldHV9oWnZ2A4N10kVC2moMqhz4a5RJYyByqY7Euiw6/rENO1lDkRCXT1FWkw3UkRWcCvuQERl8
 T9RHrn+XfN1mlCmxQkq1OAPSy4dNMAfj1G02/1pk33S43uxfOjU3ymI0a2JbKVCrMwKilu99vusR0
 wv770fxt25h1bDDXK+rem58lyNwlU/+O2mp33K8ViAthqH8nUbg5RVcxYkvjmSPIH4BVRdolGGb1F
 +51SFPOPPnp8nKOUJGnzCo5qFhdyUXivU3GaWanKUBkxJp2fnm38Z5aNdsSF9gj2cnQufeEb6eVke
 R6Dyw7NA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDc-005IgG-5c
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:10 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DB0621BF207;
 Wed,  5 May 2021 21:38:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 14/22] mtd: rawnand: Handle the double bytes in NV-DDR mode
Date: Wed,  5 May 2021 23:37:42 +0200
Message-Id: <20210505213750.257417-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143808_509627_8E58E57D 
X-CRM114-Status: GOOD (  20.68  )
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

As explained in chapter "NV-DDR / NV-DDR2 / NV-DDR3 and Repeat Bytes" of
the ONFI specification, with some commands (mainly the commands which do
not transfer actual data) the data bytes are repeated twice and it is
the responsibility of the receiver to discard them properly. The
concerned commands are: SET_FEATURES, READ_ID, GET_FEATURES,
READ_STATUS, READ_STATUS_ENHANCED, ODT_CONFIGURE. Hence, in the NAND
core we are only impacted by the implementation of READ_ID, GET_FEATURES
and READ_STATUS.

The logic is the same for all:
2/ Check if it is relevant to read all data bytes twice.
1/ Allocate a buffer with twice the requested size (may be done
   statically).
2/ Update the instruction structure to read these extra bytes in the
   allocated buffer.
3/ Copy the even bytes into the original buffer. The performance hit is
   negligible on such small data transfers anyway and we don't really
   care about performances at this stage anyway.
4/ Free the allocated buffer, if any.

Note: nand_data_read_op() is also impacted because it is theoretically
possible to run the command/address cycles first, and, as another
operation, do the data transfers. In this case we can easily identify
the impacted commands because the force_8bit flag will be set (due to
the same reason: their data does not go through the same pipeline).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 93 +++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6606882a3e77..9bde1a7c312c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1600,7 +1600,7 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 		   unsigned int len)
 {
 	unsigned int i;
-	u8 *id = buf;
+	u8 *id = buf, *ddrbuf = NULL;
 
 	if (len && !buf)
 		return -EINVAL;
@@ -1615,12 +1615,31 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 			NAND_OP_8BIT_DATA_IN(len, buf, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		int ret;
+
+		/* READ_ID data bytes are received twice in NV-DDR mode */
+		if (len && nand_interface_is_nvddr(conf)) {
+			ddrbuf = kzalloc(len * 2, GFP_KERNEL);
+			if (!ddrbuf)
+				return -ENOMEM;
+
+			instrs[2].ctx.data.len *= 2;
+			instrs[2].ctx.data.buf.in = ddrbuf;
+		}
 
 		/* Drop the DATA_IN instruction if len is set to 0. */
 		if (!len)
 			op.ninstrs--;
 
-		return nand_exec_op(chip, &op);
+		ret = nand_exec_op(chip, &op);
+		if (!ret && len && nand_interface_is_nvddr(conf)) {
+			for (i = 0; i < len; i++)
+				id[i] = ddrbuf[i * 2];
+		}
+
+		kfree(ddrbuf);
+
+		return ret;
 	}
 
 	chip->legacy.cmdfunc(chip, NAND_CMD_READID, addr, -1);
@@ -1648,17 +1667,29 @@ int nand_status_op(struct nand_chip *chip, u8 *status)
 	if (nand_has_exec_op(chip)) {
 		const struct nand_interface_config *conf =
 			nand_get_interface_config(chip);
+		u8 ddrstatus[2];
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_STATUS,
 				    NAND_COMMON_TIMING_NS(conf, tADL_min)),
 			NAND_OP_8BIT_DATA_IN(1, status, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		int ret;
+
+		/* The status data byte will be received twice in NV-DDR mode */
+		if (status && nand_interface_is_nvddr(conf)) {
+			instrs[1].ctx.data.len *= 2;
+			instrs[1].ctx.data.buf.in = ddrstatus;
+		}
 
 		if (!status)
 			op.ninstrs--;
 
-		return nand_exec_op(chip, &op);
+		ret = nand_exec_op(chip, &op);
+		if (!ret && status && nand_interface_is_nvddr(conf))
+			*status = ddrstatus[0];
+
+		return ret;
 	}
 
 	chip->legacy.cmdfunc(chip, NAND_CMD_STATUS, -1, -1);
@@ -1821,7 +1852,7 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
 static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 				void *data)
 {
-	u8 *params = data;
+	u8 *params = data, ddrbuf[ONFI_SUBFEATURE_PARAM_LEN * 2];
 	int i;
 
 	if (nand_has_exec_op(chip)) {
@@ -1837,8 +1868,21 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 					     data, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		int ret;
 
-		return nand_exec_op(chip, &op);
+		/* GET_FEATURE data bytes are received twice in NV-DDR mode */
+		if (nand_interface_is_nvddr(conf)) {
+			instrs[3].ctx.data.len *= 2;
+			instrs[3].ctx.data.buf.in = ddrbuf;
+		}
+
+		ret = nand_exec_op(chip, &op);
+		if (nand_interface_is_nvddr(conf)) {
+			for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; i++)
+				params[i] = ddrbuf[i * 2];
+		}
+
+		return ret;
 	}
 
 	chip->legacy.cmdfunc(chip, NAND_CMD_GET_FEATURES, feature, -1);
@@ -1924,17 +1968,50 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_DATA_IN(len, buf, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		u8 *ddrbuf = NULL;
+		int ret, i;
 
 		instrs[0].ctx.data.force_8bit = force_8bit;
 
-		if (check_only)
-			return nand_check_op(chip, &op);
+		/*
+		 * Parameter payloads (ID, status, features, etc) do not go
+		 * through the same pipeline as regular data, hence the
+		 * force_8bit flag must be set and this also indicates that in
+		 * case NV-DDR timings are being used the data will be received
+		 * twice.
+		 */
+		if (force_8bit && nand_interface_is_nvddr(conf)) {
+			ddrbuf = kzalloc(len * 2, GFP_KERNEL);
+			if (!ddrbuf)
+				return -ENOMEM;
 
-		return nand_exec_op(chip, &op);
+			instrs[0].ctx.data.len *= 2;
+			instrs[0].ctx.data.buf.in = ddrbuf;
+		}
+
+		if (check_only) {
+			ret = nand_check_op(chip, &op);
+			kfree(ddrbuf);
+			return ret;
+		}
+
+		ret = nand_exec_op(chip, &op);
+		if (!ret && force_8bit && nand_interface_is_nvddr(conf)) {
+			u8 *dst = buf;
+
+			for (i = 0; i < len; i++)
+				dst[i] = ddrbuf[i * 2];
+		}
+
+		kfree(ddrbuf);
+
+		return ret;
 	}
 
 	if (check_only)
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
