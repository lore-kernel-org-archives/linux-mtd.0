Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8D0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  6 May 2022 10:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RQpEjabGuQOxwu/CWUvBBRZLz2aQARrDieaYDM50Ips=; b=ljK99+6kud8CjL
	z3n2GdwQL20vvGVD0bBIbFKB1UuAeRp8X1/2DzGbydSx+MeJYhifBpA3bucDDUpCnLIrKQiFTgPxr
	gzrXHtywHebmXdMbsYpClcj8Xnw0RaWxoBuElfK2zDgIVd+hG9+5sggTQcG4gi2vLA9s++dvYiLQT
	QX8Lg9yICqazDFuxRQpIrAVzvWip78pOI7KhrVxDWnQ4AiJKW3B6UJJFQTnNYmHQe8iE8stZTxPQv
	ed4IHxUlzpiScGJo1YhAsTVSKA1tUF6yxuAu2eiPfAP9u1rNs7ptQEPHNac3HBRDbY0VmjQAMRiZR
	46QAv2eyxvBSJuCC3PlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmvZB-002n2N-3j; Fri, 06 May 2022 10:52:09 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmvZ7-002n1E-PP
 for linux-mtd@lists.infradead.org; Fri, 06 May 2022 10:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651834325; x=1683370325;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xoEmCRD1X0UIe+7Kmvfh42T6nAP1RRQttTfFvuz55zA=;
 b=A/BCeHzxSsS0fALVKcBtIA7wfdwpqMUz90nGa0w3+BU+Q2PxdI8fviWS
 URY2W2+iKQZVPndv5+E8ijj+w5W5n3C6x1eKu+m9shA+gUCDJCXh7lZMd
 G7PPZNOWFDoaXwd1G3qQWhnsBvH70M8qS94IiBkOrCDz/mGQGAaZhAe2n
 LEkQ5ZyImpgNiiIL+JaVAJXgPR3XKmq7UFY/ZwPbtnpUVhjGvsTg4S/pN
 yvjXMK2q2veZA2DxjI35E4UjeqlR7lqyXFddvTpB1J6fTxUylNwJEMqcT
 UcEr/Izglbly8FxXAVSGYhEYTV5H0CxJGEey36b14i9qTgHrx/dojid9K g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="250433994"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="250433994"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="812336355"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 06 May 2022 03:51:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 3251B179; Fri,  6 May 2022 13:51:58 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: micron-st: Skip FSR reading if SPI controller
 does not support it
Date: Fri,  6 May 2022 13:51:58 +0300
Message-Id: <20220506105158.43613-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_035205_982763_0D91A08D 
X-CRM114-Status: GOOD (  15.59  )
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

The Intel SPI controller does not support low level operations, like
reading the flag status register (FSR). It only exposes a set of high
level operations for software to use. For this reason check the return
value of micron_st_nor_read_fsr() and if the operation was not
supported, use the status register value only. This allows the chip to
work even when attached to Intel SPI controller (there are such systems
out there).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/micron-st.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8a20475ce77a..885683e0aeb8 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -396,8 +396,16 @@ static int micron_st_nor_ready(struct spi_nor *nor)
 		return sr_ready;
 
 	ret = micron_st_nor_read_fsr(nor, nor->bouncebuf);
-	if (ret)
-		return ret;
+	if (ret) {
+		/*
+		 * Some controllers, such as Intel SPI, do not support low
+		 * level operations such as reading the flag status
+		 * register. They only expose small amount of high level
+		 * operations to the software. If this is the case we use
+		 * only the status register value.
+		 */
+		return ret == -EOPNOTSUPP ? sr_ready : ret;
+	}
 
 	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
 		if (nor->bouncebuf[0] & FSR_E_ERR)
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
