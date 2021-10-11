Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CBAC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4780560462
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4780560462
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whQhcWCML/hYA1W5Gwba3GhwyReDeBDTZBaqLwRTdUs=; b=iSuco1S0BS15nJ
	YSmVJJwosIVqQAvTs42RYVHWNX2j5iqIaOrMd6LZOMXPmr5iHDFF0feCyqaLyAep0GlRRtzStlhjw
	hpmsIt0ypVF/ceLbbIOMtaj6nWOJgyljuqXNeO0/28VkQvfe/WJFC++LRzLPox7D1RjMLFirVw0gr
	/McQ4/wn5J0yqxMek6FyrkoZIDS0TUVnUrQi5PpO6omNPuqzYV0IZ+DwTBAAL+X6NsUZDUgtqCYsJ
	O5FumJ1l34lp7z+0sgYgaJedZscjh/WGTn/mH22ljr7+gRlZ8j99DJFWMvX4zGdxMjfe74/ov1LZJ
	xwGbV7qY3VSkwprjYZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2CG-00AdSb-Tb; Mon, 11 Oct 2021 20:46:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2C2-00AdQ3-Mo
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:46:44 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkW0m070905;
 Mon, 11 Oct 2021 15:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985192;
 bh=mqz2lz88cZxIXXKJa69T+JAfW3Se31KHQgsxwq0MR14=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=i/RHTVViOUe5kHGTH96/fPfBsPvSKzrYa27+hwWI6XNv4aJUBy35AjRigSF3k5rAG
 hNIsVnd+g/Iau46dSfoEpsv/c0riP2i5Amj7UxFweFEo6WlM6iShl4ahBMiqr6pDve
 +v0zD0GOh05Umgbsbdt8r3RPDTI79io/lHuLNztA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKkWat105012
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:46:32 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:46:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:46:31 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEf069811;
 Mon, 11 Oct 2021 15:46:27 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 01/14] spi: spi-mem: Add DTR templates for cmd, address,
 dummy and data phase
Date: Tue, 12 Oct 2021 02:16:06 +0530
Message-ID: <20211011204619.81893-2-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134642_848144_68B3848E 
X-CRM114-Status: GOOD (  10.74  )
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
 include/linux/spi/spi-mem.h | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85e2ff7b840d..4a99e26aa0b6 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -20,6 +20,14 @@
 		.nbytes = 1,					\
 	}
 
+#define SPI_MEM_OP_CMD_DTR(__nbytes, __opcode, __buswidth)	\
+	{							\
+		.buswidth = __buswidth,				\
+		.opcode = __opcode,				\
+		.nbytes = __nbytes,				\
+		.dtr = 1,					\
+	}
+
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
 	{							\
 		.nbytes = __nbytes,				\
@@ -27,6 +35,14 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_OP_ADDR_DTR(__nbytes, __val, __buswidth)	\
+	{							\
+		.nbytes = __nbytes,				\
+		.val = __val,					\
+		.buswidth = __buswidth,				\
+		.dtr = 1,					\
+	}
+
 #define SPI_MEM_OP_NO_ADDR	{ }
 
 #define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)			\
@@ -35,6 +51,13 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_OP_DUMMY_DTR(__nbytes, __buswidth)		\
+	{							\
+		.nbytes = __nbytes,				\
+		.buswidth = __buswidth,				\
+		.dtr = 1,					\
+	}
+
 #define SPI_MEM_OP_NO_DUMMY	{ }
 
 #define SPI_MEM_OP_DATA_IN(__nbytes, __buf, __buswidth)		\
@@ -45,6 +68,15 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_OP_DATA_IN_DTR(__nbytes, __buf, __buswidth)	\
+	{							\
+		.dir = SPI_MEM_DATA_IN,				\
+		.nbytes = __nbytes,				\
+		.buf.in = __buf,				\
+		.buswidth = __buswidth,				\
+		.dtr = 1,					\
+	}
+
 #define SPI_MEM_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
 	{							\
 		.dir = SPI_MEM_DATA_OUT,			\
@@ -53,6 +85,15 @@
 		.buswidth = __buswidth,				\
 	}
 
+#define SPI_MEM_OP_DATA_OUT_DTR(__nbytes, __buf, __buswidth)	\
+	{							\
+		.dir = SPI_MEM_DATA_OUT,			\
+		.nbytes = __nbytes,				\
+		.buf.out = __buf,				\
+		.buswidth = __buswidth,				\
+		.dtr = 1,					\
+	}
+
 #define SPI_MEM_OP_NO_DATA	{ }
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
