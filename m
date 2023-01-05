Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD3C3DA7A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 20:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zWRyTZWsGnWRsXU3GC379yFozLK7VEse+hWIUnmA7c=; b=NXXrtbLWYxJQRI
	OXUbofFKvA5uNOAV36K4abXUkVSwFlkxWCbjMmMLKLKGDFBGAe+DreS3dmgT7qhU6ArgVRjthdSgR
	dYOlq4wO1HaQ7qdRbEPG6WZSL5KPPBcFsZa5uanLGKWNFAbncHhRgPV+dZE+Ucu1+og8xLPKRh0XB
	gufOWmOsvmj3qEAgb+VCbOQZ6zpjx4uevPybn3VLzh47tQhrVsIPt6W8XwPfx/lQiCAwH2RpgZSGG
	yPFITKRq0VbPQpjlANzMRXKlkp6S511f6keDkz/exCmgNjbx9bz0xdPXQeOadx+BMTzGrcSKZ+A1S
	RLX//d1IcsoxY8Qt0LmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXKu-00EqDS-FZ; Thu, 05 Jan 2023 20:59:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUlV-00DRCL-12
	for linux-mtd@bombadil.infradead.org; Thu, 05 Jan 2023 18:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JUtHAZlTAXf3epTGIEvMxUu7mLVaK88rIyWbfK2aaSA=; b=ilA3Ve0N4YG+itSV8qLz5kM5BN
	h+vmQ8PQ16bbGWkNnfRFJ4NzmFanWZR9o6qKQciiWLiRvCvJNxIarvTw0BdV037JEhosY/2I0xJTb
	RoAs23dkEsFez6+o02MshC+44w55181WTfkZ3u+8DxEyD+rrQ1oWX1w18yURRcc7Pn/mOzY8+HcWo
	kSMm4jxeAf8mcltyIaAItNkRSa0snFD7iZpEAQ65qzqxPf0EYokWKnQf9W/qRZwfE46amPPE2HaWM
	RGbPZaxtnly2dX1k/RyxsVtNsRVYkvKX03Aps9YyJPcn8lmMqTQ4M0px0XcD+25XlhtuvYQY/F6aa
	vBiXB0bQ==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTea-001VL2-0x
	for linux-mtd@lists.infradead.org;
	Thu, 05 Jan 2023 17:03:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 848B340010;
	Thu,  5 Jan 2023 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672938218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JUtHAZlTAXf3epTGIEvMxUu7mLVaK88rIyWbfK2aaSA=;
	b=U2xfiGda7q/GGnoFc/HYkO+uLWFWfA1fkHHi2gYBj0gzD93PmzP1VHwQTDDI4fjycVmGTI
	FwbF9ISciNPE0PKmCerolJlK322AkB+3f7+OqXm2Bo//pD5nEFUZshcOcLIoqeoNWUS5RJ
	F7PS4AfqUINgrFzERJ05Q+cAWVcWdyq9dVphOnvTUCThwuv+kIERw68K2qcw2YyG3/mLeJ
	QH50o23GZ9y/CAvMrMvxC11YhA4kxrDV2FhukdGAVc3ZGeT8xEH5iy6ul1TyVrDodsG+kl
	NQTjbKXpex7pC4j9cK2d8vaFqjIgwP8hQmRZSF+8oFMDDFavMOP+k3X14GnFEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/3] mtd: rawnand: Check the data only read pattern only once
Date: Thu,  5 Jan 2023 18:03:31 +0100
Message-Id: <20230105170333.586044-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105170333.586044-1-miquel.raynal@bootlin.com>
References: <20230105170333.586044-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170344_661998_EF2BB57B 
X-CRM114-Status: GOOD (  19.23  )
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

Instead of checking if a pattern is supported each time we need it,
let's create a bitfield that only the core would be allowed to fill at
startup time. The core and the individual drivers may then use it in
order to check what operation they should use. This bitfield is supposed
to grow over time.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c  | 20 ++++++++++++++++++++
 drivers/mtd/nand/raw/nand_jedec.c |  3 +--
 drivers/mtd/nand/raw/nand_onfi.c  |  3 +--
 include/linux/mtd/rawnand.h       |  8 ++++++++
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 33f2c98a030e..83bfb1ba2fa3 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4991,6 +4991,24 @@ nand_manufacturer_name(const struct nand_manufacturer_desc *manufacturer_desc)
 	return manufacturer_desc ? manufacturer_desc->name : "Unknown";
 }
 
+static void rawnand_check_data_only_read_support(struct nand_chip *chip)
+{
+	/* Use an arbitrary size for the check */
+	if (!nand_read_data_op(chip, NULL, SZ_512, true, true))
+		chip->controller->supported_op.data_only_read = 1;
+}
+
+static void rawnand_early_check_supported_ops(struct nand_chip *chip)
+{
+	/* The supported_op fields should not be set by individual drivers */
+	WARN_ON_ONCE(chip->controller->supported_op.data_only_read);
+
+	if (!nand_has_exec_op(chip))
+		return;
+
+	rawnand_check_data_only_read_support(chip);
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
@@ -5023,6 +5041,8 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	/* Select the device */
 	nand_select_target(chip, 0);
 
+	rawnand_early_check_supported_ops(chip);
+
 	/* Send the command for reading device ID */
 	ret = nand_readid_op(chip, 0, id_data, 2);
 	if (ret)
diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 85b6d9372d80..836757717660 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -46,8 +46,7 @@ int nand_jedec_detect(struct nand_chip *chip)
 	if (!p)
 		return -ENOMEM;
 
-	if (!nand_has_exec_op(chip) ||
-	    !nand_read_data_op(chip, p, sizeof(*p), true, true))
+	if (!nand_has_exec_op(chip) || chip->controller->supported_op.data_only_read)
 		use_datain = true;
 
 	for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 7586befce7f9..f15ef90aec8c 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -166,8 +166,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 	if (!pbuf)
 		return -ENOMEM;
 
-	if (!nand_has_exec_op(chip) ||
-	    !nand_read_data_op(chip, &pbuf[0], sizeof(*pbuf), true, true))
+	if (!nand_has_exec_op(chip) || chip->controller->supported_op.data_only_read)
 		use_datain = true;
 
 	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index dcf90144d70b..28c5dce782dd 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1094,10 +1094,18 @@ struct nand_controller_ops {
  *
  * @lock:		lock used to serialize accesses to the NAND controller
  * @ops:		NAND controller operations.
+ * @supported_op:	NAND controller known-to-be-supported operations,
+ *			only writable by the core after initial checking.
+ * @supported_op.data_only_read: The controller supports reading more data from
+ *			the bus without restarting an entire read operation nor
+ *			changing the column.
  */
 struct nand_controller {
 	struct mutex lock;
 	const struct nand_controller_ops *ops;
+	struct {
+		unsigned int data_only_read: 1;
+	} supported_op;
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
