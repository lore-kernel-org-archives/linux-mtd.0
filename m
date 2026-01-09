Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA65D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egtxCC8d8OX2oxtnnQDXsJmEwkmU5rqn7BCLrLTGL5I=; b=OGvfoKqdghOXzC
	FHpBuOdlBzYm0EHUGvG5iCydSTGPCug42Ahms328/luO1DxGg1RkD+uzDqFG3zLmQXj4DnEhMuka8
	wq+UWIRcH6wKKgxxNxE08MAOhm2ii+UBfmP8Y4ULwrMQjabmy8RhSqIt4091eA76GuhzMz+6ACmtV
	mdApORyN3UrWsk09a5a5l9LVS6etTXStxSfgkfnbClwdlvJ6qHm6d0Sot8UVnqlKZsfNbUOfaK4XK
	Qg6ZyzdiqXHWG1BVozbPOjy9bKsKMtOHRVlPMOZIm06yFs3F9RdllLCRrMHo8+I4N31irL2ELb8Hf
	jFOOkLHqn/6mySKMqWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEh-00000002oGt-3KcX;
	Fri, 09 Jan 2026 17:25:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEe-00000002oCO-3FPX
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:25:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C5C6C1F6E6;
	Fri,  9 Jan 2026 17:18:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D43AD606C6;
	Fri,  9 Jan 2026 17:18:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE173103C8956;
	Fri,  9 Jan 2026 18:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XWoEYvW6UTkurEFnLt3TZWYNsLRXIKXbu8O7GL39Atk=;
	b=m1OjgYCJbE2Pt2/lIyPBAsS4bjN0OHbj4JHexQn2QnPGFzjTwVJtplLDPTv7YhDgvoVlQY
	ACYBqHLhHZSEP5nwVZ5Qm+6jQMYr1otMoKeHa2Jm/gFsxfa7kLfl5i/NfWasWI8TPKp38v
	YM7FvLRH27QVf7MSbifvh8f9qCkh0fAbk3uPrVG0CKXtLzyPTZz4tw/KW4nV7xbbirB1SM
	1CDstgICLGMiluRNIZ6bJBe9wJLyRyjMw4y4nuRMjCmzd4VXuz94fSm4hD+9FCqiuYQtbt
	0XUT3ZPDpSObp/P80TkoRXJyaITrZH9JWHFTY0biXxT/4vQyljqda+Hdk3/XKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:22 +0100
Subject: [PATCH v2 24/27] mtd: spinand: Give the bus interface to the
 configuration helper
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-24-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092517_104668_366C2ABF 
X-CRM114-Status: GOOD (  16.78  )
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

The chip configuration hook is the one responsible to actually switch
the switch between bus interfaces. It is natural to give it the bus
interface we expect with a new parameter. For now the only value we can
give is SSDR, but this is subject to change in the future, so add a bit
of extra logic in the implementations of this callback to make sure
both the core and the chip driver are aligned on the request.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c    |  2 +-
 drivers/mtd/nand/spi/winbond.c | 28 +++++++++++++++++++++-------
 include/linux/mtd/spinand.h    |  6 ++++--
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 019594182c60..1ac1d0181a91 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1606,7 +1606,7 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 		return ret;
 
 	if (spinand->configure_chip) {
-		ret = spinand->configure_chip(spinand);
+		ret = spinand->configure_chip(spinand, SSDR);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1d79a8ae7920..419f4303a0dc 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -311,13 +311,17 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static int w25n0xjw_hs_cfg(struct spinand_device *spinand)
+static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
+			   enum spinand_bus_interface iface)
 {
 	const struct spi_mem_op *op;
 	bool hs;
 	u8 sr4;
 	int ret;
 
+	if (iface != SSDR)
+		return -EOPNOTSUPP;
+
 	op = spinand->op_templates->read_cache;
 	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
 		hs = false;
@@ -371,17 +375,25 @@ static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)
 	return 0;
 }
 
-static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
+static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
+			    enum spinand_bus_interface iface)
 {
-	const struct spi_mem_op *op;
+	const struct spi_mem_op *ref_op;
 	unsigned int dummy_cycles;
 	bool dtr, single;
 	u8 io_mode;
 	int ret;
 
-	op = spinand->op_templates->read_cache;
+	switch (iface) {
+	case SSDR:
+		ref_op = spinand->ssdr_op_templates.read_cache;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	};
 
-	dummy_cycles = ((op->dummy.nbytes * 8) / op->dummy.buswidth) / (op->dummy.dtr ? 2 : 1);
+	dummy_cycles = ((ref_op->dummy.nbytes * 8) / ref_op->dummy.buswidth) /
+		(ref_op->dummy.dtr ? 2 : 1);
 	switch (dummy_cycles) {
 	case 8:
 	case 12:
@@ -398,8 +410,10 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
-	single = (op->cmd.buswidth == 1 && op->addr.buswidth == 1 && op->data.buswidth == 1);
-	dtr = (op->cmd.dtr && op->addr.dtr && op->data.dtr);
+	single = (ref_op->cmd.buswidth == 1 &&
+		  ref_op->addr.buswidth == 1 &&
+		  ref_op->data.buswidth == 1);
+	dtr = (ref_op->cmd.dtr && ref_op->addr.dtr && ref_op->data.dtr);
 	if (single && !dtr)
 		io_mode = W35N01JW_VCR_IO_MODE_SINGLE_SDR;
 	else if (!single && !dtr)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 027923841bba..b7eb3eceb138 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -529,7 +529,8 @@ struct spinand_info {
 	const struct spinand_op_variants *vendor_ops;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
-	int (*configure_chip)(struct spinand_device *spinand);
+	int (*configure_chip)(struct spinand_device *spinand,
+			      enum spinand_bus_interface iface);
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
 	struct spinand_fact_otp fact_otp;
@@ -704,7 +705,8 @@ struct spinand_device {
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 
-	int (*configure_chip)(struct spinand_device *spinand);
+	int (*configure_chip)(struct spinand_device *spinand,
+			      enum spinand_bus_interface iface);
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
