Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BD0C2D0E0
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 10:07:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A58621D7B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 10:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1YWkT39a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="2D4/nOv6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A58621D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sartura.hr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dUALUlPEUTvB/Kal3LAH6Iy+HHZXtCzuhOdqCHxe+g=; b=1YWkT39a8Tw0jHDskFWxpovMuB
	H907JfYqZyWZYGa5z/VnXmD7H+zejEtmVTT2PAFI25JPNIiz90ufG8qH2iGnTeF2idhXrn9CCVntL
	G7G7N7NuiXb14C8LF+r66lxXopCee4LAZOMlNl1EQLC6qAhN6qnMQCWXVxPWMAfSDOLHBX6PVz+zw
	p6jaNWte1fBur1QIoqrFj6+xOT6y9NYCC3L5UFHn+23Jq1o4dy6dJtxllILdAFQysOWv4sGXm2R1T
	Pk84QQGtrgHhOMw6qyMAb9RcJY0utJz4SUjkUB3SUmos/hHn79vZYB7KyNNbKdi5/pD/eVzcD7yqM
	Ph9i5s6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI7rB-0003i1-17; Tue, 15 Sep 2020 10:06:37 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI7r7-0003hW-D2
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 10:06:34 +0000
Received: by mail-ed1-x544.google.com with SMTP id e22so2432196edq.6
 for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2020 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YGES+GMaY9UbFbiZ3qdnVlJVdv/k3iehrDRv/+9sIW8=;
 b=2D4/nOv6XQ1abSLXeiLPf1ppV3vEgXLegfUhDjyPU6f9rkZUI6Zc0uZVhVbiuZXYsu
 tjWvAtuMvNEdeVQSnVjtTPWo5IkEyhhlhB7z9xZTRcYL1eo9QIqBvTRuTOa5MFKk7DOp
 aWZN5x2gSymrO688VHXUnbkEvwZRfKHP38kFSmky1l5G+Jw67zvVj/vBMy8lSdIvB4G9
 r4adVUvc0wM3nKGjVP+5JfSz+rvMwj1vl9FFg2lInns4RboBmOys9w7iw6GveofTEo79
 8B2C4LD+xcAj9NEzlEFyxXvapUI+Iy3fZYp15s1wFt4/AEWv2q0EZk5iPj75I8WYOqbn
 vopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YGES+GMaY9UbFbiZ3qdnVlJVdv/k3iehrDRv/+9sIW8=;
 b=IQV6Gz63sHyfQqyqF/HPqRZhkBONxuvlipWv0g6SJVSD8aikIj0F5I97JE5yfDC8mW
 dQ4bOdgWykdRfZM5pSa+VyjLjZ6RBYFjx5P1vU0feVE3ntF/nvQTZU06h9LH35sa7bTZ
 qdl4UWBM8Fw8Hz+iwEcvNU0Tbe98pdUDicra7N0V6XggTBJMx0tYBr7sBbCXbk+Okr5z
 EcmdVQ+MdBtkaMrID3VUSICgIXQVrslJlzqvAiYAsQdRYipJL51Fw+ylenlrXZPa6IPY
 XqfGSc2YPIuuAs6XKRjdNhelV5mShC1Fe+cQNric1Tmn9+JCvU6DVDAejILgLW7FmqJs
 pE5g==
X-Gm-Message-State: AOAM53035uJKPP2cpeGMu2BoF3RstqvRmZk5juKurSK+Jz9/02Xo8VSW
 RoSfB9H6bFSENcUY1Y81dSC3cw==
X-Google-Smtp-Source: ABdhPJy8A6ovoJZ+STs9AZCcBRWSF6zvWwyStMf9J+qIP+TpO/xvTFLH8WpxEGhamk0caBIkzTWjaQ==
X-Received: by 2002:a05:6402:1151:: with SMTP id
 g17mr21988047edw.227.1600164390299; 
 Tue, 15 Sep 2020 03:06:30 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-22.xnet.hr. [88.207.97.22])
 by smtp.googlemail.com with ESMTPSA id z18sm9942300ejb.92.2020.09.15.03.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 03:06:29 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: macronix: Add SECT_4K to mx25l12805d
Date: Tue, 15 Sep 2020 12:06:23 +0200
Message-Id: <20200915100623.708736-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_060633_556320_1A036AD4 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

According to the mx25l12805d datasheet it supports using 4K or 64K sectors.
So lets add the SECT_4K to enable 4K sector usage.

Datasheet: https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 drivers/mtd/spi-nor/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index f97f3d127575..9203abaac229 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -50,7 +50,7 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
