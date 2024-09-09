Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CA0CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/neEs2Xrk7w1mQGMmAxMzEujMHnv2r8ytiuODssDgs=; b=aElBpO3XFZgvec
	pUzZ0XySeHppIPBonHkToz8bE1D2A5iR0iRE9Kw5q71OOFeQ8NSwgSWKSmfakTiV0qp2Fcu7QiIUG
	mweatLaYmsdscfB7iGWVq/fukslIHwJUaC8faF0HHnFOFZrARaIc+W/vYtqBriTVAGsFpVOghQNSq
	PkkSjZYr5bPsb8XPkel8iDlhEHpsCfu4+R9m69TtI/XW/YsE5GOrnXEYtD0mHadCoEmEPhWS+rZnA
	TN7nGITe/fkQzyfJ9TEnGLop7T+9cc8iDUara1SLNwAxfnn6aeFJZ1vi/Ojp5rUI2IXM1sTusPl/C
	xv7uR1FztxYmSMOVopIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYWE-00000000k5Z-2Ify;
	Mon, 09 Sep 2024 07:09:02 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVw-00000000jnl-1dY7
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:48 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374b9761eecso2644701f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865722; x=1726470522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
        b=IFxflCZVEhjW1WaKmxTHAp1v53GE/wy1hALwqyNK0ibroYAULugtxYX+xCfBwlmURK
         ZUqo97TJ4tq2PKqPYBpdH0H2kNOTEkCMGkqYAVsDJUraoE9QUfeleIE3MmBp0mcza3Jw
         oF8y0iPRVIkUq+6MZkK7iNgjhezzworFAi3fCuJwAUi3AH7tWR+S9yenAn6dcW7AY8X9
         jc+4Wt6STxNSBpbzaBMR3i3qmH8M6mIZ36NfW095752JJ6s57hxwHf+8Yxpqg4+uFF7E
         r2/zdPwLRH11A9liPmi2nFO82WP4KJwHuVLwbvIuxRD9OQiVfrRlG8JFLAA4cRUOa9yu
         yesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865722; x=1726470522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
        b=g8HffundwdO6IYIAgZ1OhutWgfSIbKgMRn1rPH6B5I8zNTg/ti9YQul5Y2Iat7ow5c
         o0Li4SKneAJvRbchcdwmf/hO8F2QSf7GBwjutHK9ucZ+2d5L63+omGyvbpQnA3j6aq01
         ru5W1aqU0uW9S3p8RLAZHuSo9d7r9rjsgviw3f/bda4oQPWgZA9P5TT/xXOZr3Y9rDlV
         YVzwKui7PgfAzv18EtRhDPdCQi42szrnB4EcWq5qjVbs8cm5jpo5LWkeSksQ3+9iuqVF
         IFAkN1SYhCZEbzCANLK40hp+fKV86VN+eO8bcyF1zkDa6q167bsuQCV86+cKDoQTFvA2
         Nsow==
X-Forwarded-Encrypted: i=1; AJvYcCVJR5mJ17a+NcWg1InXwVidRhxWtfCnq0KfEWV7j2wpN6tRDnZDy4NjSCffGn9FmONRJxuge8NVYTQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YycT3CQwg9fu1oyH2bhkm715Y6ihuVCHslwUN1N0wG9NmtTaDr+
	2DppeyjFMKBuOC5wS19L2i6HwGsyHLPrTVgvbS98NEcEiFwkuAC/
X-Google-Smtp-Source: AGHT+IF71nvV/JLA7tnaX8d4uBILZgafYRcREg9unRBuq1O83qltW6sgUb4J13+Gilii8joehF0k7g==
X-Received: by 2002:a05:6000:b92:b0:371:8dcc:7f9e with SMTP id ffacd0b85a97d-378895c6306mr6637459f8f.2.1725865721615;
        Mon, 09 Sep 2024 00:08:41 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:40 -0700 (PDT)
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
	kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 16/19] lib/test_scanf: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:30 +0200
Message-ID: <20240909070742.75425-17-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000845_147414_273AD999 
X-CRM114-Status: GOOD (  12.06  )
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
