Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83703C02193
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReL8ym9MZstSLYJCiRdUicwTDxms2Zmvk/NobRzlGZg=; b=zaKZNcEhE8RuKS
	SZwaZ20Y0iayy5bFL8B+huvJrPZv0OKiZPxlU9U2gXt6UGnwBqr1oKyz8+37bQ2oFCHjqBPVLOBz7
	FR/fMWr9NvwvraCtZENOfa4uCerVHm7ZEZxcOmiIl96MLHKuwq2SeChRHezFtvzLNX+NGSgUz7uxq
	KD+SeAI5m11QFdXWmF2xF0cbsw2g1yRTtDugeqbXZGim2ECCvRFvsgjUMeRb1bpLlJHUylu19lUj0
	F6lxj4OEbyuPW6h9euhtArQbp6M5//aRwn/KTBrp/Hna+skaDLddEsMCs9UeQFTZBWJQPUPArXfkB
	lf0mbvwnjlDRi3V3xXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVCe-000000029AC-24Pk;
	Wed, 05 Feb 2025 02:31:48 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVCb-00000002972-421h
	for linux-mtd@lists.infradead.org;
	Wed, 05 Feb 2025 02:31:47 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6df83fd01cbso27068846d6.2
        for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2025 18:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738722704; x=1739327504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWJ3+/U5udNqpfJpR2/uzHJvQHNbsouaJRdWxi3SJj0=;
        b=P3s5lULEkWwl7tmbte+jCc85eFJX/+TJo0xZCIIvW9c9AhvJSTJLJsy5P2vaYBzMYO
         ptT4ihFHi5jJsE1QoIVEES5D8+i/7SrRWM7/G7AX6VRQnHeFwXTjjj50cIuquHdoxgW9
         AqnKJnRR7jQzDbTTQadlz7XMf+SjFxs8mXIMibtJBZzWiVPCgW7O+RMgngkOB73Q2/hl
         93rzqF+ikA6mCZQ5b/Tu0MnLwm8L5CShrvW4Y2OgHOti/cmwG5OqHl05kSBxsECxqSY8
         8IYXtisJtRFSNtVj94w0XgKcHjrmo2povqNtcIdL1DHzjhhYVE+CosWh5N3jOxsTVq50
         OUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738722704; x=1739327504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWJ3+/U5udNqpfJpR2/uzHJvQHNbsouaJRdWxi3SJj0=;
        b=n/Opc7bDCXkPo7RO7om5NcsNeMID7wHEgUSzamAtwBbXfEEMaoAQML7tHI8JHw/I2k
         IqR52HrPq92LFgI1EXjKtavcC4jw7K9NSzuSDDdFPan2k6QC0b3A/PgM37RFU3cYr5fj
         3DbqfI3m4m2mpNk1XFbQwwlnZH2Shdf9b0/n5ACLxonwBvV+sPoKAe2H69UcoBra02KW
         qdzpfafwLay5IhoWwCi1atfgHMlt/iF/y18VdLFPKvBtXc9I5SV+RZyNRcdWTxIyFXCK
         4EYVhi3EEJOdMvmCpa7XZxK4e6LuSvktC5F3elpF79XAeCrzskXYddZmZbnXkwe5dr99
         +ZYw==
X-Forwarded-Encrypted: i=1; AJvYcCUqAeMttHctvV+VAyzNe9Ww3Cw24AuBrTrzO6eyAeGK115hXbdJ5jr+cwBzbt19uqfGG86zvRWcxLc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAKD+3q1yxnW9r9GCB552TRikOb0oOz77xhsQP80WBZcb4YLyd
	quIYYDjm75u3lBYlVA7rUSQTU+nxk72isT4Q4zJFnkVVVHy3T7+v
X-Gm-Gg: ASbGncuFU2VYeFNdYpVB3rXmwx/FkRmiU0KCPWcjyIqYb4g1Y2VUYgcpBs759FOP3G3
	qeTOaXzKSvsw7kbAG82B1KhzDizs8QYAx9FMOBNP31BwurdU0gf8oyWLm5cIAM4S4xbwFkK9Ckg
	ceJfNncoGFvHPoyhXZVrDSRCqSeIbJD6ZfcU8Gj0d5V3MNg/uCI+ITWUlOjtyPbYdZ38F7t36Zw
	bPvDPE4KBPc3ivVyGBUnHRogmyTNbh/4zkCkT3HL6ASl9HN7CyFfDHvQSOP13M9oSRhJZsOaeIy
	bApmAQdZ0rvKx5IhZYMZyN1A1EvH9ztLrdK6Cw==
X-Google-Smtp-Source: AGHT+IF5cIIkftGw4WwRHKqTtt8+I6sIv48dAqRnLodKyaijhaIOt3OFLc/uyoQLFQAexUGZekPcbw==
X-Received: by 2002:ad4:5ec6:0:b0:6d4:b1e:5418 with SMTP id 6a1803df08f44-6e42fc6e390mr18830106d6.33.1738722704642;
        Tue, 04 Feb 2025 18:31:44 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25492254esm68579306d6.90.2025.02.04.18.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:31:44 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: gmpy.liaowx@gmail.com,
	jiashengjiangcool@gmail.com,
	jirislaby@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	stable@vger.kernel.org,
	vigneshr@ti.com
Subject: [PATCH v3 1/2] mtd: Replace kcalloc() with devm_kcalloc()
Date: Wed,  5 Feb 2025 02:31:40 +0000
Message-Id: <20250205023141.26195-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f9a35a4f-b774-4480-910a-cdcf926df41b@wanadoo.fr>
References: <f9a35a4f-b774-4480-910a-cdcf926df41b@wanadoo.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_183146_006344_1399A007 
X-CRM114-Status: GOOD (  10.19  )
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

Replace kcalloc() with devm_kcalloc() to prevent memory leaks in case of
errors.

Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
Cc: <stable@vger.kernel.org> # v5.10+
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Replace kcalloc() with devm_kcalloc().
2. Remove kfree().
3. Remove checks.

v1 -> v2:

1. Remove redundant logging.
2. Add kfree() in the error-handling path.
---
 drivers/mtd/mtdpstore.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index 7ac8ac901306..2d004d41cf75 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -417,11 +417,11 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	}
 
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, info->kmsg_size));
-	cxt->rmmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
-	cxt->usedmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+	cxt->rmmap = devm_kcalloc(&mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
+	cxt->usedmap = devm_kcalloc(&mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
 
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
-	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+	cxt->badmap = devm_kcalloc(&mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
 
 	/* just support dmesg right now */
 	cxt->dev.flags = PSTORE_FLAGS_DMESG;
@@ -527,9 +527,6 @@ static void mtdpstore_notify_remove(struct mtd_info *mtd)
 	mtdpstore_flush_removed(cxt);
 
 	unregister_pstore_device(&cxt->dev);
-	kfree(cxt->badmap);
-	kfree(cxt->usedmap);
-	kfree(cxt->rmmap);
 	cxt->mtd = NULL;
 	cxt->index = -1;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
