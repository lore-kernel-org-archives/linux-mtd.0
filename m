Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD2ACCA48B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g39OKvYnG/vyQJdoX3wXOjnG3fJAcKSi2vU+/OJ6rUo=; b=aljBlXrPw/1VNN
	e167wSd1vxyNyLxCQaxNfmmI/qmjOmASedurposgzAoA7UFKwCXi/uQ3YXeMpIUJpbqK628Grr+rl
	Kv3loYaWoaI8NqcF7Y1tXIieO6f6G2bH1zFSHV6pAHVq7wvaga7+Dso/LP/vFFT1+B2qEfHHKkzCF
	R8deFvS40oDfcqtFTxYLGKy7tdVLish74+WirB409JY6DQnUOZ4MT07uTqyUGM9EK5bq2AtRow823
	9Fc4H6PxjuyZ55/ukJEHZNzZ9K17vvkZ9K05ECt3mQ9rXRNHiC+7cDI4DvfWrT26hrrL1crVbCmnb
	Vry+oRM5b6RkqyGPE56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCN-00000002cIr-1zya;
	Fri, 16 Oct 2026 10:30:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfCL-00000002cHB-1Ihf
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D10494E4125D;
	Fri, 16 Oct 2026 10:29:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A64CA6075D;
	Fri, 16 Oct 2026 10:29:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEFA610328199;
	Fri, 16 Oct 2026 12:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792146598; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dEV4JDvu9b4MI5F89XQ5tIsA7sj7WAJIIjrdLPyDVqk=;
	b=d2kaxmxhMGdRHLbQ6yco+f47yrJaolvGAYOZj5ryH9Jb0ToeKdZf/m3hyjujVOvDnj1kQX
	pOhxdZF+oqc6Fm4eu5aCjLFoyhP7pfFQo1Nkb4P29bh7rNX04zJqCPVyuVYEM+YE8HyTC5
	+vwUSlrshFuHaPKRnYPtGyV+d0AuLDlK/eZd/CWDfnw7oQ51A5+ZlS9RGrtpwFNzHmUCwA
	rdPVSeHfdhxTGMMzaL7s21a80ZhBxVIkD/591POP0Izj1X0ayqaHq9WX0FxUfgPUAGb/dG
	3Zp06EaR3ahbDuexkG5/lDGMi8i4yLY9D0qt6D8dQrChunTYQ/bPAgBvKlyawQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 2/7] mtd: spi-nor: Wait for NOR ready with poll_timeout_us()
Date: Fri, 16 Oct 2026 12:29:12 +0200
Message-ID: <20261016102917.171095-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016102917.171095-1-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_033001_499699_E9EC34E4 
X-CRM114-Status: GOOD (  16.11  )
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
    
    v4: Also update kernel doc for new 'timeout_ms' parameter

 drivers/mtd/spi-nor/core.c | 42 +++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..7f347141ea3f 100644
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
 
@@ -707,34 +708,25 @@ static int spi_nor_ready(struct spi_nor *nor)
  * spi_nor_wait_till_ready_with_timeout() - Service routine to read the
  * Status Register until ready, or timeout occurs.
  * @nor:		pointer to "struct spi_nor".
- * @timeout_jiffies:	jiffies to wait until timeout.
+ * @timeout_ms:		timeout value in milliseconds.
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
