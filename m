Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AC4FD0049
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2026 01:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFXtNTErinAcBnIUAwDVznVOmB8BHTcgH2sSyBGwYT8=; b=aSFnwx90B7VZPy
	h47IDCfmwSXyRC6YUO+2thf8LsnmnYPJMlAnb3HrCQ6C6YbyUshERgiJbxC1o5cEOz6zhvdXI4BZs
	89AiI0SYvVSbAfemKy2WWaNdfjweQ3iPchgAYTQnmY5r89tVJOgSkOf5Mq2jDwhYClIED21YPq8VR
	MshkxuFzgQCPWlkt6iTKmc4MP6k6PTXfYJPjASOW6DWLFPgrGv6yjuidMEFg8F8Ou6diWNzMkTX2T
	NsjaO+A5lJUGM9aWczG7uvxc4GaanTAyETdwFvNBVZ/RJPzrcLTW66E+CW7Skd5jskrmcGAFfjEHq
	zbzYAw6fba+nj9kX3SPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVjR-0000000AaXO-49WJ;
	Sun, 01 Mar 2026 01:36:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVjR-0000000AaWT-0Mzk
	for linux-mtd@lists.infradead.org;
	Sun, 01 Mar 2026 01:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EE9160126;
	Sun,  1 Mar 2026 01:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6F4C19421;
	Sun,  1 Mar 2026 01:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328988;
	bh=TmlyE3kqyax39PCy07Zsgthvl210QqlXKy8uoI3awrw=;
	h=From:To:Cc:Subject:Date:From;
	b=oGnC97IMGTCIA6aNp426v5V2r3ssTe8F50+eiRz4t8uNbEKECbeQwlBhbcSsYGhHA
	 VF6P4VqjRT1OHWKoJSMTa80EHrhOJSSrjfGDu1KftksMtsKyAx4MAf1V6xQkRRdC0U
	 dSVHmb6SjPlLzgZUNFLqwq7OAZ5s+zQ7oGppMeG/ilQyg9wlmDeBvcDHZyb+Hqjpxj
	 cuDwskV5Dtop6AHLGE1Mg9pQA+aPVYY+Xlip3eYemx4032YkggoXyBskO8DrCJrUVW
	 GAEH8lFfVJ/4pdhlnx8w7LvCRccpPITIOPibOiWG/waAINkZDOz6budXuWMD940LDm
	 eLkLJ4ZXysAtw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	andrea.scian@dave.eu
Cc: stable@kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: FAILED: Patch "mtd: rawnand: pl353: Fix software ECC support" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:36:26 -0500
Message-ID: <20260301013626.1696397-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 89b831ebdaca0df4ca3b226f7e7a1d1db1629060 Mon Sep 17 00:00:00 2001
From: Andrea Scian <andrea.scian@dave.eu>
Date: Wed, 4 Feb 2026 18:41:44 +0100
Subject: [PATCH] mtd: rawnand: pl353: Fix software ECC support

We need to set also write_page_raw in ecc structure to allow
choosing SW ECC instead of HW one, otherwise write operation fail.

Fixes: 08d8c62164a322 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
Cc: stable@kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 11bd90e3f18cb..7f012b7c3eaec 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -976,6 +976,7 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
-- 
2.51.0





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
