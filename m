Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658D5C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24BFB611C0
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24BFB611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCusIi2yNiehO6j7YI/5yln4lwLbOhQ3KbjgMiDgUJ4=; b=luzEzZp/z11Sag
	pkU4wbzpePDgU7CplbKFjy3zx3J0E5hZyg9nG68f0pf78X62P3B5sExrJ67027G5HpU1a00zdUr9N
	ehbWZ81qT6qnVf4Q3icKb9qpkcGboUfBYg5FvbIj6k4JBEUy5BOPVsThgZJMfRVnXoLSrJ5TYP2UE
	4DR55vIFMTQIOUHNTZd+rQzSq1FKPB0se2L1v/punFNtJx6lVCB4EpLt/qN+MYbNA2fOoJWopXjho
	anhQ1kQCCYJaU1riAGQQJuP1UmmB/Pw4suFWldO1b1JiyfFV+qkcmC0ofBI9NA32XBZNHC8NVFUcG
	5dIGRvTpU6WzfA9diLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I96-00AT0H-J4; Tue, 13 Jul 2021 13:08:20 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I7A-00ASKV-AU
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD6EvV010456;
 Tue, 13 Jul 2021 08:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181574;
 bh=uFIGS9or9g64JHvjFEOHyBuSmYIom1KO6yATBzd+i8k=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uXgdlz99rwGtyDbU1ZNcol1HBO9+0TQptkJXdmv1rnSQL1KjdLZIAEqMseSp8QYY1
 X4kPmTfA2wbn3MNn2q0MV7DlaLyg1TMxGgGuRBF5s5srcKEY09PJuvMobWi6cw/P9I
 X7zJHw8PgILxwfP9yF/sRgu90zv5exmLGOSPLaIE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD6E0x004685
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:06:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:06:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:06:13 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daG109825;
 Tue, 13 Jul 2021 08:06:09 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 06/13] mtd: spinand: Add macros for Octal DTR page read and
 write operations
Date: Tue, 13 Jul 2021 13:05:31 +0000
Message-ID: <20210713130538.646-7-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060620_486409_AE80558E 
X-CRM114-Status: UNSURE (   8.77  )
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

Define new PAGE_READ_FROM_CACHE and PROG_LOAD op templates for Octal
DTR SPI mode. These templates would used in op_variants and
op_templates for defining Octal DTR read from cache and write to
cache operations.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 include/linux/mtd/spinand.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index ebb19b2cec84..35816b8cfe81 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -122,6 +122,12 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 4))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_OCTALIO_DTR_OP(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD_DTR(2, 0x9d9d, 8),			\
+		   SPI_MEM_OP_ADDR_DTR(2, addr, 8),			\
+		   SPI_MEM_OP_DUMMY_DTR(ndummy, 8),			\
+		   SPI_MEM_OP_DATA_IN_DTR(len, buf, 8))
+
 #define SPINAND_PROG_EXEC_OP(addr)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
@@ -140,6 +146,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(len, buf, 4))
 
+#define SPINAND_PROG_LOAD_OCTALIO_DTR(reset, addr, buf, len)		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD_DTR(2, reset ? 0x0202 : 0x8484, 8),	\
+		   SPI_MEM_OP_ADDR_DTR(2, addr, 8),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT_DTR(len, buf, 8))
+
 #define SPINAND_PROTO_BUSWIDTH_MASK	GENMASK(6, 0)
 #define SPINAND_PROTO_DTR_BIT		BIT(7)
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
