Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC18C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Nov 2022 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSLkDPFY7XszqccfvyWYzchO6A/Op/I60N7AyeWDyA4=; b=gMroveH4l0l71D
	8fO6IsTeFMf1nKC9LQv7vQPzH5HkY/3a4pFCfB2pz2sX+tIfCj5Gv1AulVObW8JRUFkzaVKiip3V5
	yVS4ldBfGdclJds08kq0DJGYx/1DyfXtKSTzn0Cmi7FVDLgICIO9ENJPoW4UGVK4rKDQDNhv1rE5N
	Db/L+2igxde7fa7YHzPBvKAXOA1Jdz5K2FD73fnwrNOVygHnEs3ukR4ksABdzCV8CfKLEOxVfkgCk
	GdCq33J5+4sT1aQdDbicAsiI2f8dIzo4TrfWhf6d0CKTsCSH6azL2+bVsfs3y1fnCBiPKFHWjZ/eS
	3g9Sbi6NHIrqgN88s5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otX50-00GwiB-EZ; Fri, 11 Nov 2022 16:40:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otX4x-00GwgM-5I
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2022 16:40:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 365A8CE283F;
	Fri, 11 Nov 2022 16:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07EDC4347C;
	Fri, 11 Nov 2022 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668184827;
	bh=T+/dE65GaUmXRopapuVAGdXHeGWYexFvnU1S9HJYdgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T8uu2XBuI+JCfADUb0zYonmDF0juv9PNq590lCkGXQ5rItYD+qXuNM3Vrz5p9OVh2
	 7nv+1xUj66rjFUFg5zUHEWBtUK2KkW6k04roEWZTd/yR/5VmFUeH5iAnkUCoiyUP7n
	 vbzBSKpzWO5RaRNoIF08v85IlZEodhvJW4+JgM5aufp/7zxKxmx0Zunc3fP/DpZTA6
	 0qG9cGuq3ZHxTZsc6zTXCmybtUYre4egsDlaktUcK9pZhLVpYqERvBglKuG4UFHf1b
	 /b/SZ/0NK0+DpXk1ovKFxQDt9FdLGxS3yTvj4IwlUHLYK3MNFNKiMB8lBAuoy7Do6o
	 80hhY8U7wO0KQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Cc: dinguyen@kernel.org,
	tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-kernel@vger.kernel.org,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Subject: [PATCHv2] mtd: spi-nor: macronix: Add support for mx66u1g45g
Date: Fri, 11 Nov 2022 10:40:15 -0600
Message-Id: <20221111164015.165581-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111164015.165581-1-dinguyen@kernel.org>
References: <20221111164015.165581-1-dinguyen@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_084031_433923_9BC2E69D 
X-CRM114-Status: GOOD (  11.44  )
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

The MX66U1G45G is the smaller sibling (128MB) of the MX66U2G45G (256MB)
that is already supported.

Tested on Intel N5X socdk board,
  - random data write, erase, read   - verified erase operations
  - random data write, read and compare  - verified write/read operations

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: fixed compile error by removing , after PARSE_SFDP
---
 drivers/mtd/spi-nor/macronix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d81a4cb2812b..07ace9da74b7 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -97,6 +97,10 @@ static const struct flash_info macronix_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
+	{ "mx66u1g45g",  INFO(0xc2253b, 0, 64 * 1024, 2048)
+		PARSE_SFDP
+		FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
