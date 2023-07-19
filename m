Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2153CC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0IGL0/k3QKMtzphH5a4WT6GPVgTt6K9yUFrFtcl5xDU=; b=VHxyL1piQnf5Gf
	599WBuHjk4evOhpjEdFTpKnaM0UkrtqHn7scQJBTsaQib/U0fjLeIUPV8knVLxdnKQsNe8zOaPSL+
	zKhFA5djERk1PI1Nq/UHkPA1GopubOkCidwlKizlKnAtokUmOHHCJtm4NxrV+sKDTBFN+Z/+0BI51
	2Clt7J8q0jyNwHam3iBcLPE3H68Ujsn0lcMK1hdLRDAtn6KNCBTuD5N0Y1yvP1GDfdtUX1lNzj6ax
	QQZXugQVH+1xQlP4QmbPN+BINYhW5wUIeHNDMhlLdPYjyMjmaoFik+iLkcIlf+5DoiuxecM1RlA+W
	TlgFUhaxBd+XfJp9EOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7XQ-007ciH-2G;
	Wed, 19 Jul 2023 13:48:20 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7XN-007chV-1r
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 13:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689774497; x=1721310497;
  h=from:to:cc:subject:date:message-id;
  bh=LjqK/tmNoiLq39k4+y5wWdRySbSnPHlhMJYPPGh+QG0=;
  b=aAF6Q+s2waNa/sBJqBrbE8RoOgvo7Yp7XAxezZW1t1my7zlDVuWm5tdS
   8pxKBZxqcGVWR3LL4D7CHwzVdPAxpqTGuoDPVEYdoGkgV60yTb2ySNYos
   i2MP+L0Kn7IRg4lF5FhlRB/p6WaN7vJfO0lzRka6WbTK6yNaRdfA5aHpE
   nnoL4mb2+fb64E2FWtqlMcOkLZKR0czKblYnt0CE8FrBDTMf3zozVNSh1
   Bpu3BthtFtAGqejDur61nqiyWujxRAydbPNHu/7tgkV7zvCZnCydk07TR
   I10hAVhjpAYRNSgu/Xd1FV2krDCsjgnjP556dvoVtW5iX9ZNq4vyjJChP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365348309"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="365348309"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 06:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789426638"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="789426638"
Received: from srikandan-ilbpg12.png.intel.com ([10.88.229.69])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 06:47:51 -0700
From: mahesh.r.vaidya@intel.com
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@linux.intel.com,
	jarkko.nikula@intel.com,
	furong.zhou@intel.com,
	mallikarjunappa.sangannavar@intel.com,
	nandhini.srikandan@intel.com,
	rashmi.a@intel.com,
	mahesh.r.vaidya@intel.com
Subject: [PATCH v1] mtd: spi-nor: macronix: Add support for MX77U25650F
Date: Wed, 19 Jul 2023 21:27:00 +0800
Message-Id: <20230719132700.15274-1-mahesh.r.vaidya@intel.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_064817_664527_9B80DF0C 
X-CRM114-Status: UNSURE (   9.83  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>

The MX7725650F is production chip for new design from Macronix
with a lesser memory of 256Mbit with unique security features
like Permanent 4 I/O RPMC, Secured 8K OTP support.

Validated by read, erase, write and read back.
Tested on Intel RPL, PASS.
Tested-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>

Signed-off-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 04888258e891..995936ba58e2 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -103,6 +103,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx77u25650f",  INFO(0xc27539, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
