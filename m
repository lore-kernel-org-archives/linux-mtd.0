Return-Path: <SRS0=yUT7=7V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EDBC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 23:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175292078D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 23:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3ipQ6jR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkRzZo2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175292078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXo2UdLDJxSRhNE7iHH8w7ZlQ0KaNlv04wndv09NtDI=; b=F3ipQ6jRQwLO62
	mSF11q7I54uuZsvSobVN/w0UZPCJXOi1Y4ozoWrr3ETLe1+HSsVQoG51IlakqbhGMhfxk7xqoCANl
	FNhOM05+pUTupnmW0301l3h/Gf7Nqb62+67WUHToOrMPpuK9OmQDDUtcQGk11PnO8vf/HGklsYiZl
	zKxtFFzll38MeSyWuuXz8f+ljhQBcoOr/f7PghiGAKvOz12CH2nwGavXHS3FHQz6IHZ/w7Zlqmidc
	LnTfBXVKbAOTTIeNZoKaNbO0aP5iNq2Shu8v4sI3lENlSVAR/Rd78GCYBxzWGPAyJ9heDtwsi6U+N
	rkrzYfgrtbgYA+udSZ+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiRA5-0007bC-Ki; Mon, 08 Jun 2020 23:26:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQxr-00079B-2E
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2020 23:14:00 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4C91208C3;
 Mon,  8 Jun 2020 23:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658038;
 bh=5dYKczIvQ+iFI127IXOGGHsWU0/YsZaZeXftt1nV9sg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NkRzZo2QJ8th5SxXeyPHztf26SBMrdfWnbMdXzfhtnjIYdoltg2m6VyEYAED40S6n
 Xzg9WiOa0GoQE0FHoMMlA/6ShUBXbQQR1f2Ok9wHWxLkiI1bg2pKh/V9i3F7gufOfk
 FRi9Mt81q0+N8GalzXaO2XumN1R51Z3eZFLY1V6o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 088/606] mtd: spinand: Propagate ECC information
 to the MTD structure
Date: Mon,  8 Jun 2020 19:03:33 -0400
Message-Id: <20200608231211.3363633-88-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161359_146556_4B5A1B54 
X-CRM114-Status: GOOD (  10.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Miquel Raynal <miquel.raynal@bootlin.com>

[ Upstream commit 3507273d5a4d3c2e46f9d3f9ed9449805f5dff07 ]

This is done by default in the raw NAND core (nand_base.c) but was
missing in the SPI-NAND core. Without these two lines the ecc_strength
and ecc_step_size values are not exported to the user through sysfs.

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/spi/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8dda51bbdd11..0d21c68bfe24 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1049,6 +1049,10 @@ static int spinand_init(struct spinand_device *spinand)
 
 	mtd->oobavail = ret;
 
+	/* Propagate ECC information to mtd_info */
+	mtd->ecc_strength = nand->eccreq.strength;
+	mtd->ecc_step_size = nand->eccreq.step_size;
+
 	return 0;
 
 err_cleanup_nanddev:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
