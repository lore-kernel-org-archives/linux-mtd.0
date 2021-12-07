Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203C7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5PF0KVZdXOeWoeUD5FoueoK4/DH+G1POJBvdzgTHms=; b=W7rUVjPBzE9XWc
	URMjVvhaaSiJWEiTqDZTPFCPFCiGwC4t+u6qkPRB5IGNY0tR/cKGgpTwqBG1PrQnpCNSxN6Lplu/S
	wZL0XYYgYgJcVew+8dF/dmtHyTitXg+WqL5IU0donuTTIIhQ+xy3XjI0PB2HnwaEih5nuWJn0K0Pt
	gZ78TtFYrFreRPZR5L4rYPMX/SrjXkJYa3ZVg1/C0bruvwS6scmnLtorGukXASNlcxiVbyB345WLg
	BhIY9sHEGz/vkaOUBHIoMP0FTKn2PEOOLP1mEttxDxjYSZp/NoJFcGB8o8ExYrDKXpElv1pI0f6G6
	9sUlP4mBF7Wo9tSUbG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWzW-007rBx-6a; Tue, 07 Dec 2021 09:42:30 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muWry-007owE-Vc
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 09:34:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1260F6001F;
 Tue,  7 Dec 2021 09:34:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mason Yang <masonccyang@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 11/22] mtd: spinand: macronix: Use random program load
Date: Tue,  7 Dec 2021 10:34:11 +0100
Message-Id: <20211207093422.166934-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211207093422.166934-1-miquel.raynal@bootlin.com>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_013443_189124_BF006BF1 
X-CRM114-Status: GOOD (  10.12  )
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

From: Mason Yang <masonccyang@mxic.com.tw>

Macronix SPI-NAND chips might benefit from an external ECC
engine. Such an engine might need to access random columns, thus needing
to use random commands (0x84 instead of 0x02).

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f31f1381a62..dce835132a1e 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -20,7 +20,7 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
