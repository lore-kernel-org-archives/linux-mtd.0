Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D550C433DB
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B80465017
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B80465017
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+tt8AShCBY6JLJA+5Pha9B02oXrV9Bq+Nl2P8CRqA/k=; b=R4S8DRyrWf40acACSzp92/Ypn
	Ie5axikNKaSmU3phJPk8qIxk1BNsVBEM1sb3if0xigmhXBVOzmJ/8mCn+o+Ej9yI7M9Lfijj4rKRo
	wP445wiBxxK6PcsZ19hs7Dv3V84o7nwbkTJa5qgrPqv2zqBWwCbceBlbQr8pyVKHiEyieKcn7bPL2
	ExRsp+NoWQFHj3kHqIVc4xri2kj41iBcZZ8iDXgnCpQmtDw7ysn4U4hq+ols1OLnHsEFFfGS1fPzq
	UKPOrxES9+GK2+j6uuQboTYphT9cS0iJHZOfxBjb0IBltgaLSWgZZQW8yuXplMph+j2x//r1dmowa
	8mJfvNfag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lITaM-002iZZ-7K; Sat, 06 Mar 2021 09:50:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lITZm-002iQF-Jy
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 09:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615024222; x=1646560222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ntGPrOaW4RoWXY/jkpumcnSQ+hE89vhCyHANUqE9kEc=;
 b=Duhyu0lx4/mcEvllZjnAQPOGF9rR8laGUEuK/x+Od/UpJ7AwV011gKe8
 EWvyczA5DSoiS6dXWWIjRnfZ8LMQ+C1uLTTGK2V33Pvjki0kPWVMbLhRQ
 +0fjk27a+G3cL+nrVYIgbG8KzFKBD7aBT+Rh0NDvSse3V8/5t5eAnHi5i
 OgVOgXmh59dyydVJL13pjXKuX5+LndIpGw6bN/158cZho4cyUDJ4QkwCV
 14kfB5zRbBUKFONL8WHAlOlI8xGuOBKbsFOZARd5pcOTVfBwev8QlBAow
 fJQAorE/OhWsFl6Utkpg3edTrN3JmGuicUw2BnVGdrU1cHt0f4mYY+Uqj g==;
IronPort-SDR: Q0r0o8Ei2NK0Hf0zmhitHDUvXgcDKX5+zjcHjOx3cxQUYtAjP4McLzT1XThqPGCFOKLMHxgW+9
 favsPeipU2xAXgAkWSPd/3vgVf+CQsJ3zL/S99J2+yVYJiR7oubKRMjhkgAyjXoOiCAu0kWvpO
 EvInX7/woOzTOd4Ti07L+42FlsQWwX3OOrh1OZ6vXcJWtVMIvI3ZV7/4I3GTCjDfHTjmNTqHvl
 zS/fKs9AtmeBEn0M+4UNGKbQMYBm5EYF10HkiUy3rM7Bd4YrnW+ODKbkDSbqk9mvecNbkVSE+b
 kIs=
X-IronPort-AV: E=Sophos;i="5.81,227,1610434800"; d="scan'208";a="112202514"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Mar 2021 02:50:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 6 Mar 2021 02:50:21 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 6 Mar 2021 02:50:19 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 5/5] mtd: spi-nor: swp: Drop 'else' after 'return'
Date: Sat, 6 Mar 2021 11:50:02 +0200
Message-ID: <20210306095002.22983-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306095002.22983-1-tudor.ambarus@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_095023_072660_160A4653 
X-CRM114-Status: UNSURE (   7.53  )
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

else is not generally useful after a break or return.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/swp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 75b9bb53d584..c35cb3becb41 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -25,8 +25,8 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 {
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		return SR_TB_BIT6;
-	else
-		return SR_TB_BIT5;
+
+	return SR_TB_BIT5;
 }
 
 static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
@@ -41,8 +41,8 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 	if (bp_slots_needed > bp_slots)
 		return nor->info->sector_size <<
 			(bp_slots_needed - bp_slots);
-	else
-		return nor->info->sector_size;
+
+	return nor->info->sector_size;
 }
 
 static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
@@ -96,9 +96,9 @@ static int spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 	if (locked)
 		/* Requested range is a sub-range of locked range */
 		return (ofs + len <= lock_offs + lock_len) && (ofs >= lock_offs);
-	else
-		/* Requested range does not overlap with locked range */
-		return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
+
+	/* Requested range does not overlap with locked range */
+	return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
 }
 
 static int spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
