Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09250C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:17:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BD0206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="odTQ/r7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BD0206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/6A9CO/SlhDpre0o/6eLcy67qWSRrCDZ5WOy8BIfgs=; b=odTQ/r7vsyjoMo
	V59DoyeOo8dC9tKKdVJnVUzjN65ElSEYB4balbdd2hMnbqfPzMA5BXOfhKX8cBbR0aZBwtoBf28r0
	SzfJFqQLmM95iZpWgUiwHghC3Iqt9u9P0jHWrtugufiITLrRQUrvEcdNmo7n6HP/IPMQ8Zt3V9/jt
	Ot5/UjSnK6aaf2S9rooMxidGQxQ4jcqwGSZjjyKt+FCB/7+eTvSdYIT64kwNv1lGCcl3xf24LNVSB
	1OviIxuFstaO2XreqLpZ+fZzx0nR2P3tGG5hJHHmxZ1yNrTE6EOqIJimd5hDZKf42NDIxH6F2X1PS
	2gXWCP5HPZpIT/SKh8nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0u1r-0000qx-Sx; Mon, 04 Mar 2019 20:17:39 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u0I-0007A5-LN; Mon, 04 Mar 2019 20:16:08 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8EB9C240007;
 Mon,  4 Mar 2019 20:15:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 04/15] mtd: spinand: Implement mtd->_max_bad_blocks
Date: Mon,  4 Mar 2019 21:15:11 +0100
Message-Id: <20190304201522.11323-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_121603_354663_04E87541 
X-CRM114-Status: GOOD (  10.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

We just have to use nanddev_mtd_max_bad_blocks().

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2ae4237a586e..ed5e340dff51 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1040,6 +1040,7 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_block_markbad = spinand_mtd_block_markbad;
 	mtd->_block_isreserved = spinand_mtd_block_isreserved;
 	mtd->_erase = spinand_mtd_erase;
+	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
 
 	if (spinand->eccinfo.ooblayout)
 		mtd_set_ooblayout(mtd, spinand->eccinfo.ooblayout);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
