Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2FCE6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/neEs2Xrk7w1mQGMmAxMzEujMHnv2r8ytiuODssDgs=; b=zx7oZdn94Mq0Mg
	Jv4vfx2C7tC8mj0D6syKU6TIzmyyr33q+aLCO7zQKkKwMhSPfo6bLTqSRztrUW/IUh4IG2fG+hubG
	RNuWN/W+EGDP1j2/D6J2t4oYj1+0RQd6d7EsLcQ1TZETJb29h/84N5+QIkEfbGhAcvztMi0NYbXWg
	h4sQgeAqaWaEjlOVNKBBi3Qr627mcbx4C8Xv5NQcMZL8qNucxKZTViC4FV+TG8w1PH37Dgg626QoG
	ecTV5Yy+4NkqYcA5flVCGFmrWVMLYtgrEbfmgbdSsdAxuxACX3WBUPr5Y0sEbin71Yuk80xFxIpLq
	vSQcEcW/iEfFLYaW2Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHR-00000000wsk-0bqo;
	Mon, 09 Sep 2024 07:57:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGw-00000000wQC-3RoD
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=; b=dXeSaFwyslAk4QtLXK9lvwoUdu
	2trDo4f7HYG+r2RNsYe6Ys6eNNqYJp6mv78lq3sXYTxI3BTL0h9xgULKFw1mr5x9flXqzyRVNuXW5
	cICH6CNcSFJmKZiPKEkmrx+c7qQkcLSYZ+Uc5dSWdrOErFtTzgOYkGMkYY1cYIeedqZOBlaky2juB
	JO7Y1w8Aw6s/854LZnNzMyOLT3GlJ/edigqWF9eBokK51km9t0KYTOX+/Bf78LAK9GGMSJUGXm9pp
	texMrSK9otudpyD12as781c7z0Ae9ppYgcazVVkvUQh307ARyytrXLZ9pP25Wn2g1lNyk6FIkNKXb
	VbhSHjMw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZGs-00000000LW2-3a2e
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so3079856f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868632; x=1726473432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
        b=Gjpa7vZ8m+TOhNETxNpUidPJUuK4dLR8WDhKNEEGzjTXCusesX1NLVFwwRdOI9biuO
         MOPeJOCS3jXYL8/bCVSifQNCqZIvcqAAuqPnnA1D4wKNc/hiuYsw/uYDcJ4m/SCNXvd2
         EBEIDIrrbkPnVkyyPd37sNu9Ffkgw5bgZpw6evqWj7Y3imi3RnmSOgPhDaoyoDJnbYVI
         zBNmZMJ2O8jG1DbuRWVSpLomELQ7Vz2ew52TrHXNGWu3iAC1a/33EPfcATXe5ncjt6wz
         so5cS6cA2llKuyHvVb4Muwa1Jndih86+sk67hYuOIBnzClK2vA/TD9fzB9OVQ3oRBnL/
         1qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868632; x=1726473432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
        b=vFyaleg0nkY0oLo/gP+7g1HtWlYlbd1ynfghIvZpRLkTYkcFfGd419NnNMKx+DQgZ3
         Z7j0LpSD3mk7BC7lcdYTYVJeWolZsUkkLe2/xgtyl3JdyrbzlJEvcMsKVeo80IRmURQr
         kn7KrYwS1QXd061g8/b9JXDWe8+0HGbaeCRsjmKK/T4ubeKEns+9BZyX+L02g1NML50w
         VX5qgpdbrM5o0aeL4lVUTfyCb8CUjkKSS4fcoJoBjsG75nUpNj2/sD2CDWQlfvurnE36
         D4y4XbcwCIV6IPQ7SRPVmUNoAkzSDUxFekuYnSlKfncgkgLdk99ULyz01B3N+wU/FRU8
         2mIg==
X-Forwarded-Encrypted: i=1; AJvYcCU81yfxUZJwYLwZl7RKdY2fYF2MyE6tvfYLFsJMcN6+weXj0J8xULB8dEFFV3+c58gpKsxR0QmLHa4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4QGjQJRV+jlds9uGSdBM8yFg4zm64trWHa3fzKtk4weDKeRs8
	HLshfBJTjKPwe3eYBl/wezMWPcbixoK2OkNzPOC/344VoUWIRHuj
X-Google-Smtp-Source: AGHT+IFpmssEVWDSb1D0XQ0h7YT1Yo7NzbQWSyrRT6WdFlX7jchUsWEdPQv+SibupVKFxwfhwpW2yw==
X-Received: by 2002:adf:f104:0:b0:371:8e3c:5c with SMTP id ffacd0b85a97d-3789229bc28mr6033390f8f.7.1725868631939;
        Mon, 09 Sep 2024 00:57:11 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:10 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RESEND v2 16/19] lib/test_scanf: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:59 +0200
Message-ID: <20240909075641.258968-17-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085714_946103_58728A0F 
X-CRM114-Status: GOOD (  12.00  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/test_scanf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_scanf.c b/lib/test_scanf.c
index 7257b1768545..44f8508c9d88 100644
--- a/lib/test_scanf.c
+++ b/lib/test_scanf.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/printk.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
