Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD400C2D0C2
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ED70206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OGPt5Vba";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m1ShNPPC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ED70206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lq2vsoNwGpOJH3xbjq9VDrfGgdpWLc7toLBIApVWO5A=; b=OGPt5Vba9AeHq4
	lMoyZo86QjlyciBWy12hLz4fKBUiOOKArP2W4Z5u8WU0M6HkBq2ji9BymrXXcKm3fVG31w61v4FfX
	IJH7foHBuTG5KfBjhnzlxLZg0p4l84CIk0kxNc6Exp+D5W+Yd38HvMC1Gw5mvPfXxthqldXTws/BM
	XktMOAnj11xQeuPe14gXos/gaiDAF6L16XdhC76ujPwQo2kP7YsMEnXhvJEkgG8HWE77t33dj/BfL
	NGvP+BbM7e+WdtirardGwgS4vL5Qirlqec3IgnyxkhAmHboiI3Gl0q1dDXKJLTwNgrg15P+BIQzZN
	etZ1tzOGdzd6XNDbklQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilyI1-0004hV-2d; Mon, 30 Dec 2019 16:53:09 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyH4-0003mZ-Vb
 for linux-mtd@bombadil.infradead.org; Mon, 30 Dec 2019 16:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W+MwV62ec+xt0270sdQa2QIP0mnR2Qcf/HD0sUHAUhw=; b=m1ShNPPC8JIIpofur8nLjWVOKL
 lN5+BNuzLkFWRVt7TwFQ+9V55ctvDhFmOaTr/uTB+5d7dv1hmijvsAmlqaH4m8eFXkaNvtIUWyV0e
 EpzAWvsLQnBSYg5wiGSZuh4tNYNU2hJrSXbWDiRX4dNp3/2fbQQ63nU6MPYlioiprA1QMKWTGwU8C
 iheJLPkc+2g/GdR+vcbvh/uI4kqpOXTaCC5mxHEZjs1vkgSaQwZHy54qcxnkzI081ov7b39HtqZxI
 oR/MtFHoWgeRYLhfmlTphAlFBYN0M2utn7JP9dHPPQQKkh/9ihl7F4i+AYwTJJEAceTogejlOSMoC
 Yix4IMQg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyH1-000501-Mp
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 16:52:08 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D9705C0005;
 Mon, 30 Dec 2019 16:51:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/8] mtd: rawnand: Define the "distance 3" MLC pairing scheme
Date: Mon, 30 Dec 2019 17:51:23 +0100
Message-Id: <20191230165129.11925-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191230165129.11925-1-miquel.raynal@bootlin.com>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

Define a new page pairing scheme for MLC NANDs with a distance of 3
pages between the lower and upper page.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h |  3 ++
 drivers/mtd/nand/raw/nand_base.c | 50 ++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index cba6fe7dd8c4..8f6fdda681cc 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -74,6 +74,9 @@ extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 
+/* MLC pairing schemes */
+extern const struct mtd_pairing_scheme dist3_pairing_scheme;
+
 /* Core functions */
 const struct nand_manufacturer *nand_get_manufacturer(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f64e3b6605c6..a471f5714cd6 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -205,6 +205,56 @@ static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
 	.free = nand_ooblayout_free_lp_hamming,
 };
 
+static int nand_pairing_dist3_get_info(struct mtd_info *mtd, int page,
+				       struct mtd_pairing_info *info)
+{
+	int lastpage = (mtd->erasesize / mtd->writesize) - 1;
+	int dist = 3;
+
+	if (page == lastpage)
+		dist = 2;
+
+	if (!page || (page & 1)) {
+		info->group = 0;
+		info->pair = (page + 1) / 2;
+	} else {
+		info->group = 1;
+		info->pair = (page + 1 - dist) / 2;
+	}
+
+	return 0;
+}
+
+static int nand_pairing_dist3_get_wunit(struct mtd_info *mtd,
+					const struct mtd_pairing_info *info)
+{
+	int lastpair = ((mtd->erasesize / mtd->writesize) - 1) / 2;
+	int page = info->pair * 2;
+	int dist = 3;
+
+	if (!info->group && !info->pair)
+		return 0;
+
+	if (info->pair == lastpair && info->group)
+		dist = 2;
+
+	if (!info->group)
+		page--;
+	else if (info->pair)
+		page += dist - 1;
+
+	if (page >= mtd->erasesize / mtd->writesize)
+		return -EINVAL;
+
+	return page;
+}
+
+const struct mtd_pairing_scheme dist3_pairing_scheme = {
+	.ngroups = 2,
+	.get_info = nand_pairing_dist3_get_info,
+	.get_wunit = nand_pairing_dist3_get_wunit,
+};
+
 static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
 {
 	int ret = 0;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
