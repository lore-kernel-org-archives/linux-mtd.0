Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD12CC6B2C
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AigVjmdoPk1jCm9ZhWrEJBnyEkYnTswhOUSEBLGUuM=; b=pJ24c/C7M5jyqm
	mGBreQxQnxx9W2KzZyFXZByFuHjqagCRlHnKeb9vwj/qtSqJoDk35wtsngFvwlkHRORUb4AypHb6b
	E5NfKDuKFoNxEMcxpjRtsGfw9euYZBspyWKXRgjMrUuK6KPT859DrLUTfpVQ2LwIJRV3Qn5qxafQt
	E0Vr7DzxYqjBUlNXqWwksP4sYVkYHhi20CkeT7AKZbhzDwzvVLlg+NGZBEsWPiG/P9R8lgG86TlNu
	ZAQCkK73IaN8JDOK0rBpoCWup7PRkBKxUVVCuvq8q5BdG44QzORla8015kWcRnSlAw2CJQ9kQPxl/
	sHTVK2nela3PQBkqZvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH19N-0000000Fssb-3W1V;
	Wed, 14 Oct 2026 15:44:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH19L-0000000FsrV-1U3C
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 15:44:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D035C4E41229;
	Wed, 14 Oct 2026 15:44:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E80F60368;
	Wed, 14 Oct 2026 15:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35E8F103284ED;
	Wed, 14 Oct 2026 17:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791992652; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=L3yzdkIIoXv+mg+K4J6YhHul2QjJeOxkn+qRFdP45OA=;
	b=it6MIToYsynzobACp4L5OJp1WnYlJ7aazkBmu4Zj5E6nddHy4iQ5K2pWaZhEpIf31lCCfs
	AetRiCanK/zzhBFbgPS+DAsw5nZF4wWtojnNd29rV4f0O/pw05S9/MXEmWVVdY5msS5A+o
	wX2eVxMgizrO5A1KrURLqeNXzecPnP4q+t9gHLppGxdJ6pVyW7ahK7m6IAqRgysjIVqvjs
	8p89hu4s0nHH9Abpmw4UHUieKvB0K5pmywQX4sXaIv7Pp/wPQZIkv4rR1gGP6Pya9sxF23
	bOw8bQMUdEuHjyixpunzIF3EcWUJL/xibTZEX74DhkYJzBEVTK6FHr1+QMl/kw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 2/7] mtd: spi-nor: Wait for NOR ready with poll_timeout_us()
Date: Wed, 14 Oct 2026 17:42:56 +0200
Message-ID: <20261014154301.157755-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014154301.157755-1-paul.cercueil@bootlin.com>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_084415_535634_0F895B05 
X-CRM114-Status: GOOD (  14.73  )
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

From: Tanmay Jagdale <tanmay@marvell.com>

Instead of polling for the spi_nor_ready() with a custom loop, use
poll_timeout_us(). The sleep period between two polls is set to 100 us
which I think should be fine.

This will make it simpler to support waiting for the SPI NOR in atomic
context later.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

Notes:
    v2: New patch
    
    v3: Set 'timeout_ms' parameter to u64 to prevent u32 overflow

 drivers/mtd/spi-nor/core.c | 40 +++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..58257cc21c68 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/iopoll.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
@@ -32,13 +33,13 @@
  * For everything but full-chip erase; probably could be much smaller, but kept
  * around for safety for now
  */
-#define DEFAULT_READY_WAIT_JIFFIES		(40UL * HZ)
+#define DEFAULT_READY_TIMEOUT_MS		40000UL
 
 /*
  * For full-chip erase, calibrated to a 2MB flash (M25P16); should be scaled up
  * for larger flash
  */
-#define CHIP_ERASE_2MB_READY_WAIT_JIFFIES	(40UL * HZ)
+#define CHIP_ERASE_2MB_READY_TIMEOUT_MS		40000UL
 
 #define SPI_NOR_MAX_ADDR_NBYTES	4
 
@@ -711,30 +712,21 @@ static int spi_nor_ready(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
-						unsigned long timeout_jiffies)
+static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor, u64 timeout_ms)
 {
-	unsigned long deadline;
-	int timeout = 0, ret;
+	int ret, status;
 
-	deadline = jiffies + timeout_jiffies;
-
-	while (!timeout) {
-		if (time_after_eq(jiffies, deadline))
-			timeout = 1;
-
-		ret = spi_nor_ready(nor);
-		if (ret < 0)
-			return ret;
-		if (ret)
-			return 0;
-
-		cond_resched();
+	ret = poll_timeout_us(status = spi_nor_ready(nor), status,
+			      100, timeout_ms * 1000, false);
+	if (ret < 0) {
+		dev_dbg(nor->dev, "flash operation timed out\n");
+		return ret;
 	}
 
-	dev_dbg(nor->dev, "flash operation timed out\n");
+	if (status < 0)
+		return status;
 
-	return -ETIMEDOUT;
+	return 0;
 }
 
 /**
@@ -747,7 +739,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 int spi_nor_wait_till_ready(struct spi_nor *nor)
 {
 	return spi_nor_wait_till_ready_with_timeout(nor,
-						    DEFAULT_READY_WAIT_JIFFIES);
+						    DEFAULT_READY_TIMEOUT_MS);
 }
 
 /**
@@ -1781,8 +1773,8 @@ static int spi_nor_erase_dice(struct spi_nor *nor, loff_t addr,
 	 * pull these from CFI/SFDP, but these values should be good
 	 * enough for now.
 	 */
-	timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
-		      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
+	timeout = max(CHIP_ERASE_2MB_READY_TIMEOUT_MS,
+		      CHIP_ERASE_2MB_READY_TIMEOUT_MS *
 		      (unsigned long)(nor->mtd.size / SZ_2M));
 
 	do {
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
