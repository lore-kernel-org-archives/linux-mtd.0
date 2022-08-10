Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E89C25B07
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 22:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWtwevWDd/acIp/4dEZz3M5F52lZ5UBGIqtz5MwoOgQ=; b=NIKqAYxEi45fbT
	6DJdfUCIyyrnn0SgKrGqqVmPcaXYLMUSnB7jE1WFuQ1mRGA8wj9aT3dM+1fzYBqXp3frxNIxtAj32
	yJNETRjJsSkhbkOCJNCrxgkh7UCteyTW73QYsLFmwWTWwHHTJepuqv+fe9BoZSZ5BfeO+S1cW9HsN
	pzSxl8hOMx3VIOhLfof6kl0KtXJ13GP6u1+Z2Xx0yLtJTiP0yfdoxkgy85SaWgJHCk/CofFvKaCrT
	becDWiy/GG5fXC+V3KvjDeyCMapefx6TVsy2CYoveG6ChRu93UVp0B0s4n/CpGNsE3gHniwLzDiEv
	taXxUUwpFi5MbdHC60Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrI-00Ferk-EV; Wed, 10 Aug 2022 22:07:24 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrD-00Feg7-ML
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 22:07:22 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id D92F82224F;
	Thu, 11 Aug 2022 00:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660169230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rCNyjvmL2t4xDROC5RIKvX+bOmZBVEh/OEx8VEUlcCg=;
	b=CggvKbqCKkt3vjgFSVDirO7LI3piTJ7r0rkYFWIONKsCaGrEdhMZowOkj52N3KlYvNGKr+
	JzarcodUcgH4bH2id5Q6iAsjj1p+simLbqWM3WG/KD+S6L66tk1kJlQbtkKqbxKsGV43Ay
	BJ75UV+6JM5J/wTcW/OQnYakQKHnEsQ=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 4/7] mtd: spi-nor: move function declaration out of sfdp.h
Date: Thu, 11 Aug 2022 00:06:51 +0200
Message-Id: <20220810220654.1297699-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220810220654.1297699-1-michael@walle.cc>
References: <20220810220654.1297699-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150720_054798_EEBBA637 
X-CRM114-Status: UNSURE (   9.78  )
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

sfdp.h should only contain constants related to the JEDEC SFDP
specification(s).

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.h | 2 ++
 drivers/mtd/spi-nor/sfdp.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..68aaccaa12d8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -701,6 +701,8 @@ int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
 int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
 				     const u8 *buf, size_t len);
 
+int spi_nor_parse_sfdp(struct spi_nor *nor);
+
 static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
 	return container_of(mtd, struct spi_nor, mtd);
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index bbf80d2990ab..c1969f0a2f46 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -107,6 +107,4 @@ struct sfdp_parameter_header {
 	u8		id_msb;
 };
 
-int spi_nor_parse_sfdp(struct spi_nor *nor);
-
 #endif /* __LINUX_MTD_SFDP_H */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
