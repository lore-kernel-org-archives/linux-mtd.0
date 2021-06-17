Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3813DC2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 14:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C8861249
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 14:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8C8861249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B5nc/TeNp3os/zUL9VgK61utCiCTFIiypcvro3od8q8=; b=e9HfZ72NLYtJ3b
	o9kgB5wW2p2DUPNTVrTLps3V+BuA2xmPRfqsPdIegn2/hmuxOMp+T2ieZZ7l3ulhlyH0704EwOi+/
	iXCz7ZmZqLivDfFH3A4q7ay86+AxKF91gcb10OPn3GHUfi/JE7Q2/zJnB0ENvZu9FIGZYEAs1rqFP
	hLuYd6kfRsIersT+ssx4Qls8DQUBt6jl1JgW0nnVVDBF+zt+c/cSuBSfftLoYTzUt68JgTqp/Ck4n
	XhYw2TnpMVUMLscOVyfaR0JQkNHkT2WLnIEeROVSmJKrAp7YVkHurVwBHa5BrHdd7IWs5kDuCx8sS
	HTTwRFodltoPOZ23v7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltsn3-00AdyV-7M; Thu, 17 Jun 2021 14:14:41 +0000
Received: from mxout017.mail.hostpoint.ch ([2a00:d70:0:e::317])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltsmz-00AdxK-TS
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 14:14:39 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
 by mxout017.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1ltsmt-000L01-SB; Thu, 17 Jun 2021 16:14:31 +0200
Received: from [2a02:168:6182:1:d64b:e086:4fb7:9a87]
 (helo=eleanor.home.reto-schneider.ch)
 by asmtp014.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1ltsmt-0001DK-Q5; Thu, 17 Jun 2021 16:14:31 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
To: linux-mtd@lists.infradead.org
Cc: Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Add support for XM25QH64C
Date: Thu, 17 Jun 2021 16:14:23 +0200
Message-Id: <20210617141423.143584-1-code@reto-schneider.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_071437_991393_8A0C7A03 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

This chip has been (briefly) tested on the MediaTek MT7688 based GARDENA
smart gateway.

Datasheet: http://xmcwh.com/Uploads/2020-12-17/XM25QH64C_Ver1.1.pdf
Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Reviewed-by: Michael Walle <michael@walle.cc>

---

Changes in v2:
- Use Datasheet: tag

 drivers/mtd/spi-nor/xmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 2c7773b68993..b6ac37bd59b8 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -12,6 +12,8 @@ static const struct flash_info xmc_parts[] = {
 	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
 	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128,
 			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "XM25QH64C", INFO(0x204017, 0, 64 * 1024, 128,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
