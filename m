Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CACC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D420320776
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NBlJC1Np"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D420320776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26rfbgpQ37tDAoL8Vd+5EoU+808rbRQOrtnTEfXVRbk=; b=NBlJC1NpJaeQ/f
	JNrkjMhCGuTSnSdk3PNdlV09FX/WNEl13J4yiXmjPuSZ9LeTo+KXzJTN7A2s+paxfBMz85mZsSVlv
	QXUXl90x6oWwgT+WjMipLsqeFm4JhJqgwE6ZA13a0zCYP9g/1YnF/BL0lz6KbWU5aPONbqgWq8wM3
	1XeX+2velzdBRDl97owB0YySS8rXXVOrUAETIu9qoNAPdczOSzrwxYuip2sO2lEWq1/FZwJU2DUJL
	gH7w75UOo+e8s8WBeCFbKeYE7RkHjWHfk7jPpQJRkYhtzBtmUSBkfkLvfwAt6gSi3nGxqxcnuNrJy
	UQsEe/fYyANjkvPil24g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeRlo-0006cM-7g; Thu, 28 May 2020 23:17:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeRl9-00064e-CH
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 23:16:25 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 19B8024000A;
 Thu, 28 May 2020 23:16:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 05/30] mtd: rawnand: Declare the nand_manufacturer
 structure out of nand_chip
Date: Fri, 29 May 2020 01:15:47 +0200
Message-Id: <20200528231612.8958-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528231612.8958-1-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_161623_546929_81BD137D 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that struct nand_manufacturer type is free, use it to store the
nand_manufacturer_desc and the manufacturer's private data.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/linux/mtd/rawnand.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 860d3c1020ef..a3dfa36a9fd5 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1043,10 +1043,21 @@ struct nand_chip_ops {
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
 };
 
+/**
+ * struct nand_manufacturer - NAND manufacturer structure
+ * @desc: The manufacturer description
+ * @priv: Private information for the manufacturer driver
+ */
+struct nand_manufacturer {
+	const struct nand_manufacturer_desc *desc;
+	void *priv;
+};
+
 /**
  * struct nand_chip - NAND Private Flash Chip Data
  * @base:		Inherit from the generic NAND device
  * @ops:		NAND chip operations
+ * @manufacturer:	Manufacturer information
  * @legacy:		All legacy fields/hooks. If you develop a new driver,
  *			don't even try to use any of these fields/hooks, and if
  *			you're modifying an existing driver that is using those
@@ -1106,13 +1117,11 @@ struct nand_chip_ops {
  *			structure which is shared among multiple independent
  *			devices.
  * @priv:		[OPTIONAL] pointer to private chip data
- * @manufacturer:	[INTERN] Contains manufacturer information
- * @manufacturer.desc:	[INTERN] Contains manufacturer's description
- * @manufacturer.priv:	[INTERN] Contains manufacturer private information
  */
 
 struct nand_chip {
 	struct nand_device base;
+	struct nand_manufacturer manufacturer;
 	struct nand_chip_ops ops;
 	struct nand_legacy legacy;
 
@@ -1161,11 +1170,6 @@ struct nand_chip {
 	struct nand_bbt_descr *badblock_pattern;
 
 	void *priv;
-
-	struct {
-		const struct nand_manufacturer_desc *desc;
-		void *priv;
-	} manufacturer;
 };
 
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
