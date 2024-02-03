Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFF0C4828F
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 00:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkcs+r4UheT2BDQ21Pl1Krq+AjEukC8uFPjC0uOQKig=; b=KU+UelXtK/pp7n
	v7m9q7mIG06dTFjKKeEfhAbWLFuEn+mXNwyJEBdZ+eEscQm3r/rFrZnRzPYh2ivZShYBS46XwO8M1
	x1qaxnXHOgmx9zzPh/fva6/El1HxPfyUAB63xJYdb299vnlLwFhR++dpG8lFOipJPnbSfzUkicrxD
	c89xx5Vp+JP+2VuBS/hi6bHnejYlRmfa3Yh47GsyZk/HcCJlk05q7rzfEB3v+fpxo4KYuvoUtRC6y
	0q+C0ac86KfXp9R/XGGYqH6koOTFhqu1arMpdw9NIN+BhAIZlWvLslmnFmaU6VQsipIBzxlwusXyT
	GPyGQbk+c+tPiSoFWIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3vP-0000000DxHm-1MZ6;
	Sat, 03 Feb 2024 00:30:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3ur-0000000DwsW-39v4;
	Sat, 03 Feb 2024 00:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aVTx8NmI279qyMHsiYWgjkWJltxhcWDLITolixCPC/s=; b=pNT8X0inrjY2/ggKMekyJAKD5m
	jtGWM/rOJum7u/AgUSE2kPPa3/hlMNQ07GJAjwIurnKoctUSErstoMggo50A6FuJfof/zD18ShTOZ
	4+GfqPUG7U4ph9YFrLQM5rMWbGfuX3QSPDp6xrLlNac8GMUsTvqs7fHIDaWfL62afRH78GfaI7rj3
	q6pXE52oIXKtYCSFdRtubX1BGN7NR/l21EgtSvg9PJ+e6x6gfgVoNsqTDydTHAsubR8MqRERNK46S
	kTnvG/i4sLzIYMrvGm/0nEiP5xlNkRSWs+kChJhxusChaXvo2+amvikYi97ZycrOJ5Hv59RSxmorZ
	90Eeh7Hg==;
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uk-0000000ALTc-2J8K;
	Sat, 03 Feb 2024 00:29:51 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 43320C001C89;
	Fri,  2 Feb 2024 16:29:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 43320C001C89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1706920184;
	bh=oYWu5Fo1F0+7WCqhPKRqpGmYX5+YscXs0w2BLbY2DiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HbftFuFpjR7830bsBF/2j9Qdq7mRKEkN9FA1o1PTlAT6Ls2omsvXj9V71I+nLbXmK
	 oPgWUth5QCxpRyG8ZE4lNLwGKgLAkQ0W3W3bbASQZxAmZVqLfRo+4/slP5RQS/EKO4
	 00n+k/iE5SCbt0di86f5a4vuy3c/gnasIbnS40VQ=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D179218041CAC4;
	Fri,  2 Feb 2024 16:29:42 -0800 (PST)
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
Subject: [PATCH v4 11/12] mtd: rawnand: brcmnand: exec_op helper functions return type fixes
Date: Fri,  2 Feb 2024 16:28:32 -0800
Message-Id: <20240203002834.171462-12-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240203002834.171462-1-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_002947_110472_40B07E42 
X-CRM114-Status: GOOD (  15.53  )
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

fix return type for exec_op reset and status detect helper functions

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: http://lists.infradead.org/pipermail/linux-mtd/2023-December/102423.html
Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
Signed-off-by: David Regan <dregan@broadcom.com>
Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v4:
- Fix the commit id in the fixes tag

Changes in v3: None
Changes in v2:
- Added to patch series

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 8c1489ff7bd6..7ce2b267676f 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -625,7 +625,7 @@ enum {
 /* Only for v7.2 */
 #define	ACC_CONTROL_ECC_EXT_SHIFT		13
 
-static u8 brcmnand_status(struct brcmnand_host *host);
+static int brcmnand_status(struct brcmnand_host *host);
 
 static inline bool brcmnand_non_mmio_ops(struct brcmnand_controller *ctrl)
 {
@@ -1749,7 +1749,7 @@ static int brcmnand_waitfunc(struct nand_chip *chip)
 				 INTFC_FLASH_STATUS;
 }
 
-static u8 brcmnand_status(struct brcmnand_host *host)
+static int brcmnand_status(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -1760,7 +1760,7 @@ static u8 brcmnand_status(struct brcmnand_host *host)
 	return brcmnand_waitfunc(chip);
 }
 
-static u8 brcmnand_reset(struct brcmnand_host *host)
+static int brcmnand_reset(struct brcmnand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 
@@ -2492,11 +2492,14 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 
 	if (brcmnand_op_is_status(op)) {
 		status = op->instrs[1].ctx.data.buf.in;
-		*status = brcmnand_status(host);
+		ret = brcmnand_status(host);
+		if (ret < 0)
+			return ret;
+
+		*status = ret & 0xFF;
 
 		return 0;
-	}
-	else if (brcmnand_op_is_reset(op)) {
+	} else if (brcmnand_op_is_reset(op)) {
 		ret = brcmnand_reset(host);
 		if (ret < 0)
 			return ret;
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
