Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A934BC4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Nov 2022 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRpWt7yyaaScPXfTp/ShI7r6LWKbKVqKyW7zUCTNOIM=; b=Qc1Mkp6hrIPDcI
	EFDAZbS18mZKNxAJJS4+ZP7AJSvJVYMApKyO0kRfjDPRs7syhK61rr+Ec3CeXprqVur6zxGn3Xz8m
	uBLDNRmpxz3BgzfbWIBukQ8qhwq9AWoAWHpyqPid58GZjxbk28VR3NsVDUUlqg+6CMOngfWsMnCV+
	592gpkQvAxGPuKx0EgK8hkw+4NiOsv0Wokta+CDsDJNIkBgzDM/eMjW9B+H1SMXYH5py8DolPqvbA
	tV5wmzPCfUGr7wXKVNVaFNmyhUFCE/n5YisN53jQ/rrrJzVETwbgR49sfsn5imJ7B2s8RG5UZj9s7
	HltlEeXbWJg154N5q67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj5Y-008whv-Nz; Sun, 06 Nov 2022 17:05:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj5V-008wfv-7m
	for linux-mtd@lists.infradead.org; Sun, 06 Nov 2022 17:05:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3569BCE0E02;
	Sun,  6 Nov 2022 17:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E41AC433D6;
	Sun,  6 Nov 2022 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754329;
	bh=xQF0jd4vAlo1a0bwEqYmq8NGnNEGxxUiKpQE6/53kLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXu7Wps1ZB0BxZl+ctuYC2s8cxedibOqvzuXnIA8F7bNk0K9SFV4I5vHEkaFSjtQc
	 ZhfoHrk9Z81zJum/DutJdNnqHcYfpGVz5fxqoHZIQDDT8XKp8K7q2KF7Q76O3es7o7
	 AlheKNw40cVsZ/IvALS8ggY2xm7LPxaxe5FEkHPFjcmHGFaRw6ZqLI+3c51zU9G3IO
	 a0JeJVDLR4VQ++4Ui34gFCwl+HiLvkbyeGRa2BVXEf4e2KP3MjG6+0IFL1xZvHA3NI
	 Wl59WmWU/imCjpj1TizKOwrjx/D2oqgENcVs8V7BKhqtsdsOGAFnAKVtfnvYB7gsWq
	 6N5NjQV12mkFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Lima <mauro.lima@eclypsium.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	andriy.shevchenko@linux.intel.com,
	lee.jones@linaro.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 07/18] spi: intel: Fix the offset to get the 64K erase opcode
Date: Sun,  6 Nov 2022 12:04:56 -0500
Message-Id: <20221106170509.1580304-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170509.1580304-1-sashal@kernel.org>
References: <20221106170509.1580304-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_090537_478321_6526DA71 
X-CRM114-Status: GOOD (  12.04  )
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

From: Mauro Lima <mauro.lima@eclypsium.com>

[ Upstream commit 6a43cd02ddbc597dc9a1f82c1e433f871a2f6f06 ]

According to documentation, the 64K erase opcode is located in VSCC
range [16:23] instead of [8:15].
Use the proper value to shift the mask over the correct range.

Signed-off-by: Mauro Lima <mauro.lima@eclypsium.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://lore.kernel.org/r/20221012152135.28353-1-mauro.lima@eclypsium.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index a413892ff449..72dab5937df1 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -116,7 +116,7 @@
 #define ERASE_OPCODE_SHIFT		8
 #define ERASE_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
 #define ERASE_64K_OPCODE_SHIFT		16
-#define ERASE_64K_OPCODE_MASK		(0xff << ERASE_OPCODE_SHIFT)
+#define ERASE_64K_OPCODE_MASK		(0xff << ERASE_64K_OPCODE_SHIFT)
 
 #define INTEL_SPI_TIMEOUT		5000 /* ms */
 #define INTEL_SPI_FIFO_SZ		64
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
