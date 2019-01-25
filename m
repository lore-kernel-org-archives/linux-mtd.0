Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741D4C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 11:04:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D5E32184B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 11:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sJ0L9/ne";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="qfeP7iav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D5E32184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1XVvDSyAyHdHQ16rIl4i3qldY0+/RNkppF7ezM9JlE4=; b=sJ0L9/nelohowa
	QMAW2sl1WsTJouB3c/Zi6ug8MYIN9tLBvqikqTUbKgw4ZAPn8wviueFz3p+KK0RXzu/sas7jqiP0c
	5DiLurI+YC1AFlc0NMkR17oZNgJiYjpnyFWQ23J945mv8s2Pw34jbEhUach+sATeRn8J498TsULYr
	Iaadg47ErqWa6m1IB2sFjoesp814QNFc0nY2AMomYbeVeUzhJIDqL0a2f9F2AynuFpTQJZE0dvplN
	SCtbS59bsaWNtjDQZ2erqfdxrBbYLnD6X9bj0Zp/MH/cAuDnfbH3P+NwutoW8T4y1sxGZZuRjZvux
	uXl0d6/llPVc9DgAOpuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmzHV-0001Uj-Be; Fri, 25 Jan 2019 11:04:17 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmzHS-0001UI-Ej
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 11:04:15 +0000
Received: by mail-lj1-x242.google.com with SMTP id l15-v6so8027909lja.9
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2019 03:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFwQ9Uc+RMzfvTqW37RxvKqIi88RNAVDwfx5KC3LSgM=;
 b=qfeP7iavRdrNcEkyIJLuP4y4KzLNqoei+b57Mv9h0lHfkiabTbksm50huLWE0fRKpg
 Qm+ntNxS3Gb35ZK5mZ1SZbTtqzG8zeyHhJS2zFJkDNBfYgnhVR6pJb41RR8nveURoFvm
 3VOusGgV7WnFBLi8WsTY+b8IRlfjWZA9kb3xta8pe9hOolvT2cQqCfSYt0UvRC49OaDu
 bNya8FQTAijLiYcVDGQi5hjZ9Mi2lZeBvr8cUfAQwFQmlmlx7PmmHBMS6hozH7iXw04q
 jsaehd8lfvZgPKoxmYXlDvO2FEOaK/efj1mosMUCrOu+FTNA1dJhIObxO7ffpbgooPi7
 7CjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BFwQ9Uc+RMzfvTqW37RxvKqIi88RNAVDwfx5KC3LSgM=;
 b=TPKSngLmpiWxdmDjzzm+mkPqh1FumGNy29WAK0+xBe+Oc4LAR8k6Gi/SC5Aw1TZwFV
 rDnCVphOZs51u5OdJBRgbXEd8HJYaXixx48zYAC04asGXghR9FtPRPHNChH1if174rah
 FUM+A2Ze+SbND8nFhiR1xDpvJC5tZJs6yTGyzQ5DQm98GLcWgoGuOhT8Zj7RYT2XLz6K
 W+j0ZB8JwZMZGl0dKKxWjCoJc7GMSY/MxDrOxixiBCGeb+V1hjtBHff173a/zdkDwLLn
 AxRXlVYxYKvBoihVFKkgBgwJtItvsRPw6D7wcu80bEvcltzRnNxZWCZ1SxKVSkfLG38X
 xjTA==
X-Gm-Message-State: AJcUukcF3toMwXcGGHx7cU+/98yAvXsVvPlnuwUfxtvoYORmVOHY9hj1
 uQ6aTMew17cDbu4hao9sVYKFyQ==
X-Google-Smtp-Source: ALg8bN40OSYemWclv0yn1OYMp7N0caZNyVQJ/a5+6M/j1jv8c3PpO7MkRjSRKUF2/0ARMBNrjVr8sA==
X-Received: by 2002:a2e:b04f:: with SMTP id d15-v6mr8720356ljl.3.1548414252331; 
 Fri, 25 Jan 2019 03:04:12 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id 11sm1426088lfq.89.2019.01.25.03.04.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Jan 2019 03:04:11 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] spi-nor: s25fl512s supports region locking
Date: Fri, 25 Jan 2019 12:04:08 +0100
Message-Id: <20190125110408.8941-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_030414_522372_2AC39EF0 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Jonas Bonn <jonas@norrbonn.se>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both the BP0-2 bits and the TBPROT bit are supported on this chip.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>
CC: Brian Norris <computersforpeace@gmail.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c80225029165..b819b12fafcf 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1880,7 +1880,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
