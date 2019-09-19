Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44155C49ED7
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:29:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16BD721D56
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLD+RvmK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="MOlak7eH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16BD721D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2hFIGKaSAkkoH2zb394kWRcDK467442ufvCIN3EemtA=; b=YLD+RvmKGqHJRO
	oYOVxfR0qn5QHdBrZOEOhMyWchXWIOzEFrVV/sl6kKE5jWspGbwkpFlmZfVwPmwcmULwkhbMhcKq5
	xrLHxODATU9WmgcWSYogUdgUz2TVMQsRy3Rpc9krV7d++6tDs/A00ow6XaobbX7DxHIl8Cg7hOfU6
	KtxvsbilJGBnb2X85JUaUObfUVAhPc7EqglhMV/smBqHeb3dVkZ/Wc8TknnNExIL0T0yCjrBZ+CJC
	hdR6tb79oxEktQ3DTkkPDoYOMjmJIXKXSKKjf1M+ULLohCQ8lGW3FbcpNSW4+kP0OpQJRz2qrN1pb
	rbtK3Udp7i2YswlRoLXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAvZJ-0002ns-4i; Thu, 19 Sep 2019 12:29:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAvZD-0002nA-Tc
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 12:29:51 +0000
Received: by mail-wm1-x344.google.com with SMTP id v17so3738874wml.4
 for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2019 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ih/MDhEc/lR/EwwEWd3UKHZku0wmOCPvpYdqNd7Cz3I=;
 b=MOlak7eHLX23anoot934MZPNCqef49OxOac8Pza7p1zC+IDnTa6+D9nOHorfBejy36
 XEdV05aEj0wP1+o9uwLdfQdWQyzTOJ0ZAmvaFnkmKmyxhMXjuJYAm33Yz2x0TkmnsdHW
 zU5ZqlaIfSDtNTWqGnoU4EftY6U2Kh++BvXSAvGG6pSeilS8SDvl2vvHTW/O4GRH2H30
 uTecNMafO95TjhTMtK4XYXYhSekGxXNpnuTluTNVP+pzARHkbznR4yZkAKcWvct0CV6F
 rdz8UljICE9v2iWgDSbWMFua5epnyEpndor195DpDgx4rkq+DivxLiNb7lumlEcWcpay
 lbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ih/MDhEc/lR/EwwEWd3UKHZku0wmOCPvpYdqNd7Cz3I=;
 b=HNqDivHCZ6aJOS0S7Xh0ghcargHCgySjgOGkrJQUxx4Nw44LTIk0esq7F3cUHe7TTO
 0m4rix5iiqJ6t+G5GI0P9cuLfdMUC4c5wbRDjebq/RMOgJh/r2YZvwiH6KDtDAU8I+bK
 rg+NTo0TEzRn2EaPrSXk5TGX4WCT+POWAVAwyz+cv00vjr8rLhDeTQv7GEhqntrxepq6
 gJK5iIo4wS2AqoQxuqZ5HqMyKsV9aL1XeKmfx65xha+qz4SVZDtmbcKtmxC7Fkn0tGXU
 mCeDaMOXjx2WIhzsKiztunwXDtudkfZd9v7hQqVJHtOz8Qv++YUzuCW/+I5lO+/Lj/RR
 srmw==
X-Gm-Message-State: APjAAAV6EAU4IM7XUyDFWgU/TLFDtcAsAI0cNdsRx4LhPSr8iBZw1Dev
 9XoeVqWLOwrPSxDBwnDRT4pMlQ==
X-Google-Smtp-Source: APXvYqx4hKCNiv9gZpKM7ZBFgWrBwYBYMkwk3rpvdDiIL6bb7B9oUvwnBLk2HXj2VFiNljt+us5Ktw==
X-Received: by 2002:a05:600c:118a:: with SMTP id
 i10mr2640350wmf.80.1568896186212; 
 Thu, 19 Sep 2019 05:29:46 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id s10sm9203194wmf.48.2019.09.19.05.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 05:29:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: st_spi_fsm: remove unused variable
Date: Thu, 19 Sep 2019 14:29:37 +0200
Message-Id: <20190919122937.29850-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_052948_005643_CF92C923 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

The region resource in struct stfsm is unused and can be removed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
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
