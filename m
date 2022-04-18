Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D6EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RZga+9FLSXdd/S+f9tFcrdouUpKd6KwdcrcKOx+p3E4=; b=qcXwwUUUuWj/oQ
	iiGORQYn+FskcrqUJtmTikFPGmELpWCSWcvO74Pb4qCqylpKjXINIFXMRGb96lyKUp5V2HbYxisOB
	ZtfMM0XH/R4dODTJ/jAQ089XxxsjE9paERA1tiHB5J5EpNMyekpeFPMJwfHoM8ho+8dWVueCV9SUP
	vwA0i9frZ/tiy3carTT3sjUBdniglvjvb4l84y0OLG/VifiS0JPB/L8o88wEYctTDpIQs7xtpxliU
	WuqKvHZYbXDeZ+OFfZvpwmy8VKqo9Fq8fANPaGzh9G5iM4dnvAdvYaKBdEBtWZPoi5onErwuN3Kqe
	UyRH+w2Ms7ESSCJYkMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngPYm-00GTLN-7K; Mon, 18 Apr 2022 11:28:48 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngPYj-00GTJz-Gi
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 11:28:46 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B653622175;
 Mon, 18 Apr 2022 13:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650281323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bCzNL/7uXt0NT32D5VA18mJ2DTCEuxlcZNdnFPArBZs=;
 b=J13lwNkcg5/QJVhfzarFXxZeWt0N7uLvRqy+gRv850NuTBhxXtHX2+L1rZtKYzZ5kDwXWj
 YjKgbbK+QhvGZHu9ocDnZO209p4QNL8K754rNPwnN6ZA2hUtVbC9nearCN2/pECsQVivBp
 SOHAsSCtES80VOBq7Q9tqG/6P1dmBIs=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: spi-nor: amend the rdsr dummy cycles documentation
Date: Mon, 18 Apr 2022 13:28:37 +0200
Message-Id: <20220418112837.2792242-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_042845_744754_83CE29DA 
X-CRM114-Status: UNSURE (   9.50  )
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

The rdsr dummy cycles are only used by the 8d-8d-8d mode. Mention that
in the documentation.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e355457a8555..beb622ae2779 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -236,9 +236,10 @@ struct spi_nor_otp {
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
- * @rdsr_dummy:		dummy cycles needed for Read Status Register command.
+ * @rdsr_dummy:		dummy cycles needed for Read Status Register command
+ *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
- *			command.
+ *			command in octal DTR mode.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
