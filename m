Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378B2C433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Oct 2022 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PMJfClB3l32l8IwLUaPhvCt5gB4vsF8x4I/USMqmeRk=; b=Obu2TzXxpdVNMV
	MX7yGxZ5O0iOwAU0N0ZNOkZrjOejW2Om2I7NKWPFWLlzlsqWr21vXXWVfjkqUZBhA3KkKGHnKuUKP
	vMbKPtqmV7Ar0Ikm/ca7qkW07+STdPjw8ZyiD3rHXXBcu7h9BQQoV4F7KbwzFhdpiF68O4/smh4J9
	bAuV12NRH/0/j22J9shphlxJE/uW728nrRk69LVyb5a1YdjYeGDNZhcCd5xdQUOhe42TWYnmjZj21
	LFmLP/keiCxuwtyOnrivCu7zS8w0iZcyz48gGYaIHJYOw+ndRMatr6rnNFa9k9X1w/kqr9RQo7H2k
	J9g5wjmsXyBWvk4kmsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omUwB-00EaMy-Ra; Sun, 23 Oct 2022 06:58:23 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omUw9-00EaLq-01
	for linux-mtd@lists.infradead.org; Sun, 23 Oct 2022 06:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666508300; x=1698044300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KtmqamnoNm/uPYXt+VG3gDCKaeSlWxuYzZYhtDBxzqQ=;
  b=D2dcTFgoPNZl5XqwXevsFsMzYfPwc/R044FfJWjyZgX8C6MKo5kz6IZr
   Q9/4TRKNpS1Y5nCLZ7vzbkUTTgMElzLHV1vG32E3HUXCa9Vge9h96gLCs
   fuMtiteTCydIR3f3+22tAyMunJuyr0hYD3jGjtAVM5RpBLgv8NuIVJmzb
   1a/YGnbWmWVDP8UdprWR3nVXvWOG5ydDavnYLi9Z7vBlcnkLSPVFB9AUn
   giBWIxwjnp1NC/PoCe/wD/xXXsNoXTfQu+iUouFTocGeydj0IMTL6B2w7
   B1keTTNH3jReBruWZQa7muw0syVUEmo53orWEFX8YvJuVlZhw5uOszvvA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="308920655"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="308920655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 23:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="625758919"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="625758919"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 22 Oct 2022 23:58:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5085C107; Sun, 23 Oct 2022 09:58:38 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Date: Sun, 23 Oct 2022 09:58:38 +0300
Message-Id: <20221023065838.53616-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_235821_113270_8E154D84 
X-CRM114-Status: GOOD (  10.88  )
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

Add support for this 32MB serial flash.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
The previous version of the patch can be found here:

  https://lore.kernel.org/linux-mtd/20220922135646.49906-1-mika.westerberg@linux.intel.com/

This version uses SFDP instead as the chip supports it just fine.

 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 119b38e6fc2a..29ae4048bb0f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -57,6 +57,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
+	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
