Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D632C04FF8
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0eqkgwRqItnUlFb5VwH1Slm6C27QdenxzJVdfJQczQ=; b=We/Y/74a+tT/G1
	B5Oje7iYGyTLQQIUrmRFl+0i+d5P0+6kQcq8sFoBuUmzpHCSMoPxzgUV2Jm1WY1D/7btIKyhW2arA
	akCmkniFbMASu1yw/PTbdx2Y4DAm2Vc/PpgYU0llV4nCob54h296HjgDWFNLQFCkkvnN6YJjgxcio
	yrqIv3x8dSHGOrBjkPR/RyG3LPCy3QKyP2kcyeFpuX+2D2meU5CdIkCIOM/gLmXlJZiP7iUE3bivM
	vxFzvFozB92ThRjMozaHt5YUQp7GWwImrrNojlQmTEbMMNFuFYM4V6LXhZPk2uk5BpsFiZeWr8Rq6
	+nLQ1wlq+ThwqwKzezfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCu-0000000HOWQ-3F7p;
	Fri, 12 Apr 2024 13:44:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCe-0000000HOH5-3PMs
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 254DACE393B;
	Fri, 12 Apr 2024 13:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123BCC2BD10;
	Fri, 12 Apr 2024 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712929467;
	bh=Hetc/oU2jZtMC9jkGVkbwuLoaws05Gs3ek4EybKWEMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3HBauPOR0oPi0tOF6mEj1wDwCkaBlUi0Wq3QWcIVW9hWixJ5AS2Lk0mbuRzp/jlR
	 WR09bQOmjRCBddX2sOdOldFbb5tO8hV48GbfdiFN38I7dFHw3k8+204OdsN8XIRyKF
	 dKt6879LcC3LGSn/1GlzpKlGu7TLiM39ugnpnw6BviHV3Uhjy4JCvQ/Di+CUAV7OOG
	 J4JuW05KVu7JRdIPRi5sI1YcWcfLQOiaeFVqUw4XSAhRt9tiY9wkuExoWEo7J90egI
	 HgzcXod64yKmBDtjZ16XaiMs3vJDDjGm0L0CMB9laMEsOOIkyO4cqH9um7MoHfLYeC
	 M3YPWXWYucP1g==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH v1 6/6] mtd: spi-nor: introduce support for displaying deprecation message
Date: Fri, 12 Apr 2024 15:44:05 +0200
Message-Id: <20240412134405.381832-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412134405.381832-1-mwalle@kernel.org>
References: <20240412134405.381832-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064429_266343_6A2275A7 
X-CRM114-Status: GOOD (  13.89  )
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
Therefore, introduce a (temporary) flag to display a message on boot if
support for a given flash device is scheduled to be removed in the
future.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 12 ++++++++++++
 drivers/mtd/spi-nor/core.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 58d310427d35..a294eef2e34a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3312,6 +3312,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 						       const char *name)
 {
 	const struct flash_info *jinfo = NULL, *info = NULL;
+	const char *deprecated = NULL;
 
 	if (name)
 		info = spi_nor_match_name(nor, name);
@@ -3326,6 +3327,17 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 			return jinfo;
 	}
 
+	if (info && (info->flags & SPI_NOR_DEPRECATED))
+		deprecated = info->name;
+	else if (jinfo && (jinfo->flags & SPI_NOR_DEPRECATED))
+		deprecated = jinfo->name;
+
+	if (deprecated)
+		pr_warn("Your board or device tree is using a SPI NOR flash (%s) with\n"
+			"deprecated driver support. It will be removed in future kernel\n"
+			"version. If you feel this shouldn't be the case, please contact\n"
+			"us at linux-mtd@lists.infradead.org\n", deprecated);
+
 	/*
 	 * If caller has specified name of flash model that can normally be
 	 * detected using JEDEC, let's verify it.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8552e31b1b07..0317d8e253f4 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -524,6 +524,7 @@ struct flash_info {
 #define SPI_NOR_NO_ERASE		BIT(6)
 #define SPI_NOR_QUAD_PP			BIT(8)
 #define SPI_NOR_RWW			BIT(9)
+#define SPI_NOR_DEPRECATED		BIT(15)
 
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
