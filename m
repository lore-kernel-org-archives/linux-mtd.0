Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B6C433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B16/SmW3oA4+sqy1RWK3d+kStl6m3EbKrkyxCy72pdo=; b=BYHzRWDR/vGjVP
	gfof7WV20FJE7pZ5YirhT7kmy1NdXkIf4qQZ4cZRtT00AYyM1lJGUVgC7oPJwdRHWynEwEC1m8tWC
	EFa1xygUwJBKptzTstFFJbOdCVbjfh25HbSinYmHYvb81Xg2LBaiORbP9lyhhhrk1mDG8HT+6IazM
	UQKC9GSy5x8YnherqVIfi6Qqc4gVpF2WoKL066vp4zs+Eh/WFAO/lHhn+g1M/BJ8UyFbh19Jb0zyy
	PiBaydm5Bzr3HEe3sUfMX24NN3yoPBou6iJkEjPem+NVRsEkVgzxn9IhUNfKFZZfeOS6IDjcZE1eH
	HN8gVgN5X1lJBOvJuvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Z31-006iVo-Dz; Sat, 01 Jan 2022 07:43:27 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z2x-006iUd-QO
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:43:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017h3DX034524;
 Sat, 1 Jan 2022 01:43:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641022983;
 bh=sxImKlYR9bxi/r/0O9cHejg8wu1LEinRPbVkHanMnrk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OS12gKsGcZA4+GtYSGTk6lZX3VIT4G5t0CJoj84jDPzOXAjsXqKIhL/xnCVwZeZyK
 V7rl+52Vp2+RQJI/wCSfqR6ZfDwh6bPVQ+7n22DnubW7mc5ChDghxb/6n/0kjZUBQC
 6qlT+CDNH+EOKsf7jPCk1BczmlhJZKgWeC3VxZtY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017h2JR038760
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:43:03 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:43:02 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:43:02 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwW033162;
 Sat, 1 Jan 2022 01:42:57 -0600
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Daniel Palmer <daniel@0x0f.com>, Alexander
 Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v3 01/17] spi: spi-mem: Add DTR templates for cmd, address,
 dummy and data phase
Date: Sat, 1 Jan 2022 13:12:34 +0530
Message-ID: <20220101074250.14443-2-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234324_014809_7B0B7112 
X-CRM114-Status: GOOD (  10.90  )
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
index 85e2ff7b840d..682378a9c600 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -20,6 +20,14 @@
 		.nbytes = 1,					\
 	}
 
+#define SPI_MEM_OP_CMD_DTR(__nbytes, __opcode, __buswidth)	\
+	{							\
+		.nbytes = __nbytes,				\
+		.opcode = __opcode,				\
+		.buswidth = __buswidth,				\
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
