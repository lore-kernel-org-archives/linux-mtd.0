Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36984C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:17:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00C8F206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QaRpyCZk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dic73KHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00C8F206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5K4cegkOmlb0fs5F/LMEue3joq1o6/W3o4R7jXbCN4=; b=QaRpyCZkUAfrqL
	kLt+J1xlsow6f9olJ7DgwLc2o/VKnbZ6F4rR0oLTJ14LuoMgcMtXhe+WPuH5lfFLSRr0IEsvZmJx4
	K0IPLxlu/Pf+hbBS1ukHaVmSFoBGyCNhXziEATZZQ8EU620wi+v1tmARPw2BgSb8spoVkCJrRpI1S
	u2h6BqDKeY+cExmp2XMH9dU9w7imM6jS8cHH3nRLm78qaeVUY0mJJVUQQj9dNFMJnVW+ODxiODgAj
	zp4IFs1CSDja/fWUPAuK113CggkbBA6ypTYpnpAKP6kMdFlBGAby7dXcAsSW2F+K/RV/0AjLw8ywn
	HRKc+ma4ooCtcaCqArAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb27M-0006g6-Bi; Tue, 19 May 2020 13:17:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1sS-0002hv-TU
 for linux-mtd@bombadil.infradead.org; Tue, 19 May 2020 13:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=RmYijYBxK1G/ybouZPal7cpOoy9pgjP1epBgQI5yw8M=; b=Dic73KHykNS3tBrHp1K7xjqzAD
 lD1QNdUgARJxGduM/9OFMriJ1vMOltcxscBTCnZG8ZJfti002zpihMgwzwk2RJZ7uGWg+spi//E4t
 zfQwxMMaT3pb0s1V3y21D3ZedKBVYdgFuS3oNzO/q4wFbFMjkYr9CS8GyNqYpOJQ5LhTPEQmjzay3
 cvvImg9KQ3mJEJ4JIh3vgTMx8TlPNfY0VkCDiTnD8jcDOpME7IduXue+GkxKsfctKiPjMdOYbCT0c
 OujKTVUj19TuJkNWLzK6GsykTFL+o5r73nnVviUQiWrNT7ctAaLDq2ueJbUyRDZLB8PrCpyaBa5wm
 mxXcfvYA==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1sO-0002KG-4x
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 13:01:46 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1BA06FF821;
 Tue, 19 May 2020 13:00:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 35/62] mtd: rawnand: oxnas: Keep track of registered devices
Date: Tue, 19 May 2020 15:00:08 +0200
Message-Id: <20200519130035.1883-36-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519130035.1883-1-miquel.raynal@bootlin.com>
References: <20200519130035.1883-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_140144_530956_CE51A63E 
X-CRM114-Status: GOOD (  14.82  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

All initialized and registered devices should be listed somewhere so
that we can unregister/free them in the _remove() path.

This patch is not a fix per-se but is needed to apply three other
fixes coming right after, explaining the Fixes/Cc: stable tags.

Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/oxnas_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
index c43cb4d92d3d..bead5ac70160 100644
--- a/drivers/mtd/nand/raw/oxnas_nand.c
+++ b/drivers/mtd/nand/raw/oxnas_nand.c
@@ -32,6 +32,7 @@ struct oxnas_nand_ctrl {
 	void __iomem *io_base;
 	struct clk *clk;
 	struct nand_chip *chips[OXNAS_NAND_MAX_CHIPS];
+	unsigned int nchips;
 };
 
 static uint8_t oxnas_nand_read_byte(struct nand_chip *chip)
@@ -79,7 +80,6 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
 	struct resource *res;
-	int nchips = 0;
 	int count = 0;
 	int err = 0;
 
@@ -145,12 +145,12 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 			goto err_release_child;
 		}
 
-		oxnas->chips[nchips] = chip;
-		++nchips;
+		oxnas->chips[oxnas->nchips] = chip;
+		++oxnas->nchips;
 	}
 
 	/* Exit if no chips found */
-	if (!nchips) {
+	if (!oxnas->nchips) {
 		err = -ENODEV;
 		goto err_clk_unprepare;
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
