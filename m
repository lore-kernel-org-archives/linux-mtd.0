Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80BBC28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 15:54:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948C5206EB
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 15:54:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l0v1E6OW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 948C5206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSniIsyGyJw/E5TxNrD7DFX+Mcd8yd0CvJLeXJmjus4=; b=l0v1E6OWOy9r8L
	PIC5XsvgP/B0Xb7OYGpVA6x0fo1GRMBwZ4JE7muv3Kk50X2YPJLs1bT8uFvJp/ThkNjycZMZ/Ytb0
	Fm/0Tq+n+kglGnVcPLP9HD9rdDHURMpRFAAQKEzQ+Nrj4S35LraNCvAfQc2JaY+M86tqqQwluPtES
	5Qruidl6a14Yh5HdcejKHE5rl4xIjkLe8Lk6FR1UfTTGioGwpRqwvHsY84dCbeGCV5eEbczuLVBnx
	N3inC0v7K/eajERKQgnzyC0WFiJrZJK5TRArPSD8oVGNKafUcSsZENc4sh2bowca167Uszae8iuel
	c8qMvWXWAz9fdN0YhDFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVGwn-0003LG-Tp; Sun, 03 May 2020 15:54:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVGw8-0002db-Dv
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 15:53:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 09F63240008;
 Sun,  3 May 2020 15:53:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/8] mtd: rawnand: Define the "distance 3" MLC pairing
 scheme
Date: Sun,  3 May 2020 17:53:35 +0200
Message-Id: <20200503155341.16712-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200503155341.16712-1-miquel.raynal@bootlin.com>
References: <20200503155341.16712-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_085348_608061_6ACDBCC5 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

Define a new page pairing scheme for MLC NANDs with a distance of 3
pages between the lower and upper page.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h |  3 ++
 drivers/mtd/nand/raw/nand_base.c | 50 ++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 9d0caadf940e..bca9b3424646 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -75,6 +75,9 @@ extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 
+/* MLC pairing schemes */
+extern const struct mtd_pairing_scheme dist3_pairing_scheme;
+
 /* Core functions */
 const struct nand_manufacturer *nand_get_manufacturer(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c24e5e2ba130..8bcc7b31f94b 100644
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
