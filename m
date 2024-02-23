Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2B7C54E41
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMdAd5p8kJGdTVrATPY/sYcZ7uOI2ImHq6RgcjgGJEY=; b=NUeJNOOXC1m4Ra
	iUjB3KomzLi1kW51+XVPGIFA6U5/0eB5S1Xld6gYCbGKRUkJpth7OnoNMeLvZ57buF77pDmGMoCG/
	mZkqOd7kPwYbu3ZnvOpLsqVv9fSKj+oGJg4O+GNOIwZDQ4W7DqIA1ifT3a6zZoRon8J4k3rZ7hZay
	UlMz3Qccz2EWZtSXeDKazZUcYd6wlMM9A3+joOBp8NHG6SIYPr99SQB+Y7rKGC1+p7Ck8ewKYQrGU
	hi3n6uspEfDDZ3uLY8lcxeFGHpy1CcNmjaYhFR+EjJdadUDqSnje7uNW5kGJeDMM6RA23qDBJDVYy
	cF0FP2/T5isAskHziBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMYU-00000007jkK-0xTh;
	Fri, 23 Feb 2024 03:48:58 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMXt-00000007ja9-1Sml;
	Fri, 23 Feb 2024 03:48:26 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 59FABC0047EF;
	Thu, 22 Feb 2024 19:48:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 59FABC0047EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660100;
	bh=TeVtdX37iglXRJatw6wyyl1lRRIAsFqkPmZrbmC3too=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwhKpcSil3kvONwj/g5TRzwPhwrMvWACFghJl2BckzNhcgRjAjdtJarBx2pQMOwe5
	 h82PSr+5yESiHsa5oZ5WxRv4TvhJP9iY1RXJRCt4qNM4CDWPWZFasa9HGfDRFr6C+4
	 adxPHUaANr1AwZ/I/zwIuyCGUQZkHiZI/++IltRs=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id CBC1F18041CAC4;
	Thu, 22 Feb 2024 19:48:18 -0800 (PST)
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
	David Regan <dregan@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v6 01/13] mtd: rawnand: brcmnand: exec_op helper functions return type fixes
Date: Thu, 22 Feb 2024 19:47:46 -0800
Message-Id: <20240223034758.13753-2-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240223034758.13753-1-william.zhang@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_194822_115721_B138335A 
X-CRM114-Status: GOOD (  15.32  )
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

From: David Regan <dregan@broadcom.com>

Fix return types for exec_op reset and status helper functions.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: http://lists.infradead.org/pipermail/linux-mtd/2023-December/102423.html
Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
Signed-off-by: David Regan <dregan@broadcom.com>
Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v6:
- Moved style fixes to a separate patch

Changes in v5: None
Changes in v4:
- Fix the commit id in the fixes tag

Changes in v3: None
Changes in v2:
- Added to patch series

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 8faca43ae1ff..b8e70fc64348 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -625,7 +625,7 @@ enum {
 /* Only for v7.2 */
 #define	ACC_CONTROL_ECC_EXT_SHIFT		13
 
-static u8 brcmnand_status(struct brcmnand_host *host);
+static int brcmnand_status(struct brcmnand_host *host);
 
 static inline bool brcmnand_non_mmio_ops(struct brcmnand_controller *ctrl)
 {
@@ -1690,7 +1690,7 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
 				 INTFC_FLASH_STATUS;
 }
 
-static u8 brcmnand_status(struct brcmnand_host *host)
+static int brcmnand_status(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -1701,7 +1701,7 @@ static u8 brcmnand_status(struct brcmnand_host *host)
 	return brcmnand_waitfunc(chip);
 }
 
-static u8 brcmnand_reset(struct brcmnand_host *host)
+static int brcmnand_reset(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 
@@ -2433,7 +2433,11 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 
 	if (brcmnand_op_is_status(op)) {
 		status = op->instrs[1].ctx.data.buf.in;
-		*status = brcmnand_status(host);
+		ret = brcmnand_status(host);
+		if (ret < 0)
+			return ret;
+
+		*status = ret & 0xFF;
 
 		return 0;
 	}
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
