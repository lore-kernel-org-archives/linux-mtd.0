Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA88C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:10:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C750B60F6B
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C750B60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+dBbGDWRE4dGWHv+EcLndBs5DhPO7V9zATfig3Fyos=; b=RXQGivBwum8HPh
	s/N2IhlR/iF4itVRNhNR4DCHysL6YkoK+5eNF3tpZouol67mX+mOpyol3pEySQpgPejGHxAkwDrkv
	65Yw1Xk2O8xmgF60T3C8rg2OQxuuEctlMDjI+7fHo0aU9NZb2WAzhwlFsGZ0mhlgXfog6LaU/Jhkr
	NGZDpL8diqwK4b7FpUMMzg0gjHbV71s4OkTc7X5krliykB83SJxnhyYocCeQsAtkkorP6hvyXBpr9
	Ql3J7fGBNhSSmx+A6NKSx6pUiIOO4QMck3JrPXIkFM8kZopmo6GHSTesd5UZy/u+ACX6hkCKVs3Lw
	Hb4F6MY/lW6R+/ebXXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ5Yr-005Dx7-LZ; Sat, 09 Oct 2021 06:10:21 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ5Ye-005Dvo-NO
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 06:10:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id i24so46370627lfj.13
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 23:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=coehjuztvSaNIggdq97y1nDiis/65kRsy3o/hM84/WQ=;
 b=XAeQcinF+ZATsmIgnWieQwGh/RAA28RmHTGoY37R9el336565UyEXtmRlSBIIFZElZ
 Fg/918DAsbQ3JAANKw4a2CRogUkth3qv/QkxWBUI/+EZ2Dinl1FMd3tGMXxSoShBAARv
 vE+WkI6epxaYDzfblXMNXr5lOxdCHPxeSLCCtBywp+Q+vUTvn8gSG/bP/DkzvsCkg1tW
 i5xlTgtdScKku5ZRAENpsiT0PvEsTlud/if/2a7BhYBIpP3kmuNQfggxL7Luamp0S+NW
 07TZRxAmRQn/NpUqhcNtRJeF5yD/Rm0zDwjhRrND4yvic4YBgK6cXwI5Rp2E1FRvcyDn
 9n0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=coehjuztvSaNIggdq97y1nDiis/65kRsy3o/hM84/WQ=;
 b=XTajPMH41iO+IRZ5uLM/c2+/q+knbACvdtffGcEW3de+hbzwDfRFpMkQtFOZtDJKDE
 Se5t6kAWn3MQdT8Gvz7n9CEAG4wDHXCR2MDybs1iZKtxjjL4GbJdjj+swUdp1t1izIi3
 0lbXLaAt9qTIbNxkfkpio1gTZNDaFIzzAWXsrOhJzLcLwOxgWxKKM3283Yv2qOFnmZoX
 dP077vszUqk+rKRvF1x6zW9Rsz/cjXz7Zv9SIvgvGfP9QZW3DjZnNjOoUDounwjobISn
 shF2SYem1TN9RKf5OJutx8513caaK8lvnoyOAsZozcyiPoHVcW3VpdeQrC771eeO+Fy1
 OmQg==
X-Gm-Message-State: AOAM532COG4yXrPLNvvt0cZU2OS5KizDW1pHHnu0oEunhr+4MeMdpw1X
 O0L3n+mbbJ9LAYyjxSr1mh34mvq/S4w=
X-Google-Smtp-Source: ABdhPJyuLsgKLI3bc6pivsXEOYpSRgkHaowAve6aPIFLiKkO+K6NXKSrHnyTRYhSigwHiM6/0olM5g==
X-Received: by 2002:a05:651c:1597:: with SMTP id
 h23mr8204269ljq.332.1633759806875; 
 Fri, 08 Oct 2021 23:10:06 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id q7sm123340lfc.159.2021.10.08.23.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 23:10:06 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Joachim Wiberg <troglobit@gmail.com>
Subject: [PATCH v3 1/2] mtd: block2mtd: minor refactor to avoid hard coded
 constant
Date: Sat,  9 Oct 2021 08:09:54 +0200
Message-Id: <20211009060955.552636-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009060955.552636-1-troglobit@gmail.com>
References: <20211009060955.552636-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_231008_783060_D1ED3397 
X-CRM114-Status: GOOD (  13.36  )
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

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 drivers/mtd/devices/block2mtd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index c08721b11642..6c2871788d59 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -31,6 +31,9 @@
 #include <linux/slab.h>
 #include <linux/major.h>
 
+/* Maximum number of comma-separated items in the 'block2mtd=' parameter */
+#define BLOCK2MTD_PARAM_MAX_COUNT 2
+
 /* Info for the block device */
 struct block2mtd_dev {
 	struct list_head list;
@@ -381,7 +384,7 @@ static int block2mtd_setup2(const char *val)
 	/* 80 for device, 12 for erase size, 80 for name, 8 for timeout */
 	char buf[80 + 12 + 80 + 8];
 	char *str = buf;
-	char *token[2];
+	char *token[BLOCK2MTD_PARAM_MAX_COUNT];
 	char *name;
 	size_t erase_size = PAGE_SIZE;
 	unsigned long timeout = MTD_DEFAULT_TIMEOUT;
@@ -395,7 +398,7 @@ static int block2mtd_setup2(const char *val)
 	strcpy(str, val);
 	kill_final_newline(str);
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < BLOCK2MTD_PARAM_MAX_COUNT; i++)
 		token[i] = strsep(&str, ",");
 
 	if (str) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
