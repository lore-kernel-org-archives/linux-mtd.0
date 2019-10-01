Return-Path: <SRS0=grO6=X2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D516C388F3
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2019 10:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 453FC2133F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2019 10:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dA8x/raX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="dRz45ZFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 453FC2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GWgC7bvDeQE+yWb2RnJx8Q2FtyTgUe3x4LrVbo4zUQs=; b=dA8x/raXJ3AWKK
	FldbayLGrATPLBxSADSyO6R4d7GDyUTNu57Ii1Fjgd1fGgiI9V+1q8OnD+j9oQf2r78Q4CtDyaeeE
	YpwYa608xoXs+O0Rbw9SnxBDKQ8MYQWCkfOaruica4KSL4y/FoI2uffUr9d2Ii6zTrQA6g0PwSpwh
	kuOGAghpHXSfe9AHihrGM3LKRVKs0djmH22PX/is01vcbJiSOZhfoYA+oV1h0XbZuahpL7lsrYjR7
	jEpqaUdRgOAtmH52uD1b/wMqkkS0wqWkbvWCdh0Q3I7ujLASRHy0a9ZIvGq4OPJYw9CE5Vo9i+T9J
	cEtbjjay90ZpktLBz37g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFF24-0005Te-6B; Tue, 01 Oct 2019 10:05:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFF20-0005Qz-MV
 for linux-mtd@lists.infradead.org; Tue, 01 Oct 2019 10:05:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id 3so2542421wmi.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2019 03:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MDb9V236X1+2wHmiAI972wYH+mIXz1A27mj3ckuSylc=;
 b=dRz45ZFY/schW2hdmyXXNc3wJcAsEVReWhJjUlkPT3gXsJwjTVpueT54F3hg02bn9r
 hdmLfZCJhrsE8tww83KORRm7Q3/S9bgaKD4/XB9pfXX2o1G5Jv0XepvCxjQNh+oIeAPb
 CDCjNL7BYGMbzctAo1ekCSB8gw/hPyrY8S5hCKceSF1+Vyzo3rEzzyWO676Q+EYBCjxP
 pdtd5+vEI3sImuzydVEe7hRfjcoz0d7lVv3nVo3CJtoeUylWEFhPAd1qjueaFTHSrpxk
 ktzfG4awi8Pa7yCqVvfiLNgS29xhWjsv/cRdRCvq1GyXkfhh2XTQzr2eboOAOjyTWO2J
 VkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MDb9V236X1+2wHmiAI972wYH+mIXz1A27mj3ckuSylc=;
 b=dWvMrW7zhWElsPvUvQkjeNk5hSSyRdZbhOt8l2GlKnQYpQSpOcONnwuAVILndy3xTr
 o7TItbZfaVLlNJlCKsv5ZuITVQiXbi1K5ddL+1Gg4/a6kNvtspsH8FPw+uSEcF9TbQrL
 I8jEdlgFT9ZFBH6lcdx2ZhblnPGWQKJ9bsonuXtcZmYWirfFGefqHObjz0J2+213MITK
 8rJf0YKFOP7BbqwR9Sw/LcLexsIqR+04wbGMWQcp2fINI+GM0mfArGbZ4VQsltE7RIGD
 Kasp0FCgPYWINsdm7zfaD3QrttgIrI/2VU5eCqB9L2+WZW0oudPcz9Lwjqt4I1CLq3d3
 pRQw==
X-Gm-Message-State: APjAAAUZ2dl270LgfTs4gKTGkSaCx4GzbDrx05af6JvN1pJwQEUmEy+H
 8Ll8tTK5ici+b1BPqAu8oPWdRQ==
X-Google-Smtp-Source: APXvYqw/rjLK3L8BZATVfqRz06QNfAaTJW8lK7seOMEM3ex/HDidB5Ngszz5C/Uh3mwqJXGp46yxIw==
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr3006333wme.105.1569924316278; 
 Tue, 01 Oct 2019 03:05:16 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id j1sm34277253wrg.24.2019.10.01.03.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 03:05:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] mtd: st_spi_fsm: remove unused field from struct stfsm
Date: Tue,  1 Oct 2019 12:05:10 +0200
Message-Id: <20191001100510.13962-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_030520_875814_CB4935FF 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The 'region' field in struct stfsm is unused and can be removed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- fixed the commit message: it now says field instead of variable

 drivers/mtd/devices/st_spi_fsm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index f4d1667daaf9..1888523d9745 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -255,7 +255,6 @@ struct stfsm_seq {
 struct stfsm {
 	struct device		*dev;
 	void __iomem		*base;
-	struct resource		*region;
 	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct flash_info       *info;
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
