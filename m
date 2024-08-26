Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73F3C54731
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s946IGD9YmYpZVo2hh3HHiG2WCKprAZ8nGmuyG1yC2I=; b=QfqSiaVeScqJNq
	hzi6BskfR1+ygUGSTGfqhnlEX+j8PbREEtJ8yj861v9db6hFVavYPgR+XJi9PVtijAI29Mj1y4goh
	gmCHD6jzYG656RXpoQx6zW/o3FSRfBNfVpHOq/iZkn2X9wsimrtyOJuRHIR0M9JG2zy0IdPN2sXDG
	inzYH6mEgAEPlh1VrTfVOn/NCNBJJ9lpD+AxKnaLIeWzTtBAxo2+7Y8B7/xdn/TpXW2i3D/jgj4/7
	m/pwOqWjtuI0iKJY0StHmWJPaOi0hJusyltKBeW3IpGL8vjmixq38USD8xqMs1ATDqxzsIwsK+HR7
	IZEmFnM7t4oCmp9bUnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWlq-00000006t30-0IXk;
	Mon, 26 Aug 2024 10:16:22 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWjq-00000006sJs-2018
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 10:14:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 360451BF205;
	Mon, 26 Aug 2024 10:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724667256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63n3Jl2nsBWMU2ihiTPBdKhMYxLqi8CUBs9STOJr28c=;
	b=G0M2Niwe9gemJqmnBgGwU3rwbuO2fL43CXicU+TBnK6y/W0QQJVcgaiPvk/cjaN1SLOm9k
	n2AKphjMYFbUJ+PHAo4q/tsJ9tW4ylD35oPNUGrqbOnyjw8hFsuGoRfsHLkL+LOrvhSkZ1
	mKeowrDUGSm4HLMG8M24BrQm32ytxg57RFlNj64hqhza8k1cAL8ZlG7x14jxBHAjrWcliR
	/zDDCUIsewjPSYYq4UKnhDD8bWmBcKoAw/cAWiDDJBFEGIdAQ9VytMs027bccx3DfhXEv1
	rf/oBbj9pwaJeBPsHlyoH/ghxyPGIPIaubKMlh1q7sYHvzhHUPA8LXfDctruCA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 3/9] mtd: spi-nand: Isolate the MTD read logic in a helper
Date: Mon, 26 Aug 2024 12:14:06 +0200
Message-ID: <20240826101412.20644-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-1-miquel.raynal@bootlin.com>
References: <20240826101412.20644-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_031418_840444_8768E33D 
X-CRM114-Status: GOOD (  13.77  )
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

There is currently only a single path for performing page reads as
requested by the MTD layer. Soon there will be two:
- a "regular" page read
- a continuous page read

Let's extract the page read logic in a dedicated helper, so the
introduction of continuous page reads will be as easy as checking whether
continuous reads shall/can be used and calling one helper or the other.

There is not behavioral change intended.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 40 ++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..9042a092687c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -630,25 +630,20 @@ static int spinand_write_page(struct spinand_device *spinand,
 	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
 }
 
-static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
-			    struct mtd_oob_ops *ops)
+static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
+					 struct mtd_oob_ops *ops,
+					 unsigned int *max_bitflips)
 {
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nanddev(mtd);
-	struct mtd_ecc_stats old_stats;
-	unsigned int max_bitflips = 0;
 	struct nand_io_iter iter;
 	bool disable_ecc = false;
 	bool ecc_failed = false;
-	int ret = 0;
+	int ret;
 
-	if (ops->mode == MTD_OPS_RAW || !spinand->eccinfo.ooblayout)
+	if (ops->mode == MTD_OPS_RAW || !mtd->ooblayout)
 		disable_ecc = true;
 
-	mutex_lock(&spinand->lock);
-
-	old_stats = mtd->ecc_stats;
-
 	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
 		if (disable_ecc)
 			iter.req.mode = MTD_OPS_RAW;
@@ -664,13 +659,33 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 		if (ret == -EBADMSG)
 			ecc_failed = true;
 		else
-			max_bitflips = max_t(unsigned int, max_bitflips, ret);
+			*max_bitflips = max_t(unsigned int, *max_bitflips, ret);
 
 		ret = 0;
 		ops->retlen += iter.req.datalen;
 		ops->oobretlen += iter.req.ooblen;
 	}
 
+	if (ecc_failed && !ret)
+		ret = -EBADMSG;
+
+	return ret;
+}
+
+static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
+			    struct mtd_oob_ops *ops)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct mtd_ecc_stats old_stats;
+	unsigned int max_bitflips = 0;
+	int ret;
+
+	mutex_lock(&spinand->lock);
+
+	old_stats = mtd->ecc_stats;
+
+	ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
+
 	if (ops->stats) {
 		ops->stats->uncorrectable_errors +=
 			mtd->ecc_stats.failed - old_stats.failed;
@@ -680,9 +695,6 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	mutex_unlock(&spinand->lock);
 
-	if (ecc_failed && !ret)
-		ret = -EBADMSG;
-
 	return ret ? ret : max_bitflips;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
