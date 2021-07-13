Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4255C07E96
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B2A6127C
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B2A6127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYLmAW4vCiQ0kWsLvv/YHENEsqB24Pq7owQolqB7Yes=; b=bqDJukdnGidU62
	Dr75mI4RZtEgaM2DlRGe1pTfuMTwKgbczNQeCXLNNKn11tiOOoNtnC15wmSLfDP1CnlaSsq6d7m35
	aJsC0sLlhXL0leTuXEP1m2ke5R6QULzpYQwK5ctl0z9LKzSiOwoQGBl0ycKBm2vv14Sh+9o6a0b7p
	SlhnzTMRKzolR8Z9WdYBQu9o9yA/K0uFwcRVQ7ay94oj2xX3L6UiGQwtG/SWHHyd74j3SBfT50u8W
	qzxcogNJjn0jFjH90J3r2SR8KxG9B1+kkDU7P2ED3yfX9d9lVINI5jqAwZtLYX6rcBJKes7AyybUE
	kPdEcqHTDheSS1xW9LWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I73-00ASJ0-Tt; Tue, 13 Jul 2021 13:06:13 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I6n-00ASED-QE
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:01 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5owV010324;
 Tue, 13 Jul 2021 08:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181550;
 bh=JcxS3BPguGIKB8ChrouzPygyBytSZSyQOD4ZRpL493I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ydMJdmdxIpEcMC1t2f4eKKJnktpW8HIXfTeWQ6LHPZlQuqbtjt1djkbeBSdI8l4Ap
 8dQ7P2ulwRuaF18N2HyPyF2JuRGbaoh3qTt82TENYPi+9K9879qUANPmdp/Kj8/UMr
 wePtnFI7zrxy4w0FmFIuFMRBeWLPBHvZhfgc6DiA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD5oCi085738
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:05:50 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:05:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:05:49 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daB109825;
 Tue, 13 Jul 2021 08:05:45 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 01/13] spi: spi-mem: Add DTR templates for cmd, address,
 dummy and data phase
Date: Tue, 13 Jul 2021 13:05:26 +0000
Message-ID: <20210713130538.646-2-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060557_973792_AB18CBC5 
X-CRM114-Status: GOOD (  11.02  )
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

Setting dtr field of spi_mem_op is useful when creating templates
for DTR ops in spinand.h. Also, 2 bytes cmd phases are required when
operating in Octal DTR SPI mode.

Create new templates for dtr mode cmd, address, dummy and data phase
in spi_mem_op, which set the dtr field to 1 and also allow passing
the nbytes for the cmd phase.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 include/linux/spi/spi-mem.h | 87 ++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 26 deletions(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85e2ff7b840d..73e52a3ecf66 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -13,46 +13,81 @@
 
 #include <linux/spi/spi.h>
 
-#define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
-	{							\
-		.buswidth = __buswidth,				\
-		.opcode = __opcode,				\
-		.nbytes = 1,					\
+#define SPI_MEM_OP_CMD_ALL_ARGS(__nbytes, __opcode, __buswidth, __dtr)	\
+	{								\
+		.buswidth = __buswidth,					\
+		.opcode = __opcode,					\
+		.nbytes = __nbytes,					\
+		.dtr = __dtr,						\
 	}
 
-#define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
-	{							\
-		.nbytes = __nbytes,				\
-		.val = __val,					\
-		.buswidth = __buswidth,				\
+#define SPI_MEM_OP_CMD(__opcode, __buswidth)				\
+	SPI_MEM_OP_CMD_ALL_ARGS(1, __opcode, __buswidth, 0)
+
+#define SPI_MEM_OP_CMD_DTR(__nbytes, __opcode, __buswidth)		\
+	SPI_MEM_OP_CMD_ALL_ARGS(__nbytes, __opcode, __buswidth, 1)
+
+#define SPI_MEM_OP_ADDR_ALL_ARGS(__nbytes, __val, __buswidth, __dtr)	\
+	{								\
+		.nbytes = __nbytes,					\
+		.val = __val,						\
+		.buswidth = __buswidth,					\
+		.dtr = __dtr,						\
 	}
 
+#define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)			\
+	SPI_MEM_OP_ADDR_ALL_ARGS(__nbytes, __val, __buswidth, 0)
+
+#define SPI_MEM_OP_ADDR_DTR(__nbytes, __val, __buswidth)		\
+	SPI_MEM_OP_ADDR_ALL_ARGS(__nbytes, __val, __buswidth, 1)
+
 #define SPI_MEM_OP_NO_ADDR	{ }
 
-#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)			\
-	{							\
-		.nbytes = __nbytes,				\
-		.buswidth = __buswidth,				\
+#define SPI_MEM_OP_DUMMY_ALL_ARGS(__nbytes, __buswidth, __dtr)		\
+	{								\
+		.nbytes = __nbytes,					\
+		.buswidth = __buswidth,					\
+		.dtr = __dtr,						\
 	}
 
+#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)				\
+	SPI_MEM_OP_DUMMY_ALL_ARGS(__nbytes, __buswidth, 0)
+
+#define SPI_MEM_OP_DUMMY_DTR(__nbytes, __buswidth)			\
+	SPI_MEM_OP_DUMMY_ALL_ARGS(__nbytes, __buswidth, 1)
+
 #define SPI_MEM_OP_NO_DUMMY	{ }
 
-#define SPI_MEM_OP_DATA_IN(__nbytes, __buf, __buswidth)		\
-	{							\
-		.dir = SPI_MEM_DATA_IN,				\
-		.nbytes = __nbytes,				\
-		.buf.in = __buf,				\
-		.buswidth = __buswidth,				\
+#define SPI_MEM_OP_DATA_IN_ALL_ARGS(__nbytes, __buf, __buswidth, __dtr)	\
+	{								\
+		.dir = SPI_MEM_DATA_IN,					\
+		.nbytes = __nbytes,					\
+		.buf.in = __buf,					\
+		.buswidth = __buswidth,					\
+		.dtr = __dtr,						\
 	}
 
-#define SPI_MEM_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
-	{							\
-		.dir = SPI_MEM_DATA_OUT,			\
-		.nbytes = __nbytes,				\
-		.buf.out = __buf,				\
-		.buswidth = __buswidth,				\
+#define SPI_MEM_OP_DATA_IN(__nbytes, __buf, __buswidth)			\
+	SPI_MEM_OP_DATA_IN_ALL_ARGS(__nbytes, __buf, __buswidth, 0)
+
+#define SPI_MEM_OP_DATA_IN_DTR(__nbytes, __buf, __buswidth)		\
+	SPI_MEM_OP_DATA_IN_ALL_ARGS(__nbytes, __buf, __buswidth, 1)
+
+#define SPI_MEM_OP_DATA_OUT_ALL_ARGS(__nbytes, __buf, __buswidth, __dtr)\
+	{								\
+		.dir = SPI_MEM_DATA_OUT,				\
+		.nbytes = __nbytes,					\
+		.buf.out = __buf,					\
+		.buswidth = __buswidth,					\
+		.dtr = __dtr,						\
 	}
 
+#define SPI_MEM_OP_DATA_OUT(__nbytes, __buf, __buswidth)		\
+	SPI_MEM_OP_DATA_OUT_ALL_ARGS(__nbytes, __buf, __buswidth, 0)
+
+#define SPI_MEM_OP_DATA_OUT_DTR(__nbytes, __buf, __buswidth)		\
+	SPI_MEM_OP_DATA_OUT_ALL_ARGS(__nbytes, __buf, __buswidth, 1)
+
 #define SPI_MEM_OP_NO_DATA	{ }
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
