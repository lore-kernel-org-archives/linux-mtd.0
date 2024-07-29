Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57879C49EA1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2024 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lG4QB3kl7O2v1OaY79oVv2wGFM1pxL8pWrnR5QLpB4=; b=yIoes0tkcSlLHc
	Jy8C9HToAvu/3tCaZDONBB/anBfzZTKJhtmJI+nHlAjVVpCUUyvvVa+ByaXhGgxeKbBvtW4eSI0ua
	PYZyS9sq7O+Gqzt4hOxMoJq0JM7E9Y54riwhr2ketfQHqNlNs9CPdprnTQpHa/KRKFIjW5rSK2mD5
	YT6qP/d7pGqH4eFzyQxyNxjfLvjCCTb8NRKSYgvWQpMw4soDxggjZQgfn5JeC9B37/IQIKc80SD6e
	RM4SGGYmNYfhY/R/YbFk2q+cwhv3HEFdy0P0Q7geQHyy4QzpgHM7Bhf2g93dPCxD2UA/uEpgPasxS
	1dgUnHc3c1g8/wRE3dHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUu-0000000ArYP-14zs;
	Mon, 29 Jul 2024 10:20:56 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNUr-0000000ArXC-0ylc
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jul 2024 10:20:54 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024072910204967a5549c034150d2b0
        for <linux-mtd@lists.infradead.org>;
        Mon, 29 Jul 2024 12:20:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5lAwZ35so0g3Opkau6SN19xyym/rO9tJ9VbL3jvpo0Q=;
 b=NhSLYj6VLf81go5ydwcLhxC2qVdXBuENFmXz89HfmsZAt2g0NWjIHBTPnUDnoCwNFsYZVp
 6fkbeqyUPZhOq3KB3/plaCWanUXUydvd8zzI26CJhqaL2DBv8DqAJRjtLNvvPxN6dFtUYwir
 F/5FnfLZl3mhmFgRTMrnSUEt4wMQy9oaUg07PU5yR0GUYKRZPPuoTWgHcX5IEYYaADihCDmG
 hPYwUCuQa7oM+DALEvxqqbTydcONavJ2clxM1LZqT264eSFRKy58Y/+mNrkLCRsfsMdqetyq
 Eve/RPAQTOZWPiJTwNDcncwg9Qeuv2ufRMF0ClsW29It2+9KPw1TkbGA==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 2/3] mtd: spi-nor: convert existing devices to use mfr_bank
Date: Mon, 29 Jul 2024 12:20:15 +0200
Message-ID: <20240729102016.8527-3-alessandro.zini@siemens.com>
In-Reply-To: <20240729102016.8527-1-alessandro.zini@siemens.com>
References: <20240729102016.8527-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_032053_432779_8653FD75 
X-CRM114-Status: GOOD (  10.07  )
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

From: Alessandro Zini <alessandro.zini@siemens.com>

Convert existing devices to use the newly introduced manufacturer bank
information, instead of wrongly counting continuation codes as part of
the device ID.

This patch depends on patch #1.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 drivers/mtd/spi-nor/issi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 18d9a00aa22e..4966580fc0dd 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -60,16 +60,18 @@ static const struct flash_info issi_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &pm25lv_nor_fixups
 	}, {
-		.id = SNOR_ID(0x7f, 0x9d, 0x20),
+		.id = SNOR_ID(0x9d, 0x20),
 		.name = "is25cd512",
 		.sector_size = SZ_32K,
 		.size = SZ_64K,
 		.no_sfdp_flags = SECT_4K,
+		.mfr_bank = 2,
 	}, {
-		.id = SNOR_ID(0x7f, 0x9d, 0x46),
+		.id = SNOR_ID(0x9d, 0x46),
 		.name = "pm25lq032",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
+		.mfr_bank = 2,
 	}, {
 		.id = SNOR_ID(0x9d, 0x40, 0x13),
 		.name = "is25lq040b",
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
