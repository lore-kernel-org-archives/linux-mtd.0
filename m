Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C70C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y40eo4MHnU0eYUkIWRCaA5Xv1s3AyESlZdayIvwonpY=; b=KU8YcM/kreVJfL
	MdFDhgX6HkSJOJvqaVNvzqtWfF+STx3mEX/VCnP72oH89lWDdQwqdm7Jfc3G7h9AK9aRw6gCUM9V3
	6iy+DWV8RA2qTEscZLuMePsnmDS1vzhjiJSm7LGIutcvjHN7uk7y4fKEd232btrK/E9W4/AkcMi2O
	ZvyGKgRxPiXQY6fHqqakJmMydXgV6kds6sAuO7dP0NZwjon5YwivZF0zlOKZJkKjrH+Mr5Cd6FKNV
	emGVe6Hx72SXZ83t4x4bWod9QBpretQPO/8SVWXMSqOultEdZ2TRCYrVr4cwVrny+gllXqMdv0PPC
	TAo4MVaUIE90K5S3Rxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sibge-00000007pKQ-3jhq;
	Mon, 26 Aug 2024 15:31:20 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sibfj-00000007p5D-2YkD;
	Mon, 26 Aug 2024 15:30:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61763E0006;
	Mon, 26 Aug 2024 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724686221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QM2d/CuDoeK7efPjvSGZdvRUED2mLtmBql6lzH7ZOJ0=;
	b=DMTKuUKb8qV/8FWvf04ifbAzsP1p6kbaUjEKCAgIXkoy65CpvV5cFYaBEI0zVndJbwiIbe
	13fHGeq3bjAuZ3GzUkWlEVsh+1rHPZuY2jXJqnlERXRoE1JaCFjfBe7n8+OCwKXidtzck2
	Tyq1z3gZCAvDq/KQGIgNwixYO0XtKxBL9ptj91dpaKzY03PvdKHkBvEyTSUgvEWB3cqgAe
	ntkvEzto3U1tLrwZLhDGW3j9uuQ+1ThyEgKrUgEzyCTvJggsrPA/+NsWs776f4PApluwd5
	P+S43f/pH551H+N8qcPr/QWCraOLYYcoK5B376+OqheQl0AZiKEdZltsFcztfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH next 2/2] mtd: rawnand: mtk: Fix init error path
Date: Mon, 26 Aug 2024 17:30:19 +0200
Message-ID: <20240826153019.67106-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826153019.67106-1-miquel.raynal@bootlin.com>
References: <20240826153019.67106-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_083023_907603_A53B5EFE 
X-CRM114-Status: GOOD (  12.34  )
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

Reviewing a series converting the for_each_chil_of_node() loops into
their _scoped variants made me realize there was no cleanup of the
already registered NAND devices upon error which may leak memory on
systems with more than a chip when this error occurs. We should call the
_nand_chips_cleanup() function when this happens.

Fixes: Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Backporting this change will probably fail. In practice, the memory leak
is very unlikely to happen so I guess we can live without it.
---
 drivers/mtd/nand/raw/mtk_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index bf845dd16737..586868b4139f 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1453,8 +1453,10 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 
 	for_each_child_of_node_scoped(np, nand_np) {
 		ret = mtk_nfc_nand_chip_init(dev, nfc, nand_np);
-		if (ret)
+		if (ret) {
+			mtk_nfc_nand_chips_cleanup(nfc);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
