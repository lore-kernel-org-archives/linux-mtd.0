Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCB8C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 17:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D83E92065D
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 17:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fhwd58VM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D83E92065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCq4CLgjiLbbvtXeX9xf4PzTL8/1NuB1faTOuMp/iNs=; b=fhwd58VMRQhjPy
	pb6LfB7k6SWY+tjtnLU7oAb3MRf7EKSdNZD3t+QZ2yYlXDCxLVsBLPPwrmw6HQ0mZWzsACpYmjw3k
	OS6npuKR0XfOXNgAJBmT/yee9XnGwBbTFfAZShchn/TFIwdeYNfHdqJulECTeLlkrSvB8W+MC692j
	XSO/QCIhkdd17sPUvf5MoLGNGZnxWRDfBc3fIoVmMVB8SuSPMt2V0z2nHf2zOXShe7Y46RyqImbl7
	KnoUUOd1nrKUhjuTYFHK8xdLQGzMoPdRBzEoprYG/rOA16lirLN53zkr8pCyfLrkGTFfwltBSAUh/
	FMugOvLFFMv6qt/uskxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZHbd-0000Mf-RY; Thu, 14 May 2020 17:25:13 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZHU3-0005FU-F7; Thu, 14 May 2020 17:17:25 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D785E24000A;
 Thu, 14 May 2020 17:17:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v5 13/21] mtd: rawnand: Drop the legacy ECC type enumeration
Date: Thu, 14 May 2020 19:16:43 +0200
Message-Id: <20200514171651.24851-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514171651.24851-1-miquel.raynal@bootlin.com>
References: <20200514171651.24851-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_101723_661538_0B28BAD9 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that all files have been migrated to use the new enumeration, drop
the old one which is unused.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c |  8 --------
 include/linux/mtd/rawnand.h      | 12 ------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 130db134bd58..59a66c641db0 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4959,14 +4959,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	return ret;
 }
 
-static const char * const nand_ecc_modes[] = {
-	[NAND_ECC_NONE]		= "none",
-	[NAND_ECC_SOFT]		= "soft",
-	[NAND_ECC_HW]		= "hw",
-	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
-	[NAND_ECC_ON_DIE]	= "on-die",
-};
-
 static const char * const nand_ecc_engine_providers[] = {
 	[NAND_ECC_ENGINE_NONE] = "none",
 	[NAND_ECC_ENGINE_SOFT] = "soft",
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index ce7f1f301bf6..a41225b8f6fb 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -80,18 +80,6 @@ struct nand_chip;
 
 #define NAND_DATA_IFACE_CHECK_ONLY	-1
 
-/*
- * Constants for ECC_MODES
- */
-enum nand_ecc_mode {
-	NAND_ECC_INVALID,
-	NAND_ECC_NONE,
-	NAND_ECC_SOFT,
-	NAND_ECC_HW,
-	NAND_ECC_HW_SYNDROME,
-	NAND_ECC_ON_DIE,
-};
-
 /**
  * enum nand_ecc_engine_type - NAND ECC engine type/provider
  * @NAND_ECC_ENGINE_INVALID: Invalid value
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
