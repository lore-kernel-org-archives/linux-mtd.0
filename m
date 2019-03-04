Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA96C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:32:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74DE920823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mzdsvUo5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74DE920823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJGZBlyUVypzxXpXj7X3xyCvxf2v8aaJfxtYwHqecQk=; b=mzdsvUo5pL6Ryo
	Z+aqSeKsxWdmIbMn/2bM9r8w0sHgQFxb8zdcN7OwBfM2NxpQdFehXrZLjql/Lg+bu3b2J/8RSsA4D
	5gAwvTOC+npb7gtoKzLyMCYACi2z5HQg6nqhwhUhQVsZmsLYTQsl51XYjFztPeAm4yECr0L39LEcc
	u1Ll+DgZW10Gd7iGeOPDYYMcg029Z3ZDsZF6R0oa4Vo39pREaXSgX4V4tckZeUIqrjx/RvKliqHaH
	b25zMK713nG02nxDuWYK1NNHxZ+lBwzDyy2dqUxhjljZZPlgAZGitsy61PavzuER075YrHNl1QHbS
	Xr+QcZUY0p6+u4ddWgkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0w8g-0001qL-Tn; Mon, 04 Mar 2019 22:32:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w7R-0000CG-HP; Mon, 04 Mar 2019 22:31:55 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E05C8240003;
 Mon,  4 Mar 2019 22:31:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 31/36] mtd: nand: Let on-die ECC engines be retrieved from
 the NAND core
Date: Mon,  4 Mar 2019 23:28:36 +0100
Message-Id: <20190304222841.13899-32-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_143134_089688_45B5C6CE 
X-CRM114-Status: GOOD (  10.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Before making use of the ECC engines, we must retrieve them. Add the
boilerplate for the on-die ones.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/engine.c | 6 ++++++
 include/linux/mtd/nand.h      | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/ecc/engine.c b/drivers/mtd/nand/ecc/engine.c
index 4345124e01bf..2464b7dea062 100644
--- a/drivers/mtd/nand/ecc/engine.c
+++ b/drivers/mtd/nand/ecc/engine.c
@@ -470,6 +470,12 @@ struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand)
 }
 EXPORT_SYMBOL(nand_ecc_get_sw_engine);
 
+struct nand_ecc_engine *nand_ecc_get_ondie_engine(struct nand_device *nand)
+{
+	return nand->ecc.ondie_engine;
+}
+EXPORT_SYMBOL(nand_ecc_get_ondie_engine);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c68060cebc86..3498d22fe893 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -248,6 +248,7 @@ int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req, void *oobbuf);
 bool nand_ecc_correction_is_enough(struct nand_device *nand);
 struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand);
+struct nand_ecc_engine *nand_ecc_get_ondie_engine(struct nand_device *nand);
 
 /**
  * struct nand_ecc - High-level ECC object
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
