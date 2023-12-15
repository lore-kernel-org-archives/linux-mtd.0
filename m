Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21319C35274
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU43TjjmWaTJIXKw6d4rivKNA7Eg4uBRr4hv0z4NHpc=; b=nIAeApgj1Zdd8R
	LPFNXBwvc3YtMzY+wCbsNORx2fsXEZtnVPImCl904jU5SXBna+6Gd8WfN89fXcTtZfpMYO3qmm0L+
	uS80hjC0dlCPYzka+oSj+WKutwJG0z2URtlkqZXwF4Kuy5t8wV2XnrQW/e69j7/4LIgtNbM46iCgV
	5/1Ru/ykzkZ9kvL1pUSgmyOYfZorqYCZ6nJ7JJd65FSyEkoH2SkfqvBgrRYCmhIpLMGY/Cf7e7M6L
	JEPFnLRNBwJHcliDVtVC/3nVNZsR6q3iThrIOFl59KorN+bNZonvW/uqU8CsLv2+pD5GKas8S82uI
	/f+UkSmyJKN7+F0gfZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Mf-003Eqx-0P;
	Fri, 15 Dec 2023 12:32:25 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7Mb-003EoJ-2B
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 12:32:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CC9A1BF210;
	Fri, 15 Dec 2023 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702643540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qNhSGk24Wd3KqDZvArgww3F1dD6EeCxn1qNbuBtcZ4=;
	b=bctRou4QxDYwafAq2TANfW7HNjJ53mbp+9zBTGyEymQrHyZopHLDPHrixl6yHkPG+h1Xqy
	irKqAyqQNbiZyqrF35z3MtYCz/s6Ux8w1iOXYhfKjjRx2L8K4nSx+mQnIZ+3HWpyXiRKnO
	/F0lW+VKy7v4egpTwA0iBK2LSqZAPcSa7J3fHGYW7YBsXG/t8eX3JqgDYaGm9/4CtolHMY
	EW2jjrFHBknY4Tw1nf/SEwM7lNeQGkIO6I6NH2MnF9etxtbGBgWdVdcOHqQHW6ZKFfeWkS
	r1tFjVv/aVERPWB2XCiHzhDkFgiS+5avOlSbNEsj7CqdCZl4kKTAKlrfNlPw1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] mtd: rawnand: Clarify conditions to enable continuous reads
Date: Fri, 15 Dec 2023 13:32:08 +0100
Message-Id: <20231215123208.516590-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215123208.516590-1-miquel.raynal@bootlin.com>
References: <20231215123208.516590-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_043221_865271_E648DA1D 
X-CRM114-Status: GOOD (  13.50  )
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

The current logic is probably fine but is a bit convoluted. Plus, we
don't want partial pages to be part of the sequential operation just in
case the core would optimize the page read with a subpage read (which
would break the sequence). This may happen on the first and last page
only, so if the start offset or the end offset is not aligned with a
page boundary, better avoid them to prevent any risk.

Cc: stable@vger.kernel.org
Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 139fdf3e58c0..bbdcfbe643f3 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3460,21 +3460,29 @@ static void rawnand_enable_cont_reads(struct nand_chip *chip, unsigned int page,
 				      u32 readlen, int col)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	unsigned int end_page, end_col;
+
+	chip->cont_read.ongoing = false;
 
 	if (!chip->controller->supported_op.cont_read)
 		return;
 
-	if ((col && col + readlen < (3 * mtd->writesize)) ||
-	    (!col && readlen < (2 * mtd->writesize))) {
-		chip->cont_read.ongoing = false;
-		return;
-	}
+	end_page = DIV_ROUND_UP(col + readlen, mtd->writesize);
+	end_col = (col + readlen) % mtd->writesize;
 
-	chip->cont_read.ongoing = true;
-	chip->cont_read.first_page = page;
 	if (col)
-		chip->cont_read.first_page++;
-	chip->cont_read.last_page = page + ((readlen >> chip->page_shift) & chip->pagemask);
+		page++;
+
+	if (end_col && end_page)
+		end_page--;
+
+	if (page + 1 > end_page)
+		return;
+
+	chip->cont_read.first_page = page;
+	chip->cont_read.last_page = end_page;
+	chip->cont_read.ongoing = true;
+
 	rawnand_cap_cont_reads(chip);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
