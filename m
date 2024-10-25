Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32DED149DA
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6/IznKR29c/fZ/lIYwVMUqTVXAnqz/XGbACjsC3Yrc=; b=ron5zhRNHfbSXt
	iCq1uLIVMJVFVmqFgzXM7y7kFjSlPaV9pFoX25Il3rAQCaLEdBiOxMmg8Y1KMrkeQ/wVoFxludEp+
	FElSuqfEn7j7xQIoKBih2KG0xHOL0QyZAvOWQSOBemwLvpmtsXl7K7PG2Lth4fxQEVOFEEiWWVOpI
	NMCXdEDVbHRz/BPq7tOEVFVsLeoacL3eUDb/8uwO9oV6n8qEBe/ss8muOCAm9WEBhvoVw4Q6LSVvq
	TuG9g8Ebr7I4QdqOmJMBSQJB425ssVGNqSlJk6JjOorUEOhGT/BGToTegF3mP4mZFFbTQjzh4CVEx
	WlPLupLIzB9CnX8YvBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O9i-00000004bbh-2twh;
	Fri, 25 Oct 2024 17:31:22 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MyD-00000004Nk2-0d69
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3229E000D;
	Fri, 25 Oct 2024 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FkvuH0AWdcL0zGrECt5K+wtClopnb+WgibOUAQNP4l4=;
	b=D7+5mePwAHc+DAdMGKrs42INvoZ1kL3wuLSrf5+dCnkxyXujRtp8m4hWERlmfQ/pMra7SE
	joAqZmLUG2Q+BfvbfafSJXkThkRFAW5Hly+OwbmHJnMPbQ7BiLbASNz9m8xXutShyfYNhx
	Et1mu+LLGoWd9Hh2l0JDnqgxwjA7qbciZ3dJKVpRwDtggr0ZFV63ykGZShHypCIc1kd8MN
	4qBLuJPksLDx1owGmS8wrPUgzBB1F0kYY1/0J0uatjs6a9gbowhdcYEsZECFXOFpIhy4fy
	yyF6M5P3N2zbI3G+DIn7OxRYTX+wr3x0d8j1YcSME2NLw3K0SoaN5BViAiVPcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 18/24] mtd: spinand: Add an optional frequency to read from cache macros
Date: Fri, 25 Oct 2024 18:14:55 +0200
Message-ID: <20241025161501.485684-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091525_477668_D325AB56 
X-CRM114-Status: GOOD (  12.05  )
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

While the SPINAND_PAGE_READ_FROM_CACHE_FAST_OP macro is supposed to be
able to run at the highest supported frequency, it is not the case of
the regular read from cache, which may be limited in terms of maximum
frequency. Add an optional argument to this macro, which will be used to
set the maximum frequency, if any.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 3730cdf914f8..6064029c5e05 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -62,11 +62,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_PAGE_READ_FROM_CACHE_OP(addr, ndummy, buf, len) \
+#define SPINAND_PAGE_READ_FROM_CACHE_OP(addr, ndummy, buf, len, ...) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
-		   SPI_MEM_OP_DATA_IN(len, buf, 1))
+		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
+		   __VA_OPT__(SPI_MEM_OP_MAX_FREQ(__VA_ARGS__)))
 
 #define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),			\
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
