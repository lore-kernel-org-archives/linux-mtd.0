Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1BDCC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozaEck6z+3ct/6Pr0yukCyWg3eVbKl/T3dqnG3wltl8=; b=Vl2XtgXpaBttPx
	HkZjEw7Tzf0w/Wodegb3usLnmn0jO/UPsk6031u1p7fNgga60DMnRVGVV0J2uLqWU+SGoRHeOKhXp
	9qIZ15lvaXQ4MU43lhRjwDXXUAkVcql9tgUym7PqxECPU1SRNuaNIjliPCBcM085u4FQ1GaLyzUko
	HgxMOITu/FwPdPZWjtiVNTNM/VbmbiyLpLhFJzV5HmVHTLWNDvYXjYrdEm6K/WOuENsufDNhx/+yb
	6E9rJi6q+EjY7NeMdCwG7eWnX9ELWX1hVwN+XvjeyUymywspC60xzf9rOSS38wPA/CBSlpg7Eco7z
	JDCrtrRKb8ruynCVcG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdHD-0000000D3IO-2W2R;
	Tue, 13 Oct 2026 14:14:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdH9-0000000D3Gg-2vYJ
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:14:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 411381A11FE;
	Tue, 13 Oct 2026 14:14:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14C7C60362;
	Tue, 13 Oct 2026 14:14:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AABC11D71027;
	Tue, 13 Oct 2026 16:14:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791900877; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LT6bzH7ij2G7iHBsS599MfmBcz4/Mb03S3bgNvQVnBc=;
	b=dIfI6zYRJRaiFANLMckonG3G2cKjzZfwbEjyFjxFpw+XLuDKqycktDUHuZLYdUOw/xj6Su
	2m0XvMOf7b982RCQECaxwaoyxL8nGj0nzeOGh3utsEMIQSjVt4a5t3Ew/xXYEt1HOYIRgJ
	CDSOEeZqiwWje+jzBX4gpX/XzrNZEp0wAm6s/ejC647ggEjJJo0wOv50+pqcI+XhmCRy9w
	ViJ2I/hR8fiEX3pv/kEtUeFpwaAS12clz422LFCezMrp3tj6XKMJjD5rRHM7pq9LZQBWQV
	k9ocVuKftSuXs1/JG8XfqppYq2iAhkF6enAZw1diuk4nSbnzEIBAUS1FIZw9bA==
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
Subject: [PATCH v2 2/7] mtd: spi-nor: Wait for NOR ready with poll_timeout_us()
Date: Tue, 13 Oct 2026 16:13:45 +0200
Message-ID: <20261013141350.189996-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013141350.189996-1-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_071443_876237_CEF217DA 
X-CRM114-Status: GOOD (  15.12  )
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

 drivers/mtd/spi-nor/core.c | 39 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..2509fb983d4f 100644
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
 
@@ -712,29 +713,21 @@ static int spi_nor_ready(struct spi_nor *nor)
  * Return: 0 on success, -errno otherwise.
  */
 static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
-						unsigned long timeout_jiffies)
+						unsigned long timeout_ms)
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
@@ -747,7 +740,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 int spi_nor_wait_till_ready(struct spi_nor *nor)
 {
 	return spi_nor_wait_till_ready_with_timeout(nor,
-						    DEFAULT_READY_WAIT_JIFFIES);
+						    DEFAULT_READY_TIMEOUT_MS);
 }
 
 /**
@@ -1781,8 +1774,8 @@ static int spi_nor_erase_dice(struct spi_nor *nor, loff_t addr,
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
