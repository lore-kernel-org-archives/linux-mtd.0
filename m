Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAABEC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O75bbXHdJhySvIPA/mJPsZ3gnbd8TECLndxiH9hqWJA=; b=XfZ9otqNSe3A82
	ZF9j4TjmtPWkP7UZAZ5UgNrQKgeKY/U/i91Hbo2UVOqhFIV/63f8u9okLWpcCo88snBqb268kDzVJ
	hT3vV5IO8FVqdhv043pe1CEQlvPorg0talSQj75RDq3rmupgjQW++Tya+tUVsh6SJExYLzKuyau7y
	xhcvtioACNhSV5mvCcV9UPAdU4xUx5R5PaoOtN3M5A8C7Np1HwIa3gyem1fWcMjkcOH7GHLzY5yI1
	R4+2rpHWNwq0/XTmgZzrR6QKDWE8I8JJt7a0MpuqEIo9iKfDCK7KD1lv3BzBtfIaBae9sdY3HREof
	tttePMEt3eO60vzQV5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlniB-004ZHR-8l; Tue, 03 May 2022 08:16:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlni3-004ZEh-LD
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651565800; x=1683101800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s2i2ki5NYR2LhScyDnXPiSeJIRiAm3tWkChoGSua/Pw=;
 b=j/XcHrXvxqEkBavLbqSJbVO6lq4mPN57vcoCUPxXv7R618tebaoXgs5x
 P8fDgMTgZu7eI7nYThMFo005AnVH9RVL7LjxqK7Gwj+S8OQdUn069sAjM
 F5EgFzxGLnG+V+tRNtN0P0Zk8a7qFUeqYN3fkZd3BM5lvNdDADVhy52oF
 Pv3P96pHKBzJjnTDo2BSrWdyuAunOPEdxdYFxRXuT03qSiDCzmfQ9RfIs
 P1FUUEuQWXBsOux1lR8OTbJbOXX/kq7i6Izn3t14QqPKyBbWB/n51gnGs
 3F/oi++og6P4j+fwOc7750Ipzqy59HuNvjv6NouuvFAEGhmjOD+gOIQdu Q==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="162115934"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:16:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:16:38 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:16:36 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v14 3/8] mtd: spi-nor: sfdp: Clarify that nor->read_{opcode,
 dummy} are uninitialized
Date: Tue, 3 May 2022 11:16:22 +0300
Message-ID: <20220503081627.341870-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_011639_746478_F4060625 
X-CRM114-Status: UNSURE (   9.90  )
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

nor->read_{opcode, dummy} are uninitialized (value zero) at SFDP parsing
time. Clarify that in the code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/sfdp.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 61ae8c8c5237..058ce218d2af 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -178,12 +178,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
 static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 			     size_t len, void *buf)
 {
-	u8 addr_nbytes, read_opcode, read_dummy;
+	u8 addr_nbytes;
 	int ret;
 
-	read_opcode = nor->read_opcode;
 	addr_nbytes = nor->addr_nbytes;
-	read_dummy = nor->read_dummy;
 
 	nor->read_opcode = SPINOR_OP_RDSFDP;
 	nor->addr_nbytes = 3;
@@ -191,9 +189,10 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 
 	ret = spi_nor_read_raw(nor, addr, len, buf);
 
-	nor->read_opcode = read_opcode;
 	nor->addr_nbytes = addr_nbytes;
-	nor->read_dummy = read_dummy;
+	/* Restore setup to its uninitialized state. */
+	nor->read_opcode = 0;
+	nor->read_dummy = 0;
 
 	return ret;
 }
@@ -690,7 +689,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	u32 addr;
 	int err;
 	u8 i;
-	u8 addr_nbytes, read_opcode, read_dummy;
+	u8 addr_nbytes;
 	u8 read_data_mask, map_id;
 
 	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
@@ -699,8 +698,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 		return ERR_PTR(-ENOMEM);
 
 	addr_nbytes = nor->addr_nbytes;
-	read_dummy = nor->read_dummy;
-	read_opcode = nor->read_opcode;
 
 	map_id = 0;
 	/* Determine if there are any optional Detection Command Descriptors */
@@ -757,8 +754,9 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 out:
 	kfree(buf);
 	nor->addr_nbytes = addr_nbytes;
-	nor->read_dummy = read_dummy;
-	nor->read_opcode = read_opcode;
+	/* Restore setup to its uninitialized state. */
+	nor->read_dummy = 0;
+	nor->read_opcode = 0;
 	return ret;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
