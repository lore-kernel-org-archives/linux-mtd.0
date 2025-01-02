Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ACDE77194
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2025 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ibkx3h27S5cN38Leh+JvD3Zo1g/RbzxQXesqyyxxFGU=; b=Kujgg2++5HbPWG
	hCfwtX4Ep6zUEJcdXd+/rPIZlnE8ZZ5n+gKfm79UD9Xs5qxze9edowHdtCdYvgjwHWBX7Qt6L7Mgk
	OaqCcl9U9T+w4tMvVIS+Hypjlx6szcy6CGMY+MnlgRTn3yeY2C9agsbNQxl+BPdW5ZgSrjHKUOZtw
	YB+hLDrY7yFbMdGqNMONUHMrMmQ+lrUNBETlQbziv9vzNbbkxH7U4DvWTR0fDF7S1ltPCaMSenYTW
	QMSmaoMoCH9+QBUlM+hGvhvsi1fjZ49tyreWCrifs/ADqxvWJqlEH5+FubLZ7ScDKF1Lm3M3E1scp
	pXr0Tn4np0+iYq/uzl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJjl-0000000AHtU-0kjX;
	Thu, 02 Jan 2025 11:51:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJji-0000000AHrz-0FpS
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jan 2025 11:51:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502BpROW1937107
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 2 Jan 2025 05:51:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735818688;
	bh=lfL2mENsbnZ2nVSCWzqK5Cua6MqY9m3FvW1aPebZY9Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N5MPArHVm9A3G2Yry8peBHtEANsZEkHBS7enOse4X+IrmeOaxPc8a6zlsVV23JKLc
	 n+9KHJSVug8pVVaanIvPWGzQCzll2mgdpXkRt/bZ8XbpWBSfEPhJVOo9E9L8Vkhtxi
	 GfaH4/2lSjff8pbB8GQHkAjdrghfmCLdiZXvfphY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502BpRh5059897;
	Thu, 2 Jan 2025 05:51:27 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 05:51:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 05:51:27 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502BpLpF030343;
	Thu, 2 Jan 2025 05:51:24 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <quic_sridsn@quicinc.com>, <quic_mdalam@quicinc.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <p-mantena@ti.com>, <s-k6@ti.com>
Subject: [PATCH 1/3] mtd: spinand: Define OctalIO ops
Date: Thu, 2 Jan 2025 17:21:08 +0530
Message-ID: <20250102115110.1402440-2-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102115110.1402440-1-s-k6@ti.com>
References: <20250102115110.1402440-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_035134_147284_B23D3E92 
X-CRM114-Status: UNSURE (   8.64  )
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

Define the macros for Octal-based read and load operations on OSPI
NAND flashes.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 include/linux/mtd/spinand.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index cbbcd44ac225..b730e334e399 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -122,6 +122,12 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 4))
 
+#define SPINAND_PAGE_READ_FROM_CACHE_OCTALIO_OP(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xcb, 1),				\
+		   SPI_MEM_OP_ADDR(2, addr, 8),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 8),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 8))
+
 #define SPINAND_PROG_EXEC_OP(addr)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
@@ -140,6 +146,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(len, buf, 4))
 
+#define SPINAND_PROG_LOAD_OCTALIO(reset, addr, buf, len)		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(reset ? 0xc2 : 0xc4, 1),		\
+		   SPI_MEM_OP_ADDR(2, addr, 8),				\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(len, buf, 8))
+
 /**
  * Standard SPI NAND flash commands
  */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
