Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 14:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41Gga0L9qxDn41G1C+JFUjNU0t1sYDf5XvDLy5OHTk4=; b=sYnELxGSMUPw6V
	rZLiEv29MKPTG3xV/mGHQDSfjuj+Hbx4UH6BwnlrbjIsVtQP5VM/O2//xHEw72g8lPn9heaobmyg7
	EQM9WiVaZXkk+7rFD2Km1/0Y22AK0ZezbcWZcoQumtmHsNN5El1/Txy+wXVWVNSucy1jDs7pFUsZf
	szBZUwgxYMiK+gviDmIB6qFBSPh220efqCGSJtav8WlyhdpYfmSlw02zW3gIaYJHL2lqaR/rnW/qR
	NGF3RZ6Rxwf9Ob44FyOCfVy0qF+Fk9a/rc79lo8ACkCMd+vXS75c3H+fNRxUygQkL3fZDSy7RDrlF
	lsZZ1L1hfF6eM0596U0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noQRt-002O4L-Tj; Tue, 10 May 2022 14:02:49 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noQRn-002O1Y-Vc
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 14:02:47 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A508A2224E;
 Tue, 10 May 2022 16:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652191358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UxwEeiTcfaMCwqN6AHf331eQEYKir5m9q3Wiknlh7g=;
 b=DLK/b1X0WBV/9/SUW5c51jrTJcl+roD5zc7RhR80MPB3F43Gu3risbFBai/wRH9Wwzi45Q
 i66GtB2SzbVxbB0lIzNLMaL6GoCr6IfcaKV4SgaaV/R3/y1mD+KLFAiz9F31o3vWWU30w4
 cuHW2bffJ8Zb1QjTQXPLsJaAI80P8Lc=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 2/2] mtd: spi-nor: winbond: use SNOR_ID3() for w25q512nwm
Date: Tue, 10 May 2022 16:02:32 +0200
Message-Id: <20220510140232.3519184-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220510140232.3519184-1-michael@walle.cc>
References: <20220510140232.3519184-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_070244_693496_89FCBE24 
X-CRM114-Status: GOOD (  10.89  )
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

Use the new SNOR_ID3() so we don't have to specify the number of sectors
as we are reading that property from the SFDP anyways.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/winbond.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 08f9b5abf4d2..12b38f6776f4 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -134,8 +134,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
 			      SPI_NOR_DUAL_READ) },
-	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
-		PARSE_SFDP
+	{ "w25q512nwm", SNOR_ID3(0xef8020)
 		OTP_INFO(256, 3, 0x1000, 0x1000) },
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
