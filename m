Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7C7C04AB6
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 21:54:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5620120873
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 21:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h1wWeoia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5620120873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFQzsC1T+U6d3wjuJY17EBegGQnMLXhb5qY9hsXrBhM=; b=h1wWeoia6S8bxm
	sQ+l6bXtXXUytdU7FqTfxBCUmGXZhb2+xVShrW6oHvH86aOQeTNNuv9OZkQS8R8cVoHLiot134kYH
	k6wj4CjmbkwEx3Qyqjsq4RR+CxCTlT43X9cKcUmPeBhtFu3Lil9ltduxYZ8tIhN37mGQJ6Kg3YCPj
	q6Dz3fua0zTQUjD4+8t0nmc/fFLaX21Kd4H+rAJSkI86X+ZVDaMu3wFAL0NcxOiPFZ95cRY/xweC0
	1SkjXyG01BbrF3frwZwcUlmQeiQz/nFANrUgXtrVy+3vwxOPDkvgFNpaVTbPQ7I+cBYBMWzSCc5jp
	geuwjpUZNegDCVLUWSkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQfNA-0004rx-ER; Tue, 14 May 2019 21:54:08 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQfN7-0004rg-RQ
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 21:54:07 +0000
Received: from allycomm.com (inet.guidewire.com [199.91.42.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 2633E3B813;
 Tue, 14 May 2019 14:54:04 -0700 (PDT)
From: Jeff Kletsky <lede@allycomm.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v2 1/3] mtd: spinand: Add #define-s for page-read ops with
 three-byte addresses
Date: Tue, 14 May 2019 14:53:13 -0700
Message-Id: <20190514215315.19228-2-lede@allycomm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514215315.19228-1-lede@allycomm.com>
References: <20190514215315.19228-1-lede@allycomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_145405_890860_D32AEF1E 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jeff Kletsky <git-commits@allycomm.com>

The GigaDevice GD5F1GQ4UFxxG SPI NAND utilizes three-byte addresses
for its page-read ops.

http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/

Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>
---
 include/linux/mtd/spinand.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index b92e2aa955b6..05fe98eebe27 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -68,30 +68,60 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(fast, addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
+		   SPI_MEM_OP_ADDR(3, addr, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 1))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_X2_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 2))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(addr, ndummy, buf, len)	\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
+		   SPI_MEM_OP_ADDR(3, addr, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 2))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_X4_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 4))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(addr, ndummy, buf, len)	\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
+		   SPI_MEM_OP_ADDR(3, addr, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 2),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 2))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP_3A(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
+		   SPI_MEM_OP_ADDR(3, addr, 2),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 2))
+
 #define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 4),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 4))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP_3A(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
+		   SPI_MEM_OP_ADDR(3, addr, 4),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4))
+
 #define SPINAND_PROG_EXEC_OP(addr)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
