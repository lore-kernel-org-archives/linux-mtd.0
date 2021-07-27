Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E5CC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:01:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1282610E9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1282610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AgytYuBT4Yg4HShlWDVx5kM41pp5bLWQYFilRPGVZk=; b=kIBF3tAdY4YC8F
	LecZ+3l6YTvHtjb9HXuVPx9jnzVCLti4Ps09K9BHfkN3iahiBlE2bDYI03pYNfTKLyqU5QNlfMjlx
	4OxIJpqDHxp3ZClh9JxF667mqIiegiQd3acsyOMaG9OuH9exJbBzmrrjt4NjcvJdZ+LthqQQ2zrlC
	lGBe+pDgQefOB6EiIOie6loBSYVazEaGC/XC8dgNxN3Eq+BRNeuUOZtrAtxp1hyncIB72ws2oZzvl
	tXAsQvDB1lIFmqLULiDYj1OiTWHg8IkoSk5a11UtjvTmN5nXk7xBKxigcY8SE5im53pTgVaNtD1gS
	Imub1foC3tZrY93fdu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8G8z-00DWMC-EF; Tue, 27 Jul 2021 06:00:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6a-00DHkY-Q4; Tue, 27 Jul 2021 04:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361652; x=1658897652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z1KEnQMB1TWuUPku8a8nzjp3TzBTGce4VMYNdWlm5es=;
 b=W3pzG8zi46TnKPaNBgXet+8Fr5ybs/MBEraYtW8LHKwQhpZYIMuZJd6x
 CWMTBc14gDbH0b5XXgO2lGHjz5D1KvammiqwiTzF8TgWMvR5RFd5LFrDB
 CkFmlEaKf3hzCqkoRYChXA7Czj7nqZCuFrTszvmuJ8LQws1oPoWie5wf9
 Lbos0DV58hAZ9ZETDbyUu4TDt68Xqjr34UlyF6NFxvjCB1rRBuBWPIj4D
 Lr753LUtWTaGf0AuTYbrb6Ou8Nbn8aswmqnLb0NepHbJoDVjrjmm31Tf1
 h82zckIRM0sNsNzD8n50lJv/cJjN/6qyvcA/xjhXbnOn++CiMMNQOqacU Q==;
IronPort-SDR: 6gGHgYUmm0stu3M/VthlRHnK2qnoedZA1MNhdL3cUMkyUS18TBkpmVP+WOKU68SstMKZMEg2RK
 w3hSm/KAvp8dVMCzEvf3Wz++/5T7CtL57nrh5rufM+2RN8mShq7j62Id0HJrysrkePxsXfPRFI
 eFwlnjVCieXP0/R9T0iEaCxGz9c7Yh78/scqOcE2CaJI/cDrvUK4OcyFTSxWT2DV1uN7X8OvKz
 1Mf1fdgwQLoJt6shtzXlLFUHA7xOqIbddszoDTYJtaNKRc3+QjnbCHRI4+VRBs4o/WoEfAxfl6
 x39iuF3vivFQMdXe9DDmt781
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="123560030"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:11 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:06 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 20/35] mtd: spi-nor: core: Use container_of to get the
 pointer to struct spi_nor
Date: Tue, 27 Jul 2021 07:52:07 +0300
Message-ID: <20210727045222.905056-21-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215412_951199_591546AD 
X-CRM114-Status: GOOD (  10.62  )
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

Get the pointer to the containing struct spi_nor by using container_of.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 1 -
 drivers/mtd/spi-nor/core.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9885d434ea83..5c8cffb5e6f2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3175,7 +3175,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
-	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
 	mtd->writesize = nor->params->writesize;
 	mtd->flags = MTD_CAP_NORFLASH;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 987797a789c8..8fddc685d2d3 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -557,7 +557,7 @@ void spi_nor_otp_init(struct spi_nor *nor);
 
 static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
 {
-	return mtd->priv;
+	return container_of(mtd, struct spi_nor, mtd);
 }
 
 static inline void snor_f_4b_opcodes(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
