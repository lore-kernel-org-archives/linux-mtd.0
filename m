Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13230C04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 16:01:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA01320815
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 16:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jm0OhCKc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ1lreXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA01320815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A2NaaGIjk/pMrzL50KJEUg2r2dcKk/p8fxHdspOVeQo=; b=Jm0OhCKcRVGiHtTX1M7RpNQN9y
	/VBoyzUnGqmEGp2sjbwx0H7MwZXc/UhNfTvzWri5Mrcnl4iTeCQyG+AsSw7GjkDD70rFvaZ1knyDO
	3SmXsYIinxigfY+z5hY5TN3L23Ar0wFla5wthBUZOzPtgaiEWiVwEztEw4qagtKR/UFGRHKL1RMKz
	mJVpDGurGs5l60n+eFreUAjpf2QCDXE7TiQqAn8vuqI3waQbJUCPto0zgU1oComiSHNezo+6YHE26
	fuCyA5x/0/1O1m6UnbW/PcwHJg/xuIhvcKElWW5BIEDf7OPX9mMXwzqZap4MFmtRNzUhNb+wnK+XI
	O9FS8UPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRIoZ-0005NP-TZ; Thu, 16 May 2019 16:01:03 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRIoW-0005MW-H2
 for linux-mtd@lists.infradead.org; Thu, 16 May 2019 16:01:01 +0000
Received: by mail-ed1-x544.google.com with SMTP id p26so6025099edr.2
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2019 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8WgMWkot3W6frdZDEhuKoWGYZZnnA8ggjmWUdQkxVUg=;
 b=VQ1lreXFzVPz7qMf6CbZsyHyEK8BaUPzViIbtM9m26OmLDc9tKQb+Ww5BzyPFxvKVr
 MJrT5hYOZFr1qqbinjNi0tc9Y7K9TrxawuH+WidxXbg7JTXsX7z3gzTQWohuiByopt7m
 4ryVrr07Qa7xoWkcqKuFRHHW6UpEbZSNoCQ5aRG612xPXgDlckr7b6De7pLUdaxjaiQV
 hcsybkXuOdvGi1Mxsfms0QU4V/9nnmPkZ/AeYezrL2lSFkfpmZ8cwUfcwzQnmC99Or34
 ynutTND6GIF1CpSUzaGCAKL/ehYJFRu0Vyi2/xwYYLD0u/S4b3IEcTBNrrSgbmRaMxxB
 JCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8WgMWkot3W6frdZDEhuKoWGYZZnnA8ggjmWUdQkxVUg=;
 b=KSvEpQLxYxLEBGRyeE87Ck1V03a/IkZxu27lwi0yn6YkhrvReTjJShqJkEX/llHIah
 UUncq7TeM7kL5tKNQYMG3fUEmg9pvPa8CCvY4/jKVUJ9vSFSiyscLbbweWNqDOxX4Hk8
 29ZF8nzp+FXY9Zj+X8+k2/a+P9PG/p87EOjI3TKn5L5IhdhUs1/Z7SHkNqStjf5h60l2
 Wq8YdOSlDDTovNbRzrGXxUkjBvHNyzKdf9o9LzJMyGnXc7h/SNgPXLiyayZpu3kNgWJI
 sPIPdDjWZi44hAb9ZMFrndvvU7h+Mzu8rnadqf1CDknbY+YI4sVdlkKe7s/FD6Wl3D/M
 P+OQ==
X-Gm-Message-State: APjAAAXBlCstLFzjwEqzcnwrvLk/buINOcyb2f3oZsF5p8l4ZtsRlSkr
 753AWXi9SCzs0c+AiKnhSOlbcpIQ
X-Google-Smtp-Source: APXvYqyMxBN1sByOco4/CKLlBrCsf2Soi/E7L6cLHGLDX2cIXMgHdQjhgFGhYUdXaJFeCs5VE9Ln+Q==
X-Received: by 2002:a17:906:8398:: with SMTP id
 p24mr25198362ejx.8.1558022458538; 
 Thu, 16 May 2019 09:00:58 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id n8sm348307ejk.45.2019.05.16.09.00.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 09:00:57 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] mtd: nand: raw: brcmnand: When oops in progress use
 pio and interrupt polling
Date: Thu, 16 May 2019 11:45:40 -0400
Message-Id: <1558022399-24863-2-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
In-Reply-To: <1558022399-24863-1-git-send-email-kdasu.kdev@gmail.com>
References: <1558022399-24863-1-git-send-email-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_090100_563973_44B35EDD 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If mtd_oops is in progress switch to polling for nand command completion
interrupts and use PIO mode wihtout DMA so that the mtd_oops buffer can
be completely written in the assinged nand partition.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index a30a7f0..dca8eb8 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -835,7 +835,6 @@ static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
 	}
 
 	disable_irq(ctrl->irq);
-
 	ctrl->pio_poll_mode = true;
 }
 
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
