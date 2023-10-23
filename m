Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6062CC25B45
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgFulkIpQaGq5Hlgc30PDpN5vYqDuuhXljSptMu55e0=; b=V9dfE7AWQLT2DB
	2oWXKgNb/WkmhzJGCAPsgQA6Z9LoJ8jpkT9tSRT/8QFLat8FGO+9jiSp43hy8nr0wPyCm1VOlXSKC
	4bOwIn3ySca6xwZDFZLko4mnaMhF+nC1Eu1eL5Q1UiBCrLuNyY5v8LxYTZlQnkZnx+P4U/vVDBLKv
	8W0Pg0IEeKdMG+3rvlbwqIYNOOR99BGIoL6xBDQ15mK/MuHNLX3Uw5BjcCPT21kGg1x9fRRPmlnbH
	1Gv+t+hi74YZz45E6YTvH8jpO1L0se3phalT/kAchX5k3DifOAsAV9Dd6JQCJOHs7YQpPppELJTSL
	Zl6eXu93GEhYUK0pZOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyWA-007uBE-1D;
	Mon, 23 Oct 2023 17:15:06 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyW7-007u9k-1Z
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 17:15:04 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 39FC8C007598;
	Mon, 23 Oct 2023 10:15:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 39FC8C007598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1698081303;
	bh=GqmnpEMfWio14hWw5HE21rvGs1KEhArEROd+g4C5LJQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fPWjOQnXMgc7FnhgtU6PcVX6xnuWAr2bRDbqpCrJn2llOiuXduQ/BrXixEd+xRZzG
	 PO6qaDYSVoBGiJiSaCXf0GdgV6s6Hn7wa9Cp+K9tdAhUZQlDY2i5ramaIp+PDc2D3k
	 TvoexMkZsijjs4/aEVO3LOmORqdOMcy13NqrAYJY=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 2DA8B18728D;
	Mon, 23 Oct 2023 10:15:03 -0700 (PDT)
From: dregan@broadcom.com
To: dregan@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH v4 3/4] mtd: rawnand: brcmnand: pass host struct to bcmnand_ctrl_poll_status
Date: Mon, 23 Oct 2023 10:14:43 -0700
Message-Id: <20231023171444.322311-3-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231023171444.322311-1-dregan@broadcom.com>
References: <20231023171444.322311-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_101503_563312_AF8E2126 
X-CRM114-Status: GOOD (  14.83  )
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

Pass host struct to bcmnand_ctrl_poll_status instead of ctrl struct
since real time status requires host, and ctrl is a member of host.
Real time status is required for low level commands vs cached status
since the NAND controller will not do an automatic status read at the
end of a low level command as it would with a high level command.

Signed-off-by: David Regan <dregan@broadcom.com>
---
Changes in v4: none

Changes in v3: none

Changes in v2: added this patch in series
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 440bef477930..8d429eb3b72a 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1061,10 +1061,11 @@ enum {
 	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
 };
 
-static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
+static int bcmnand_ctrl_poll_status(struct brcmnand_host *host,
 				    u32 mask, u32 expected_val,
 				    unsigned long timeout_ms)
 {
+	struct brcmnand_controller *ctrl = host->ctrl;
 	unsigned long limit;
 	u32 val;
 
@@ -1379,7 +1380,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 		 * make sure ctrl/flash ready before and after
 		 * changing state of #WP pin
 		 */
-		ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY |
+		ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY |
 					       NAND_STATUS_READY,
 					       NAND_CTRL_RDY |
 					       NAND_STATUS_READY, 0);
@@ -1389,7 +1390,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 		brcmnand_set_wp(ctrl, wp);
 		nand_status_op(chip, NULL);
 		/* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
-		ret = bcmnand_ctrl_poll_status(ctrl,
+		ret = bcmnand_ctrl_poll_status(host,
 					       NAND_CTRL_RDY |
 					       NAND_STATUS_READY |
 					       NAND_STATUS_WP,
@@ -1629,13 +1630,13 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 	 */
 	if (oops_in_progress) {
 		if (ctrl->cmd_pending &&
-			bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0))
+			bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0))
 			return;
 	} else
 		BUG_ON(ctrl->cmd_pending != 0);
 	ctrl->cmd_pending = cmd;
 
-	ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+	ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
 	WARN_ON(ret);
 
 	mb(); /* flush previous writes */
@@ -1664,7 +1665,7 @@ static bool brcmstb_nand_wait_for_completion(struct nand_chip *chip)
 	if (mtd->oops_panic_write || ctrl->irq < 0) {
 		/* switch to interrupt polling and PIO mode */
 		disable_ctrl_irqs(ctrl);
-		sts = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY,
+		sts = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY,
 					       NAND_CTRL_RDY, 0);
 		err = sts < 0;
 	} else {
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
