Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AFCC7EE29
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 04:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqKFowQM8Rr9DaaKrZ2pOL7congucLCCy+Qx6e+nTBk=; b=kKlAx8bJTpzKzG
	ZJudXaDc1sgJGn+e121m7WDTMAUPXN100a2nB8yTDeGh+4Wi3M6keB9hO+URg1qaLRjJGIMWhoFcr
	aDuNdirUGY2ipWNkEJsSBcUO5W6j3XmjR5gpGMPFO+OMdS2ikBLjNfsVcIQk98pOS+sbrn0RecubS
	1h2F93mPYqvDRzAgBPM2ui/SQ/odhL5NHZcduHoiC7ChxA/oYF2l4mK8QJuC+4UdOc41AS5ldVTxE
	TjT+ja3WCnJxkOglFHct2lYAx3ayUnBCd8ZwY+6LDi6xSMqwCz/qMtA4ZNN8BL/GS22eE9I8qEvAR
	yeNVNesZlPYLNO9FNDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8w75-006vV3-0S;
	Tue, 13 Jun 2023 04:58:39 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8w72-006vUc-0U
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 04:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686632316; x=1718168316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dKWqNItNhnl2qzeK3LTkxa2K/X8UQHIfaIfPLs0gLNM=;
  b=QorGLt/YjA3ygaMQ+B9yyNJZggOkwLJtqOedEiZq+UUsduQrICfXRbrF
   DYcjrKJPOsyDoHTDWKNFbzLZAKRcvczGjUZp47UWVM4Rhzuu5mTlzRKNA
   lKXvX1WXnpiESdAZTzzhLY8Ac16yzbGEEKnndZg44L8gHZGU7KW7qjgAR
   Mi9nIZwRrwwY61joomaq+0GXtSEpe/4IVf3hq6evB6zCK36aLCJK8Tj0J
   +5rQImpN8jiCpSKOOfVbGAkHTASKB2GY9X3gxRZ5Mdo/RDTpWw914x2No
   LkZ2hl7M6lughyV71cA4Wm0LD/YtoMRmJ1a6i1MN5V7q+SHL9YrV0fMiR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="421819091"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="421819091"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 21:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041614066"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="1041614066"
Received: from haoyao-desk.bj.intel.com ([10.238.232.41])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 21:58:31 -0700
From: Hao Yao <hao.yao@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Hao Yao <hao.yao@intel.com>,
	Md Sadre Alam <mdalam@codeaurora.org>
Subject: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lb256
Date: Tue, 13 Jun 2023 12:53:13 +0800
Message-Id: <20230613045313.2690342-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
References: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_215836_256654_9C8DD7AE 
X-CRM114-Status: UNSURE (   9.92  )
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

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index d57ddaf1525b..d56c1876549f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -62,6 +62,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "gd25lb256", INFO(0xc86719, 0, 64 * 1024, 512)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
 		PARSE_SFDP
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
