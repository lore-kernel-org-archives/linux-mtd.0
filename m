Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79930C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtHTCXjrnVYMV0TyqNpHb24TzJd899izx+PAnT2sd/w=; b=bna5QWd9t+gETW
	euU5kfNzFdqLYgLTwFfARki6zy2+g/kUugIXNcJrUIiWaaxNvbhYqwlf1ZX8YsIYMP71Q3BT+T2Oi
	Nq6jrF4SMMHx1i6XbO8sElzdIWc/axKXuYfYCMBdUnr0N3KnOr3vAurBHOyfIAVFMbzRhJTgFFiQN
	Fgfz10cpYP4R+Tzgg5Sqn5tEjgDsvtl8gPDY57bZgic9LfGITBbQ0zVbwzuAHtpOK6O386nM6dnoh
	+F2o1X1bNaVMFDRKxwFJ0ESowb6SZnJVcp7bNBKrKBwRpaAA0+zfRxHZ2TP/GSuJskT5yZ0Oleknw
	IPQUD936aAhZMtvmdXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlni9-004ZGh-2e; Tue, 03 May 2022 08:16:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlni3-004ZE6-ED
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651565799; x=1683101799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aaI8Idc0gs8g1ysFMCchHDjzmH440mYSa9+QvLu7i9k=;
 b=gS4+XdqjMBVT2LqUwGmQy0HuseqWej+sEUeewYqOBeBcuE2SuJWnA1tT
 G7+m4VWWipJ9uvY47ABfVxjZLyS9mkV6xH8e4AbgynU45z/wJBvsdqSYo
 OXRSlIcGlZRd23HC+ExTse7hMWdGImj0ASxfEfuoX0AhITW8IMFRudCAe
 t5t/GgXiOmUIaQWPEIwYmIYztm+3HfVncOlifGopgkoLPrUjOM3B9uKRW
 vRBrdG4psQIx4c4t2qcbCPYvsdcWujLpdJzdMOvxTVOkiCKE4jiSm0OGZ
 j0jU54rAwM8UWXN8O3nxOD/XI4RVDBrdCjk+bCSurp2/BSHeaqNVka4HK A==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="157607141"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:16:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:16:36 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:16:34 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v14 2/8] mtd: spi-nor: core: Shrink the storage size of the
 flash_info's addr_nbytes
Date: Tue, 3 May 2022 11:16:21 +0300
Message-ID: <20220503081627.341870-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_011639_580879_9E994E30 
X-CRM114-Status: UNSURE (   9.43  )
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

The maximum number of address bytes in SPI NOR is 4. Shrink the storage
size of the flash_info's addr_nbytes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5fc3d4a8add1..fe7683fe1b4d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -493,7 +493,7 @@ struct flash_info {
 	unsigned sector_size;
 	u16 n_sectors;
 	u16 page_size;
-	u16 addr_nbytes;
+	u8 addr_nbytes;
 
 	bool parse_sfdp;
 	u16 flags;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
