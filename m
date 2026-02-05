Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91E9ECD996
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 18:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A0BKnj5ydFZeooeYrB5pZR6PPcYO8qYW7dKBzc4DXp8=; b=092uL/Wl68xU6n
	VkfbviSKq1Cim1fXqrih7QQe9X250eFa6znhimc5cquZEZtIpRszuheqiqGwveyrMynhRSHPC3yRa
	PcWBoep4zVSUD5hMsY6S+CJdsuDav4dyyWu2kHKdKnvqieMv447CltQm4ZDck85VGQn6GKk4VAHM8
	0Tnr5s469hkEGF2BKRUtW5Ry4F7LAzj636S8da1X+ytbHKLH+s1L20MLkCpdlar6yDEmOIuc2c5w3
	PCVdg5g8UX/g5HHKv8cSIL0OsoNP+OJ5AY9cKHXwa42fik5EZd7Qxfrjo7l/XPxUFKrW73eYFkVKi
	V3NV79scZQ9cNcEdBHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4Q9-0000000AONT-3hD5;
	Thu, 05 Feb 2026 18:49:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4Pt-0000000AOKw-3IfP
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 18:49:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DBFE34E42428;
	Thu,  5 Feb 2026 18:49:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 934DB6074D;
	Thu,  5 Feb 2026 18:49:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D567119D171A;
	Thu,  5 Feb 2026 19:49:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770317361; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3R3VGTqZaQmqQODMD2DgZJ69im+XnbWf7hmS2rClmfo=;
	b=Sf4K2t52dY/0Eu4+KBaf53PmKiO/gGzmZyvqma+AsNfdnSMETP7wO0kHYSmVdOhTC+UhPw
	yMdPtumsuM92rdEL0g+gQVirWLbic0qDM2uTlhvnin21v9hxBlnwP4bwsJfmMXvh8Gvxpj
	e56I0lhECcs17DxMd4P2uJ4CEhsRlf/QulOrIzDuYYRWkstzSWgTtgehWCO6XW+KNvfxB5
	Ji4B7gt1XAHLjxO/ccRdtNKRRH+hZJuFUvFRw6wTGV6xsCOQWFPWoqwzVQ06cZ7f6ZDK3a
	ZuCw+Cm/krnX88fbyJefWlzFWmFAjyp1xhH7TTZXyfXecM9OchR2DDkNMaaNVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: spinand: Clean the flags section
Date: Thu,  5 Feb 2026 19:49:15 +0100
Message-ID: <20260205184916.1094036-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_104926_553832_B9C57E40 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Mention that we are declaring the main SPI NAND flags with a comment.
Align the values with tabs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6a024cf1c53a..58abd306ebe3 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -477,8 +477,9 @@ struct spinand_ecc_info {
 	const struct mtd_ooblayout_ops *ooblayout;
 };
 
-#define SPINAND_HAS_QE_BIT		BIT(0)
-#define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+/* SPI NAND flags */
+#define SPINAND_HAS_QE_BIT				BIT(0)
+#define SPINAND_HAS_CR_FEAT_BIT				BIT(1)
 #define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
