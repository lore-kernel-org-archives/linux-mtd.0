Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE96C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRu2+TLLRtJ+MH+kNb6m4yixEGkRlJyXekQH67ZHL/A=; b=MKxp9HU5zUd/Km
	vphORilp4yEK7AiQwhR++zlD/oULqgI2+d3eQ3I4m/v0mo8/AG7+CLMb3afz79yw8I+hFWPeKcuEJ
	0jq6w1bWh+LgwuVtDWK4UaMI6+o1GCmk/QVAFAbJ9rF8/SrEiWd5+Jg8y+ayZiEAuo36rHjgDWNku
	qg9/rC5jGZYCmR97bx/CTMIVZFeGC4VGmO0ZIY88a/PRKva6Z9HPh1JYm1J1rXNmDopFsUpGw4liv
	81Vb7gOj8qNLHuqD89CVFOgCzpU6aPDxG9+j3dJcxAKaH9HbMIUN9UFWSl5U3RyHUkPm5Dc9aXI19
	MlyOOnvmjMMqgYdWwSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0T-00000005vTn-0JBm;
	Fri, 19 Apr 2024 14:14:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0P-00000005vR9-3Z2o
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 14:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37948619EE;
	Fri, 19 Apr 2024 14:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E07C3277B;
	Fri, 19 Apr 2024 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713536060;
	bh=p/3JPIvR/iX1VY60SIuTHKNJqMHHtyy/NyXLubcttms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJVVUFV02+KHL3buUmmT6Sw5mV7TaTRqwi/xOTm6e/qPBQK/6S5Qlx4wXwoWL1fzz
	 FQvNPvlQ2aVg3S3LnsuwQ5E6bHxfRg5eszKSVQ9GPpPMuA05ouaGbJ3CDiRHMPje1G
	 a3cvjuMayNDtGnQfBP3LIkplmXPKrhXjtePh8vd9FBGGfM9gtqZEFvrUre3v9+IyeN
	 duB8CzM2Z4GePy/DWd7Eq1FjsJsfM7eGN+Qv7eH1L7s8h6NyhnD+vR56qBZ/Nxb9n9
	 pZTh1IT/0liGLNoCDFN1KMaVeMn3U/yhRWIoq7kcgvT6suf/3+b+l/Xzos18P+87q5
	 XjSZ/0xYRt6VQ==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 6/6] mtd: spi-nor: introduce support for displaying deprecation message
Date: Fri, 19 Apr 2024 16:12:49 +0200
Message-Id: <20240419141249.609534-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419141249.609534-1-mwalle@kernel.org>
References: <20240419141249.609534-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_071421_970154_D6673E3E 
X-CRM114-Status: GOOD (  16.83  )
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

SPI-NOR will automatically detect the attached flash device most of the
time. We cannot easily find out if boards are using a given flash.
Therefore, add a .deprecation_version to the flash_info struct which
indicates the kernel version after which the driver support will be
removed.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 11 ++++++++++-
 drivers/mtd/spi-nor/core.h |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8e4ae1317870..bed5209b94de 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3323,7 +3323,16 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	 * some partitions may be marked read-only, and we don't want to loose
 	 * that information, even if it's not 100% accurate.
 	 */
-	return jinfo ?: info;
+	if (jinfo)
+		info = jinfo;
+
+	if (info && info->deprecation_version)
+		pr_warn("Your board is using a SPI NOR flash (%s) with deprecated driver\n"
+			"support. It will be removed after kernel version %s.\n"
+			"If you feel this shouldn't be the case, please contact us at\n"
+			"linux-mtd@lists.infradead.org\n",
+			info->name, info->deprecation_version);
+	return info;
 }
 
 static u32
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37..984155d10fd8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -447,6 +447,8 @@ struct spi_nor_id {
  * @id:   pointer to struct spi_nor_id or NULL, which means "no ID" (mostly
  *        older chips).
  * @name: (obsolete) the name of the flash. Do not set it for new additions.
+ * @deprecation_version:      the kernel version after which the support for
+ *	                      this flash will be removed.
  * @size:           the size of the flash in bytes.
  * @sector_size:    (optional) the size listed here is what works with
  *                  SPINOR_OP_SE, which isn't necessarily called a "sector" by
@@ -504,6 +506,7 @@ struct spi_nor_id {
 struct flash_info {
 	char *name;
 	const struct spi_nor_id *id;
+	const char *deprecation_version;
 	size_t size;
 	unsigned sector_size;
 	u16 page_size;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
