Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F985CE8340
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKIYkLBmXfByOpuUyBfQfjFGRSZc9picyH0+xmQwUM8=; b=I4sqjcCYMY4cYd
	3pZPLWQ4su0pRlWZO3mzbkog0P0ZNWkM5Erqq4nJ7TBOQjloBL4CAcXsuoXcREJDq62E7En9ujXov
	Q5Twf47Hl2AiA45LHTIbQSI+XGdfrisqdgQL9JY3sA73pSLxEZ48pn+EE9NPdnnCPjlUzaTgmDKdC
	QsbwTfh1XFLGYkH6yvWP6VHh7vgbabGYKtNq+HKDhW7txImhsKBBGiwarcdC2X4b6EwlvJsMM/yFD
	cfVnNmcXD9Td1hop3aJnPV8+d/EyqfM+Ho3RZUUPIP9GwvQ+iTjbgl58Pk24LJ8sQwPGfkyxqIQro
	qJqAtUsOgTyxuyrl75BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBd-0000000HEDe-2Ocj;
	Mon, 30 Sep 2024 13:11:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFed-0000000H52R-2r8f
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so25669305e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699850; x=1728304650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz4qKU/YFIFXfB/NpuI+EYoLGmKb2OxmH0ULGfS7UQs=;
        b=j9rvbCfyLz2b7LZCOv6f9yxm5a0yGgUiu3w6U8qI0Iscuts00BN4UbWwEwrx+4kd2A
         fbZUh7qGL7iiMEFGhgL8Qvc9+TFswpLcqUpYCfRm5dJm9bSYldhqpo120A5PVPGmWzDw
         sDUSVFW5J6TyY7i6RadpAbfuBDITuZI9w6xEa+wbwqs3SNYl04wDpDoM+6+1rVLVqCjr
         9vPys34Z9+adrhI4DqdefxYpihjkjM5QlLebuToBGNz6fFeRpsKwS/G4ARyPHk0MRtq5
         s8XkE2f3/FWsb5dUa/5vJUimh2CXVjINhHy4kiz4MeC0A7Hl98RvwTG2a3AerxoGDqoB
         QUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699850; x=1728304650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz4qKU/YFIFXfB/NpuI+EYoLGmKb2OxmH0ULGfS7UQs=;
        b=lW3RzvvYUYf/Soi25OLbQ+8B2zSEYzJWUJJsqYyc72vuLk2qKziRgC12ocLfgsxNdM
         +hSYu93fv6bAZKzPHaO3KW0WSHyq/FMChAUYFAOg3q7V7XhwoVppJEwCk2LjiZFXU/av
         ZDaPhzWQ/HZDTmhEDKCmA4OuQ1APdhtP13t47EnbGsqQu1qn3bcbfR96iyVykqD26NzU
         oH/g9/OOGw1lKomBsPXn/8yiyu1PwnBYrIwjQ2D54tnVO5c6ex1I+7vy/5UaLITsYUy5
         89yRvlsvwTMzZqbjjWAwvEjABftddjSkhczTkxKXb8J0Hn4FBx7j/ClXuSn5Kh40ydhB
         wy0A==
X-Forwarded-Encrypted: i=1; AJvYcCW3RnhXRVtDQZtJT/cNasgAjLDP4EHNMh2np0qxBpr6zQogkGvzZlOWH9w/ghM8hc1cdl9gkuoBl9M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrAfCxNBO4KVe293QqpiWUfjfoBN+N+mq3GmaTOUXlw2EcdtGN
	8Y0R/rq33gG87VwlJVNTEp7nCrs/sBiVxz78UcK1Qj3R63Ear/I9
X-Google-Smtp-Source: AGHT+IEHFojSqPP2AgQGoeK6Tsjuir7GTcIP+p3ReuPc4+U3eJkS8TX9JsgxlIhdOuf0uw7wfeRCPA==
X-Received: by 2002:a05:600c:4592:b0:42c:b377:3f55 with SMTP id 5b1f17b1804b1-42f521c6035mr89879815e9.3.1727699849850;
        Mon, 30 Sep 2024 05:37:29 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:29 -0700 (PDT)
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
Subject: [PATCH v3 16/19] lib/test_scanf: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:27 +0200
Message-ID: <20240930123702.803617-17-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053731_755936_A1149A1E 
X-CRM114-Status: GOOD (  12.04  )
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
Acked-by: Petr Mladek <pmladek@suse.com>
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
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
