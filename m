Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8C2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 00:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lCOASuJbVN2GibP8b/fvBti+QqES/uHmkH2l7i7ad5w=; b=hKYYgqZOYYWubGN5M5c+HTp1di
	zhA5Vz9+A+W739B9EWo6YNnWqSL5CI2sf9Ao3k0me7RSX3SweVlOqi/GAm8TdoSdJCvzL5PQx4Rs0
	FuVoo/n16hLPxnoUGhFXV6TVxBmU36sl8juuhnpZpyb5sRgJhl+YjlkeXts+JkvXMDcParAxqPfSH
	rJhJFnK6SCo00AAz4h6AIuwvx2BR/bIKjqaj7w/o5Y9u43XJnpO8XtD2Z+TWKsMlUbHGTCTzubG8j
	qAzAWTAaLVtnWAuuTRSbn9I5aJS5Di/cBniQsG/1vRSldN6og3jtB8lxUVmlmg2OTKL+skfDIDBPM
	GA+QYuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf9bO-007rhR-OO; Fri, 15 Apr 2022 00:14:18 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9bM-007rgC-9N
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 00:14:17 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 q142-20020a25d994000000b00641d23dbeb9so5304106ybg.9
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 17:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ahv1rMnoXCJYqGoBMv8RBADWJdwEiPpEYtFvG6t6lwk=;
 b=VJ6FESzpi+kwKXbN4PjaEo5RYLhxcdrKaGb60eloOT8EztGcgCnZKP0rXMfhj3mZHw
 SCdNpZH64G5qdy3boXLj6xlC6VcyNv+lklrRgBJPeYOdLtWSl67eIfdB6AdanP/aUWTZ
 KgG7R3ZUhf6pliehqp5RIvSoZD2SQq1yaZCEaW1mZp4wNhEkAUUufjQhOe1Yu6Ua+FDU
 IU3qGidlqmUZFRnx0YjUnQImk2MrYdddWmeHDZYhn6iNNejUkEfYgXF0oQ/kqjXjXKqC
 +JH9jP8S+xbHyMwmuohtLSNf+/BFaZVtJC0YrAMgUqFL5j5qVjZ5vGcHVsvBGQBHMyRK
 HrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ahv1rMnoXCJYqGoBMv8RBADWJdwEiPpEYtFvG6t6lwk=;
 b=uulLSNWcytdFcdn1R5/swUdBUCeP8w+Z96Nhy32pla+z7uBAZKjYCrFT4GyXKJ98mo
 kMCS5o+Eb5KYcwVYpXGK6Ta3dgVZLMQQaLBhUlo7MXDBfdSNvmNaQGBpyPtJN5sLzoQb
 9GRPX5We9ia43dd/0UjAx8Qt1TnMZaGz74esQbc4V7dbp0ibiX+Ar3uyixaK7vZHl12P
 mbWY67mXkuU95iVpNp1SGJ+uS1bfDHwlozhZg1i9EcyMiuXhz8RpQnpQaDpg4NPPty9v
 yEBbKtuIk35UT84/M0p0Hk9ljJg8hac0eQgNUKkCybZpeAF4uJBALWjbpgRqIshxf28I
 8R4g==
X-Gm-Message-State: AOAM5305hD7v7qKTbvXRT14iTfIfFP7XifkFRk4M9S0HzB6VVqGS3SHc
 /qE0P2tVVbd24QTb2BG9EORCImCXvuhH
X-Google-Smtp-Source: ABdhPJz0sRlJgwqEIUkD/l0xohBHj1hXJzIsDsQUZHoplQroWQ4UFZYNm68G+NEkRyeSyR95NY1r0n3mAmrh
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:7d77:8cae:9dfe:95c])
 (user=jmeurin job=sendgmr) by 2002:a05:6902:1109:b0:63d:caf3:73b5 with SMTP
 id o9-20020a056902110900b0063dcaf373b5mr3737845ybu.413.1649981654033; Thu, 14
 Apr 2022 17:14:14 -0700 (PDT)
Date: Thu, 14 Apr 2022 17:13:21 -0700
In-Reply-To: <20220415001321.252848-1-jmeurin@google.com>
Message-Id: <20220415001321.252848-4-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
 <20220415001321.252848-1-jmeurin@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH v3 3/3] mtd: mtdoops: Add a timestamp to the mtdoops header.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_171416_363386_C038730F 
X-CRM114-Status: GOOD (  14.05  )
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

On some systems, the oops only has relative time from boot.

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index f80468ef31c6..4e5ade91da36 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -16,6 +16,7 @@
 #include <linux/wait.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/timekeeping.h>
 #include <linux/mtd/mtd.h>
 #include <linux/kmsg_dump.h>
 
@@ -37,11 +38,13 @@ module_param(dump_oops, int, 0600);
 MODULE_PARM_DESC(dump_oops,
 		"set to 1 to dump oopses, 0 to only dump panics (default 1)");
 
-#define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
+#define MTDOOPS_KERNMSG_MAGIC_v1 0x5d005d00  /* Original */
+#define MTDOOPS_KERNMSG_MAGIC_v2 0x5d005e00  /* Adds the timestamp */
 
 struct mtdoops_hdr {
 	u32 seq;
 	u32 magic;
+	ktime_t timestamp;
 } __packed;
 
 static struct mtdoops_context {
@@ -191,7 +194,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	/* Add mtdoops header to the buffer */
 	hdr = (struct mtdoops_hdr *)cxt->oops_buf;
 	hdr->seq = cxt->nextcount;
-	hdr->magic = MTDOOPS_KERNMSG_MAGIC;
+	hdr->magic = MTDOOPS_KERNMSG_MAGIC_v2;
+	hdr->timestamp = ktime_get_real();
 
 	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
@@ -247,7 +251,9 @@ static void find_next_position(struct mtdoops_context *cxt)
 
 		if (hdr.seq == 0xffffffff && hdr.magic == 0xffffffff)
 			mark_page_unused(cxt, page);
-		if (hdr.seq == 0xffffffff || hdr.magic != MTDOOPS_KERNMSG_MAGIC)
+		if (hdr.seq == 0xffffffff ||
+		    (hdr.magic != MTDOOPS_KERNMSG_MAGIC_v1 &&
+		     hdr.magic != MTDOOPS_KERNMSG_MAGIC_v2))
 			continue;
 		if (maxcount == 0xffffffff) {
 			maxcount = hdr.seq;
-- 
2.36.0.rc0.470.gd361397f0d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
