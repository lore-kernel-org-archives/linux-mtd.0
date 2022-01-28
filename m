Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B38C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Q1yiTuuwFLRy91znPfJfMsQJw3dnyCWJFMmRYOlxG0U=; b=t2b
	2JPXOWpK1gqizlKch7dy9rknPOJOMPDo7kJYtbA4H5gMFRFvFYqRL/d75JIx641zIqoLJQeSQYo9u
	1q785NVK7740kr0n33NDdNXGBntPL/NyKcceoPEu6SJIAxSHazLug4APPUxGnhX7kvy9daerAM+ev
	AQV+XfnEErnt0J9FsA4tDvgg+/wfQS9aacTLixyRS8fKmgPWkKNw++f4tuWj4pkwJ3VvT8zLGDWZM
	s4voPbRQb5JA9Yg7wXz64x6tQIIjm326jlCTZCsytjMyQufYAWsHMzBAcX+4zMdmHOWi1rbP5517T
	B52iNSS94qsQ9zGsU1y7HaU39JuzbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDZM2-003eEF-J2; Fri, 28 Jan 2022 22:04:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDZM0-003eD4-Ev
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 22:04:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 e13-20020a25e70d000000b00615e9bc9a3cso14954055ybh.22
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jan 2022 14:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=9kuLsoxSY0OiUWPOZQPW3S5zK0U21m9yY4je+fn9waE=;
 b=VaaHhdrb7XS5lp77SYAo08EZ/jKt5Gz4mqwTZku845U4SOGYlL+HuEnAy84StZXiub
 0zKb+nSuzyEl+8LGjsdM35+aWi1DRE5plxK+qC8Z0BxFyVdGC98sbWhaX5cTT3v4DC1D
 K7A6Nm82kOl16/aL2kiTkFFF5AQTxJfB9N6U/m2Et2qR8fZWPubo5ENICkLYjFVsbinO
 Tqqt5l4bDtdmJyfLIU5eLDcM9K0SX9RXkDsHrMMCZPRhlP4AiKpKgNHPN/vtmDkwapiU
 0x2pkoT6+EcjxHlWEC6t1EvgKN/ADbKDZc/PBT6w2wS1azvdmTP8rvdgupZUWjH+xBUM
 PCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=9kuLsoxSY0OiUWPOZQPW3S5zK0U21m9yY4je+fn9waE=;
 b=yC23951Ww8oOBe9W+kz3BMfoF1v/zkZkag/nFKhWR8ukHlnxLY7tpnYpEL5eriKnVN
 TOr1bPiuNvsWZLSNPMUcqcK0KufDRTY53hjjvcI+B0l/q3BqwU/WUtzlvxvegQIsXDOk
 UKOsliSF1AcC2zCt3lOrzSZreJADzOvNXtcKe9nWqtHz84TUqaRc6+M6GriW6NCrN7vq
 Yj0vLeHcX1/t2IGyCGUCnfvRfC7LBYHmpwfgNDnDW21o8ozha9Vq1tsdleft0nhXYvCW
 YuLJmX07JSPrDpRpU3r3FELqD57RahePYSQRX5kyOs7ASMlSmirJJT3M938kiCi5uy1v
 VG0g==
X-Gm-Message-State: AOAM530mYlnKGRxvQcTY+CNmgJbnLyr2CPvTUmfd/iRVx1jL+j9gpstc
 F8m1n1I7rR1wwLoHAjxiI0W94hBlnb0X
X-Google-Smtp-Source: ABdhPJwgvPLRgmWG81wNjsJg35Uq+9RVmeCuus+Ga6cp08WjWtOA/pE4BetzuiG3uOVuV07lPCRuY4m4MA+2
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:562d:d821:bf6:b545])
 (user=jmeurin job=sendgmr) by 2002:a25:6146:: with SMTP id
 v67mr15737383ybb.408.1643407453772; Fri, 28 Jan 2022 14:04:13 -0800 (PST)
Date: Fri, 28 Jan 2022 14:04:06 -0800
Message-Id: <20220128220406.4058777-1-jmeurin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH] Add a timestamp to the oops header.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_140424_525588_D27EB2E6 
X-CRM114-Status: GOOD (  12.09  )
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

The saved panics in the mtdoops partition now include a timestamp
in the expanded header after the existing sequence number.

This patch depends on patch 2268aeacced1.

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 09a26747f490..7f5869c209a8 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -16,6 +16,7 @@
 #include <linux/wait.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/timekeeping.h>
 #include <linux/mtd/mtd.h>
 #include <linux/kmsg_dump.h>
 
@@ -23,7 +24,7 @@
 #define MTDOOPS_MAX_MTD_SIZE (8 * 1024 * 1024)
 
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
-#define MTDOOPS_HEADER_SIZE   8
+#define MTDOOPS_HEADER_SIZE   16
 
 static unsigned long record_size = 4096;
 module_param(record_size, ulong, 0400);
@@ -180,6 +181,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	size_t retlen;
 	u32 *hdr;
 	int ret;
+	ktime_t ktime = ktime_get_real();
 
 	if (test_and_set_bit(0, &cxt->oops_buf_busy))
 		return;
@@ -188,6 +190,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	hdr = cxt->oops_buf;
 	hdr[0] = cxt->nextcount;
 	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
+	hdr[2] = (u32) (ktime >> 32);
+	hdr[3] = (u32) (ktime & 0xffffffff);
 
 	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
-- 
2.35.0.rc2.247.g8bbb082509-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
