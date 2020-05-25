Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2872AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD827207D8
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQNBxSuU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD827207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CbKs8fxeNPds6yiiagwh+PrnRPw2GbXXgOhKmmm7PQ=; b=IQNBxSuUTsRzZO
	QXjHchOtHQ4iGk0n/j45PWUc+AFYxRUTm2MgHcBbq9lzvkU63iqAvaIwf0fM0TY8+oTIXUu6SCjCT
	JdtoMmRxUI1ijp7wUnMGA/dUFPJogacoUGDg3rePd36N6oY73QNCay6hXxOi4WXO7KKI9hiSH+/eY
	cOy+VXO7HMEInAvKeW3sMzxzrHsUo6trD7N7/8+dRAJ9dfNR+mTjFQS5Ow1aiWgOrYhb7p1+Iaw22
	2csiAO6sNtmMJHAjxBk1lUVW0iIhwg4drrqzCS887ddSu3rEMc9kYox1NGD5VA7hy6sU3wvFuUSrP
	wD5zhmV0jNM5SFlgKEEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdH8J-0003do-Bv; Mon, 25 May 2020 17:43:27 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdH7i-00038F-SZ
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 17:42:52 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C6D5224000D;
 Mon, 25 May 2020 17:42:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 02/19] mtd: rawnand: Only use u8 instead of uint8_t in
 nand_chip structure
Date: Mon, 25 May 2020 19:42:22 +0200
Message-Id: <20200525174239.11349-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525174239.11349-1-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_104251_053543_FAA3E9D1 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
Cc: Rickard Andersson <rickaran@axis.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mechanical change to avoid using old types.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/rawnand.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 8a1e0192f78e..7d62e0e719ac 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1141,13 +1141,13 @@ struct nand_chip {
 	int (*suspend)(struct nand_chip *chip);
 	void (*resume)(struct nand_chip *chip);
 
-	uint8_t *oob_poi;
+	u8 *oob_poi;
 	struct nand_controller *controller;
 
 	struct nand_ecc_ctrl ecc;
 	unsigned long buf_align;
 
-	uint8_t *bbt;
+	u8 *bbt;
 	struct nand_bbt_descr *bbt_td;
 	struct nand_bbt_descr *bbt_md;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
