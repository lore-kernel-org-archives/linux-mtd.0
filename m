Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE6BC636CB
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 01:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zfmye995bZL+3br6u4fdKloMMJvoO/wXbYgXNBKq4uQ=; b=RkdeHN9ke0S1CS
	BynV70MAChkwWWPmglJqvMYMLJE5WeNoOktwC8w5nnR7hxVKE0/LotARlsTr4iyre7YEqPGXNIgW7
	sxyhvINgKT9MPya+HUYB5fX2QZIjL+Sgt0enpKQklwHDBcn45HCPl2eoktJUpgFlnOsfFsFP+RIX0
	0tBaaX3pvToAYBCnDrabebvfn92rLulknzK7O1+EjdgCQ8Lk5nfLcTfB41sLu4QilJycyaAqaAXid
	8I0SG/B5+sVpVAaGWV73vKVWBX7CP5kvU9QHmOS0AulT/xNVYLyunFjQbRnioB4kJkARTdigp6r3W
	Cj+KgPJHrA+p+IEpn5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6hQ3-008LBl-2A;
	Sat, 25 Nov 2023 01:25:15 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6hQ1-008LAY-0L
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 01:25:14 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A18B7C00DAD9;
	Fri, 24 Nov 2023 17:25:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A18B7C00DAD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1700875512;
	bh=Mt/A8IXzoCUJXLU+oYc8jniqtMmbYYaDH7bW1ntuJLk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EP7uWK4RMuiicMetAht0MIdD3Ov8ZRcE0URbHq9Y3juMu4Gf/3Zlm5N3Dikz6lLHG
	 CHXxec/bVss0Q6CGukabk+BNEiWjicFQL1ixl3S8HAQRSrA2iGYJdmJNyi+O2x8RmE
	 u1lWAwdfL2Td6rUZp2WbW7+QFb453KxBrBfyDC/M=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 9552E18728D;
	Fri, 24 Nov 2023 17:25:12 -0800 (PST)
From: dregan@broadcom.com
To: dregan@broadcom.com,
	miquel.raynal@bootlin.com,
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
Subject: [PATCH v5 3/4] mtd: rawnand: brcmnand: pass host struct to bcmnand_ctrl_poll_status
Date: Fri, 24 Nov 2023 17:24:37 -0800
Message-Id: <20231125012438.15191-3-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231125012438.15191-1-dregan@broadcom.com>
References: <20231125012438.15191-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_172513_185448_5CB3FB3A 
X-CRM114-Status: GOOD (  14.09  )
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
Changes in v5: none

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
