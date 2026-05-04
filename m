Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E447CFF885A
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2026 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kE/GZEQzNGVqPAGSx1i2+LJra9blYw4YD53z7I1f060=; b=fbnkoros1Me5KL
	cgAR2zQ1YoHuXJPT/mY6jVlaNw9/68JqQj5zdBH2NuoqUH/z9sHDTTfsbU0KbXKmiwGNQCBegJA1U
	m4paxyiiZ/jsbAmohGTXwaM8Ri3TXKLYopgeDsOtxQ+P4dZ4fUWaF0blckcGMhrmRDnVS1pWScYhm
	GdScnv3t6ly0OZq/EQjz9HFkB8feGDKSfj7FDKN6dCAkNt1o/BhPLbCdP1Nv4kogEU4j0SaZ6qfsv
	1C1c+1WvNfNXtKm2Vkndf7zsE436Zd3nTyyZWlD+pNtTOYfrbHxhJ5kPeKfIjwPcW+a1n81/4IPm8
	PMTULRrK16Py7fNo5CsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1VF-0000000ESOc-2VVx;
	Mon, 04 May 2026 22:11:01 +0000
Received: from mail.rulkc.org ([155.212.184.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK1VD-0000000ESNg-0rVo
	for linux-mtd@lists.infradead.org;
	Mon, 04 May 2026 22:11:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23FA7100036;
	Tue,  5 May 2026 01:10:39 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rulkc.org; s=dkim;
	t=1777932648; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2pJdonCvAwld4fN0yK+Xb4wRHrqadLgYk32qyWpwm5w=;
	b=EwdnCP/UfNaCJtQp4gMxFS/oHIQUm3csgs8flJs0WhksOp+BDGJHp/kV80kj8aZCT9IwS1
	vfSXUgERRnADLxLPRB//UaXrpRSEA/yS9Dl5psrhFX1rW/eZUr6GWLUSIW/Bv1VrfCdYj8
	R09suF8AocShHLhy4at3X9CPo8peNRtGDT830QMqaqgdy5xu6+yNnaBmHAjQ74bKZ3Ac0p
	dAgCCnBNmkyxfn08IrXIwbNnHDOTiHdX4TR/EmHV24FGz0tV1CurIV98e8Jkp3wPUBYFwT
	zT2u1Ol40yHaZ81TjT2JJo0HGaV1jxvOLGmUA/Ezgp/7P23oWUaCAJ+uxiTW9A==
From: Arseniy Krasnov <avkrasnov@rulkc.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rulkc@linuxtesting.org,
	oxffffaa@gmail.com,
	Arseniy Krasnov <avkrasnov@rulkc.org>,
	stable@vger.kernel.org
Subject: [PATCH v1] mtd: rawnand: fix condition in 'nand_select_target()'
Date: Tue,  5 May 2026 01:10:12 +0300
Message-ID: <20260504221012.1310605-1-avkrasnov@rulkc.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_151059_749777_00BCD8DC 
X-CRM114-Status: GOOD (  12.54  )
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

'cs' here must in range [0:nanddev_ntargets).

Cc: stable@vger.kernel.org
Fixes: 32813e288414 ("mtd: rawnand: Get rid of chip->numchips")
Signed-off-by: Arseniy Krasnov <avkrasnov@rulkc.org>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 13e4060bd1b6a..edfee22f15a73 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -174,7 +174,7 @@ void nand_select_target(struct nand_chip *chip, unsigned int cs)
 	 * cs should always lie between 0 and nanddev_ntargets(), when that's
 	 * not the case it's a bug and the caller should be fixed.
 	 */
-	if (WARN_ON(cs > nanddev_ntargets(&chip->base)))
+	if (WARN_ON(cs >= nanddev_ntargets(&chip->base)))
 		return;
 
 	chip->cur_cs = cs;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
