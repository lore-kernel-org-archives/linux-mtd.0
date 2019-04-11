Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37649C10F13
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86542084D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tiIUM8I6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NzNFKjHb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86542084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yY9OzKo0kkqIGMXXQI5rksx0zPIUrxnY/H3PNumnq8M=; b=tiIUM8I6lsjjed
	PtdLtEogsp4F0IQHIncBHLDZKx1CLEZjh1A4kaOUu26hbRoI4yE/Zsv6Q7zruBjvLhKiHeOQL5WYr
	pg724iXrtHAITCGRtLp7RFOofEZ7jGXCSqOPewDw24h49b2Kyihg28JPLuqAFj9XemTJTsHc3ODaN
	uTFqOP/SosSRcJ6k8M029covMBYFk8pKIns4W/Qy/VkI0u7wSJfRnn0j8j3TnNchuZ0SYe7VWw4sk
	yik1i+Ek3IMjtUIP4RlrSeIFFX5H6ixm7bY0obfOU6Bfu9k6NJsuT3oNUrkhXvDIk2vA7FlC/ORLb
	jfluGr3lhq8b6EWRKQiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhmO-0005PP-Ma; Thu, 11 Apr 2019 22:02:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhl8-0003ag-LW; Thu, 11 Apr 2019 22:01:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id v14so8479256wmf.2;
 Thu, 11 Apr 2019 15:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4m105n5JXJH4GNf9WN+soWtXGry/vpyc5a/iSxRDFzw=;
 b=NzNFKjHb09kbOIHFC41lGJd95srXDx+k6jOgARNJ6GIQ36ROXxomwgG1t5ZZmtnDcq
 9x0D4BW/E1st5N+fdpO4q/KshtnUPtQJjHjutgQdFrpX/HAI1lc5Ni4VWJC9Jhnak+9a
 WLTkCFzeaPFj4djeAlX7H65RWyYR3vJnvlRvlCcEvZ6vxC6XH5Mo7QYJ4PKFAQdOrrZl
 BH44N+OpoVxPWmBdIAwy0qsgN2oarmGgx7+jb8cJfmn2RlvtqijKBA420rFOYuQ2us0E
 shLtv0GWTTcOa/xcgDqYvMJ0mH2xgXcuRLkpajKWtvCRPnSPjSLKY+s4lAdDjEeGD7+3
 +R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4m105n5JXJH4GNf9WN+soWtXGry/vpyc5a/iSxRDFzw=;
 b=rN086315qtYUGIEjh9yNP8rcCf/CinyGPNxVyTbCRcbs32tczxu/XFfe9XGv/11qmR
 NhjSfKdbYEttExh8F3pKydEqYQD2giiCF4rZ9g5gbIxQU3Bh40zyTgK4bBZNB08NUpjB
 ZrQeykR99ylchPrfriUxarCwNnU/Z3ghwyfXtSh5V+QcVk58NxR6WsqTUImiUlYml3hi
 /A/+powfjIFidvVETratIP0zce3XDfd0gYZSW2bMX+HYDoYHmtY8AimyQ/6E7Bkhe2t/
 NenqJ5NnDN9pjOwm6XxbEWpvDltMUPoWq+X0p21Rr4HYf7M26woboXKwfIcwpuvXAkw5
 jDRw==
X-Gm-Message-State: APjAAAUyVM1y7uLnepsoLv1UoG9DAonKWMEufx4RvmCMkuJSLwj/Xwva
 YU0XGydRS5oWOixwh0A4ISs=
X-Google-Smtp-Source: APXvYqwvz5r4sd151G017FJh/Vn+1GDk5EwoOrb7sRHdQs5rc/n1+l76wMQOKuKsn5oRdB6Q4mftzg==
X-Received: by 2002:a1c:6783:: with SMTP id b125mr8256171wmc.41.1555020085029; 
 Thu, 11 Apr 2019 15:01:25 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0009F15067C8D22C31.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:9f1:5067:c8d2:2c31])
 by smtp.googlemail.com with ESMTPSA id
 s189sm13266186wmf.45.2019.04.11.15.01.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 15:01:24 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: liang.yang@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-mtd@lists.infradead.org, richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 4/4] mtd: rawnand: meson: only initialize the RB completion
 once
Date: Fri, 12 Apr 2019 00:00:56 +0200
Message-Id: <20190411220056.19109-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_150127_040761_09A97E74 
X-CRM114-Status: GOOD (  12.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Documentation/scheduler/completion.txt states:
  Calling init_completion() on the same completion object twice is
  most likely a bug as it re-initializes the queue to an empty queue and
  enqueued tasks could get "lost" - use reinit_completion() in that case,
  but be aware of other races.

Initialize nfc->completion in meson_nfc_probe using init_completion and
change the call in meson_nfc_queue_rb to reinit_completion so the logic
matches what the documentation suggests.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 57cc4bd3f665..ea57ddcec41e 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -400,7 +400,7 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
 	cfg |= NFC_RB_IRQ_EN;
 	writel(cfg, nfc->reg_base + NFC_REG_CFG);
 
-	init_completion(&nfc->completion);
+	reinit_completion(&nfc->completion);
 
 	/* use the max erase time as the maximum clock for waiting R/B */
 	cmd = NFC_CMD_RB | NFC_CMD_RB_INT
@@ -1380,6 +1380,7 @@ static int meson_nfc_probe(struct platform_device *pdev)
 
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
+	init_completion(&nfc->completion);
 
 	nfc->dev = dev;
 
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
