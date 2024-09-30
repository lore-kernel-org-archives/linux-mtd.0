Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C670FCE834A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmzBu3ZXemrOOKRtJjbesF95myH4wUcYhK/qDGPVVGU=; b=mHhXubVH+RMO90
	cgYhmX/kzHyvDeCqiq7BkHXlHRn7XoRUFmEAqtF8zdZjZdPJlUIUrcuzHom7Qc4b6maIjbj9hmH0k
	WFaTLSPP0UvplDiOjVWPSHaBAHGXv0GMEkN1oWjWXZserGwwvXajWoZKEW5iQZyzNhJ0y0YIT869n
	59iNV1B76Iw0CcerTccx2xp8RvBxG8KTKmrBSk3uejuueD0I9FIZ2CySH3qkWBCoq01VG/6bnh1U6
	9K04Om8KPDl2ZL1lWw1rVwxLOxO8yd6aHvKk27zI/KCBIGnpXXagEaAf33e8CWQAYovdLAf8mUyAH
	34c2oubM32Zp7kJlQp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHBO-0000000HTqF-3uFB;
	Mon, 30 Sep 2024 14:15:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeh-0000000H55C-12mZ
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42e5e758093so34292095e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699854; x=1728304654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mtn3Z+z0ZXxXMNcR2ig5e/IN1sKqO9BkR2/07EQmxE=;
        b=Ng9L9b/xYw7EbiWD904KdbhSx45pfj/RWQMHw4j4XHa5MDPqddXJwdhLMFPrE752Q/
         y7mYfht2BL/fNGXfJupwiIJPdlpoI999gFEyG9x9/YiMcaU4hOmOkdyw2qTu//JxmCgm
         ONzvapIz7y2aZS074QXb2evwfJkWrDCKAiofur1zDXrB6VSK9Ku+auFUxKRzOo0dWg9f
         I34NxzTqri+c55eGP5EJzoqHAI2f9yfMTwJvmaFNukqI7LSDRGe9/+O3+xLPx1ocQA11
         b/Yx9KD6tU8lUCa0CD3gsBPmbFZs2cBBcXsNAIvqg0qkeNW8/5OVYhayERBjNEcCM89j
         p5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699854; x=1728304654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mtn3Z+z0ZXxXMNcR2ig5e/IN1sKqO9BkR2/07EQmxE=;
        b=IekpD1E7V1spln3bKZ6tvfJNbJtAJDSKkvLFNe99RXmgdLU/af0u7jWljeb1RP3XmP
         YmKveSo6gyIVdBb9ugeLwTFH/fo8S0hDIhCCQAKa8NyKRecaQwvpnoeVTeWGmm3KdXaa
         WG/kEkrXsT7elRMmHFDjnWoLyL8KM+nH2RVlXAks9epbBuwOpqVQjId9pZmGgmicwNXf
         gvDX4PNXIZd6XADoRnVxvw+ptNHaRgEiyKD0M91RpsjBgVp0BLHLQExPyixWu216Fe9S
         OzFyZnaZBUIQ5gtBGCbL0VpmrLROmQMzjxQMLfFcmkPzGKyTsqxcFUMe7WEbP/3cz+qq
         RqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhVuZ+1fbAff6vhwJTNrg/ikH2m+mb6VMw9O78axnIf4ASpFDiBIPAje8nP5xFWR7no6mcake+Toc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1mKDsEdx4CS6bu8UoxsZBZkh8xF0rznbN3539zqSL9IjCpnFz
	52C0BEtUjQYmTpYpAPz0wARLKUU8iCz3ox5BCPl+uOJWwdEx3gWK
X-Google-Smtp-Source: AGHT+IHR5GBV9Sk+AH/yXxWplf7Dccbv713xjj5lLaRHbnIJlkBTu8kMh1LwOxClCDrwdMW16rb5Wg==
X-Received: by 2002:a05:600c:4e86:b0:42c:bb75:4f86 with SMTP id 5b1f17b1804b1-42f58498ba3mr80097165e9.32.1727699853769;
        Mon, 30 Sep 2024 05:37:33 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:32 -0700 (PDT)
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
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3 18/19] random: Do not include <linux/prandom.h> in <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:29 +0200
Message-ID: <20240930123702.803617-19-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053735_343724_86C389A5 
X-CRM114-Status: GOOD (  10.31  )
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

Files that use prandom infrastructure are now converted to
use <linux/prandom.h> header instead of <linux/random.h>.
Remove the legacy inclusion of <linux/prandom.h> from
<linux/random.h>.

This is the "nice cleanup" part, wished in c0842fbc1b18.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Fixes: c0842fbc1b18 ("random32: move the pseudo-random 32-bit definitions to prandom.h")
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/random.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index b0a940af4fff..333cecfca93f 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -145,13 +145,6 @@ declare_get_random_var_wait(u64, u32)
 declare_get_random_var_wait(long, unsigned long)
 #undef declare_get_random_var
 
-/*
- * This is designed to be standalone for just prandom
- * users, but for now we include it from <linux/random.h>
- * for legacy reasons.
- */
-#include <linux/prandom.h>
-
 #ifdef CONFIG_SMP
 int random_prepare_cpu(unsigned int cpu);
 int random_online_cpu(unsigned int cpu);
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
