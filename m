Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32EFC4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8bqTGwzM/sCOF2DKerFkHE/9r+T2LwsR7uJ4G1LhFsE=; b=1GcKyVf6MFutcv
	sWH7o/jN7qfQk6Qe6J4R3p83pIJ1PKfbUIoT4m2GAfbRNWNEjYFCXDCuxXqTiRPDM6y2lgm8rrO9d
	4iOQZgCowEM/2Lt5waNeavlI+1wTSkgsiyPrUfnglv//ObrjfAQTGPp27bK/FqjEx1/FZ5aXEOgsT
	2z87ZkfEGJIZNuAfsnPRe77yyUb4cHO9vR3/slTSVh6ezLdUs4u6kNUWkBtohGfNvA+25CiRv1p6I
	AkIji1UtRhEQmBZ/RoaUKgHg66ZO5ow0LmyTIfnDFPIJx6/mXb6luX/fvfm4V9Bc3w4Q/f8+wpMfm
	pz1J6rmFhiLk/o3jgZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQLO-006ZVN-07;
	Tue, 05 Dec 2023 07:59:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQLK-006ZUW-2S
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 07:59:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D827C0007;
	Tue,  5 Dec 2023 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701763179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IFopPnr2RTizq0lI60QxnaJpxZBJXLYBiZefDswc5eQ=;
	b=BmX1oDtpRse0RydZAJ5Kzrt2joXf8NkLmAJuOEBa380RYLPLyX8TWkp4SbY+8TnFbd+zZ4
	sit4S/Sjn0evzf/Vi4MLtOc54kiH1190m0/8837lYUa/41WTh0oT7TxNROsQlu/oR7g65T
	saNiq8KHF4kTqOw5XaF0SmnX3naBA65QRNbbp5k42cUYTOixxOQcwbroj2VkCBSZb0Zjsm
	g/s9+tUUR+2tE7f9zdcRSH8u4XBbfRWyBTO4cEDIOWe/Og6pFSsTUj8ngszIDjXfHMrhq/
	UDA1X34XoepOFJpnRIhTwCrXjIWPIoWHUYhO0PFJc4oHbId8SCfziJEzYwPrtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: maps: vmu-flash: Fix the (mtd core) switch to ref counters
Date: Tue,  5 Dec 2023 08:59:36 +0100
Message-Id: <20231205075936.13831-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_235946_944154_106AD869 
X-CRM114-Status: GOOD (  11.49  )
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

While switching to ref counters for track mtd devices use, the vmu-flash
driver was forgotten. The reason for reading the ref counter seems
debatable, but let's just fix the build for now.

Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312022315.79twVRZw-lkp@intel.com/
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/maps/vmu-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index a7ec947a3ebb..53019d313db7 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -719,7 +719,7 @@ static int vmu_can_unload(struct maple_device *mdev)
 	card = maple_get_drvdata(mdev);
 	for (x = 0; x < card->partitions; x++) {
 		mtd = &((card->mtd)[x]);
-		if (mtd->usecount > 0)
+		if (kref_read(&mtd->refcnt))
 			return 0;
 	}
 	return 1;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
