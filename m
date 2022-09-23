Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF47BC6FA82
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11hNNFmhV2PHCNue63OJhWJ+8B/XfPm7vd7FOPASPrw=; b=BCYmOo/k4LONxG
	YwpSrWtgaEytuiVOLiMZMHZs/pysmAyVtYLC3u4v1og2T5a6fhmTInnPx7ldT/aInR9LB5xMnqmJZ
	BRrIc6IHl7Bke8vH6eeZoADq7aviBiLwcUp4BzTbmBx/1UbtMLcEicDyxIS4zYKAkiSM6agqTfGz1
	equE38iEEcZ6GgGjn4B0SJrDHMH8oRupcb/PtSh3MphsokSMJs+W6OuDRLqKQMDZdqT/t8Sd8ji+7
	1ugVmO7U83wpey7Q4Dec5Ned0lBDea5RJhNZG5zslg09/o3yFF99D74l81+wqs9lmFSk2wPIQBJKQ
	mEQQnPver3KwW0SLy8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf4q-003NDf-Kz; Fri, 23 Sep 2022 09:34:32 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf4n-003N9w-FC
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2022 09:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663925669; x=1695461669;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S9yL+jLzvFwmFb6yqp1Bq5rdE5gEoWqhE52tGLJKRnQ=;
  b=hoK0kL4A1YiMd09BREaClHkucIEBaU+1dy9qH42w4OMPZ/GQW9fIawYU
   ra3leQJGGwLu/LV6o3XiFfOg4Axwp6Kn28jhNs+pFy3Np1W+0iY5f6v18
   K+tZlkgRdyQzgFyIQTWTHeGW2icCuvHnYQglJQWBOYBiYaw7lQZqFwiaV
   MHT8ETDAlglBSPXWCqudjmLwIsyfxN7rE3cAbOH0XFlwc71LrcOdl8PNQ
   ENjvrycXJqVPLmsE33efvcj4aveue+dmxKoYWHFhRT5Zh0ZemeN/tWcK9
   EqijBT82TUKNv/6rFS6mC4FSIRRlJeUUAs6DnI7DkM8lUPt1Exy8u6Dwz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="287670091"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="287670091"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 02:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="865235151"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2022 02:34:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id CC7F5F7; Fri, 23 Sep 2022 12:34:41 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Hongyu Ning <hongyu.ning@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Date: Fri, 23 Sep 2022 12:34:41 +0300
Message-Id: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_023429_576912_8E424F09 
X-CRM114-Status: GOOD (  14.47  )
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

The Intel SPI-NOR controller does not support the 4-byte address opcode
so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
chip probe fail like this:

  [ 12.291082] spi-nor: probe of spi0.0 failed with error -524

Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
Return error code from set_4byte_addr_mode()") it worked just fine.

Fix this by ignoring -ENOTSUPP in spi_nor_init().

Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
Cc: stable@vger.kernel.org
Reported-by: Hongyu Ning <hongyu.ning@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
The previous version of the patch (the revert) can be found here:

  https://lore.kernel.org/linux-mtd/20220922134824.46758-1-mika.westerberg@linux.intel.com/

In this version we ignore -ENOTSUPP but the other error codes will be
passed to the caller.

 drivers/mtd/spi-nor/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..bee8fc4c9f07 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2724,7 +2724,9 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		return nor->params->set_4byte_addr_mode(nor, true);
+		err = nor->params->set_4byte_addr_mode(nor, true);
+		if (err && err != -ENOTSUPP)
+			return err;
 	}
 
 	return 0;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
