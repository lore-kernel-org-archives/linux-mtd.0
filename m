Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D02CA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 11:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3222087E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 11:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cfx9IgJK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="heuGAUyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3222087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C5F1mwv2fym4rVl0vW+A/n/Ree8Axbz0XAkGcGey648=; b=Cfx9IgJKpn6+Dh
	knPby1A5SwqhiPxUOM8iOumN9BP5gzk6Kr42sKuaK5d6qlLNhSBVwJFtz85tKEiv0CQkazMjRJh0S
	dF0pN3eFglK/jcnbQdLgQnWptcWOblFhnyYrrC7Y880C9N/+tFrW+WnsfVO9FKQiECsRumQ+qAXC+
	7efM0Kp/2pXQpqrL9gwfzyG5Hc/jMNQQp9zxUIOWa19MY+SPivT6RX9uWZyX4Q2W3r8qqKKfOkvQP
	vI42hDJFzaaJ8bdwGGdOfLgDEJRg1KPxIujyjW3enHiUCgEXVDtSn2dNzOgKlWB/vKVFf/UExzvrX
	BncFDcMmEnqLxsG32BJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPmIg-0005rZ-QP; Wed, 30 Oct 2019 11:38:06 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPmIc-0005qq-MP
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 11:38:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id x5so1785128wmi.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2019 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMqfqwcrAsJ4swY9fBChukxSH9FYveqrjsajiENH4/g=;
 b=heuGAUyo6eWdaO737PRffEBv9wPYKzUv8wslYzVnWgh7OKHuajgpaUkxjqLhYAQB8y
 TJjzqUeE0k6+02/orNIJ6PHkYED7+ATiGITzzV/SYreUwjDlnKFtVgBHbHZybyThIV7V
 5FjXBy54XSwMRRmCIFPzTmbnWTjaN3r2LErC82SkDcG78Wq/+LmDwTNHSTNVPgoEgN81
 WafXWlFeSHHSRzANbRikyKB7YrvxLdXPCJAbNTqkWhUOi//s/V55oSrQcKIO7u6rVLYQ
 TjqXlzWmKheXJQB9ZO0ZCB07M8AbDMbatOtEXoaNxwrhMX06v23eowiQBzrA8wQy0SDM
 mcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMqfqwcrAsJ4swY9fBChukxSH9FYveqrjsajiENH4/g=;
 b=ti097ht6UpRpDjPeeNoS7/8nxqVRdlBlHsGSkwp8plP0ApEC6Qwk5IOR9dk+cqFDVJ
 eUQrXuJMvsgDKvQhn6JdQuPeFQWFwlbTPLs1E8KAgZ2pymxlkY+6uGdMrsMINp3ruFhQ
 O/XNVy6wloxkfE9hu7LNJ8TY6y2AFkdt8JdJ594Jyb9eL7/pdXMzetoJU4AqYLTqAinn
 d+ID6HMKYOsN7MrVYh3eRNjjPK92qowHz1KE4dqe0xyaB4/LaJOdWmU4hD2EYNbK/h2U
 0KcVLR6MSV+YV1/6DngoIq/8+DhDvvlD/dWvpZEA2RF7QOLxmayumw12jDqF05ng7BHc
 DSEQ==
X-Gm-Message-State: APjAAAW/pj28fnYJJ2GU5zq+63YmMb3LSXezerZNKhXNGEVvxVm8zwHC
 fJepcSwZQZd/RgY8Zrm/qt67HQ==
X-Google-Smtp-Source: APXvYqyb7wqOz8UxgZyWHU4auVC+nfcupLJdglBrLE5oPqTGVVSiZzPQvy6nzL8OklZAa+9+sRDZ+A==
X-Received: by 2002:a1c:3c43:: with SMTP id j64mr8601966wma.13.1572435480307; 
 Wed, 30 Oct 2019 04:38:00 -0700 (PDT)
Received: from localhost.localdomain
 (host218-7-dynamic.16-79-r.retail.telecomitalia.it. [79.16.7.218])
 by smtp.gmail.com with ESMTPSA id f8sm1868292wmb.37.2019.10.30.04.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 04:37:59 -0700 (PDT)
From: Angelo Dureghello <angelo.dureghello@timesys.com>
To: vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com
Subject: [PATCH] mtd: devices: fix mchp23k256 read and write
Date: Wed, 30 Oct 2019 12:39:57 +0100
Message-Id: <20191030113957.1625342-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_043802_781186_63B09BBB 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, angelo.dureghello@timesys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Due to the use of sizeof(), command size set for the spi transfer
was wrong. Driver was sending and receiving always 1 byte less
and especially on write, it was hanging.

echo -n -e "\\x1\\x2\\x3\\x4" > /dev/mtd1

And read part too now works as expected.

hexdump -C -n16 /dev/mtd1
00000000  01 02 03 04 ab f3 ad c2  ab e3 f4 36 dd 38 04 15
00000010

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 drivers/mtd/devices/mchp23k256.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index b20d02b4f830..77c872fd3d83 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -64,15 +64,17 @@ static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_transfer transfer[2] = {};
 	struct spi_message message;
 	unsigned char command[MAX_CMD_SIZE];
-	int ret;
+	int ret, cmd_len;
 
 	spi_message_init(&message);
 
+	cmd_len = mchp23k256_cmdsz(flash);
+
 	command[0] = MCHP23K256_CMD_WRITE;
 	mchp23k256_addr2cmd(flash, to, command);
 
 	transfer[0].tx_buf = command;
-	transfer[0].len = mchp23k256_cmdsz(flash);
+	transfer[0].len = cmd_len;
 	spi_message_add_tail(&transfer[0], &message);
 
 	transfer[1].tx_buf = buf;
@@ -88,8 +90,8 @@ static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	if (retlen && message.actual_length > sizeof(command))
-		*retlen += message.actual_length - sizeof(command);
+	if (retlen && message.actual_length > cmd_len)
+		*retlen += message.actual_length - cmd_len;
 
 	return 0;
 }
@@ -101,16 +103,18 @@ static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct spi_transfer transfer[2] = {};
 	struct spi_message message;
 	unsigned char command[MAX_CMD_SIZE];
-	int ret;
+	int ret, cmd_len;
 
 	spi_message_init(&message);
 
+	cmd_len = mchp23k256_cmdsz(flash);
+
 	memset(&transfer, 0, sizeof(transfer));
 	command[0] = MCHP23K256_CMD_READ;
 	mchp23k256_addr2cmd(flash, from, command);
 
 	transfer[0].tx_buf = command;
-	transfer[0].len = mchp23k256_cmdsz(flash);
+	transfer[0].len = cmd_len;
 	spi_message_add_tail(&transfer[0], &message);
 
 	transfer[1].rx_buf = buf;
@@ -126,8 +130,8 @@ static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	if (retlen && message.actual_length > sizeof(command))
-		*retlen += message.actual_length - sizeof(command);
+	if (retlen && message.actual_length > cmd_len)
+		*retlen += message.actual_length - cmd_len;
 
 	return 0;
 }
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
