Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F91103E161
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t//DpX9aTrEqIStDCPF4b6EAdj39lhjfDo3bSXC/2+c=; b=TYgGnqOh27b1KU
	22hC0s8QrwY46+xxFs8AqxVjyIW1e/te+ElORFcrU+D/YODHx3lqzKYGN2y2sKbgYWHC2CKKFjmzK
	wpsV/fWgojTblOi6F6YTtiJK+IqVFWfo6VMLv7KUutF1UjhnYVQ8oiMzfm5iUit2uqU+oBNM//Bik
	SAeK9F3YXJjcg1b3JRmiful6qFPm3GNdGlk/lo9dtmhK/8vBIKaj1eog3fn8j0anUJx5ZEnO9txjD
	pMiETHqgVErr86OcRHePOKFJaruhSrR0wvtxpcsnXuzt+eZeG9O0xfh9Iv1XBvdhtzhVdtGodHOzA
	FxTz/ouBjLyHkWOXZGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oRa-00000008EUH-0I3D;
	Wed, 18 Mar 2026 10:48:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oRW-00000008ESe-2OPj
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 10:48:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 554674E426E0;
	Wed, 18 Mar 2026 10:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EB386004F;
	Wed, 18 Mar 2026 10:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8D7E1045077B;
	Wed, 18 Mar 2026 11:47:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773830878; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LdL0DJ2zWmild6aoaYq8ogKRjuS6nkkO6eYhSHPXzqA=;
	b=zB06cacwPFCKhtUe96WWF08arEXkF5zsUudJNQJmNAwUQhFxkdpya4JkVyyEl3pO/fP9XY
	yRoqlGgQ3+TyoWOq2ZXgN7RGnLwkb4ocZfq3T0reXT12BFATyaoZhU2Wns8NoOKIQUWEzE
	At0ou7Kw+4rUVL/rWbeiAwOCsI4r7zQSP6XpIrrFKj+e+GyPqiCnrvHwHyp9Xm2cYeHTBK
	/UADpQgQjTUODfbnuztneM+h91wkTv4xnl8dDIwZfMNr18romSg5R8df2ZO9LBkFB7mkNg
	r27gLB9w1zLVDXhpGo0dK+klk3ITTXMUfNaQY5w5BoQhKsifIIyGDT6DXV/9+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: spinand: winbond: Clarify when to enable the HS bit
Date: Wed, 18 Mar 2026 11:47:50 +0100
Message-ID: <20260318104750.581596-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_034802_742781_AD532939 
X-CRM114-Status: GOOD (  14.00  )
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

Above 104MHz when in fast dual or quad I/O reads, the delay between
address and data cycles is too short. It is possible to reach higher
frequencies, up to 166MHz, by adding a few more dummy cycles through the
setting of the HS bit. Improve the condition for enabling this bit, and
also make sure we set it at soon as we go over 104MHz.

Fixes: f1a91175faaa ("mtd: spinand: winbond: Enable high-speed modes on w25n0xjw")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
The boards I have which are mounted with W25N chips cannot go over
104MHz, so both the original commit and this one are mostly based on
speculation and datasheet reading. There are no designs allowing to test
this yet, so it is possible that some cases might still not be correctly
supported.
---
 drivers/mtd/nand/spi/winbond.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6dfd0dcc8ee7..e0138785e280 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -337,16 +337,19 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
 
+	/*
+	 * SDR dual and quad I/O operations over 104MHz require the HS bit to
+	 * enable a few more dummy cycles.
+	 */
 	op = spinand->op_templates->read_cache;
 	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
 		hs = false;
-	else if (op->cmd.buswidth == 1 && op->addr.buswidth == 1 &&
-		 op->dummy.buswidth == 1 && op->data.buswidth == 1)
+	else if (op->cmd.buswidth != 1 || op->addr.buswidth == 1)
+		hs = false;
+	else if (op->max_freq && op->max_freq <= 104 * HZ_PER_MHZ)
 		hs = false;
-	else if (!op->max_freq)
-		hs = true;
 	else
-		hs = false;
+		hs = true;
 
 	ret = spinand_read_reg_op(spinand, W25N0XJW_SR4, &sr4);
 	if (ret)
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
