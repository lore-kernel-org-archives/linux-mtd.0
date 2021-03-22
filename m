Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173ABC433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 07:53:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7164E60238
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 07:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7164E60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ei5HKLcCTYo6m8rf5QQVHj3j8N6FpQK/VmigciQnKdw=; b=CzvBF+uNlTMTrhy40X18xYfbs
	dKHV+YmHF3T9ndHJu68hPvWLF3YqrAX+1b14ZEOyn2laf9LfNgh+vIogC4J/V43M/MYTyp50/smHs
	bqgYy5jPxVr+ypsb+krKKBn5yzMY1lbQSn14J8XhxTwEpslk1/84yPpYC2xqH5JtkvtdgEIdHRHsZ
	v7yCbF3nAy7+4p4CCGquq5gfOB4cQrvAu7ZgMmit3e+xcF3Jua/IZ0hnETWOcPWS+UsWR8uJTMIJl
	AeFRmfy02OzUd/mYOe65WbZ5nCFLiseAyENDicxNj4oldr68a8UVav+e3Bs9Wkzk4Xpzr/nmnHNJE
	31UMJXI1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOFMb-00B6gP-8u; Mon, 22 Mar 2021 07:52:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOFMT-00B6fP-9Q
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 07:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1616399549; x=1647935549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ABEJG5RkSChbcetRBk6+q1bGur85qi1KrJf4/KyP+XE=;
 b=0xcyv/n6bz2MRx9gZ+hswolH8x/SKRGffCRB+DLxtDiuLma5TyTzk/zG
 e2DQPt6eWHsprR+25EbxhPTYet/fT8LQdKowKfHvIyvyditYTHnKoYkOW
 Bf2cbOiGDJRP/EHzEH6AhfVNLjiTC2c/eWEkEEp8F4EsycdXfa7JtwtGJ
 Iw8GRRnYGC+5HoZyXnCjeZTG9lN+nX083wIs+4PD60NXcG7ZAVZmChLlK
 J8icSqp+tHo5u5TAsjqlT9YVj3UEhMhmDcS+zPhfuTcWZxAl76ncMuHxY
 jXG6LkbqlOn20DyyFOeq83VqWjReWf132Easw+j3uKFFo239FY79gTWZl A==;
IronPort-SDR: Yg9nL2mIDLCuNQX7JiGNkr9BNx5Ep2gnzyBfbRgx6KUblfoMwfHOV9vpEkO5ozL5kc5yw3pDkw
 JKB2sHSVTdfI+S6s9d/Ea1UTFo9uHrrAC2ye/BK3nxPw3qYokAy92G1v0W1FkcdOkG+C0tIQ/I
 brhtVMGT0Jx053UBvvl4nUyTalfPnEX15yI4iyKdoUyOYLhXQZ9MuFPi8qwVlRqGb4TRaA+AB3
 uFIJYtNUO8bqLgG5SmCEsdQhS+s2LOwH0iWSRhStuDU2zNzKvl65Nl0o3mMP9j8vPnO+Ei6Mjm
 hYw=
X-IronPort-AV: E=Sophos;i="5.81,268,1610434800"; d="scan'208";a="113597886"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Mar 2021 00:51:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 22 Mar 2021 00:51:40 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 22 Mar 2021 00:51:38 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <michael@walle.cc>, <p.yadav@ti.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>, Joe Perches <joe@perches.com>
Subject: [PATCH v3 2/2] mtd: spi-nor: swp: Improve code around
 spi_nor_check_lock_status_sr()
Date: Mon, 22 Mar 2021 09:51:31 +0200
Message-ID: <20210322075131.45093-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322075131.45093-1-tudor.ambarus@microchip.com>
References: <20210322075131.45093-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_075229_880520_F2F68FAA 
X-CRM114-Status: UNSURE (   9.93  )
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

- bool return value for spi_nor_check_lock_status_sr(), gets rid of
  the return 1,
- introduce temporary variables for better readability.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v3: new patch

 drivers/mtd/spi-nor/swp.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 5b236db6bb56..8594bcbb7dbe 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -81,36 +81,39 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 }
 
 /*
- * Return 1 if the entire region is locked (if @locked is true) or unlocked (if
- * @locked is false); 0 otherwise
+ * Return true if the entire region is locked (if @locked is true) or unlocked
+ * (if @locked is false); false otherwise.
  */
-static int spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
-					uint64_t len, u8 sr, bool locked)
+static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
+					 uint64_t len, u8 sr, bool locked)
 {
-	loff_t lock_offs;
+	loff_t lock_offs, lock_offs_max, offs_max;
 	uint64_t lock_len;
 
 	if (!len)
-		return 1;
+		return true;
 
 	spi_nor_get_locked_range_sr(nor, sr, &lock_offs, &lock_len);
 
+	lock_offs_max = lock_offs + lock_len;
+	offs_max = ofs + len;
+
 	if (locked)
 		/* Requested range is a sub-range of locked range */
-		return (ofs + len <= lock_offs + lock_len) && (ofs >= lock_offs);
+		return (offs_max <= lock_offs_max) && (ofs >= lock_offs);
 	else
 		/* Requested range does not overlap with locked range */
-		return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
+		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
-static int spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-				u8 sr)
+static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				 u8 sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
-static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-				  u8 sr)
+static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs,
+				   uint64_t len, u8 sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
