Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6011DCCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wN32Pqi+4oyUgeYWa4wMDtTFrFKettyqxCP6bVmwJSo=; b=UhSM6y1wmU6Ez2
	Fqy0HjTkK2cAvlpSACX82YVOmxLiSl/R2NEsgoPZ7esQXh5ASEHwOd74bXm0FvN60R5cT8qrNu5lp
	ze+PTC0rB4/AqG1jK2nRndKHquf+7k4xCWVeLtmaz8mDUrmYCZQ6zeIonzAa9GMv4VVt2Ib6qbe9O
	FyOI82BfDXf1oqYqlEgjQs9C9j0n6+w8UucDaoYUw97scmykseyTaB1j09EEM+jwib7B+5XH52QWq
	Pgy85ASgBCPU895gi6Ba2RpOlQRZ6l81L9SiBvAxqXJho/aw+5tlKcX0XpfZ09EL7M5B8Kg1r6XYq
	yTP9UJqZK+OcUmH41MHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswW-00000006Vib-2f87;
	Fri, 31 Oct 2025 17:29:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvc-00000006Uaa-3Lbd
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC7701A17C2;
	Fri, 31 Oct 2025 17:28:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C377360704;
	Fri, 31 Oct 2025 17:28:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 165131181800A;
	Fri, 31 Oct 2025 18:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FbpwgQnTShOmE9iJ48pWQGNuCt29TUQkvkRo0eiMaAQ=;
	b=DIRu8ElFiW438LrY4NcGm9oQrY4vcnzVQZPDi4iKKpm7/ZB5O8TtTmVe6jmnVn8enww1hF
	TgcfgIcqEJOfcxL9Zo84uvwVL8K578F/R+u40MqpF1FKPWjQrSvVCJRiaWVfbUQ6mppSwl
	JZHPJLSgvZsKqQA56q8FR8atFup6k9Ez/FhMA4uYEB1EytTfKHJjmZ/Hbx1clnU/p8kEW0
	29UVz8Y/carl6Ts2izQDq5ExeOOIMwBMAOVYQ2tk1iwezo+jv9gLjMEKE4KXr2YnhoB/3B
	KmpW2mJREmWKk6fnIPk3Ig1Vw7MkueGWUz8ZBAIK3Os9Sc+zn/icIiZDKS6GGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:08 +0100
Subject: [PATCH 24/28] mtd: spinand: Propagate the bus interface across
 core helpers
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-24-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102845_060113_461E5CFF 
X-CRM114-Status: GOOD (  11.76  )
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

For now all drivers provide SSDR variants only. When we add support for
ODTR modes, there will be a need to differentiate the type of variant we
target as well as the need to check if we support one or the other type
of operations.

Pass this parameter to lower level helpers, which for now is unused, in
order to simplify the patch introducing ODTR support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index fc7263fad7afbd084ecf015dd1d764d6683b46a8..0d98cc1d987e1f6387f6bb243cd3720949b01b0b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1325,7 +1325,8 @@ static void spinand_init_ssdr_templates(struct spinand_device *spinand)
 }
 
 static int spinand_support_vendor_ops(struct spinand_device *spinand,
-				      const struct spinand_info *info)
+				      const struct spinand_info *info,
+				      enum spinand_bus_interface iface)
 {
 	int i;
 
@@ -1346,7 +1347,7 @@ static int spinand_support_vendor_ops(struct spinand_device *spinand,
 }
 
 static const struct spi_mem_op *
-spinand_select_op_variant(struct spinand_device *spinand,
+spinand_select_op_variant(struct spinand_device *spinand, enum spinand_bus_interface iface,
 			  const struct spinand_op_variants *variants)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -1439,28 +1440,28 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
 
-		op = spinand_select_op_variant(spinand,
+		op = spinand_select_op_variant(spinand, SSDR,
 					       info->op_variants.read_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
 		spinand->ssdr_op_templates.read_cache = op;
 
-		op = spinand_select_op_variant(spinand,
+		op = spinand_select_op_variant(spinand, SSDR,
 					       info->op_variants.write_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
 		spinand->ssdr_op_templates.write_cache = op;
 
-		op = spinand_select_op_variant(spinand,
+		op = spinand_select_op_variant(spinand, SSDR,
 					       info->op_variants.update_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
 		spinand->ssdr_op_templates.update_cache = op;
 
-		ret = spinand_support_vendor_ops(spinand, info);
+		ret = spinand_support_vendor_ops(spinand, info, SSDR);
 		if (ret)
 			return ret;
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
