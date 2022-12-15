Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2D1C00145
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnne/1kIWLb3UxRyuzrJtYSi3+ndvlXLK7saGJhGCHI=; b=rZdqE5o5lL3rKk
	vLPucsDo/ONv+rUY9E6UqzEqrxRlps1VKBPKfAhCg2yErGytaw5CR0WTXO7hwB7pNStXoRn/bDgqA
	1aA8mG1oET8bsRJhAQkQg/Qa0gtj0EnuR7M1uBsRXon2wZboFIdZ42OTreXSBDkKr/QyjqmaM4ZeL
	r0+3Ho4ocnxkyCSVdo8Quj17L3FpjQ9yQE5GdhXyU1LNuLlkyJFuA9M0g/Fb2vSo1N/bAe9U8vQun
	JHLnACjMQK0o5aXyBpUT6fpo0dEY4v3G6iGOdMDUahBJVH/JmihCWv3seHjE7xyhLWc4sWJIZ9N0v
	cL2zMueUGloxqhteeFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMJ-007Y4s-Sv; Thu, 15 Dec 2022 08:12:51 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jMH-007Y1x-54
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2022 08:12:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 90724E0014;
	Thu, 15 Dec 2022 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671091967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihyoDKMdrFOMi2XVrzupzJURomSfFtPlpzUsTVAdsBg=;
	b=ZMvYHluVF4YwhjjC98emWifNR4c6fwXUYsSoahgL3Qqy2OxrkvBinlfzNA3oP374AgtDi7
	tPIsZhtn3pn3WgSIMPEL8yrxYDKDEkiaTZIrItC/jOZdXdR6aTiPm5PI5XfP4wZvwjawhj
	JOBNR5iHM3Y/Oj3RwtKse8kBZ+l+P+Uupml5/m02aQqO2bp97ccwMof+NeROpKjRd+KkXl
	i4ei05tqesOk3KEBLPq+UKyuCiYkUmGYBKtIhnlT/Bu+M8B5fqgte+kUjTnSvYZ8Xrwkmz
	n72c9Fssn0mq1jBVKj4R2iN0FTjmeF/y/JWeRNSt1zoyRshv7NzkyeudNjsoJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 3/9] mtd: spi-nor: Add a macro to define more banks
Date: Thu, 15 Dec 2022 09:12:35 +0100
Message-Id: <20221215081241.407098-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215081241.407098-1-miquel.raynal@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_001249_351048_6DB7FFAC 
X-CRM114-Status: UNSURE (   7.92  )
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

Most of the chips on the market only feature a single bank. However, new
chips may support more than a single bank, with the possibility to
parallelize some operations. Let's introduce an INFOB() macro which also
takes a n_bank parameter.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 drivers/mtd/spi-nor/core.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8a067d56c995..044d49d749e0 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -553,6 +553,10 @@ struct flash_info {
 	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
 
+#define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
+	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
+	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
+
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
 	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
 	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
