Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD31C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=05n38GQl/6vyyr/YOa0/bsaMqv+afDfc+MeiBK3MKqg=; b=Jj8TaYveeLGzdG
	I79k0wPbMzRZ4qSHz+xwi4DJn0IPjmXDWk4yuE710FnzwzGfeBgjYPMHSPCazpOOb1s1Mr/5dIKzA
	eyHQ/MSoyBFn8/8bKHVbnSDLZzofPCrovBGN8Lmi/hl7eAdTC55/WF258UPOZdywOEvy9u7VrzYlu
	IkgzMm15ecWkYEr0tNMl+egjO7WjHQ2fS8fwD8KaKMYV3gXdvGft5jf0weWeAQxrUkx2jPaT/MNQB
	ldE6eOMD7Xk8GkeLX47r2Ces0ZCu2dg4mF+KMoSVPw6E9AbV2v3WWLM4NnVZzrFUjSv6+ZIxeyKw1
	eiU6q6RWQAEb+Sd8wsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5NrK-00GyFY-1T; Thu, 06 Jan 2022 08:10:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5NrG-00GyDt-I1
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 08:10:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id h1so1973743pls.11
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 00:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=zfeGovTDvd51bnK3uaST+KcnIFCf9TyLQm16m2/g9uQ=;
 b=U/86GXi+uhsyy5ekzRtEp8lZJcntxNKUFCKDQi2noFKWRzrvun8ZASpuy2Ah9MN09b
 e9V47Dvtu6NMtntdcujVY0B0PAZ0tgsKLS/U4rU2My+yXhT2G+qYpdbbY13lkmtsowhE
 zSlZUU+BWAyHdzzqhKzOyz+LiH+ctCYP9DPQooAfl3dlk3GMScR27fWnjAePQspRnfmD
 JCMaWUK1qZlGXcCvH6Ix//rMiTthgA359zDs74tHZyjWUt4f0BF/EkK7FH8fBxcGGZPl
 no871HEB1/vnCclj9+pqRS3gOlmiWzvF4RH4pX3p1DXdUtJuwUblfdLTfYmpAtMKPwTt
 sKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zfeGovTDvd51bnK3uaST+KcnIFCf9TyLQm16m2/g9uQ=;
 b=5Xqlx4uqTOHTHe6Qu4nWOLfE8L6x0m0kg6O7Tiqc4P0ZTHerDQug63gnaeRLuD+ZhK
 bbSF93/1/ubYbnWhJTgOrnZn5aV/BLWxZnGtMZgLZPtTuaoVelOaSR50KrgZQkuWwxsm
 C7E8Cz4VdRfFau0vuLH98h0WqpjpEmqIkWEOGLSWfHCNe6lFdahUZ3GydRFr3bieN4l+
 bvEsOUq1OT13gGBmDifbosSXSKk3VvTzTW6Q1iYOLtDPb0aJzrs7YwDlxO5+NFTaAxUc
 BQ9tWdb2jlB88DsMMgz0IGpSYPNLorg8C6c98wzfNhxYO1VPwKx3ltPbeGO2CuuPy0Qw
 uFCw==
X-Gm-Message-State: AOAM530oLaLr3lOM6YpyoIdAA9FqmoHeGwOZad01ldlftaq8B7VI01f2
 Me/c5H/YO6LAtadsJFQSQm28ReJHzw0=
X-Google-Smtp-Source: ABdhPJwwW9gtEzoJhUwhwVq7Y9PXThk0EXgZKxrvDsjDiXGS2r08nmr7iIeIHU5Pq6MnBdOs7Ioi4A==
X-Received: by 2002:a17:90a:ac0f:: with SMTP id
 o15mr3280187pjq.145.1641456648925; 
 Thu, 06 Jan 2022 00:10:48 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id f22sm1504937pfc.183.2022.01.06.00.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 00:10:48 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw,
 JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH] mtd: rawnand: cache read suquential
Date: Thu,  6 Jan 2022 16:10:43 +0800
Message-Id: <20220106081043.17275-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_001050_641198_7A0C07F7 
X-CRM114-Status: GOOD (  22.59  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For reducing time of read sequence which address are continuous.
Adding cache read suquential features in raw nand existing architecture.
Creating nand_exec_continue_read_page_op function for read command extend.
Adding command select in nand_lp_exec_read_page_op and taking readlen to
judge the last page for read.
Command of read cache sequential can be separate 3 parts.
First part is 00-30-31, it means read cache sequential enabled and next
page data can be prepare while cache data reading.
Second part is 31-3F, means flash will prepare next page data for reducing
time cost.
Last part is 3F, means the last cache read and flash don't need to prepare
next page data.

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 95 ++++++++++++++++++++++++++++++--
 include/linux/mtd/rawnand.h      |  5 ++
 2 files changed, 95 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..ddaba40b58a7 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1176,6 +1176,39 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 	const struct nand_interface_config *conf =
 		nand_get_interface_config(chip);
 	u8 addrs[5];
+
+	/* Command sequence select to 00-30-31 when read cache sequential is enabled */
+	if (chip->ops.conti_read_require) {
+		struct nand_op_instr instrs[] = {
+			NAND_OP_CMD(NAND_CMD_READ0, 0),
+			NAND_OP_ADDR(4, addrs, 0),
+			NAND_OP_CMD(NAND_CMD_READSTART, NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max), 0),
+			NAND_OP_CMD(NAND_CMD_READCONTI, NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max),
+					 NAND_COMMON_TIMING_NS(conf, tRR_min)),
+			NAND_OP_DATA_IN(len, buf, 0),
+		};
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		int ret;
+
+		if (!len)
+			op.ninstrs--;
+
+		ret = nand_fill_column_cycles(chip, addrs, offset_in_page);
+		if (ret < 0)
+			return ret;
+
+		addrs[2] = page;
+		addrs[3] = page >> 8;
+
+		if (chip->options & NAND_ROW_ADDR_3) {
+			addrs[4] = page >> 16;
+			instrs[1].ctx.addr.naddrs++;
+		}
+
+		return nand_exec_op(chip, &op);
+	}
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
 		NAND_OP_ADDR(4, addrs, 0),
@@ -1206,6 +1239,31 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 	return nand_exec_op(chip, &op);
 }
 
+static int nand_exec_continue_read_page_op(struct nand_chip *chip,
+					    void *buf, unsigned int len)
+{
+	bool conti_read_last = false;
+	const struct nand_interface_config *conf =
+		nand_get_interface_config(chip);
+	/* Set conti_read_last true before the last aligned page reading */
+	if (chip->ops.conti_readlen >= len && chip->ops.conti_readlen < 2*len)
+		conti_read_last = true;
+	struct nand_op_instr instrs[] = {
+		NAND_OP_CMD(conti_read_last?NAND_CMD_READLAST:NAND_CMD_READCONTI,
+					    NAND_COMMON_TIMING_NS(conf, tWB_max)),
+		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max),
+				 NAND_COMMON_TIMING_NS(conf, tRR_min)),
+		NAND_OP_DATA_IN(len, buf, 0),
+	};
+	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+
+	/* Drop the DATA_IN instruction if len is set to 0. */
+	if (!len)
+		op.ninstrs--;
+
+	return nand_exec_op(chip, &op);
+}
+
 /**
  * nand_read_page_op - Do a READ PAGE operation
  * @chip: The NAND chip
@@ -1231,10 +1289,15 @@ int nand_read_page_op(struct nand_chip *chip, unsigned int page,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-		if (mtd->writesize > 512)
-			return nand_lp_exec_read_page_op(chip, page,
-							 offset_in_page, buf,
-							 len);
+		if (mtd->writesize > 512) {
+			/* Selecting read command sequence  */
+			if (!chip->ops.conti_read_first_page && chip->ops.conti_read_require)
+				return nand_exec_continue_read_page_op(chip, buf, mtd->writesize);
+			else
+				return nand_lp_exec_read_page_op(chip, page,
+								 offset_in_page, buf,
+								 len);
+		}
 
 		return nand_sp_exec_read_page_op(chip, page, offset_in_page,
 						 buf, len);
@@ -3362,7 +3425,6 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
-
 		if (!aligned)
 			use_bounce_buf = 1;
 		else if (chip->options & NAND_USES_DMA)
@@ -3381,6 +3443,25 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 						 __func__, buf);
 
 read_retry:
+			/*
+			 * Read cache sequential command can be separate 3 parts.
+			 * For distinguishing that flash driver set value to
+			 * conti_read_first_page for checking whether the first page
+			 * and set conti_read_require to select command sequence.
+			 * And take readlen to conti_readlen for checking whether the
+			 * last page or not.
+			 */
+			if (!col && readlen >= (2*mtd->writesize)) {
+				if (chip->ops.conti_read_require == 0)
+					chip->ops.conti_read_first_page = 1;
+				else
+					chip->ops.conti_read_first_page = 0;
+				chip->ops.conti_read_require = 1;
+				chip->ops.conti_readlen = readlen;
+			} else if (chip->ops.conti_read_require) {
+				chip->ops.conti_read_first_page = 0;
+				chip->ops.conti_readlen = readlen;
+			}
 			/*
 			 * Now read the page into the buffer.  Absent an error,
 			 * the read methods return max bitflips per ecc step.
@@ -3468,6 +3549,10 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			retry_mode = 0;
 		}
 
+		/* set conti_read_require 0 when finish the last aligned page read */
+		if (readlen < mtd->writesize)
+			chip->ops.conti_read_require = 0;
+
 		if (!readlen)
 			break;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b2f9dd3cbd69..a5dccccdf65e 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -67,6 +67,8 @@ struct gpio_desc;
 
 /* Extended commands for large page devices */
 #define NAND_CMD_READSTART	0x30
+#define NAND_CMD_READCONTI     0x31
+#define NAND_CMD_READLAST      0x3f
 #define NAND_CMD_RNDOUTSTART	0xE0
 #define NAND_CMD_CACHEDPROG	0x15
 
@@ -1173,6 +1175,9 @@ struct nand_chip_ops {
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
 	int (*choose_interface_config)(struct nand_chip *chip,
 				       struct nand_interface_config *iface);
+	bool conti_read_require;
+	bool conti_read_first_page;
+	int conti_readlen;
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
