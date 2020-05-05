Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAE2C47247
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76C2206CC
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E2p0T8W8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C76C2206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGawF19pG8es37K9vc8qF3j92T2rWnOxIdURPcBeU3c=; b=E2p0T8W88vWtNq
	ovpf/vXypSIUDdmWVGgtcpALY1JLzN+is1xwBXK4gyATghCAJ1yVwo1+ModrCfMOr56BPkjrAxWwa
	hRsSXNiV9dLdDUC4BVak1PKxb5OseK58V4DgA5asqjgrCbI5dYG7rc8ExYcdBiWoB6TiJt8F/2LqF
	HD5y1ZAmMHXBvjOgsbegWKweCldeLcDz6OSUIAiqlgnyIgKXl0iyUAgkzK836bvfJKtnpUOuw93iP
	aOGNJv0LAZW1Wt0j1S6Nyy2b1tNGjjZH2NlJ8KNhWDj41cNMrlETMJM9V8B63XW5y672gXK2CKrrk
	09JB2HZtDcK2wHPBhsYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVueV-000541-Q0; Tue, 05 May 2020 10:18:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuaT-0007Ao-2t
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 10:14:09 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7F0602A1C94;
 Tue,  5 May 2020 11:14:02 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 16/19] mtd: rawnand: cafe: Adjust the cafe_{read,
 write}_buf() prototypes
Date: Tue,  5 May 2020 12:13:50 +0200
Message-Id: <20200505101353.1776394-17-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200505101353.1776394-1-boris.brezillon@collabora.com>
References: <20200505101353.1776394-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_031405_283614_7C8CA8C7 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace the uint8_t pointer by a void pointer and make the length
unsigned so it matches what's passed through the NAND instructions.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes in v2:
* s/nand/NAND/
* Add R-b/T-b
---
 drivers/mtd/nand/raw/cafe_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index bcdd58e93666..74c64af700d5 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -179,7 +179,8 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
 #define cafe_readl(cafe, addr)			readl((cafe)->mmio + CAFE_##addr)
 #define cafe_writel(cafe, datum, addr)		writel(datum, (cafe)->mmio + CAFE_##addr)
 
-static void cafe_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
+static void cafe_write_buf(struct nand_chip *chip, const void *buf,
+			   unsigned int len)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
@@ -191,7 +192,7 @@ static void cafe_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
 	dev_dbg(&cafe->pdev->dev, "Copy 0x%x bytes to write buffer.\n",	len);
 }
 
-static void cafe_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
+static void cafe_read_buf(struct nand_chip *chip, void *buf, unsigned int len)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
