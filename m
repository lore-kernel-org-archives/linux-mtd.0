Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB95C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=830dVyLgQzSyDnq7WcIDFp3OCbMKKhOcM7vmgnLw9oE=; b=tbj91Sq/gHNnrw
	kh0ACZF2ZZ2zPHkunGwwzv3yjZh0wxpefJRzpTRMKelWvnwvNPj6xWA9zdGJ78XRa0n5ofOo6Lvz5
	t7uiVRCLwgMsCuwpkdjd48vBppWgS1NsGCu/hyEtj68r8PZQ4IU7t44KXHA1bC7dWYdHY5uT5edcl
	3wB5LPsXrdVYtSyXGbkuMuO+HxBSViQgbHYB6rTwRVhD9H86f1gW30xha6cIoz3WPPWPfReI2MZIb
	QNAkQOuxMuXRy0mD5V2ggYWEW1cEG1lGD3et5cXNAmNhb5jMGXR9S7h88hUIflAseoDTeFdxxQ5Ed
	aVm9MPXuzGWVNHh9D/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFOb-00FKMS-4X; Thu, 09 Dec 2021 09:07:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFMg-00FJe0-3w
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 09:05:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 47425CE2538;
 Thu,  9 Dec 2021 09:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E36AC341CC;
 Thu,  9 Dec 2021 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639040719;
 bh=MWHUAT+QSRf94eotQxVo99grDUjLT8VxsVL550Wj88g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OkQf2K0Y6j7bt+RJ9zI+50lehAJcEYqCZilCaVzboEP8Q4+CRANRhGgMYBj18OmHV
 dM9Iu9kTYA2aSwzxLETZqb4xcdaHMWziTndXX4OCslCxC4HwgEWZRJ3lUj1LjsnJwT
 tGRkqbOVMClKdzaaJ3ezOgAw4527Qiq4vthSuEsWBpAUN/423Y0jSsBURhsuMYN541
 XyV5QnjrUhhMTaFoOc8lae9oe8SBTsZEx52IXl6aIKWwkUhAa9nblV9Hz7agWsJcDX
 VPHpg0lXNWwVyCVOkGv78JAHiRxXUER2YGbjC1nA2aXRcT7ocaNjzkR3gDYovl4g8N
 QL9Zr06i+bz+w==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 5/6] mtd: rawnand: omap2: fix force_8bit flag behaviour for
 DMA mode
Date: Thu,  9 Dec 2021 11:04:57 +0200
Message-Id: <20211209090458.24830-6-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209090458.24830-1-rogerq@kernel.org>
References: <20211209090458.24830-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_010522_377609_C56458A2 
X-CRM114-Status: GOOD (  10.81  )
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

In DMA mode we were not considering the force_8bit flag.

Fix it by using regular non-DMA 8-bit I/O if force_8bit flag is set.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/omap2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 0c7ee26171ad..2b58ddea3b01 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -447,6 +447,11 @@ static void omap_nand_data_in_dma_pref(struct nand_chip *chip, void *buf,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
+	if (force_8bit) {
+		omap_nand_data_in(chip, buf, len, force_8bit);
+		return;
+	}
+
 	if (len <= mtd->oobsize)
 		omap_nand_data_in_pref(chip, buf, len, false);
 	else
@@ -463,6 +468,11 @@ static void omap_nand_data_out_dma_pref(struct nand_chip *chip,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
+	if (force_8bit) {
+		omap_nand_data_out(chip, buf, len, force_8bit);
+		return;
+	}
+
 	if (len <= mtd->oobsize)
 		omap_nand_data_out_pref(chip, buf, len, false);
 	else
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
