Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F2CCFA05
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGMCCR0tWAqS8CtTSfxGt3qYCZPXdGoPgr+qjfQFtxY=; b=tJEXpMXo/ky+ka
	9a0urLRlpkk8jUVwoLr30scXt62t0v5tVyF6bfXv84jcgFD3n7dPF6UxMGtrxtciKSXpVvk1fjrL9
	iq9Gu0g18N+16yQE3OD7aCb4Ll27aOPKXtjfSIz6m+FsnqSG31vdPyXWv+SR+ddoWd32BySO+pmld
	9ASNWPI/vpTcwNYIY3lHGYSiq2bH77T4v6p/zSbO2lyltHdwV4CM5UzyoxJF128Jtt7ITsFRRFjjd
	rt6uqcuQyHev+9wmdyGVoM1eYckZurcLd4xPvRQLWa1BJ/qM4pjcgFA/BKPEWMo4lips9Qzw1dTNW
	cM5bg8C6tSEzb0qqN2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvM-00000006UIe-47iV;
	Fri, 31 Oct 2025 17:28:28 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvE-00000006U7g-0Hlf
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DA249C0E95D;
	Fri, 31 Oct 2025 17:27:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6ABFC60704;
	Fri, 31 Oct 2025 17:28:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A31A11181800B;
	Fri, 31 Oct 2025 18:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931697; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mLluG8puW16khAmDrjVJJH9/M5suelfU9smry8s1GdM=;
	b=df5R4CGMI5w+5S/Z1v/u2Gi7kUW5QflghJ+N20juWOd0iMxYA/KwG0RmviiS7FBA35ykd4
	JM1hMETT2xQzj4vPBWlKZD4N8OXTZW7OhalguaA0xHUVKrpWpgaZgWD+O5EQbxLElZkLHE
	vKHwYZH49VuwvZY+tDHIxm98v62fdtKzZujGEIIN/JbQkCRlKIXnTHpBABlrG0QJn31rfZ
	Pv+ZY3WkzYtRn+1Pwao/z6tSyPNlNPe7iYCBxjFHPSvVLmIVoUNOXC/GCMjALPjWxmAuvc
	/IAN5400v4+OmsI3z9aPYui3NJoyhfP3UD/Z5p3cvCW+uip32lvV3cm1C3cIZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:50 +0100
Subject: [PATCH 06/28] mtd: spinand: Remove stale definitions
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-6-be42de23ebf1@bootlin.com>
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
X-CRM114-CacheID: sfid-20251031_102820_384140_9D88B43B 
X-CRM114-Status: UNSURE (   7.26  )
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

SPI NAND command values are directly included in the macros defining the
ops. These are stale definitions, they are unused so drop them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 1c741145e49717169152854718f784e0e519ea92..731a3156b2577032e1f9a767044f94aa262c3ec0 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -232,12 +232,6 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(len, buf, 8))
 
-/**
- * Standard SPI NAND flash commands
- */
-#define SPINAND_CMD_PROG_LOAD_X4		0x32
-#define SPINAND_CMD_PROG_LOAD_RDM_DATA_X4	0x34
-
 /* feature register */
 #define REG_BLOCK_LOCK		0xa0
 #define BL_ALL_UNLOCKED		0x00

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
