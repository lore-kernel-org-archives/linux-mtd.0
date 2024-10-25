Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF178D149D8
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DaguPP7kv7arxwPZdhcjf6qSIJhCR02H93k7b4wd+c=; b=KMTlHsgJPKiyvd
	UFKmF53l04TgEfPStyeewK6m40KgShff6IeAy6dWUztEkeNa86U6gjia0p1o3vi2JU6fAPNCyK4eU
	7aGe8QR1KbVIWU2pKvbc65yZ37+s/8xJ5vQpcUiQaHP9kI+aBAO18srOV9uEuqsjTmyWWiS2kUIvZ
	JiQcGMTD8vSmmKQDuDwjEbub32olCqLdOPADktbAT/NLakTpqBypc2fCnLjSeovs827Q417hzC1va
	8zHmSh37TuoUOWM0r5gxuLjq43Pz3PAUg6iwEzGUxKoZRmeBpi2JvN5AM+DN/XP7cJvxoJlpGYWMZ
	v2McszEq9oXWtGTWPS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O9j-00000004bbz-18mK;
	Fri, 25 Oct 2024 17:31:23 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MyE-00000004Nkt-0Ru9
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFD4AE0005;
	Fri, 25 Oct 2024 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gP/qcdb5gg8KjdWKCoDKUL1fJp7AcT58aQ8bLIsoI4k=;
	b=S+w1Hwv/fKN1ElmR9O5xc2uFOUZ31/oOHy5biHeSUnEMzALff1tOvwYiMxRQnU6t/9Mw7z
	nx8mLEm88VZfrOYyJKQ3zZMB26ZyIOO9Ir+Muj8ENUXFlcVJs7P6NDexFsmVkIFpchr7/V
	gyovMfC7O7/cSWN8pmGUNELYh+MvHAfG+sPb3imx6ZD7YuhWihtfwosj7m+Y7hF1YTdD7h
	2bX8m/zCCsxrtKz1rmo6ILYvJ+C0EOLCA3RxDet23qNq1APz/4QLW//d8aTO/LDmfENrPo
	KvWCrDd0vKqxxt9/+WA/XmqqkWKd3kKUCS7C6LFLKkKSsBaiBlBQk3bW29GCvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 19/24] mtd: spinand: winbond: Fix the *JW chip definitions
Date: Fri, 25 Oct 2024 18:14:56 +0200
Message-ID: <20241025161501.485684-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091526_498281_FD3EC243 
X-CRM114-Status: GOOD (  13.01  )
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

W25N01JW and W25N02JW use a different technology with higher frequencies
supported (up to 166MHz). There is one drawback though, the slowest
READ_FROM_CACHE command cannot run above 54MHz. Because of that, we need
to set a limit for these chips on the basic READ_FROM_CACHE variant.

Duplicating this list is not a problem because these chips have DTR
support, and the list of supported variants will diverge from all the
other chips when adding support for it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 329377bf3717..686e872fe0ff 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
+#include <linux/units.h>
 
 #define SPINAND_MFR_WINBOND		0xEF
 
@@ -17,6 +18,14 @@
 
 #define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
 
+static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -177,7 +186,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbc, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_dtr_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
@@ -197,7 +206,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbf, 0x22),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 2, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_dtr_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
