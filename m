Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5561C04FFE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zpGBUDtFMJ4PFn1TctqLDv/sgxQ1kM5xOIpnpn5ufLU=; b=y0i3KnNUukxSzP
	nBJ3mXu1e0v7ZY97LTwY7Y+8JSlJLWzRWGK2xBkPEFyP6vlKlo89BhByI0SQ4bvQmS6I6zkzPbKzY
	IhPKe8HKO31v/vlf/PiuK8AEwH9u6Mv2j/gy4hL1J6/7JFmWCbL+u8ddRx6/NHYSkLu9DLwhGcbvF
	WvfnbbPkDEnn6qCcC+q+CYFJxzV3kNDbmhpMtpABKbWxKVLIgqz1RGx+VtCku3rRp+9sFbsUolp2U
	9RcZ93rKlxe+jT8x7S7jmJab0zwwhRzyTcgPTnhx2np4SVR8d/MPGlm1jVhDr782yudAIacjBRk3R
	5EUncUu1Hk10/qEIVohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pU6-0000000FaXr-2PAJ;
	Tue, 14 May 2024 10:34:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pU2-0000000FaVM-1AVZ
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 10:34:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6pTv-0006iz-Tn; Tue, 14 May 2024 12:34:03 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6pTv-001KzM-C5; Tue, 14 May 2024 12:34:03 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6pTv-003QYu-0p;
	Tue, 14 May 2024 12:34:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: rawnand: make rawnand_check_data_only_read_support() work
Date: Tue, 14 May 2024 12:33:55 +0200
Message-Id: <20240514103355.817056-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_033410_340075_A3702CBD 
X-CRM114-Status: GOOD (  12.72  )
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

rawnand_check_data_only_read_support() calls nand_read_data_op() with a
NULL pointer as buffer which will immediately return an error. Allow a
NULL buffer pointer when check_only is requested. This should be safe to
do as nand_read_data_op() has no business in touching the buffer in
check_only mode.

Fixes: 9f820fc0651c ("mtd: rawnand: Check the data only read pattern only once")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d7dbbd469b892..a5e7d8deafbbe 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2173,7 +2173,7 @@ EXPORT_SYMBOL_GPL(nand_reset_op);
 int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 		      bool force_8bit, bool check_only)
 {
-	if (!len || !buf)
+	if (!len || (!buf && !check_only))
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
