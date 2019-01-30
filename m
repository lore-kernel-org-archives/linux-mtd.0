Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDE5C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:26:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E482B21852
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r5ggH04C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=procenne.com header.i=@procenne.com header.b="Gv+etr2A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E482B21852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=procenne.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BGIvCFDWpXYPhDhTxgfggtqLmr4aSAcM0uEhKwyxwsI=; b=r5g
	gH04CTXdHBhuJ45SQQH4DyYu6PSzm8dvQVPyCIE+aPIEMw4nyHwbefEBjyTHVDRi8adgEyO8oImn1
	q9kmXw6PVvNJcF6XXl4ace/ukJHgf6GmuL6XWjBdKW1USB1QnAv9fcew/Bc0ZjcwdcUEzZ3P5urDE
	M2wkl5PQGZxfhh2aJWhrby3i03jq5MtrnbYzzWcOVorMclZhOtpyHNCQpta+nerHOCRR0tnYne0jv
	zG1+tXW/WCtXXdKTEz7O+yTGG/l0A8W/+SZtyy8j21uTttfwudWg6He86j/dY6R5FfQ1lY96b3mD5
	LyzBVmrFUH+ETj498g8JQcYwj/BEu3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gon4g-00085l-1g; Wed, 30 Jan 2019 10:26:30 +0000
Received: from forward103p.mail.yandex.net ([77.88.28.106])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gon4c-00085S-Ps
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 10:26:28 +0000
Received: from mxback6g.mail.yandex.net (mxback6g.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:167])
 by forward103p.mail.yandex.net (Yandex) with ESMTP id 54E6B18C3AA3;
 Wed, 30 Jan 2019 13:26:20 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net
 [2a02:6b8:0:1472:2741:0:8b6:6])
 by mxback6g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id vwrbtzDhBo-QKwqOLhe; 
 Wed, 30 Jan 2019 13:26:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=procenne.com; s=mail;
 t=1548843980; bh=qmRG5aQ6QmGPFRiW2p1c+ivA68Ndf6olke1rX9G7VqU=;
 h=From:To:Cc:Subject:Date:Message-Id;
 b=Gv+etr2AdABz1P3uKdzg8TFpY4nv9L4Nkn7MY7vkIe/Sz0KZlcR5in27xcdtATOJ9
 YXuwu3itwoKMN1q2qGJr+uazHz2ovodbAcEfvqZSN880oesFs3MXpi43W5xzS0TqkV
 8mdXMbAAenr5fQl7iQiA5iYS31DyvS/+wn71i8Xc=
Authentication-Results: mxback6g.mail.yandex.net;
 dkim=pass header.i=@procenne.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 zM6VNBYSId-QIHKxPiU; Wed, 30 Jan 2019 13:26:18 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: "A. Celenk" <ahmet.celenk@procenne.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: split s25fl128s into s25fl128s0 and s25fl128s1
Date: Wed, 30 Jan 2019 13:26:10 +0300
Message-Id: <1548843970-8473-1-git-send-email-ahmet.celenk@procenne.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_022627_014221_D853C405 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "A. Celenk" <ahmet.celenk@procenne.com>, Marek Vasut <marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
the s25fl128s qspi memory, the single "s25fl128s" device entry must be
split into two to match the correct JEDEC ID's for each version. Solves
paging related issues of S25FL128SAGBHI210 chips.

Signed-off-by: A. Celenk <ahmet.celenk@procenne.com>

Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 13a5055..1ee2d56 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1898,7 +1898,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
