Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C467AC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:58:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E5E6207CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 19:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="djAwtLl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E5E6207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yl4Qeyex1UTzpSfwz243vvQfCnYTgYDk5jE1aqNrz/0=; b=djAwtLl/sLQCBW
	mEV54cNDdCIkiJZ/PrrxZOPmbG6+fXYAaKH3VPGfSzt+n647Wg3PQi/iPPoeBHtPmaK4uFX3G7omu
	ODFaz60nv3CsyDUNVrAwzZI38lyw8KBMRVWWwb3cKUyAEhOG8aEAG7AFADRWzzZSg/qYsVd9dmfe6
	pjHPgDsRELStbgQGQyBw1yqvOD4S+BU7RMZx09J2jG/TJ4gk9m593o0jTEXlEOKpdaruPoUQGCkaT
	q83nRsfbFitZ5Tdjk1AvldK21s4AUJRrsjNVIl+lCbg+nv0R4jXAwX19AhFHfdt/PUUnmixgZKKin
	mXI4UGFmV5C1Z9qJ5H2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdfiP-0000Mr-Kx; Tue, 26 May 2020 19:58:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdfgq-0007TM-KU
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 19:56:46 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0359FC000C;
 Tue, 26 May 2020 19:56:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [RESEND v5 06/21] mtd: rawnand: Add an invalid ECC mode to
 discriminate with valid ones
Date: Tue, 26 May 2020 21:56:18 +0200
Message-Id: <20200526195633.11543-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_125644_812601_23E73322 
X-CRM114-Status: GOOD (  11.13  )
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

NAND ECC modes (or providers) have their own enumeration but, unlike
their algorithms counterpart, there is no invalid or uninitialized
value to discriminate between an error and having chosen a no-ECC
situation. Add an "invalid" entry for this purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 include/linux/mtd/rawnand.h      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a756f3193558..ef70ca0828c3 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5027,7 +5027,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 	if (err < 0)
 		return err;
 
-	for (i = 0; i < ARRAY_SIZE(nand_ecc_modes); i++)
+	for (i = NAND_ECC_NONE; i < ARRAY_SIZE(nand_ecc_modes); i++)
 		if (!strcasecmp(pm, nand_ecc_modes[i]))
 			return i;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 7b87c5dc89bd..8187056dd3a0 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -84,6 +84,7 @@ struct nand_chip;
  * Constants for ECC_MODES
  */
 enum nand_ecc_mode {
+	NAND_ECC_INVALID,
 	NAND_ECC_NONE,
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
