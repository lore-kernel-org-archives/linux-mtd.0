Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D022C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fYVOW0zJPf427eV2DaHyQvK2cu0EZ3BCpa93QXURVY=; b=YxPwsQadQRrGCK
	Ms/W810U9mRxw4TtVzoxXJS7mIYLL7KWRDNIzV1mism4ZfHT3FJSNMTFeqBmons/gsqfhS3QkF6bq
	vLbwxHZU3DIk8xnj11WcONSCtEBevXuaLwR6h3nrvkK0YjO69BpsJMjRVdp2aduu1jO0/k9FvDNfF
	loODnPAKkd2wezh1NRAvA8kqfNilyapNZwmGkpa7q3mLX0zInW/zYyatQSrVJGVmeMaVuhKfqr7gH
	iw3+VYW5B2W2pIHDHda5RI0X0dkZaQAwIVxHSjulXg1bhxvT8yv5bRlV22kE4aO23tGJsxc9FmWO/
	jKA2z9MT5ZynfxS50wSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9ts-006wxi-Hi; Thu, 10 Nov 2022 15:55:32 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9tj-006wrD-LK
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 32D6F20007;
	Thu, 10 Nov 2022 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C51q0U2/0wTS/ZVCiEdunxb3b26NHQ1mconNJdeKVbs=;
	b=DiHotdb32uItw+uCfQrLhUOeD8yZDNZx9VK/S8qcL5fyB8zEbW4ojLT4Ig/6WuO18+mE08
	udWEWrFqUpqZsiX31Myvhv7WmJ5tGID0rWgABvGiyvqcCF8mlvaLUAJKIYszxV5ecz4+kK
	9PNpDKH+aF4uqoGaXG4ayb8pAM6EruaC3I7qhhCayIYfB6Au1kwMPHTu/0CAvGvxroeAwT
	ocOvfG9hHNKMB3DwBqEVWNwXHIQdLaE2F4pHxL8D+mhD6JLMfMMZPCCi5yqRy6SAZumglb
	KUsUe5y5rFG5gOYYBR8SNaAuy6YzYG//RU8lRYcNyvmM/HcAvGPHQWvX9M3kbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 4/9] mtd: spi-nor: Reorder the preparation vs locking steps
Date: Thu, 10 Nov 2022 16:55:08 +0100
Message-Id: <20221110155513.819798-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075523_886633_6F50BDCA 
X-CRM114-Status: GOOD (  11.17  )
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

The ->prepare()/->unprepare() hooks are now legacy, and there are only
two controllers left supporting them. In both cases, the implementation
acquires a mutex, which is somehow redundant with the spi-nor main lock
that we acquire as well in the spi_nor_[un]lock_and_[un]prep() helpers.

While the mutex taken in the core is necessary, the helper can be
reorganized to first do the preparation, then acquire the core
lock. This is necessary in order to be able to improve the locking
mechanism in the core and should have no side effect.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 38a57aac6754..de77ca55f74d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1074,23 +1074,20 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)
 {
 	int ret = 0;
 
-	mutex_lock(&nor->lock);
-
-	if (nor->controller_ops &&  nor->controller_ops->prepare) {
+	if (nor->controller_ops && nor->controller_ops->prepare)
 		ret = nor->controller_ops->prepare(nor);
-		if (ret) {
-			mutex_unlock(&nor->lock);
-			return ret;
-		}
-	}
+
+	mutex_lock(&nor->lock);
+
 	return ret;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
+	mutex_unlock(&nor->lock);
+
 	if (nor->controller_ops && nor->controller_ops->unprepare)
 		nor->controller_ops->unprepare(nor);
-	mutex_unlock(&nor->lock);
 }
 
 static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
