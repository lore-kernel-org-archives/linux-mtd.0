Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77368C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tr96SONpujyFqBWDWPJl2PhnDVa6AnMz2Lam3tFjv1E=; b=hiTUO9pJNzzlOc
	RCOnN+N4I/oezyoQdq19ZhCk7TQZHtnqI/kX8xEBCraTa+v0Xxo9CaQ9pj6gzqWr/hib0yc5+Ld1W
	5NB+LqXXP0gefVU9f7AWuQoc6+I4s5tY0W29QITlM9TZPilcSladujLzTez0V56egejQpRZCdouRT
	fG7F/CoQIcjW8dAwGHzpunLCeFV1lEtsJRQs0HBwrmcAl2kO0FzANaUT+fYKluACuX+fujN4yDwKR
	x2x1ofiXkE/F+qmKL1lBjyosaWIiMMboSHi84rWs0EKxKxD3+bueTLE4BhDLuDHxuLKcZcNasfZ90
	pllD3PLQE/oqAh+PZXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npVSK-00GIIS-7G; Fri, 13 May 2022 13:35:44 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npVSD-00GIDQ-UB
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 13:35:40 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1B5322224E;
 Fri, 13 May 2022 15:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652448929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lh+U1nOda0NfWwmDOTPUquxb7TCGhj6x58ZzYRjPX6s=;
 b=pVZMQFzcRU2XQkzbBw/yFO4g/TsrQlIiyZqHFvWyN2BqYIFDIlaTr9gs3/u1OANW56hJO/
 WojOnHdh5g7uhlcv9d3Xo82vkmNsHiKWlrEd0pwBc8KDuaSEXlLMBfwDoJ4IKo0JYJ1K5x
 uwu7/caqzng7tXPCASG4krs2f+q6Hks=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] mtd: spi-nor: move function declaration out of sfdp.h
Date: Fri, 13 May 2022 15:35:18 +0200
Message-Id: <20220513133520.3945820-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513133520.3945820-1-michael@walle.cc>
References: <20220513133520.3945820-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_063538_177883_D99AE3CF 
X-CRM114-Status: GOOD (  10.41  )
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
---
 drivers/mtd/spi-nor/core.h | 2 ++
 drivers/mtd/spi-nor/sfdp.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 61886868cd02..3a19b8092ab8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -694,6 +694,8 @@ int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
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
