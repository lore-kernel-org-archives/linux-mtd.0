Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A57606A885
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 02:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NTJkbXjA;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rhazpaYn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hgGNvb0XcH0qQtK+SPdzNzqlszEgAOB7v+KlnFxuI5k=; b=NTJkbXjAKRy8C3PwYLzfCHBw/3
	ACVAsQjmKgfj6GTgDJa+Ly7u5DNG1s9bFLVxIWyl1/oqibIQNdCZp+sO+bcKCMKta6+EE32nS1NQq
	+o3uHRq4HjBYSfk7Q+pNCR7cOuTaLncsN36hoU/vLGHyj+SlWqGUiNDQAIOJyq18hXg2dmaRfXNNR
	YsIisYm23EEeKzTIEv3hjm6MeC2z0Yd4yIBR+lpifq9vfRDkZ1ItO27CCSWTSqU3RduWp/DiyXniu
	24dzOIBd+MJVf1qJ2loQw9o1QT2P3MPNoL9LCkGEj8/wcAUQK/Nf34J1zxw49+59USpd1crFHCmvc
	7Eo9a5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVAU-00000007W6G-1SRK;
	Wed, 18 Nov 2026 02:13:02 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVAR-00000007W5N-14Fi
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 02:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rhazpaYnIPgI0eB2VZF9TPkTgw5xsk1Ol1MUD/zL4SzRF6pNEISmJ3e5wnBzvYZMuPj19pLJeQESp
	 gGI9BvpqEwSDGMcAgvS2dXthpA+U3DfiKA3cxSydPLiOLZ0eGDXjXqmHrM95Sy4dqyQArAlF58SdQs
	 UugpxAjI7vz6aIuU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd09a2ef5-ae2c3;
	Wed, 18 Nov 2026 10:12:51 +0800 (CST)
X-RM-TRANSID: 2ee46afd09a2ef5-ae2c3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afd09a1cf7-c5347;
	Wed, 18 Nov 2026 10:12:51 +0800 (CST)
X-RM-TRANSID: 2ee66afd09a1cf7-c5347
From: zhaofeng2@cmss.chinamobile.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 1/2] mtd: rawnand: parse GPIO CS with devm_gpiod_get_index_optional()
Date: Wed, 18 Nov 2026 10:12:46 +0800
Message-ID: <20261118021248.1952-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_181259_859487_8813509C 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

rawnand_dt_parse_gpio_cs() acquires the CS GPIO descriptors with
gpiod_get_index_optional() and hands them to the caller, which must
release them on error and at remove time.  If a later loop iteration
fails, the descriptors acquired so far are leaked as well.

Acquire them with devm_gpiod_get_index_optional() instead, so the
device-managed framework releases them on probe failure and at device
removal, and its only caller, the arasan driver, can drop its manual
gpiod_put() bookkeeping.

Fixes: b85c943d181a ("mtd: rawnand: Add a helper to parse the gpio-cs DT property")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
'cs_array' is already devm-allocated, so after this change both the
descriptors and the array are released by devres.

v2: respun to use devm_gpiod_get_index_optional() per Sashiko's review
    and Miquel's request (managed version instead of manual rollback).

Verified against current upstream master.  Not runtime-tested (no
hardware using gpio-cs).

 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5479,8 +5479,8 @@
 		return -ENOMEM;
 
 	for (i = 0; i < ndescs; i++) {
-		descs[i] = gpiod_get_index_optional(dev, "cs", i,
-						    GPIOD_OUT_HIGH);
+		descs[i] = devm_gpiod_get_index_optional(dev, "cs", i,
+							 GPIOD_OUT_HIGH);
 		if (IS_ERR(descs[i]))
 			return PTR_ERR(descs[i]);
 	}



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
