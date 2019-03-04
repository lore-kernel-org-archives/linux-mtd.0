Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51D8C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:26:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A009D206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ob45Ugf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A009D206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8Cm7M9ZIJ6rMvQX8Q+kUBtp6/ToJ5UDLinQI2+GewY=; b=Ob45Ugf54s0Fxk
	txIOHkqWwQVkejNpOcTVElieJiv5Rx139r7l+ecE3jiZEllWE8IXAWCAd91KyhORcrO6Hc8eRT8iO
	VPjD5mEInVYVJ76aOfhdKVOHKpnHr+6fpphuFdY15tsFtoxCaiKFkI7GJ8wG/7nTfAv2kD1wYvbQF
	4PbXuNSD2kcdxelMcCHFhLNEfo87bCYtPs7dh09DsnMg+piR/ng0N7Vt2afmGOWlNZW+sKeG8U8JN
	i6kHXuWeErFhjJHC6ISemVX65ZDQmufn4YFblCM8PMMfxQbMABD+YeX0YVCSgEuQ86bsNLIEA9p0Q
	vbCXRbig86hpTNAnuqlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0uAM-0002Dm-5d; Mon, 04 Mar 2019 20:26:26 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u0P-0007MI-CU; Mon, 04 Mar 2019 20:16:30 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5364B24000B;
 Mon,  4 Mar 2019 20:16:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 05/15] mtd: rawnand: Use nand_to_mtd() in nand_{set,
 get}_flash_node()
Date: Mon,  4 Mar 2019 21:15:12 +0100
Message-Id: <20190304201522.11323-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_121610_033962_A4B4ECC0 
X-CRM114-Status: GOOD (  10.62  )
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

Use the nand_to_mtd() helper to access chip->mtd as done everywhere
else.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 include/linux/mtd/rawnand.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 33e240acdc6d..c20ea012aab6 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1113,17 +1113,6 @@ struct nand_chip {
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
 extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
 
-static inline void nand_set_flash_node(struct nand_chip *chip,
-				       struct device_node *np)
-{
-	mtd_set_of_node(&chip->mtd, np);
-}
-
-static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
-{
-	return mtd_get_of_node(&chip->mtd);
-}
-
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
 {
 	return container_of(mtd, struct nand_chip, mtd);
@@ -1155,6 +1144,17 @@ static inline void *nand_get_manufacturer_data(struct nand_chip *chip)
 	return chip->manufacturer.priv;
 }
 
+static inline void nand_set_flash_node(struct nand_chip *chip,
+				       struct device_node *np)
+{
+	mtd_set_of_node(nand_to_mtd(chip), np);
+}
+
+static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
+{
+	return mtd_get_of_node(nand_to_mtd(chip));
+}
+
 /*
  * A helper for defining older NAND chips where the second ID byte fully
  * defined the chip, including the geometry (chip size, eraseblock size, page
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
