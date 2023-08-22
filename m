Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50262EE49A8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HicNbg5MwI1Fl+MBsLvgfmWYmECklFVSPpata0RqyWU=; b=2WJrQrDd5hpc1O
	AHc+TF0eYwKBOtHFiUTjz5RCcFH63QamGPb75Z7Kmm+Xyow/2nUoWjeX6PsWxlWPWt8tgyVcNc4Ke
	W3eBE+V9d2HATJz1raCGk14kE+cMuSnFHIIc+YcUQQyaUHNWpbjb00Z+zwZkzoU5B28z4A894cDR8
	Exj5qJUHH4mKCLfA7xuiivYHqmegEzBFmrOtczLpZb/61Q3N7mOYULjcq8eTkv6r0Bda8ygKZ7Pwm
	0t+n5HUzKQZVhzCKTqUceuz4pZ/e7uM3xcI4Ua9BD8D9ltstp22x6O7PCnx/dXXkrZmFRGbZyfXwD
	49PDxA91YvW8Z9+bm9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWN-00FHpO-0V;
	Tue, 22 Aug 2023 07:09:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWK-00FHoH-1n
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:09:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1507B64D4A;
	Tue, 22 Aug 2023 07:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FF4C433C8;
	Tue, 22 Aug 2023 07:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688182;
	bh=yto9V/zcEZBJmLMoKJpHfJ7xX1RdTjUYPmlgcSHSm3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XcByFBx9BxiDHx0SrX6nTwNSxcYdjeo9UltySMbXGY707cFzznvdcs8Oy8DbPPO5Y
	 TKu005fIxvsutMN902ugXc1x127/6zsfghqtUDov+klcLahpzNrsa+fHGWX9NEO8ao
	 XP/SjtR50QoSeVvNqF1Qnvwo+Lwipledr52NjDR589DgJ+Lfb4FjtuRO3AHUQ13HSL
	 ED6JXjS9jshKbtJunlwRmXVMkYO2iCLFMQ/o3dzRgL9NhMnT79o7vWCzJFH2FyCFnd
	 OlIHgy/nW8kYL7DNgNFuIo/QKfjwZ1PPDMY2qKiU+OgNlu/TRavJHggLCpVeM+INJb
	 n0EMFSP6lF4GQ==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:19 +0200
Subject: [PATCH v2 03/41] mtd: spi-nor: xilinx: use SPI_NOR_ID() in
 S3AN_INFO()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-3-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_000944_636953_829C349B 
X-CRM114-Status: GOOD (  10.29  )
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

In commit 59273180299a ("mtd: spi-nor: Create macros to define chip IDs
and geometries") SPI_NOR_ID() were introduced, but it did only update
the INFO() macro in core.h. Also use it in S3AN_INFO().

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/xilinx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 00d53eae5ee8..de5189c38432 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -22,12 +22,7 @@
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
 #define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff				\
-			},						\
-		.id_len = 3,						\
+		SPI_NOR_ID(_jedec_id, 0),				\
 		.sector_size = (8 * (_page_size)),			\
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
