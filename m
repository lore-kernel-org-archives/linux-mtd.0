Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CBFC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F72207D8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="krWTQrCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F72207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=th9P7psl7LgHN+Uo2vy6HYGUWAmb0RTXHzO80JOWJsA=; b=krWTQrCGD/+D4H
	XAXPSXcAxUQPMOJQuyE4lPXha9Znwo4uM6pnssTSqTGvFjYTSw4v2WCwNvTW8h5gB5CkTVmLzV+Kt
	kyAIKbKFmHon4D/wkcnYCdlJwMl0gEpFtN/coFRchcdy19doogbb8y5laKYH4QrPiE+BnOK6rHrPt
	AJhvDJ4pckBdh06TYB+1a7/kDn3MWq3NeiqFKK+ry2dnGt5MHcKOMfji7S5xWqbBMN7BKW0qIj+rs
	Cw9DJhohfBHGEx6MeC2j1d2aOGO73/gZSXy3E76urt09yihlKxNBsjD8gHNSQRQV3BZ8eIMOKN1Zk
	W+DsZ8TyDg45PP4+Ts6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfhQ-00080y-DR; Tue, 26 May 2020 19:57:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdfgl-0007P4-QV
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:56:41 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 77F99C0009;
 Tue, 26 May 2020 19:56:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [RESEND v5 02/21] mtd: rawnand: Avoid a typedef
Date: Tue, 26 May 2020 21:56:14 +0200
Message-Id: <20200526195633.11543-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_125639_991979_B136BEC7 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In new code, the use of typedef is discouraged. Turn this one in the
raw NAND core into a regular enumeration.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c               | 4 ++--
 include/linux/mtd/rawnand.h                    | 6 +++---
 include/linux/platform_data/mtd-davinci.h      | 2 +-
 include/linux/platform_data/mtd-nand-s3c2410.h | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 384a9b2d1610..e2cdfbb45923 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5104,8 +5104,8 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 
 	/*
 	 * For backward compatibility we support few obsoleted values that don't
-	 * have their mappings into nand_ecc_modes_t anymore (they were merged
-	 * with other enums).
+	 * have their mappings into the nand_ecc_mode enum anymore (they were
+	 * merged with other enums).
 	 */
 	if (!strcasecmp(pm, "soft_bch"))
 		return NAND_ECC_SOFT;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 2804c13e5662..0911e845cced 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -83,14 +83,14 @@ struct nand_chip;
 /*
  * Constants for ECC_MODES
  */
-typedef enum {
+enum nand_ecc_mode {
 	NAND_ECC_NONE,
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_ON_DIE,
-} nand_ecc_modes_t;
+};
 
 enum nand_ecc_algo {
 	NAND_ECC_UNKNOWN,
@@ -362,7 +362,7 @@ static const struct nand_ecc_caps __name = {			\
  * @write_oob:	function to write chip OOB data
  */
 struct nand_ecc_ctrl {
-	nand_ecc_modes_t mode;
+	enum nand_ecc_mode mode;
 	enum nand_ecc_algo algo;
 	int steps;
 	int size;
diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
index 08e639e047e5..03e92c71b3fa 100644
--- a/include/linux/platform_data/mtd-davinci.h
+++ b/include/linux/platform_data/mtd-davinci.h
@@ -68,7 +68,7 @@ struct davinci_nand_pdata {		/* platform_data */
 	 * Newer ones also support 4-bit ECC, but are awkward
 	 * using it with large page chips.
 	 */
-	nand_ecc_modes_t	ecc_mode;
+	enum nand_ecc_mode	ecc_mode;
 	u8			ecc_bits;
 
 	/* e.g. NAND_BUSWIDTH_16 */
diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
index deb849bcf0ec..08675b16f9e1 100644
--- a/include/linux/platform_data/mtd-nand-s3c2410.h
+++ b/include/linux/platform_data/mtd-nand-s3c2410.h
@@ -49,7 +49,7 @@ struct s3c2410_platform_nand {
 
 	unsigned int	ignore_unset_ecc:1;
 
-	nand_ecc_modes_t	ecc_mode;
+	enum nand_ecc_mode	ecc_mode;
 
 	int			nr_sets;
 	struct s3c2410_nand_set *sets;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
