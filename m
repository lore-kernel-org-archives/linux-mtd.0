Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A19CD6E52
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qknKMNYT9QuAJ2Y7iLWddM2AihyIjcxeqCtsGeUf+JE=; b=uu0WXsbRKmQBhl
	d/FieYdO31AH1lCy6A6tTYblr3pS8yXP6nmk9WomAnX0mJJDBEbIBLe/KiZXmTeO3qUIR507cIOEq
	vkYmzW5mO8xaEXqCz072+SkS88DgDMSzpU8ptyq2PlrBW6YANK5rc1L05uuXXpxZSErlmID/L1CEY
	/tjcyadIS+hp0dzv4AQE2+wsBXbT+7rQbC+/1ERkFwKN3RNkT8uSYbx/B1EO7Rzd44wus/CP29pNf
	Yfw2Qi7remSQPjkVhR3P2hHUgxK+vwGHOLFYn6uUX1Mv5MU6zWLaqSBdnod6Vri9RKC4DDA4BEsVc
	7tai5LFdM6DBBlpCmIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3Q-00000007fxZ-1zMq;
	Fri, 29 May 2026 15:23:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3J-00000007fkS-1jKl
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:23:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F16AB4E42D8D;
	Fri, 29 May 2026 15:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6852601FA;
	Fri, 29 May 2026 15:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D90D10888CC5;
	Fri, 29 May 2026 17:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+5qy+Wx8CuCVygHaFLnoRc3bI1wnl8rQeTR5ZK1q+LI=;
	b=IX9kFRUXqa2/+7ncT+IrgXCPUKWnM8ZxT9ejZBgTVKylJsbArlnJ0N7E8CIiePLVJuKIp0
	yOJm2+wyeWShTfEJl0ddhuT72Mrd7erIXm6Lg1fzsWtCj5n6SbZbTwRUNxgSi2QjocMVJE
	zyvdiB0vj8axh/qzh4eSnyZ3E5fDmwpgpv8uU8iB+wM2rB/cquLBxCG7tiRx+4rf/O8sdk
	jBU+bWddKoYts/EMLGPK9rTicpOhQ9cFrUo5Lrv4cl6yUQT72cFNevyzIc1bSlasLUP8X7
	VEa2O3tyeaVEElbkztEti3NVN7eCitCL5ZK4AlzyD6TNbDMiB/vl/3YPFak1Mw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:39 +0200
Subject: [PATCH 19/30] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-19-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082313_634436_108ECB9A 
X-CRM114-Status: UNSURE (   9.95  )
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs.

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 2612 KiB/s
page write speed is 2509 KiB/s
2 page write speed is 2560 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 3033 KiB/s
page write speed is 2895 KiB/s
2 page write speed is 2976 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 78a31e71d3f1..7286d50b0c53 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -294,7 +294,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
