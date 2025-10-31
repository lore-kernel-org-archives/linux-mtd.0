Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBED4CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/KbaQUDyAwbCQpL5af0vQaLwFIhaAvdNPKIBffLjCg=; b=upXin/aPED8rsV
	YZvvNQWOF39Iu4yIwRNdjL2uK6itW1l9F1bok7jDISoEMPg0el9Nw2L5mM+3JMC+RV2alBpBlOHI6
	98aCiB6RymBGXloFocRxdx7BFy3CEFLBVf921IQ59aTf3VET2k5AKguXoOPZvB0MOy/03lh1BbFnh
	UYYnjKsrQG+ggxQpeLQHLhy2vMhc+q8QoCOuaGqqTdpximc+mxkPKsEzoBoHjMq/3A7C2juR4Do6C
	ht/ZxcqYhIWY1eXRpoDC6t8gtRPYiVZ62CT7D0iQUMOX8hJP5YXLN39ZNLIT9zyXFcb6jemaDPWov
	6ieCYuj+TCI6bKZ/n7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswc-00000006Vql-4AX2;
	Fri, 31 Oct 2025 17:29:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvh-00000006UhV-44gQ
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Oct 2025 17:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1AlxpEmOzkdHU55IN1x55ULPTzeTpk4t+gKIBhPki5c=; b=I8505FkpAfVDi5tdAR2G3qiHel
	f+/x4p2ykfZ9HcxBhaLMfxazczgmxNYKO6JRto676VlS73bc6DcbHV2mWnsbEdO8cLxpKgthPH4qy
	HKrIWJjjHpqGjPVYNp0CdWTce14wnk+wy3UXsJlfA/PYCnc37ulGsK/5mrR11SpCQ78cnsrGNaOhi
	vGb/Gsqvcvd/prMowRg8pGRinU6YJ8NMrStm1jkKMyfrxDfoGg/LUtcsxb8UUvyRcAI56GA95GANn
	O9s45oWWQrzf2b4Rle+BRB7cQJuwzb1JKvKfCkieRxbxRUmowxHzkhqNCx7Uknn3f6UNRw/UjjhSX
	pZ0HlHsw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs3u-0000000Bkg4-2XvN
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 16:33:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F50DC0E959;
	Fri, 31 Oct 2025 17:28:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4A4F60704;
	Fri, 31 Oct 2025 17:28:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6478411818007;
	Fri, 31 Oct 2025 18:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1AlxpEmOzkdHU55IN1x55ULPTzeTpk4t+gKIBhPki5c=;
	b=vJNmRXNz3oDvVJ1FnQQieTAov+RBMej4MMh2r2w4tS3K/b6clMI6/YalgI8CUvhCt0DB3B
	GXopmiFUpwXfQ6se8A3WdbUVSPTnqqXPSZC+2ETRwiBpmBQgmNuFduM/9nHY5AlnTUW1SY
	2hjjC24hDbfYF6LZzmoBfr4wA7Rd2uVszF4M8lyGh0s9gVzD1tP3geXxETHMa0JfKr/cI2
	QLvZakIoEUvKAbER94qALH59ikc5fR6UP7OI1ThE5S9G9yWveGwmL0kWFA0UR922jkSuOn
	S8inmMdlfEHkvC8OM3yDZQodIXvY3XFfuGwjpl2SwJVVoiv5JmsUkPMaBLvqaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:09 +0100
Subject: [PATCH 25/28] mtd: spinand: Give the bus interface to the
 configuration helper
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-25-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_163314_810137_FE56C341 
X-CRM114-Status: GOOD (  16.30  )
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
index 0d98cc1d987e1f6387f6bb243cd3720949b01b0b..044a84d7b47bf08a14f2310b971cdc85267b0fd2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1521,7 +1521,7 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 		return ret;
 
 	if (spinand->configure_chip) {
-		ret = spinand->configure_chip(spinand);
+		ret = spinand->configure_chip(spinand, SSDR);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1d79a8ae79206af7d823018c4603b3bd36a0dd88..419f4303a0dc7518017e2bd422584813dca14d48 100644
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
index 7d059956c81a3a6fd337bab43fb4f1130997ab0f..94348344208861c9e1ca36bd86e206225cbbd816 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -528,7 +528,8 @@ struct spinand_info {
 	const struct spinand_op_variants *vendor_ops;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
-	int (*configure_chip)(struct spinand_device *spinand);
+	int (*configure_chip)(struct spinand_device *spinand,
+			      enum spinand_bus_interface iface);
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
 	struct spinand_fact_otp fact_otp;
@@ -703,7 +704,8 @@ struct spinand_device {
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 
-	int (*configure_chip)(struct spinand_device *spinand);
+	int (*configure_chip)(struct spinand_device *spinand,
+			      enum spinand_bus_interface iface);
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
