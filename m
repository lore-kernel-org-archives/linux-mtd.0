Return-Path: <SRS0=axHB=SY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96399C282CE
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2019 19:07:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A93F2075A
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2019 19:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+IctOSJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnoR8wtS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A93F2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ElJ8iNmJey42AmIvtdxb2ty3sIcH6ajZH2V8WzFc9KY=; b=u+I
	ctOSJg+kUP0uBNcybB0QFpxs2km2/UugTElUQpIzBPcLNVP9iGirB0SfzhwkjzKRY6mIKl8vFI2tb
	dXkfiBQ7h/3PaMONQbZHS7WVBGwiyJz4aSkNb2n0LT7xFSKZlunLjR9X9MsS33pkHL5ixAlnm/7Va
	TdGWGkVtYvnIqgwCyHiGZeoMA/j515FuxRJuNxMf8f0lbtfeUcR6VDtiwtd1M9TNUmq6gIPg8fXad
	oepgQJzuAtzAtZKLNpsfyiL0MpvBlsUHW1oLysgp1apcWgaUODTUmfQMFieod1gJUmcGQECkd0NyT
	/bP/YGbG6jX9ARVRnWBv9sZWzWzofrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIeHs-0000ko-Tt; Mon, 22 Apr 2019 19:07:32 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIeHq-0000kA-0l
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2019 19:07:31 +0000
Received: by mail-lj1-x241.google.com with SMTP id h16so11181907ljg.11
 for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2019 12:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KLIN3jIzPTgdzkxsNAa+yQ6usxnR0Vxtw6BLIdb8RZw=;
 b=EnoR8wtS1LSmILz/hhzFnUhu/5zoOsxRXnGZKZDuOc2aOIJhNnzjupV03SR8+kvcr4
 HJtjcRkpNrWdlDOblFYZ7TbMkdyz3Y+JcfvSLVfmFSluGTmAaYLM5mN7j9fyJeP1CpSD
 TB137GJdctxFMbY8iS1WPKmu1Qdht8IiTyCLgY1IxEwkB8WwyBrHF9CjpzNlCctcj16D
 qs29CUZxtsOlZQeFYkZizV7fX9DZZ4LEjXMslEOHh/JSPWKfOjGlkmjcX/QT4IFx2KIK
 cjrJJCHE+TKofwn6GhNR5w81NcGa8ksNfURsLqBamwEowIDG+K7YX8VjnYjK9UVRuNwp
 LyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KLIN3jIzPTgdzkxsNAa+yQ6usxnR0Vxtw6BLIdb8RZw=;
 b=Em/CA0FAf6cTenIoFB72Qzhl/ZbKCjMkdAp4Tm0wRkbRSRsOtOPgDL48Wo2syjt9K9
 EZpbAhkDHnO+YGJ6EQUWveUXMIEdDEFa8VkuOvcOVkh6ggsXAxkNdsT4xluDXsxS+LH4
 NEC2m/56ixMDZedIrhYQVMJS7qeNsNU6ofKWDssLpMmoeS4Ko4gXphIZwA4fnodV8UsF
 X8SVI7VWp9vlGwrl3Y9vjKTpleikZPEdu1ouxoQEkFQYcvq4WoVEtsO/VAy1k0fgYX45
 HH04jIC7aAVWNeJ7IUWSEHL1XVRqQ+cl7lEVfsLrhZ7w5gS6As70OYAvcR+jYcDVS+oF
 4VFA==
X-Gm-Message-State: APjAAAXM7QtURugKwl8pqpGIHKY3RHjFU6S6m8goxZeoSvNssx+rF4jz
 Wqz1f1N/zwmXrk15bnZ+RDk=
X-Google-Smtp-Source: APXvYqz3Bsrju11ax7scqtq+i6HaD/VXbRndbBpxHUtKHWDfh6LIEI/h6QUFFrLodidPf/6lQKywxA==
X-Received: by 2002:a2e:500d:: with SMTP id e13mr11096429ljb.169.1555960047724; 
 Mon, 22 Apr 2019 12:07:27 -0700 (PDT)
Received: from localhost.localdomain (80-167-223-88-cable.dk.customer.tdc.net.
 [80.167.223.88])
 by smtp.gmail.com with ESMTPSA id j9sm11048lji.35.2019.04.22.12.07.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 22 Apr 2019 12:07:27 -0700 (PDT)
From: Daniel Gomez <dagmcr@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org,
 marek.vasut@gmail.com, richard@nod.at
Subject: [PATCH] spi: AT45xxx dataflash: declare missing of table
Date: Mon, 22 Apr 2019 21:06:04 +0200
Message-Id: <1555959964-8320-1-git-send-email-dagmcr@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_120730_082881_DF37C62E 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
Cc: javier@dowhile0.org, linux-mtd@lists.infradead.org, dagmcr@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add missing <of_device_id> table items for SPI driver relying on SPI
device match since compatible is in a DT binding or in a DTS.

Before this patch:
modinfo drivers/mtd/devices/mtd_dataflash.ko | grep alias
alias:          spi:mtd_dataflash
alias:          of:N*T*Catmel,dataflashC*
alias:          of:N*T*Catmel,dataflash
alias:          of:N*T*Catmel,at45C*
alias:          of:N*T*Catmel,at45

After this patch:
modinfo drivers/mtd/devices/mtd_dataflash.ko | grep alias
alias:          spi:mtd_dataflash
alias:          of:N*T*Catmel,at45db642dC*
alias:          of:N*T*Catmel,at45db642d
alias:          of:N*T*Catmel,at45db021dC*
alias:          of:N*T*Catmel,at45db021d
alias:          of:N*T*Catmel,at45db321dC*
alias:          of:N*T*Catmel,at45db321d
alias:          of:N*T*Catmel,dataflashC*
alias:          of:N*T*Catmel,dataflash
alias:          of:N*T*Catmel,at45C*
alias:          of:N*T*Catmel,at45

Reported-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 53febe8..27e9a71 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -104,6 +104,9 @@ struct dataflash {
 static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,at45", },
 	{ .compatible = "atmel,dataflash", },
+	{ .compatible = "atmel,at45db321d", },
+	{ .compatible = "atmel,at45db021d", },
+	{ .compatible = "atmel,at45db642d", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
