Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BFEC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:25:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC1720776
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aaCUJ4Nw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC1720776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhN57C75uaWHhoopDwj9q9bHOdKAQvd/wrZ+XDq6hDQ=; b=aaCUJ4Nw5K/zqM
	fVFnQSGzsjkqBxCDw9zN80nZYDblt89tgBJcwCRDehfA+iofa7F9cjen78sRykbHUQbMqshhOleN0
	ewaRRUYtQLfNhGRZdC+G82vP1yR5kUJEQPFznS4RHsLvx+71DDTsZ/oyaJnSjkxWL6eiBwHQub/lX
	BIZNhFLtztGZxWuM5PwLWRY/QBsy70mmqdoMvbAzReT89ucnE7IOSP3KUvsDqcP+bz7G0nQP5Y2eC
	I4IS0lTjSIjRH18OXWNR6ANOfKLiaqH2/iShXoSScfAKYVm4pW9UE6km3uGqQ6fXNHP9oQJ6qLFGj
	eLT7+AHPRYvTVkdnDQqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfC3-0001pX-Ah; Tue, 26 May 2020 19:24:55 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdf5U-0001lJ-1N
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:18:11 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 506A8240006;
 Tue, 26 May 2020 19:18:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 25/28] mtd: rawnand: hynix: Implement
 ->choose_data_interface() for H27UCG8T2ATR-BC
Date: Tue, 26 May 2020 21:17:22 +0200
Message-Id: <20200526191725.7591-26-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526191725.7591-1-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_121808_260170_5F242177 
X-CRM114-Status: GOOD (  10.60  )
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

This chip supports ONFI SDR timing mode 4, implement the new hook to
advertize it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_hynix.c | 16 ++++++++++++++++
 drivers/mtd/nand/raw/nand_ids.c   |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 7d1be53f27f3..d61a55121962 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -673,6 +673,19 @@ static void hynix_nand_cleanup(struct nand_chip *chip)
 	nand_set_manufacturer_data(chip, NULL);
 }
 
+static int
+h27ucg8t2atrbc_choose_data_interface(struct nand_chip *chip,
+				     struct nand_data_interface *iface)
+{
+	int ret;
+
+	ret = onfi_fill_data_interface(chip, iface, NAND_SDR_IFACE, 4);
+	if (ret)
+		return ret;
+
+	return nand_choose_best_sdr_timings(chip, iface, NULL);
+}
+
 static int hynix_nand_init(struct nand_chip *chip)
 {
 	struct hynix_nand *hynix;
@@ -689,6 +702,9 @@ static int hynix_nand_init(struct nand_chip *chip)
 
 	nand_set_manufacturer_data(chip, hynix);
 
+	if (!strcmp("H27UCG8T2ATR-BC", chip->parameters.model))
+		chip->ops.choose_data_interface = h27ucg8t2atrbc_choose_data_interface;
+
 	ret = hynix_nand_rr_init(chip);
 	if (ret)
 		hynix_nand_cleanup(chip);
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index c729a8bc895d..3b890d55703d 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -50,7 +50,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"H27UCG8T2ATR-BC 64G 3.3V 8-bit",
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
-		  NAND_ECC_INFO(40, SZ_1K), 4 },
+		  NAND_ECC_INFO(40, SZ_1K) },
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
