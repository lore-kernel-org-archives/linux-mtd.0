Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2C7C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZTm4DKjLDruORzCjbyfFnbi248k3cKfppVrPShZiANY=; b=fdoY0dSh/qex1e
	/26xC1SSQ0Mar4qUWZ1m9EC8FWICaMw6xx49oHMDa4rc6iyYsVagrqjctpEmLMokT26wrWmzE57qE
	WzwUJyftgSCN0csMTzCt1ev77YRM4t1t9VN5ODXTajfaPYCPpt9ft9YPHOLcBO1wC2FqXX1iKQbY6
	jWiX2TtgAtiFVyDliCDjOG515EFZZ+s+KJj0r/aBtc2tRq5gtUe/noyhJZ2uq3klr14aybkHKLPy1
	kJ60lgzHt5u0nktN7Xpb2RBtVZQBEhCtS/Ul0Sj6t4VL+ACRVRpBOm+4eyZPWTwDIVQlqKjH6UgAS
	jThbwwfs2K6dXuQBTPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChqh-005HbO-1X;
	Mon, 11 Dec 2023 15:05:35 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChqe-005HX5-0O
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 15:05:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5469FF805;
	Mon, 11 Dec 2023 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702307127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HJx/g1lQV6d6umo/aERsV9LKr3iz252wNrScN5BFwWo=;
	b=Mk2XI5VI37MZLKnpUgc8NqOC+CPTGY76jvNYYnrJU926zakRhTU4aMu1xEaQZ7fhuNT6bn
	ZS8ElGUtipdYU/E2bxOgXiFi9a0bre0sqXYC8YCgI+YDH4ope5rApBHWT2cSq8aXHNLmQJ
	SwOfRubn/1B/f3IlDb1/tGR/Ms6RawobptHgp9MxLvTAOwzVe0VQ36vsoXxM3ks+zdEM3n
	KdXgpB2kK/5CM/D4hcN0q/z6oB07lQ3DIy/d4Ml7MA4CvP1fGXHGSqlAMt2wEL0vES0E2h
	Ru/FFZck/K9DQQBCxZ2607OxsvvypCvy5yh5zBo5HS0mC7bVQjS87dowL3C+ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mtd: rawnand: pl353: Fix kernel doc
Date: Mon, 11 Dec 2023 16:05:24 +0100
Message-Id: <20231211150524.108803-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_070532_331501_9391C5A4 
X-CRM114-Status: GOOD (  10.35  )
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

Both the "chip" kernel doc member and description are wrong. This field
is called "chips" and describes the list of NAND chips connected to the
controller.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312102130.geZ4dqyN-lkp@intel.com/
Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index c506e92a3e45..1c76ee98efb7 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -128,7 +128,7 @@ struct pl35x_nand {
  * @conf_regs: SMC configuration registers for command phase
  * @io_regs: NAND data registers for data phase
  * @controller: Core NAND controller structure
- * @chip: NAND chip information structure
+ * @chips: List of connected NAND chips
  * @selected_chip: NAND chip currently selected by the controller
  * @assigned_cs: List of assigned CS
  * @ecc_buf: Temporary buffer to extract ECC bytes
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
